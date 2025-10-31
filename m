Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA4DCCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 02:43:04 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.6276.1761878581619630614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 19:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id DFCC01C837
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 03:42:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEf6L-0OXCYT0; Fri, 31 Oct 2025 03:42:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gtkmm4: update
Date: Fri, 31 Oct 2025 03:42:42 +0100
Message-ID: <20251031024242.46550-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761878573-D9FF8A4B-055BB740/0/0 CLEAN NORMAL
X-TOI-MSGID: a6cddad3-c9f5-4a7e-8382-738d47034b6a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 02:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121217

4.20.0 (stable) 2025-09-19

Gdk:
* PixbufAnimation, PixbufAnimationIter: Deprecate these classes.
  GdkPixbufAnimation and GdkPixbufAnimationIter are deprecated
  since gdk-pixbuf 2.44.
* PixbufLoader: Deprecate get_animation().
  (Kjell Ahlstedt)

4.19.1 (unstable) 2025-08-26

Gdk:
* Event: Add get_relative_direction() and enum ScrollRelativeDirection.
  (Kjell Ahlstedt)

Gsk:
* Transform: Add matrix_2d().
  (Kjell Ahlstedt)

Gtk:
* Application: Deprecate property_register_session().
* CssProvider: Add property_prefers_color_scheme() and
  property_prefers_contrast().
* Entry: Add set/get_menu_entry_icon_text(),
  property_menu_entry_icon_primary_text() and
  property_menu_entry_icon_secondary_text().
* Add enum InterfaceColorScheme and InterfaceContrast.
* FilterListModel: Add get/set/property_watch_items().
* Settings: Add property_gtk_interface_color_scheme()
  and property_gtk_interface_contrast().
  (Kjell Ahlstedt)

Documentation:
* Add images used in documentation copied by gmmproc.
* Gtk::DrawingArea, Gtk::GLArea: Update the class descriptions.
  (Kjell Ahlstedt)

Build:
* Require gtk4 >=3D 4.19.4
  (Kjell Ahlstedt)

4.19.0 (unstable) 2025-06-29

Gdk:
* Deprecate Gdk::Cairo::set_source_pixbuf().
* Texture: Deprecate create_for_pixbuf().
* Pixbuf: Deprecate create_from_xpm_data().
* ColorState: Add equivalent().
* MemoryTextureBuilder: Add get/set_stride_for_plane() and get/set_offset=
().
* TextureDownloader: Add download_bytes_with_planes().
* Toplevel: Add enum TitlebarGesture, enum Toplevel::Capabilities,
  titlebar_gesture(), get/property_capabilities(), get/set/property_gravi=
ty().
  (Kjell Ahlstedt)

Gsk: (new subdirectory and namespace)
* Add RoundedRect, Transform and enums BlendMode, Corner, FillRule,
  MaskMode, ScalingFilter, Transform::Category.
  (Kjell Ahlstedt) Merge request !92

Gtk:
* Add Fixed::set/get_child_transform()
  (Kjell Ahlstedt)
* Add FixedLayout and FixedLayoutChild
  (Kjell Ahlstedt) Issue #164 (Thayne McCombs)
* Calendar: Deprecate select_day(), property_year/month/day(),
  add set/property_date().
* FileFilter: Deprecate add_pixbuf_formats().
* IconPaintable: Deprecate get/property_icon_name(), is_symbolic(),
  property_is_symbolic().
* UriLauncher.hg: Add can_launch().
* Window: Add enum WindowGravity, get/set/property_gravity().
  (Kjell Ahlstedt)

Demos:
* Avoid deprecated Pixbuf methods where possible.
  (Kjell Ahlstedt)

Build:
* NMake Makefiles: Generate gskmm build config files
* NMake builds: Add build rules to build gskmm
  (Chun-wei Fan) Merge request !92
* Require gtk4 >=3D 4.19.2
  (Kjell Ahlstedt)

4.18.0 (stable) 2025-03-23

Gdk:
* CairoContext: Deprecate cairo_create().
* Device: Add get/property_active_layout_index(), get/property_layout_nam=
es().
* Surface: Add translate_coordinates(), deprecate create_cairo_context().
  (Kjell Ahlstedt)

Gtk:
* Accessible: Add update_platform_state().
* HeaderBar, WindowControls: Add get/set/property_use_native_controls().
* Widget: Add get/set/property_limit_events().
  (Kjell Ahlstedt)

Documentation:
* Gtk::SignalListItemFactory: Remove errroneous links.
  (Daniel Boles)
* Gtk::AboutDialog: Update the image.
* Gtk::ConstraintLayout: Add a link to the description of GtkConstraintLa=
yout.
* Gdk::Pixbuf, PixbufFormat, PixbufLoader: Add class descriptions.
  (Kjell Ahlstedt)

Build:
* Require gtk4 >=3D 4.17.5
* Meson build: Use the Python installation that Meson uses.
  See merge request glibmm!67.
  (Kjell Ahlstedt)

4.17.0 (unstable) 2025-01-26

Gdk:
* ColorState: Add get_oklab() and get_oklch().
* ContentFormats: Add is_empty().
  (Kjell Ahlstedt)

Gtk:
* SearchEntry2: Add signal_activate().
  (Kjell Ahlstedt) Issue #161 (PBS)
* ColorDialogButton, DropDown, Expander, FontDialogButton, MenuButton,
  PasswordEntry, Text: Add signal_activate().
  (Kjell Ahlstedt)
* Snapshot: Add and deprecate render_background().
  (Kjell Ahlstedt) Merge request !91 (Ezike Ebuka)
* ApplicationWindow: Deprecate unset/set/get_help_overlay().
* ShortcutLabel, ShortcutsGroup, ShortcutsSection, ShortcutsShortcut,
  ShortcutsWindow: Deprecate these classes.
* FileDialog: Add open_text_file(), open_text_file_finish(),
  open_multiple_text_files(), open_multiple_text_files_finish(),
  save_text_file(), save_text_file_finish().
* ListBox: Add set/get/property_tab_behavior().
* StringList: Add find().
* TextView: Add get_visible_offset().
  (Kjell Ahlstedt)

Build:
* Require gtk4 >=3D 4.17.3.
  Require glibmm >=3D 2.75.0. Actually required since gtkmm 4.15.0.
* Meson build: If GTKMM_NO_DIST_TESTS is defined, 'meson dist'
  does not run test programs.
  (Kjell Ahlstedt)

4.16.0 (stable) 2024-09-10

Almost identical to 4.15.1.

Gtk:
* gtkmm.h: Add eventcontrollerlegacy.h.

4.15.1 (unstable) 2024-08-30:

Gdk:
* DrawContext: Deprecate begin_frame(), end_frame(), is_in_frame(),
  get_frame_region().
* Surface: Deprecate set_opaque_region().
  (Kjell Ahlstedt)
* Cursor: Rename create(const SlotGetTexture& slot, .....).
  Call it create_from_slot(). It was added in 4.15.0 (unstable),
  but some create() calls in old code became ambiguous.
  (Kjell Ahlstedt) Issue #159 (Alessandro Astone)

Gtk:
* Window: Add set_interactive_debugging().
* TextBuffer: Add enum TextBuffer::NotifyFlags,
  add_commit_notify(), remove_commit_notify().
  (Kjell Ahlstedt)

Build:
* Require gtk4 >=3D 4.15.5.
  (Kjell Ahlstedt)

4.15.0 (unstable) 2024-08-01:

Gdk:
* Cursor: Add create(slot, fallback).
* Add class CicpParams, ColorState and MemoryTextureBuilder.
* DmabufTextureBuilder: Add get/set/property_color_state().
* GLTextureBuilder.[ccg|hg]: Add get/set/property_color_state().
* Texture: Add get/property_color_state().
* TextureDownloader: Add get/set_color_state().
  (Kjell Ahlstedt)

Gtk:
* Widget: Deprecate set/unset/get_font_options().
  (Kjell Ahlstedt)
* Paned: Add unset_start_child() and unset_end_child().
  (Kjell Ahlstedt) Issue #156 (PBS)
* Add enum FontRendering.
* GraphicsOffload: Add set/get/property_black_background().
* Settings: Add property_gtk_font_rendering().
* FileDialog: Add a nullptr test.
  (Kjell Ahlstedt)
* Undefine preprocessor macro BSD, which can be defined in MacOS,
  and can interfere with enum License::BSD.
  (Kjell Ahlstedt) Issue #157 (Mohamed Akram)
* Shortcut: Add set_action(). Deprecate the misnamed
  set_trigger(const Glib::RefPtr<const ShortcutAction>& action).
* Snapshot: Deprecate gl_shader_pop_texture().
  (Kjell Ahlstedt)

Demos:
* Dialog demo: Fix a memory leak. Add some comments.
  (Kjell Ahlstedt)

Documentation:
* Gdk::Cursor: Update the class description.
* Gtk::Settings: Improve the class documentation.
  (Kjell Ahlstedt)
* Don't link to removed parts of library.gnome.org.
  (Andre Klapper, Kjell Ahlstedt)

Build:
* Require gtk4 >=3D 4.15.4.
* Meson build: Require meson >=3D 0.62.0.
  Use Meson's pkgconfig module instead of using
  the *.pc.in templates.
  (Kjell Ahlstedt)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gtk+/{gtkmm4_4.14.0.bb =3D> gtkmm4_4.20.0.bb}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm4_4.14.0.bb =3D> gtkmm4_4.20.0.b=
b} (63%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm4_4.20.0.bb
similarity index 63%
rename from meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
index d3a01e444c..439ab800f8 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -3,8 +3,10 @@ HOMEPAGE =3D "http://www.gtkmm.org/"
 SECTION =3D "libs"
=20
 LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
-                    file://COPYING.tools;md5=3D751419260aa954499f7abaaba=
a882bbe"
+LIC_FILES_CHKSUM =3D " \
+	file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0ae21 \
+	file://COPYING.tools;md5=3D570a9b3749dd0463a1778803b12a6dce \
+"
=20
 DEPENDS =3D "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16=
 gdk-pixbuf-native"
=20
@@ -14,7 +16,7 @@ inherit gnomebase features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
-SRC_URI[archive.sha256sum] =3D "9350a0444b744ca3dc69586ebd1b6707520922b6=
d9f4f232103ce603a271ecda"
+SRC_URI[archive.sha256sum] =3D "daad9bf9b70f90975f91781fc7a656c923a91374=
261f576c883cd3aebd59c833"
=20
 EXTRA_OEMESON =3D "-Dbuild-demos=3Dfalse"
=20
--=20
2.51.0


