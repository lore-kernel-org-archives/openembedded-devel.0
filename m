Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.824.1610135663178771649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 11:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DwTgGfbb;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 19so9540325qkm.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Jan 2021 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qj0OruVFsKRlk3LhieFVHRXOrsX9xYIOXjEVvwppt2I=;
        b=DwTgGfbbjlDBQIl7iG2UW6ecO1UYrkN4iZYI54soK1cLNPpHR04l4JRBb611RxkSWs
         5it0vX+SduOTYlA1Nbesb1NONPpmSGXsJl8gh/IFJSFb/KoNT5llpjyqq72zbay9VtKu
         R6gv8VXcdxNs7RJl3evux3HMtDfWpsWfBhoMJ64tYxrMVCulDuXFcNyrS33Fr4HGjvAa
         E7iFGGQZ8Yc5E5iw5MHNo3ntU765CLvuSOw/Ip8v4mzkP8MRqZdSsUSM+ZLQWmgrJ9Td
         bY28l0B0KWbr9gD9fj8Mmh42gim+tam7eUZWKp7HSGZoUfbplxoc7OQ1tHk7imbEruMZ
         nYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qj0OruVFsKRlk3LhieFVHRXOrsX9xYIOXjEVvwppt2I=;
        b=RDNyL7bFMV50ZkssP2/+GAQYA2SvkPbwY1pHHYFaKT1jyKAoPADinncjqBi18nueP/
         b+2/gqCUaYEedPX8Mk9kcOe7WtW7QespQVD6D0nGoLJrKwOlc/FaeRO9ihMRnU4JwHdQ
         rps0kVVLnCAe9vAjPrPUVTBhyvdWqSrm7qfU0XJnOYAr7572p3cC1Arlk6LS1BdLwWkv
         5V36fDwQKy4hM7T6iyvB3JrA8EzlSjxTnJDCPKmZNl1iyRaN65qS5Ec5IX8ESY317TEB
         +uSz32cf7rlcVmIAZQUT1+1WKtZEcwBhx97Fo39Zxo24PLcOxkw07TYjd/ri6oxbykNg
         J71A==
X-Gm-Message-State: AOAM530Lt9iRLAx40vUiTeqtH6aXESN7D6lWTn6bCK2DG53nPanCfDzu
	yuXUXpimn6dxLCiMJeSCWrc7R3aA71NnnHoEwhU=
X-Google-Smtp-Source: ABdhPJyjmL1ddCpuRMQ7TlVNYwvJ7dublhF51rLDysQIIly6ssqhF/R2NpPy9HNz0chNLvd11GjO3LkbKcrA2c1taX8=
X-Received: by 2002:a37:6189:: with SMTP id v131mr5271370qkb.337.1610135662042;
 Fri, 08 Jan 2021 11:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20210106151717.1779543-1-schnitzeltony@gmail.com> <20210106151717.1779543-4-schnitzeltony@gmail.com>
In-Reply-To: <20210106151717.1779543-4-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 8 Jan 2021 11:53:56 -0800
Message-ID: <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 04/28] libxfce4ui: upgrade 4.14.1 -> 4.16.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see an odd failure on qemuriscv64
https://errors.yoctoproject.org/Errors/Details/540832/

On Wed, Jan 6, 2021 at 7:17 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> GTK2 libs are gone so extra GRK2/GTK3 packages can go
>
> Release notes for 4.16.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - about: Harmonize capitalisation
> - Update credits for Xfce 4.16
> - Translation Updates:
>   Basque, Bulgarian, Catalan, Chinese (Taiwan), Dutch, Galician,
>   Japanese, Lithuanian, Norwegian Bokm=C3=A5l, Portuguese, Portuguese
>   (Brazil), Serbian
>
> Release notes for 4.15.7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [Please note that this is a development release.]
> - libxfce4ui now needs libxfce4util >=3D 4.15.6
> - Update configure.ac.in syntax
> - Namespace of the gir needs capital first letter
> - Remove hardcoded translators list
> - Bump libepoxy version to 1.2
> - Translation Updates:
>   Portuguese (Brazil), Slovenian, Swedish
>
> Release notes for 4.15.6
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [Please note that this is a development release.]
> - Introduce xfce_spawn and xfce_spawn_command_line
>   in favor and instead of xfce_spawn_no_child
> - Bump GLib (and gio, gthread, etc) minimum to 2.50.0
> - about: Support multiple GPUs and print GPU memory size
> - about: Drop window subtitle
> - Always perform sanity check
> - Avoid checking for epoxy if libgtop is disabled
> - XfceTitledDialog: Fix erroneous check (Fixes #30)
> - No startup notification in Wayland to prevent crash (Issue #17)
> - Translation Updates:
>   Chinese (China), Chinese (Taiwan), Estonian, French, German, Hebrew,
>   Indonesian, Italian, Japanese, Lithuanian, Norwegian Bokm=C3=A5l,
>   Portuguese, Portuguese (Brazil), Russian, Serbian, Spanish, Swedish,
>   Turkish
>
> Release notes for 4.15.5
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [Please note that this is a development release.]
> - Add new API xfce_spawn_no_child (!8):
>   Launch processes re-parenting them to init vs. as children
> - about: Fix icon names
> - about: Display userspace bitness if it differs from OS kernel bitness
> - about: Print GPU name in system info
> - about: Use more understandable arch labels (Issue #27)
> - Improve xfce_icon_name API
> - No startup notification in wayland to prevent crash (Issue #17)
> - Add missing docstring
> - Fix typos
> - Add README.md to EXTRA_DIST
> - Translation Updates:
>   Catalan, Chinese (China), Danish, Galician, German, Italian,
>   Lithuanian, Turkish
>
> Release notes for 4.15.4
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This is a development release of libxfce4ui aiming the upcoming release
> of Xfce 4.16.
>
> - Avoid redundant key re-grabbing
> - Adds new README.md and updates AM_INIT_AUTOMAKE
> - Silence compiler warnings (Fixes #25)
> - AC_CONFIG_MACRO_DIR =E2=86=92 AC_CONFIG_MACRO_DIRS
> - Add default shortcuts for tiling (Fixes #4)
> - Avoid shortening the keycodes GArray while walking it.
> - about: Revamp About Xfce tab
> - about: More icon name fixes
> - Add more logo icons and new about icon
> - Update deprecated icon names
> - keyboard-shortcuts: Improve UI for setting shortcuts
> - shortcut-dialog: Add label to clear button
> - shortcut-dialog: Port to new XfceTitledDialog API
> - shortcut-dialog: Only grab keyboard
> - Always return GTK_RESPONSE_OK for accepted shortcut keys (fixes #20)
> - Translation Updates:
>   Albanian, Amharic, Arabic, Armenian, Armenian (Armenia), Basque,
>   Belarusian, Bengali, Bulgarian, Catalan, Chinese (China), Chinese
>   (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
>   Eastern Armenian, English (Australia), English (United Kingdom),
>   Estonian, Finnish, French, Galician, Georgian, German, Greek, Hebrew,
>   Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
>   Kazakh, Korean, Latvian, Lithuanian, Malay, Norwegian Bokm=C3=A5l,
>   Norwegian Nynorsk, Occitan (post 1500), Polish, Portuguese,
>   Portuguese (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian,
>   Spanish, Swedish, Telugu, Thai, Turkish, Ukrainian, Uyghur, Welsh
>
> Release notes for 4.15.3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [Please note that this is a development release.]
>
> - Update bug URLs to point to gitlab.xfce
> - xfce-about: Hide empty email address tags (Fixes #12)
> - Remove translator email address as per request (Fixes #11)
> - Add missing translator "Hugo Carvalho" to xfce4-about (issue #18)
> - Replace deprecated 'gdk_keyboard_ungrab' function (Fixes #15)
> - shortcuts-grabber: Correctly ungrab keys on updating shortcuts (Fixes
>   #16)
> - Add basic GitLab pipeline
> - Allow more granular control over menu item accelerators.
>   - No automatic accelerator activation formenu items
>   - Added 'gtk_menu_item_set_accel_label'
>   - Added 'xfce_gtk_accel_group_connect_action_entries'
> - renamed 'xfce_gtk_accel_group_append' to
>   'xfce_gtk_accel_map_add_entries' and modified internals accordingly.
>   No automatic add to an accel_group any more, since this may lead to
>   double-activation in some cases.
> - Add "xfce_gtk_accel_group_disconnect_action_entries" to be able to
>   revert "xfce_gtk_accel_group_connect_action_entries"
> - Add title to xfce_dialog_confirm_close_tabs
> - Add new methods to libxfce4ui.symbols. Followup of
>   231e57daccb5946379f413ed440629c32025f6f3
> - Translation Updates:
>   Albanian, Amharic, Arabic, Armenian, Armenian (Armenia), Basque,
>   Belarusian, Bengali, Bulgarian, Catalan, Chinese (China), Chinese
>   (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
>   Eastern Armenian, English (Australia), English (United Kingdom),
>   Estonian, Finnish, French, Galician, German, Greek, Hebrew,
>   Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
>   Kazakh, Korean, Latvian, Lithuanian, Malay, Norwegian Bokm=C3=A5l,
>   Norwegian Nynorsk, Occitan (post 1500), Polish, Portuguese,
>   Portuguese (Brazil), Romanian, Russian, Serbian, Slovak,
>   Slovenian, Spanish, Swedish, Telugu, Thai, Turkish,
>   Uighur, Ukrainian, Welsh
>
> Release notes for 4.15.2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [Please note that this is a development release.]
>
> - Introduced 'XfceGtkActionEntry' as replacement for the deprecated
>   'GtkAction', 'GtkActionEntry' in order to keep simple menu creation.
>   This includes various support methods, like:
>   'xfce_gtk_translate_action_entries' to to translate a list of
>      XfceGtkActionEntrys
>   'xfce_gtk_accel_group_append' to register the provided
>      accelerators of the entries
>   'xfce_gtk_get_action_entry_by_id' to find a single
>      XfceGtkActionEntry, e.g. by using a enumeration
>   'xfce_gtk_***_new_from_action_entry' to create the specific
>      menu- or tool-items from an XfceGtkActionEntry
> - Add a widget for filename input (Bug #16542)
> - Enabled doc generation for XfceGtkActionEntry and related
>   methods
> - Enabled doc generation for new widget 'xfce-filename-input'
> - Switch Ctrl+Alt+Del to xfce4-session-logout (Bug #11979)
> - Add more default keyboard shortcuts (Bug #16470)
> - shortcuts: Replace xfrun4 by xfce4-appfinder
> - shortcuts: Also map Homepage to browser
> - shortcuts: Remove calculator shortcut
> - Update gitignore
> - Translation Updates:
>   Albanian, Basque, Belarusian, Chinese (China), Chinese (Taiwan),
>   Croatian, Danish, Dutch, French, Galician, German, Hebrew, Hungarian,
>   Kazakh, Malay, Norwegian Bokm=C3=A5l, Portuguese, Portuguese (Brazil),
>   Russian, Serbian, Slovenian, Swedish, Ukrainian
>
> Release notes for 4.15.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This release introduces the following features:
> - Switch XfceTitledDialog to headerbar/CSD layout
> - Use GtkMessageDialog as base class for Xfce Dialogs
> - Add two new functions to search for app icons
> - Improve Tests and Docs
>
> Full changelog:
> - Switch XfceTitledDialog to headerbar layout
> - XfceTitledDialog: Keep buttons in the action area
> - XfceTitledDialog: Also repack xfce_titled_dialog_new
> - XfceTitledDialog: Make sure windows can be dragged
> - XfceTitledDialog: Add _create_action_area, _add_button
>   and _add_action_widget
> - Introduce xfce_titled_dialog_set_default_response
> - Mark xfce_titled_dialog_new_with_buttons as deprecated
> - Add two new functions to search for app icons
> - xfce-about: Fix Makefile
> - shortcut-dialog: Show dialog content (Bug #16338)
> - xfce-dialogs: Use GtkMessageDialog as base class
> - xfce-dialogs: Improve layout of confirm_close_tabs
> - xfce-dialogs: Improve alignment and layout of dialogs
> - xfce-dialogs: Add right margin back to labels
> - xfce-dialogs: Drop default window titles
> - docs: Add xfce_dialog_confirm_close_tabs
> - tests: Add xfce_dialog_confirm_close_tabs
> - tests: Improve UI
> - tests: Add icons to dialog buttons
> - tests: Simplify code by using XfceTitledDialog
> - tests: Re-order buttons
> - tests: Fix typo in test-ui.c (Bug #16253)
> - Rename test-ui-gtk3 to test-ui
> - Improve docstrings
> - Fix typos
> - Drop gladeui Gtk2 from distcheck options
> - Drop unused declaration
> - Fix compiler warnings
> - Remove trailing whitespace
> - Always provides needed files for vala binding in dist tarball
> - Add recents functions to libxfce4ui.symbols
> - Drop xfce-header from pot files
> - Update docstrings
> - Fix license text box too small (Bug #16259)
> - .gitignore: ignore all .o files
> - Make autogen output friendlier
> - Translation Updates:
>   Albanian, Bulgarian, Catalan, Chinese (China), Croatian, Danish,
>   Dutch, French, Galician, German, Hungarian, Italian, Japanese,
>   Lithuanian, Norwegian Bokm=C3=A5l, Polish, Portuguese, Portuguese
>   (Brazil), Russian, Serbian, Slovak, Slovenian, Spanish, Swedish,
>   Turkish, Ukrainian
>
> Release notes for 4.15.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Drop support for Gtk2
> - Make glibtop an optional dependency ("About System" tab)
> - about: Add system info tab
> - about: Hide system tab conditionally
> - dialogs: Use symbolic window-close icon
> - Fix Window not visible when grabbing keyboard (Bug #16054)
> - Bump Gtk3 to 3.22 (Bug #15781)
> - Do not use gdk_screen_get_monitor_at_point (Bug #15781)
> - Replace gtk_show_uri (Bug #15781)
> - Replace gdk_display_get_screen (Bug #15781)
> - Replace gdk_keymap_get_default (Bug #15781)
> - Replace deprecated device functions (Bug #15781)
> - Replace gdk_error_trap_* and gdk_flush (Bug #15781)
> - Ignore what is hard to replace (Bug #15781)
> - Add a dialog to confirm closure of multiple tabs (bug #15873)
> - Translation Updates:
>   Bulgarian, Chinese (China), Chinese (Taiwan), Croatian, Czech,
>   Danish, Dutch, English (United Kingdom), Finnish, French,
>   Galician, German, Hungarian, Interlingue, Italian, Japanese,
>   Korean, Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Polish, Portuguese,
>   Portuguese (Brazil), Russian, Serbian, Slovak, Slovenian,
>   Spanish, Turkish
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...ivate-xfce4-keyboard-shortcuts.xml-fix.patch |  2 +-
>  ...ibxfce4ui_4.14.1.bb =3D> libxfce4ui_4.16.0.bb} | 17 ++++------------=
-
>  2 files changed, 5 insertions(+), 14 deletions(-)
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.14.1.bb =3D> lib=
xfce4ui_4.16.0.bb} (50%)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-pr=
ivate-xfce4-keyboard-shortcuts.xml-fix.patch b/meta-xfce/recipes-xfce/libxf=
ce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
> index 6d107b1b6..616142761 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-x=
fce4-keyboard-shortcuts.xml-fix.patch
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-x=
fce4-keyboard-shortcuts.xml-fix.patch
> @@ -19,7 +19,7 @@ index 723a10d..e6502f3 100644
>  --- a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
>  +++ b/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
>  @@ -75,4 +75,8 @@
> -       <property name=3D"&lt;Primary&gt;F12" type=3D"string" value=3D"w=
orkspace_12_key"/>
> +       <property name=3D"<Super>KP_Next" type=3D"string" value=3D"tile_=
down_right_key"/>
>       </property>
>     </property>
>  +  <property name=3D"providers" type=3D"array">
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb b/me=
ta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb
> similarity index 50%
> rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb
> index 348b685be..7a269ad66 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.0.bb
> @@ -2,17 +2,15 @@ SUMMARY =3D "Xfce4 Widget library and X Window System =
interaction"
>  SECTION =3D "x11/libs"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a61=
6475"
> -DEPENDS =3D "intltool-native perl-native gtk+ gtk+3 libice libsm libxfc=
e4util xfce4-dev-tools xfconf virtual/libx11"
> +DEPENDS =3D "intltool-native perl-native gtk+3 libice libsm libxfce4uti=
l xfce4-dev-tools xfconf virtual/libx11"
>
>  inherit xfce gtk-doc gobject-introspection features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI +=3D " \
> -    file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.pa=
tch \
> -"
> -SRC_URI[md5sum] =3D "50eae4bab5eeced186bce16fb5f802ac"
> -SRC_URI[sha256sum] =3D "c449075eaeae4d1138d22eeed3d2ad7032b87fb8878eada=
9b770325bed87f2da"
> +# TODO: Check if this can go
> +SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.=
xml-fix.patch"
> +SRC_URI[sha256sum] =3D "8b06c9e94f4be88a9d87c47592411b6cbc32073e7af9cbd=
64c7b2924ec90ceaa"
>
>  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
>
> @@ -20,15 +18,8 @@ PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gladeui2] =3D "--enable-gladeui2,--disable-gladeui2,glade=
"
>  PACKAGECONFIG[startup-notification] =3D "--enable-startup-notification,=
--disable-startup-notification,startup-notification"
>
> -PACKAGES =3D+ "${PN}-gtk2 ${PN}-gtk3"
> -FILES_${PN}-gtk2 +=3D "${libdir}/libxfce4ui-1.so.* ${libdir}/libxfce4kb=
d-private-2.so.*"
> -FILES_${PN}-gtk3 +=3D "${libdir}/libxfce4ui-2.so.* ${libdir}/libxfce4kb=
d-private-3.so.*"
> -
>  PACKAGES +=3D "${PN}-glade"
>  FILES_${PN}-glade =3D " \
>      ${libdir}/glade \
>      ${datadir}/glade \
>  "
> -
> -RDEPENDS_${PN}-gtk2 =3D "${PN}"
> -RDEPENDS_${PN}-gtk3 =3D "${PN}"
> --
> 2.26.2
>
>
>=20
>
