/*
 * This file is part of gitg
 *
 * Copyright (C) 2012 - Jesse van den Kieboom
 *
 * gitg is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * gitg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with gitg. If not, see <http://www.gnu.org/licenses/>.
 */

namespace GitgDiff
{
	// Do this to pull in config.h before glib.h (for gettext...)
	private const string version = Gitg.Config.VERSION;

	public class Panel : Object, GitgExt.Panel
	{
		public GitgExt.Application? application { owned get; construct; }

		construct
		{
		}

		public string id
		{
			owned get { return "/org/gnome/gitg/Panels/Diff"; }
		}

		public bool is_available()
		{
			// The diff is always available
			return true;
		}

		public string display_name
		{
			owned get { return "Diff"; }
		}

		public Icon? icon
		{
			owned get
			{
				var uri = "resource:///org/gnome/gitg/diff/diff-symbolic.svg";
				return new FileIcon(File.new_for_uri(uri));
			}
		}

		public Gtk.Widget? widget
		{
			owned get
			{
				return null;
			}
		}

//		private Gee.HashMap<string, Object>? from_builder(string path, string[] ids)
//		{
//			var builder = new Gtk.Builder();

//			try
//			{
//				builder.add_from_resource("/org/gnome/gitg/dash/" + path);
//			}
//			catch (Error e)
//			{
//				warning("Failed to load ui: %s", e.message);
//				return null;
//			}

//			Gee.HashMap<string, Object> ret = new Gee.HashMap<string, Object>();

//			foreach (string id in ids)
//			{
//				ret[id] = builder.get_object(id);
//			}

//			return ret;
//		}
	}
}

[ModuleInit]
public void peas_register_types(TypeModule module)
{
	Peas.ObjectModule mod = module as Peas.ObjectModule;

	mod.register_extension_type(typeof(GitgExt.Panel),
	                            typeof(GitgDiff.Panel));
}

// ex: ts=4 noet
