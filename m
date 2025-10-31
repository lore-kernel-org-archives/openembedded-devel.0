Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540F3CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 02:49:34 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.6392.1761878963719290232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 19:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 07859F166;
	Fri, 31 Oct 2025 03:49:22 +0100 (CET)
Received: from [192.168.178.36] ([84.163.34.215]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEfCb-2gQzIW0; Fri, 31 Oct 2025 03:49:21 +0100
Date: Fri, 31 Oct 2025 03:49:16 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] gtkmm4: update
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <4I6Z4T.XI0ZRLUUE1UL3@t-online.de>
In-Reply-To: <1873733C4A3630FF.18972@lists.openembedded.org>
References: <1873733C4A3630FF.18972@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-r0zH85RcEbLD6U36+sDr"
X-TOI-EXPURGATEID: 150726::1761878961-467FB9F4-0FDD189D/0/0 CLEAN NORMAL
X-TOI-MSGID: e622107e-d08e-4a6a-b44e-65e8659770a6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 02:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121219

--=-r0zH85RcEbLD6U36+sDr
Content-Type: text/plain; charset=us-ascii; format=flowed

This update is required for gtk-4.20 in oe-core master-next
It will break build with gtk-4.18

On Fri, Oct 31 2025 at 03:42:42 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> 4.20.0 (stable) 2025-09-19
> 
> Gdk:
> * PixbufAnimation, PixbufAnimationIter: Deprecate these classes.
>   GdkPixbufAnimation and GdkPixbufAnimationIter are deprecated
>   since gdk-pixbuf 2.44.
> * PixbufLoader: Deprecate get_animation().
>   (Kjell Ahlstedt)
> 
> 4.19.1 (unstable) 2025-08-26
> 
> Gdk:
> * Event: Add get_relative_direction() and enum 
> ScrollRelativeDirection.
>   (Kjell Ahlstedt)
> 
> Gsk:
> * Transform: Add matrix_2d().
>   (Kjell Ahlstedt)
> 
> Gtk:
> * Application: Deprecate property_register_session().
> * CssProvider: Add property_prefers_color_scheme() and
>   property_prefers_contrast().
> * Entry: Add set/get_menu_entry_icon_text(),
>   property_menu_entry_icon_primary_text() and
>   property_menu_entry_icon_secondary_text().
> * Add enum InterfaceColorScheme and InterfaceContrast.
> * FilterListModel: Add get/set/property_watch_items().
> * Settings: Add property_gtk_interface_color_scheme()
>   and property_gtk_interface_contrast().
>   (Kjell Ahlstedt)
> 
> Documentation:
> * Add images used in documentation copied by gmmproc.
> * Gtk::DrawingArea, Gtk::GLArea: Update the class descriptions.
>   (Kjell Ahlstedt)
> 
> Build:
> * Require gtk4 >= 4.19.4
>   (Kjell Ahlstedt)
> 
> 4.19.0 (unstable) 2025-06-29
> 
> Gdk:
> * Deprecate Gdk::Cairo::set_source_pixbuf().
> * Texture: Deprecate create_for_pixbuf().
> * Pixbuf: Deprecate create_from_xpm_data().
> * ColorState: Add equivalent().
> * MemoryTextureBuilder: Add get/set_stride_for_plane() and 
> get/set_offset().
> * TextureDownloader: Add download_bytes_with_planes().
> * Toplevel: Add enum TitlebarGesture, enum Toplevel::Capabilities,
>   titlebar_gesture(), get/property_capabilities(), 
> get/set/property_gravity().
>   (Kjell Ahlstedt)
> 
> Gsk: (new subdirectory and namespace)
> * Add RoundedRect, Transform and enums BlendMode, Corner, FillRule,
>   MaskMode, ScalingFilter, Transform::Category.
>   (Kjell Ahlstedt) Merge request !92
> 
> Gtk:
> * Add Fixed::set/get_child_transform()
>   (Kjell Ahlstedt)
> * Add FixedLayout and FixedLayoutChild
>   (Kjell Ahlstedt) Issue #164 (Thayne McCombs)
> * Calendar: Deprecate select_day(), property_year/month/day(),
>   add set/property_date().
> * FileFilter: Deprecate add_pixbuf_formats().
> * IconPaintable: Deprecate get/property_icon_name(), is_symbolic(),
>   property_is_symbolic().
> * UriLauncher.hg: Add can_launch().
> * Window: Add enum WindowGravity, get/set/property_gravity().
>   (Kjell Ahlstedt)
> 
> Demos:
> * Avoid deprecated Pixbuf methods where possible.
>   (Kjell Ahlstedt)
> 
> Build:
> * NMake Makefiles: Generate gskmm build config files
> * NMake builds: Add build rules to build gskmm
>   (Chun-wei Fan) Merge request !92
> * Require gtk4 >= 4.19.2
>   (Kjell Ahlstedt)
> 
> 4.18.0 (stable) 2025-03-23
> 
> Gdk:
> * CairoContext: Deprecate cairo_create().
> * Device: Add get/property_active_layout_index(), 
> get/property_layout_names().
> * Surface: Add translate_coordinates(), deprecate 
> create_cairo_context().
>   (Kjell Ahlstedt)
> 
> Gtk:
> * Accessible: Add update_platform_state().
> * HeaderBar, WindowControls: Add 
> get/set/property_use_native_controls().
> * Widget: Add get/set/property_limit_events().
>   (Kjell Ahlstedt)
> 
> Documentation:
> * Gtk::SignalListItemFactory: Remove errroneous links.
>   (Daniel Boles)
> * Gtk::AboutDialog: Update the image.
> * Gtk::ConstraintLayout: Add a link to the description of 
> GtkConstraintLayout.
> * Gdk::Pixbuf, PixbufFormat, PixbufLoader: Add class descriptions.
>   (Kjell Ahlstedt)
> 
> Build:
> * Require gtk4 >= 4.17.5
> * Meson build: Use the Python installation that Meson uses.
>   See merge request glibmm!67.
>   (Kjell Ahlstedt)
> 
> 4.17.0 (unstable) 2025-01-26
> 
> Gdk:
> * ColorState: Add get_oklab() and get_oklch().
> * ContentFormats: Add is_empty().
>   (Kjell Ahlstedt)
> 
> Gtk:
> * SearchEntry2: Add signal_activate().
>   (Kjell Ahlstedt) Issue #161 (PBS)
> * ColorDialogButton, DropDown, Expander, FontDialogButton, MenuButton,
>   PasswordEntry, Text: Add signal_activate().
>   (Kjell Ahlstedt)
> * Snapshot: Add and deprecate render_background().
>   (Kjell Ahlstedt) Merge request !91 (Ezike Ebuka)
> * ApplicationWindow: Deprecate unset/set/get_help_overlay().
> * ShortcutLabel, ShortcutsGroup, ShortcutsSection, ShortcutsShortcut,
>   ShortcutsWindow: Deprecate these classes.
> * FileDialog: Add open_text_file(), open_text_file_finish(),
>   open_multiple_text_files(), open_multiple_text_files_finish(),
>   save_text_file(), save_text_file_finish().
> * ListBox: Add set/get/property_tab_behavior().
> * StringList: Add find().
> * TextView: Add get_visible_offset().
>   (Kjell Ahlstedt)
> 
> Build:
> * Require gtk4 >= 4.17.3.
>   Require glibmm >= 2.75.0. Actually required since gtkmm 4.15.0.
> * Meson build: If GTKMM_NO_DIST_TESTS is defined, 'meson dist'
>   does not run test programs.
>   (Kjell Ahlstedt)
> 
> 4.16.0 (stable) 2024-09-10
> 
> Almost identical to 4.15.1.
> 
> Gtk:
> * gtkmm.h: Add eventcontrollerlegacy.h.
> 
> 4.15.1 (unstable) 2024-08-30:
> 
> Gdk:
> * DrawContext: Deprecate begin_frame(), end_frame(), is_in_frame(),
>   get_frame_region().
> * Surface: Deprecate set_opaque_region().
>   (Kjell Ahlstedt)
> * Cursor: Rename create(const SlotGetTexture& slot, .....).
>   Call it create_from_slot(). It was added in 4.15.0 (unstable),
>   but some create() calls in old code became ambiguous.
>   (Kjell Ahlstedt) Issue #159 (Alessandro Astone)
> 
> Gtk:
> * Window: Add set_interactive_debugging().
> * TextBuffer: Add enum TextBuffer::NotifyFlags,
>   add_commit_notify(), remove_commit_notify().
>   (Kjell Ahlstedt)
> 
> Build:
> * Require gtk4 >= 4.15.5.
>   (Kjell Ahlstedt)
> 
> 4.15.0 (unstable) 2024-08-01:
> 
> Gdk:
> * Cursor: Add create(slot, fallback).
> * Add class CicpParams, ColorState and MemoryTextureBuilder.
> * DmabufTextureBuilder: Add get/set/property_color_state().
> * GLTextureBuilder.[ccg|hg]: Add get/set/property_color_state().
> * Texture: Add get/property_color_state().
> * TextureDownloader: Add get/set_color_state().
>   (Kjell Ahlstedt)
> 
> Gtk:
> * Widget: Deprecate set/unset/get_font_options().
>   (Kjell Ahlstedt)
> * Paned: Add unset_start_child() and unset_end_child().
>   (Kjell Ahlstedt) Issue #156 (PBS)
> * Add enum FontRendering.
> * GraphicsOffload: Add set/get/property_black_background().
> * Settings: Add property_gtk_font_rendering().
> * FileDialog: Add a nullptr test.
>   (Kjell Ahlstedt)
> * Undefine preprocessor macro BSD, which can be defined in MacOS,
>   and can interfere with enum License::BSD.
>   (Kjell Ahlstedt) Issue #157 (Mohamed Akram)
> * Shortcut: Add set_action(). Deprecate the misnamed
>   set_trigger(const Glib::RefPtr<const ShortcutAction>& action).
> * Snapshot: Deprecate gl_shader_pop_texture().
>   (Kjell Ahlstedt)
> 
> Demos:
> * Dialog demo: Fix a memory leak. Add some comments.
>   (Kjell Ahlstedt)
> 
> Documentation:
> * Gdk::Cursor: Update the class description.
> * Gtk::Settings: Improve the class documentation.
>   (Kjell Ahlstedt)
> * Don't link to removed parts of library.gnome.org.
>   (Andre Klapper, Kjell Ahlstedt)
> 
> Build:
> * Require gtk4 >= 4.15.4.
> * Meson build: Require meson >= 0.62.0.
>   Use Meson's pkgconfig module instead of using
>   the *.pc.in templates.
>   (Kjell Ahlstedt)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gtk+/{gtkmm4_4.14.0.bb => gtkmm4_4.20.0.bb}           | 8 
> +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-gnome/gtk+/{gtkmm4_4.14.0.bb => 
> gtkmm4_4.20.0.bb} (63%)
> 
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb 
> b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
> similarity index 63%
> rename from meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
> rename to meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
> index d3a01e444c..439ab800f8 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
> @@ -3,8 +3,10 @@ HOMEPAGE = "http://www.gtkmm.org/"
>  SECTION = "libs"
> 
>  LICENSE = "LGPL-2.1-only & GPL-2.0-only"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/> \
> -                    
> file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe" 
> <file://copying.tools;md5=751419260aa954499f7abaabaa882bbe/>
> +LIC_FILES_CHKSUM = " \
> +	file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 
> <file://copying;md5=4bf661c1e3793e55c8d1051bc5e0ae21/> \
> +	file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce 
> <file://copying.tools;md5=570a9b3749dd0463a1778803b12a6dce/> \
> +"
> 
>  DEPENDS = "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 
> cairomm-1.16 gdk-pixbuf-native"
> 
> @@ -14,7 +16,7 @@ inherit gnomebase features_check
> 
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
> 
> -SRC_URI[archive.sha256sum] = 
> "9350a0444b744ca3dc69586ebd1b6707520922b6d9f4f232103ce603a271ecda"
> +SRC_URI[archive.sha256sum] = 
> "daad9bf9b70f90975f91781fc7a656c923a91374261f576c883cd3aebd59c833"
> 
>  EXTRA_OEMESON = "-Dbuild-demos=false"
> 
> --
> 2.51.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121217): 
> <https://lists.openembedded.org/g/openembedded-devel/message/121217>
> Mute This Topic: <https://lists.openembedded.org/mt/116042414/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-r0zH85RcEbLD6U36+sDr
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This update is required for gtk-4.20 in oe-core master-next</div><div>It will break build with gtk-4.18</div></div><div id="geary-quote" dir="auto"><br>On Fri, Oct 31 2025 at 03:42:42 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">4.20.0 (stable) 2025-09-19

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
* Require gtk4 &gt;= 4.19.4
  (Kjell Ahlstedt)

4.19.0 (unstable) 2025-06-29

Gdk:
* Deprecate Gdk::Cairo::set_source_pixbuf().
* Texture: Deprecate create_for_pixbuf().
* Pixbuf: Deprecate create_from_xpm_data().
* ColorState: Add equivalent().
* MemoryTextureBuilder: Add get/set_stride_for_plane() and get/set_offset().
* TextureDownloader: Add download_bytes_with_planes().
* Toplevel: Add enum TitlebarGesture, enum Toplevel::Capabilities,
  titlebar_gesture(), get/property_capabilities(), get/set/property_gravity().
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
* Require gtk4 &gt;= 4.19.2
  (Kjell Ahlstedt)

4.18.0 (stable) 2025-03-23

Gdk:
* CairoContext: Deprecate cairo_create().
* Device: Add get/property_active_layout_index(), get/property_layout_names().
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
* Gtk::ConstraintLayout: Add a link to the description of GtkConstraintLayout.
* Gdk::Pixbuf, PixbufFormat, PixbufLoader: Add class descriptions.
  (Kjell Ahlstedt)

Build:
* Require gtk4 &gt;= 4.17.5
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
* Require gtk4 &gt;= 4.17.3.
  Require glibmm &gt;= 2.75.0. Actually required since gtkmm 4.15.0.
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
* Cursor: Rename create(const SlotGetTexture&amp; slot, .....).
  Call it create_from_slot(). It was added in 4.15.0 (unstable),
  but some create() calls in old code became ambiguous.
  (Kjell Ahlstedt) Issue #159 (Alessandro Astone)

Gtk:
* Window: Add set_interactive_debugging().
* TextBuffer: Add enum TextBuffer::NotifyFlags,
  add_commit_notify(), remove_commit_notify().
  (Kjell Ahlstedt)

Build:
* Require gtk4 &gt;= 4.15.5.
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
  set_trigger(const Glib::RefPtr&lt;const ShortcutAction&gt;&amp; action).
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
* Require gtk4 &gt;= 4.15.4.
* Meson build: Require meson &gt;= 0.62.0.
  Use Meson's pkgconfig module instead of using
  the *.pc.in templates.
  (Kjell Ahlstedt)

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gtk+/{gtkmm4_4.14.0.bb =&gt; gtkmm4_4.20.0.bb}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm4_4.14.0.bb =&gt; gtkmm4_4.20.0.bb} (63%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
similarity index 63%
rename from meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
index d3a01e444c..439ab800f8 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 
 LICENSE = "LGPL-2.1-only &amp; GPL-2.0-only"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c">file://COPYING;md5=4fbd65380cdd255951079008b364516c</a> \
-                    <a href="file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe" "="">file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"</a>
+LIC_FILES_CHKSUM = " \
+	<a href="file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21">file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21</a> \
+	<a href="file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce">file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce</a> \
+"
 
 DEPENDS = "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16 gdk-pixbuf-native"
 
@@ -14,7 +16,7 @@ inherit gnomebase features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
-SRC_URI[archive.sha256sum] = "9350a0444b744ca3dc69586ebd1b6707520922b6d9f4f232103ce603a271ecda"
+SRC_URI[archive.sha256sum] = "daad9bf9b70f90975f91781fc7a656c923a91374261f576c883cd3aebd59c833"
 
 EXTRA_OEMESON = "-Dbuild-demos=false"
 
<div>-- 
</div>2.51.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#121217): <a href="https://lists.openembedded.org/g/openembedded-devel/message/121217">https://lists.openembedded.org/g/openembedded-devel/message/121217</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/116042414/3618223">https://lists.openembedded.org/mt/116042414/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-r0zH85RcEbLD6U36+sDr--


