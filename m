Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4A8C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:43:48 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.9090.1741851821779775185
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 062CE102A;
	Thu, 13 Mar 2025 08:43:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsdE8-4WdEZC0; Thu, 13 Mar 2025 08:43:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFC][gnome48][meta-gnome][PATCH 6/8] gnome-control-center: update 47.3 -> 48.rc.1
Date: Thu, 13 Mar 2025 08:44:09 +0100
Message-ID: <20250313074411.5600-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313074411.5600-1-f_l_k@t-online.de>
References: <20250313074411.5600-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1741851816-ECFF7466-EAC70C70/0/0 CLEAN NORMAL
X-TOI-MSGID: 9229f2b4-8eb6-4f1b-bee7-a46becc16f8a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115960

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.rc.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates

- Include subprojects/libgxdp in the release tarball
- Pin the revision of libgxdp wrap file

Wellbeing
- Fix type in a gtk_widget_dispose_template() call

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates

Applications
- Add Global Shortcuts Provider frontend dialog

Displays
- Add HDR luminance settings UI

Power
- Add a translator comment about "Battery Charging" string
- Use new UPower power-profiles-daemon DBus API

Sound
- Fix styling of sound test button

Users
- Synchronize fingerprint enrollment feedback strings with fprintd

Wellbeing
- Fix translatability of =E2=80=98average $weekday=E2=80=99 strings
- Support locales where the week starts on a Saturday
- Add missing includes for _NL_TIME_FIRST_WEEKDAY code path
- Block settings change notifications while updating them
- Fix delayed-apply of movement break settings

Wifi
- Disable activation for rows in Saved Wi-Fi Networks dialog

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Various translation updates
- Make search bar always grab focus with shortcuts
- Fix a memory leak in CcMaskPaintable (used for illustrations)
- Fix missing icons in Mouse/Wacom/WWAN settings (ship our own icons)
- Add single-panel-mode for distros to launch Settings in a single panel =
(without sidebar)
- Use static hostname instead of pretty hostname (hostnamed) in URLs
Dependency updates
- gnome-settings-daemon >=3D 48.alpha.1
Device Security
- Don't hardcode height of "help" dialog
Display
- Add monitor HDR setting
Keyboard
- Rename old "logout" media key name to "Power Off"
- Add new media keys shortcuts for "Restart" and "Logout"
- Port shortcuts dialog to AdwDialog
Mouse
- Use AdwToggleGroup in the "Primary Button" settings
Region
- Port Format Chooser to AdwPreferencesPage
- Inform accountsservice of all configured languages
Sound
- Filter out NULL stream names in Volume Levels settings
Thunderbolt
- Fix unescaped string in device status dialog
Wellbeing
- Add screen time support
- Use gtk_widget_set_child_visible in allocate
- Various accessibility/navigation/esthetic improvements
- Split data collection and limits settings
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Various translation updates
- Start using the new GNOME release service
- Prevent crash on CcSplitRow related to Gtk size group changes
- Use accessible-role=3Dpresentation for illustrative icons/images
- Use gtk_list_box_remove_all instead of iterating GTK widget children
- Import developer docs from gitlab wiki to the docs/ source folder
- Various improvements to our development Flatpak build
- Various style/consistency updates to gobject creations
- Stop calling "gtk_widget_get_root()" incorrectly
- Various improvements to CcPermissionInfobar
- Use luminance masking for webm assets
- Introduce follow-accent property to CcMaskPaintable
- Allow FQDN hostnames
Dependency updates
- upower >=3D 1.90.6
- gsettings-desktop-schema >=3D 47.0
- libadwaita >=3D 1.7.alpha
About
- Fixes wrong GPU names when g-c-c is launched using dGPU

Accessibility
- Turn CcCursorSizeDialog into a page
- Remove "screen" mark labels in zoom page
- Simplify cursor size subtitle
Apps
- Avoid crash when parsing invalid app permissions
- Handle Epiphany webapps
- Various memory leak fixes
- Remove .circular style class from some buttons
Appearance
- Load GnomeBG thumbnails async
- Internally handle scale-factor
- Allow for concurrent cache updates
- Generate one background thumbnail at a time
- Don't accidentally reset accent colors
- Add "undo" option when deleting a wallpaper
- Load async wallpapers in order
Color
- Fix "Show details" link on profile warning
- Fix row expansion and button visibility
- Port "Add Profile" to AdwDialog
- Rename "Color" panel to "Color Management"
- Various code style improvements
- Port add profile page from GtkTreeView to GtkListView
- Ensure profile is connected before setting system-wide
- Various fixes to the color calibration tool
Date and Time
- Fix incorrect disabling of auto timezone without location services
- Use AdwToggleGroup in the "Time Format" row
Display
- Snap monitors after updating prefer mode to current config when enable =
join mode
- Port "Scale" and "Multiple Displays" rows to AdwToggleGroup
- Use real color temp in night light scale widget
Keyboard
- Port Shortcut editor to AdwDialog
- Use "--parent-handle" option when launching Tecla (keyboard layout prev=
iewer)
- Fix compose key example string
Network
- Make metered connection and hotspot settings adaptive to small screens
- Fix memory leaks in wireguard page
Notifications
- Update UI when underlying gsetting changes
Mouse
- Convert VP9 webm with alpha to monochrome variants (so we don't need gs=
treamer-bad-pluggins)
- Update webm illustration assets to latest versions
Mobile Networks
- Fix status pages alignments
- Use header capitalization in the "Turn off Airplane Mode" button
Multitasking
- Make workspace settings insensitive for single workspace
Online Accounts
- Track goa changes in PresentationIdentity and update the UI accordingly
Power
- Add support for battery charge limiting
- Split panel into "General" and "Power Saving" pages
- Split "Black Screen" setting in switch and delay
- Remove separate dialog for "Automatic Suspend"

- Various improvements on code readability and refactors
- Fix conflicting mnemonics
- Handle when tuned-ppd has an unsupported power profile
Printers
- Remove "search as you type" feature as it conflicts with global search
- Add a confirmation dialog when attempting to clear all jobs
- Add "No Results" page when nothing to show on search
- Use a consistent printer icon in several status pages
- Set "Driver" row after selecting ppd file in Printer Details dialog
- Port "Install PPD" dialog to GtkFileDialog
Region
- Update language row after closing lang selector
- Port format chooser dialog to AdwDialog
- Show locale name in format chooser preview
- Reset format chooser preview when uncollapsing
Sound
- Turn sound alert dialog into a subpage
- Prevent crash in Volume Levels when stream has no name
Search
- Add a button to open custom search locations
Sharing
- Fix saving of new shared folders in "Media Sharing" settings
- Make "Media Sharing" dialog use GtkFileDialog for new folders
Tests
- Disable randomly failing network panel test
- Improve waiting on NM device/client changes
- Add FQDN hostname tests
Thunderbolt
- Use AdwToast to display transient notifications
- Use property-rows style in device dialog
Users
- Use a dialog to confirm fingerprint removal
- Stop shipping legacy avatar images
- Fix conflicting mnemonic in "Add User" dialog
- Port "Remove User" button to AdwButtonRow
- Make screen reader read avatar file names when there are no names
- Port fingerprint dialog to AdwDialog
Wacom
- Do not crash when handling an unknown stylus ID
- Support hidpi for tablet/stylus images
- Make assets recolorable
- Rename visible entry to "Graphics Tablet"
- Change from "left handed orientation" to "location of buttons"
- Various style tweaks to stylus page
Wellbeing
- Add initial Wellbeing panel (disabled by default)
Wifi
- Fix crash on wifi adapter removal
- Fix using wifi hotspot with multiple wifi adapters
- Don't disable wireless globally when toggling one Wifi connection OFF
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

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-control-center_47.3.bb =3D> gnome-control-center_48.rc.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_47.3.bb =3D> gnome-control-center_48.rc.1.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_47.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_48.rc.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_47.3.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_48.rc.1.bb
index a73183f0f8..02fb43eb64 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
48.rc.1.bb
@@ -38,8 +38,9 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext gi-docgen upstream-
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
+SRC_URI =3D "https://download.gnome.org/sources/gnome-control-center/48/=
gnome-control-center-48.rc.1.tar.xz"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "78381d5a7f1d5b297c9a19611145ee5e0584f06a=
c575ed08ad070a0c07bbeaa2"
+SRC_URI[sha256sum] =3D "20cae814d92989ca16e4ec268b16f90e9f23aef9dc4c5318=
97ae1da353dac885"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
--=20
2.48.1


