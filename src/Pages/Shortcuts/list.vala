namespace Keyboard.Shortcuts
{
	struct Group { 
		public string[] actions;
		public Schema[] schemas;
		public string[] keys;
	}
	
	// this class provides an interface to the structure containing
	// all the shortcuts (description, dconf schema and key)
	class List : GLib.Object
	{
		public Group[] groups;
		
		public void get_group (SectionID group, out string[] a, out Schema[] s, out string[] k)
		{
			a = groups[group].actions;
			s = groups[group].schemas;
			k = groups[group].keys;
			
			return;
		}
		
		public bool conflicts (Shortcut s, out string key, out int group, out int path)
		{
			key    = (string) null;
			group  = (SectionID) 0;
			path   = -1;
			
			if (s.accel_key == Gdk.Key.BackSpace)
				return false;
			
			for (int g = 0; g < groups.length; g++)
			{
				for (int i = 0; i < groups[g].actions.length; i++)
				{
					if (s.is_equal (settings.get_val(groups[g].schemas[i], groups[g].keys[i])))
					{
						key    = groups[g].keys[i];
						group  = g;
						path   = i;
						return true;
					}
				}
			}
			return false;
		}
		
		public List ()
		{
			groups =
			{
				// windows group
				Group () {
					actions = {
						_("Close"),
						_("Lower"),
						_("Maximize"),
						_("Unmaximize"),
						_("Toggle Maximized"),
						_("Minimize"),
						_("Toggle Fullscreen"),
						_("Tile Left"),
						_("Tile Right"),
						_("Toggle Shaded"),
						_("Toggle on all Workspaces"),
						_("Toggle always on Top"),
						_("Switch Windows"),
						_("Switch Windows backwards"),
						_("Expose Windows"),
						_("Expose all Windows")
					},
				    schemas = {
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.MUTTER,
						Schema.MUTTER,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.GALA,
						Schema.GALA
					},
					keys = {
						"close",
						"lower",
						"maximize",
						"unmaximize",
						"toggle-maximized",
						"minimize",
						"toggle-fullscreen",
						"toggle-tiled-left",
						"toggle-tiled-right",
						"toggle-shaded",
						"toggle-on-all-workspaces",
						"toggle-above",
						"switch-windows",
						"switch-windows-backward",
						"expose-windows",
						"expose-all-windows"
					}
				},
				
				// workspaces group
				Group () 
				{
					actions = {
						_("Switch to first"),
						_("Switch to new"),
						_("Switch to workspace 1"),
						_("Switch to workspace 2"),
						_("Switch to workspace 3"),
						_("Switch to workspace 4"),
						_("Switch to workspace 5"),
						_("Switch to workspace 6"),
						_("Switch to workspace 7"),
						_("Switch to workspace 8"),
						_("Switch to workspace 9"),
						_("Switch to left"),
						_("Switch to right"),
						_("Move to workspace 1"),
						_("Move to workspace 2"),
						_("Move to workspace 3"),
						_("Move to workspace 4"),
						_("Move to workspace 5"),
						_("Move to workspace 6"),
						_("Move to workspace 7"),
						_("Move to workspace 8"),
						_("Move to workspace 9"),
						_("Move to left"),
						_("Move to right"),
						_("Show Workspace Switcher")
					},
			
					schemas = {
						Schema.GALA,
						Schema.GALA,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM,
						Schema.WM
					},
		
					keys = {
						"move-to-workspace-first",
						"move-to-workspace-last",
						"switch-to-workspace-1",
						"switch-to-workspace-2",
						"switch-to-workspace-3",
						"switch-to-workspace-4",
						"switch-to-workspace-5",
						"switch-to-workspace-6",
						"switch-to-workspace-7",
						"switch-to-workspace-8",
						"switch-to-workspace-9",
						"switch-to-workspace-left",
						"switch-to-workspace-right",
						"move-to-workspace-1",
						"move-to-workspace-2",
						"move-to-workspace-3",
						"move-to-workspace-4",
						"move-to-workspace-5",
						"move-to-workspace-6",
						"move-to-workspace-7",
						"move-to-workspace-8",
						"move-to-workspace-9",
						"move-to-workspace-left",
						"move-to-workspace-right",
						"show-desktop"
					}
				},
				
				// screenshots group
				Group () 
				{
					actions = {
						_("Take a Screenshot"),
						_("Save Screenshot to Clipboard"),
						_("Take a Screenshot of a Window"),
						_("Save Window-Screenshot to Clipboard"),
						_("Take a Screenshot of an Area"),
						_("Save Area-Screenshot to Clipboard")
					},

					schemas = {
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA
					},
	
					keys = {
						"screenshot",
						"screenshot-clip",
						"window-screenshot",
						"window-screenshot-clip",
						"area-screenshot",
						"area-screenshot-clip"
					}
				},
				
				// launchers group
				Group () 
				{
					actions = {
						_("Calculator"),
						_("Email"),
						_("Help"),
						_("Home Folder"),
						_("File Search"),
						_("Internet Browser")
					},

					schemas = {
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA
					},
		
					keys = {
						"calculator",
						"email",
						"help",
						"home",
						"search",
						"www"
					}
				},
				
				// media group
				Group () 
				{
					actions = {
						_("Volume Up"),
						_("Volume Down"),
						_("Mute"),
						_("Launch Media Player"),
						_("Play"),
						_("Pause"),
						_("Stop"),
						_("Previous Track"),
						_("Next Track"),
						_("Eject")
					},

					schemas = {
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA
					},
		
					keys = {
						"volume-up",
						"volume-down",
						"volume-mute",
						"media",
						"play",
						"pause",
						"stop",
						"next",
						"previous",
						"eject"
					}
				},
				
				// a11y group
				Group () 
				{
					actions = {
						_("Decrease Text Size"),
						_("Increase Text Size"),
						_("Toggle Magnifier"),
						_("Magnifier Zoom in"),
						_("Magnifier Zoom out"),
						_("Toggle On Screen Keyboard"),
						_("Toggle Screenreader"),
						_("Toggle High Contrast")
					},

					schemas = {
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA,
						Schema.MEDIA
					},
		
					keys = {
						"decrease-text-size",
						"increase-text-size",
						"magnifier",
						"magnifier-zoom-in",
						"magnifier-zoom-out",
						"on-screen-keyboard",
						"screenreader",
						"toggle-contrast"
					}
				}
			};
			
			return;
		} // constructor
	}
}