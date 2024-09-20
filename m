Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BD4CF9C56
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20596.1726844891854776218
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id C79DFDE4D
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0W0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 16/23] gnome-control-center: update 46.2 -> 47.0.1
Date: Fri, 20 Sep 2024 17:08:15 +0200
Message-ID: <20240920150822.1131707-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844862-8DFF9467-A68BD968/0/0 CLEAN NORMAL
X-TOI-MSGID: 48687146-1b04-4947-9d07-080eb408e198
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112420

- inherit gi-docgen to make api-documentation available
- Add missing dependencies to build documentation
- Temporary switch to gitsm, because gnomebase.bbclass does not
  work, if package contains patch version number
- Remove PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
  Seems to be unneeded by now

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates
- Various CI fixes
- Various ports to modern libadwaita widgets
- Various mnemonics additions
- Use GtkWindow.set_default_icon_name for legacy sessions

Accessibility
- Rename "Reduce Animation" setting to "Animation Effects"

Apps
- Rename "File and Link Associations" page to "Files and Links"
- Show status page when Parental Controls aren't available
- Don't show "App is not sandboxed" banner for system components

Display
- Adapt rotation labels to the screen ratio
- Don't set automatic Night Light when Location Services are unavailable

Keyboard
- Load input choice locales asynchronously
- Fix "Move" buttons in input rows

Location
- Remove reference to now retired Mozilla Location Services

Mouse
- Use monochrome assets to support different accent colors
- Separate "Touchpad" row into its own preferences row group

Network
- Don't set empty ignored hosts

Notifications
- Turn "App Notifications" dialog into a subpage

Online Accounts
- Add a toast overlay for panel notifications/error messages

Users
- Modernize the "Add User" dialog
- Respect password "enforcing" based on /etc/security/pwquality.conf
- Avoid user names with underscores being interpreted as mnemonics
- Show correctly the remaining list of fingerprints to enroll
- Reverse sorting of finger names list to prioritize most used ones

Printers
- Various tweaks for the PPD Selection dialog
- Add button instead of link to open printer cups web page

Privacy
- Don't leak Bolt and Location subpages
- Fix visibility of Bolt settings when Bolt isn't available

Remote Desktop
- Fix loop resetting credentials
- Use new gnome-remote-desktop server configuration DBUs interface

Sound
- Add an empty state page for when no sound device is available

Wacom
- Set up Wacom stylus keyboard shortcuts and switch monitor

WWAN
- Fix crash preventing the load of the SIM Unlock dialog

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates
- Various CI fixes
- Various dialogs have been ported to subpages
- Add CcNumberRow to ease the mapping of settings to combo rows
- Skip tests if we don't have Xvfb or setxkbmap
- Various ports of rows to AdwButtonRow
- Various ports of dialogs to AdwDialog
- Various ports to AdwAlertDialog
- Various row changes to use the "property" style
- Improve padding of some search entries
- Fix Flatpak Development build manifest
- Reorganize various icon assets

Accessibility
- Add "Activate Windows on Hover" setting
- Move "Screen Reader" settings to the top
- Use same size for cursors settings interface
- Port Cursor Size dialog to AdwDialog
- Various icon artwork updates

Apps
- Improve description of "Default Apps" settings
- Turn app settings dialogs into subpages
- Fix "No Search Results" page
- Don't show "Open" button for Settings itself
- Show the number of static permissions in the "Required Access" row
- Indicate when no apps are available for a mime type in "Default Apps"

Background
- Implement accent colors
- Improve window preview style
- Improve a11y of the accent color toggles

Color
- Modernize looks of the Color settings
- Capitalize "Built-In Webcam"
- Rename "Laptop Screen" to "Built-In Screen"

Displays
- Fix panel crash when closing laptop lid
- Add icon to the Night Light settings

Keyboard
- Allow previewing keyboard layouts in Input Sources dialog
- Turn CcXkbModifierDialog into a subpage

Mouse
- Remove primary indicator delay for Mouse Test dialog
- Make Mouse Test not respond to middle click

Network
- Make the QR Code dialog contents readable by screen readers
- Use property rows to show Wi-Fi hotspot information
- Add 6GHz to "Supported Frequencies"
- Sort VPNs list
- Fix row removal when Bluetooth wifi is removed
- Add stable-ssid support for cloned-mac

Online Accounts
- Rename Windows Live provider to "Microsoft"
- Rename MS365 provider
- Close new account dialog when account creation is complete

Printers
- Modernize Printer Jobs dialog
- Modernize Printer Details dialog
- Fix spelling inconsistency for the word "Cancelled"
- Close "Add Printer" dialog when pressing "Escape" key
- Port "Undo" feature to AdwToast

Power
- Add suspend time options for mobile devices

Privacy
- Port to CcNumberRow

Search
- Port "Search Locations" page to a subpage

Sharing
- Improve text description of the Sharing features
- Add DAV address in the File Sharing dialog
- Add notice about shared files not being encrypted
- Hide panel when none of the Sharing features are available in the syste=
m

Sound
- Use AppInfo to get app icons and fallback to icon-theme
- Try to use AppInfo icon for stream icons
- Turn volume levels dialog into a subpage
- Adjust sound of the "Click" effect closer to the freedesktop.org bell s=
ound
- Make sound setting sliders more accessible with keyboard

System
- Load subpages on demand to speed up panel load
- Avoid re-setting Remote Desktop credentials when they haven't changed

Users
- Don't show unwanted system accounts
- Fix parental controls settings visibility
- Rename "Add Enterprise User" to "Add Enterprise Login"

Wacom
- Always allow calibration for display tablets
- Enforce a Z-shape sequence of calibration points
- Fix wrong alignment detection in the calibrator
- Reset the clock after any click on the calibrator
- Up the calibrator threshold to 50 pixels
- Simplify the calibrator code
- Fall back to the generic tablet provided by libwacom
- If we have two identical monitors, suffix the connector name

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-Add-meson-option-to-pass-sysroot.patch | 25 ++++++++++---------
 ...46.2.bb =3D> gnome-control-center_47.0.1.bb} | 10 +++++---
 2 files changed, 19 insertions(+), 16 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_46.2.bb =3D> gnome-control-center_47.0.1.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index c1bd34d14..851537563 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific]
  3 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index b2302bf..5b9baf5 100644
+index 9aeeed313..6097263a6 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,3 +1,4 @@
@@ -22,28 +22,29 @@ index b2302bf..5b9baf5 100644
  option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
  option('location-services', type: 'feature', value: 'enabled', descript=
ion: 'build with location services')
 diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
-index 6ced050..df1f808 100644
+index 8f9cbecdf..17f17d395 100644
 --- a/panels/background/meson.build
 +++ b/panels/background/meson.build
-@@ -24,7 +24,7 @@ common_sources +=3D gnome.mkenums_simple(
+@@ -23,7 +23,7 @@ common_sources +=3D gnome.mkenums_simple(
+ )
 =20
- enums =3D 'gdesktop-enums-types'
- enums_header =3D files(
+ gdesktop_enums_header =3D files(
 -  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h'
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h'
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
  )
 =20
- common_sources +=3D gnome.mkenums(
+ common_sources +=3D gnome.mkenums_simple(
 diff --git a/panels/system/meson.build b/panels/system/meson.build
-index 4fee822..979332a 100644
+index bbe004837..92e809fbe 100644
 --- a/panels/system/meson.build
 +++ b/panels/system/meson.build
-@@ -73,7 +73,7 @@ sources +=3D gnome.compile_resources(
+@@ -68,7 +68,7 @@ sources +=3D gnome.compile_resources(
  )
 =20
- enums_header =3D files(
--  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
+ gdesktop_enums_header =3D files(
+-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h'
 +  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
-   'datetime/cc-datetime-page.h'
  )
 =20
+ sources +=3D gnome.mkenums_simple(
+=20
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_47.0.1.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_46.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_47.0.1.bb
index ae96caf94..f2b0d09d5 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.0.1.bb
@@ -31,14 +31,17 @@ DEPENDS =3D " \
     tecla \
     udisks2 \
     upower \
+    ${@' libxslt-native docbook-xsl-stylesheets-native' if d.getVar('GID=
OCGEN_ENABLED') =3D=3D 'True' else ''} \
 "
=20
-inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-ve=
rsion-is-even bash-completion features_check
+inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen u=
pstream-version-is-even bash-completion features_check
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
+SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;pro=
tocol=3Dhttps;nobranch=3D1"
=20
+S =3D "${WORKDIR}/git"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "6335c6cb8164e574db521fff61cfa3dfaa55f1db=
66ae3bca02750a193e1c4f3d"
+SRCREV =3D "adb035fa5c61cdcff622536fde9456e3859211fd"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
@@ -49,11 +52,10 @@ PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler=
"
 PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,=
malcontent,malcontent-ui"
=20
 EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
+GIDOCGEN_MESON_OPTION =3D 'documentation'
=20
 export XDG_DATA_DIRS =3D "${STAGING_DATADIR}"
=20
-PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
-
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/gnome-shell \
--=20
2.46.0


