Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159D2C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 11:12:53 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.50135.1699701169404610036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 03:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id CC1A81E4E5
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 12:12:47 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1luv-2WvQRN0; Sat, 11 Nov 2023 12:12:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] drop GNOMEBASEBUILDCLASS = "meson"
Date: Sat, 11 Nov 2023 12:13:14 +0100
Message-ID: <20231111111314.4857-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699701165-F77FD954-5C4904A7/0/0 CLEAN NORMAL
X-TOI-MSGID: 5b58643c-de97-4c4a-aa6e-2b91ea4ddefd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106550

It is set to meson by default
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb           | 1 -
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb        | 1 -
 meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb         | 1 -
 .../network-manager-applet/network-manager-applet_1.34.0.bb     | 1 -
 meta-gnome/recipes-gimp/babl/babl_0.1.106.bb                    | 2 --
 meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb                     | 1 -
 meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb           | 1 -
 meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb                  | 1 -
 meta-gnome/recipes-gnome/eog/eog_45.1.bb                        | 1 -
 meta-gnome/recipes-gnome/evince/evince_45.0.bb                  | 1 -
 .../evolution-data-server/evolution-data-server.inc             | 1 +
 meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb        | 1 -
 meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb                      | 1 -
 meta-gnome/recipes-gnome/gedit/gedit_46.1.bb                    | 1 -
 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb    | 1 -
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb                | 1 -
 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb             | 2 +-
 meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb                      | 1 -
 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb     | 1 -
 .../recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb   | 1 -
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb    | 1 -
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb       | 1 -
 .../recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb   | 1 -
 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb  | 1 -
 .../recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb     | 1 -
 .../gnome-control-center/gnome-control-center_45.1.bb           | 1 -
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb    | 1 -
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb | 1 -
 .../recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb     | 1 +
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb   | 1 -
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb    | 1 +
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb      | 1 +
 .../gnome-online-accounts/gnome-online-accounts_3.48.0.bb       | 1 -
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb      | 1 +
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1 -
 .../recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb     | 2 --
 meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb    | 1 -
 .../gnome-settings-daemon/gnome-settings-daemon_45.0.bb         | 1 -
 .../recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb    | 1 -
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb        | 1 -
 meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb  | 1 -
 .../gnome-system-monitor/gnome-system-monitor_45.0.1.bb         | 1 -
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb       | 1 -
 .../recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb   | 1 -
 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb      | 1 -
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb          | 1 -
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb                  | 1 -
 meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb                 | 1 -
 meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb                | 1 +
 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb                | 2 +-
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb       | 1 +
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb  | 1 -
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb | 1 -
 meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb                    | 1 -
 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb            | 1 -
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb               | 1 +
 meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb              | 1 +
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb      | 1 -
 meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb               | 1 -
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb              | 1 +
 meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb            | 1 +
 meta-gnome/recipes-gnome/mutter/mutter_45.1.bb                  | 1 -
 meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb              | 1 -
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                     | 1 -
 meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb              | 1 -
 meta-gnome/recipes-gnome/tecla/tecla_45.0.bb                    | 1 -
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb        | 1 -
 meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb               | 1 -
 meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb                | 2 --
 meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb                  | 1 +
 meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb                | 1 -
 .../libcloudproviders/libcloudproviders_0.3.4.bb                | 1 -
 .../xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb         | 1 -
 meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb      | 1 -
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb        | 1 -
 .../networkmanager/networkmanager_1.44.0.bb                     | 1 -
 meta-networking/recipes-support/spice/phodav_3.0.bb             | 1 -
 .../recipes-connectivity/modemmanager/modemmanager_1.22.0.bb    | 1 -
 meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb             | 1 -
 meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb                  | 1 -
 meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb               | 1 -
 meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb                | 2 +-
 meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb                  | 1 -
 meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb                       | 1 -
 meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb                        | 1 -
 meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb                     | 1 +
 meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb       | 1 +
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb                     | 1 -
 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb                 | 1 -
 meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb           | 1 -
 meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb                | 1 -
 meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb           | 1 -
 meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb                | 1 -
 93 files changed, 17 insertions(+), 82 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.6.bb
index c94a9590f..5b9717f46 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     libgee \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Db_lto=3Dfalse "
=20
 CFLAGS:append:toolchain-clang =3D " -Wno-error=3Dimplicit-function-decla=
ration"
diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/m=
eta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
index 8737b6d7e..3bfe38f08 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
@@ -12,7 +12,6 @@ DEPENDS =3D " \
     zlib \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D "with-vala"
diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb b/me=
ta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
index bff9a3360..997a5a71b 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 DEPENDS =3D "glib-2.0 gtk+3 gtk4 networkmanager"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gobject-introspection gtk-doc gettext vala features_ch=
eck
=20
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG','gcr'=
,'x11','',d)} opengl"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/netwo=
rk-manager-applet_1.34.0.bb b/meta-gnome/recipes-connectivity/network-man=
ager-applet/network-manager-applet_1.34.0.bb
index 5ce1b9b14..312d759db 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-mana=
ger-applet_1.34.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-mana=
ger-applet_1.34.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 DEPENDS =3D "gtk+3 libnma libnotify libsecret libgudev networkmanager is=
o-codes nss"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit features_check gnomebase gsettings gtk-icon-cache gettext pkgcon=
fig
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb b/meta-gnome/re=
cipes-gimp/babl/babl_0.1.106.bb
index 5d656adb0..61cd7ada9 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
@@ -2,8 +2,6 @@ SUMMARY =3D "Babl is a dynamic, any to any, pixel format =
conversion library"
 LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6a8e020838b23406c81b19c1d46=
df6"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
-
 GIR_MESON_OPTION =3D "enable-gir"
 VALA_MESON_OPTION =3D "enable-vapi"
=20
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.46.bb
index 75e11722a..8c3f89fa9 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
@@ -17,7 +17,6 @@ DEPENDS:append:toolchain-clang  =3D " openmp"
 DEPENDS:remove:toolchain-clang:riscv32  =3D "openmp"
 DEPENDS:remove:toolchain-clang:powerpc  =3D "openmp"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 VALA_MESON_OPTION =3D ""
=20
 inherit features_check gnomebase gobject-introspection vala
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb b/meta=
-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
index 31226ef44..32a69a070 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Configuration editor for dconf"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     dconf \
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb b/meta-gnome/=
recipes-gnome/dconf/dconf_0.40.0.bb
index 6641be86e..c5c45a026 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
@@ -7,7 +7,6 @@ SRC_URI[archive.sha256sum] =3D "cf7f22a4c9200421d8d3325c5=
c1b8b93a36843650c9f95d645
=20
 DEPENDS =3D "dbus glib-2.0 intltool-native"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase bash-completion vala
=20
diff --git a/meta-gnome/recipes-gnome/eog/eog_45.1.bb b/meta-gnome/recipe=
s-gnome/eog/eog_45.1.bb
index 41bd5d882..41ed940c0 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.1.bb
@@ -15,7 +15,6 @@ DEPENDS =3D " \
     lcms \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime=
-xdg features_check gtk-icon-cache
=20
diff --git a/meta-gnome/recipes-gnome/evince/evince_45.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_45.0.bb
index d97a8a0cf..e2c6b3b82 100644
--- a/meta-gnome/recipes-gnome/evince/evince_45.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
@@ -25,7 +25,6 @@ DEPENDS =3D " \
     zlib \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introsp=
ection gettext mime-xdg gi-docgen features_check gtk-icon-cache
=20
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 195b8cb85..2f3bf6198 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
                     file://src/camel/camel.h;endline=3D24;md5=3D342fc5e9=
357254bc30c24e43ae47d9a1 \
                     file://src/libedataserver/e-data-server-util.h;endli=
ne=3D20;md5=3D8f21a9c80ea82a4fb80b5f959f672543"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase upstream-version-is-even
=20
 SRC_URI[archive.sha256sum] =3D "91f4ffc38a1b8d2fe8939834449ac541c0bff4a3=
9b444edc2a9529344a28e98a"
diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
index f9b6841d6..ce2b6d95b 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "An archive manager utility for the  GNOME En=
vironment"
 LICENSE=3D"GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb b/meta-gnome/reci=
pes-gnome/gdm/gdm_45.0.1.bb
index 311d28325..d95ea9013 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
@@ -17,7 +17,6 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 systemd pam polkit gobject-introspecti=
on-data"
 GIR_MESON_OPTION =3D ""
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
 SRC_URI =3D "https://download.gnome.org/sources/gdm/${@oe.utils.trim_ver=
sion("${PV}", 1)}/gdm-${PV}.tar.xz"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.1.bb
index 0014b512a..c0221b9a7 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
@@ -3,7 +3,6 @@ SECTION =3D "x11/gnome"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     appstream-glib-native \
diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb=
 b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
index 42659d0f6..a1495d615 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
@@ -3,7 +3,6 @@ SUMMARY =3D "A convenience library for the geocoding"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e=
9abc605"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D "enable-introspection"
 GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
=20
diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb b/meta-gnom=
e/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
index 19d31f428..8fd658310 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D625f055f41728f=
84a8d7938acc35bdc2"
=20
 DEPENDS =3D "exiv2 python3-pygobject-native"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 inherit gnomebase gobject-introspection gtk-doc python3native vala
diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb b/meta-g=
nome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
index faeaa8ccb..e9ee434ad 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
@@ -10,7 +10,7 @@ DEPENDS =3D " \
     libsoup-2.4 \
     gnome-online-accounts \
 "
-
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gtk-doc gobject-introspection pkgconfig features_check
=20
 # for gnome-online-accounts
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.78.0.bb
index e91fa1bc6..67efdabd7 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Javascript bindings for GNOME"
 LICENSE =3D "MIT & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D "mozjs-115 cairo"
=20
diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb =
b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
index 29aeef1ad..8d602eee4 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     libarchive \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_OPTION =3D "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds=
_45.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_4=
5.0.bb
index 534f9a4c2..704a0b645 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.b=
b
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db52fb0a6df395e=
fb7047cb6fc56bfd7e"
=20
 SECTION =3D "x11/gnome"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gettext allarch
=20
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.=
34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.=
5.bb
index e2a885b1f..2a9726312 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
@@ -11,7 +11,6 @@ DEPENDS =3D "udev gtk+3 libnotify libcanberra bluez5"
 GNOMEBN =3D "gnome-bluetooth"
 S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspe=
ction upstream-version-is-even
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.=
6.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
index 7cce14dba..1385e4203 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
@@ -18,7 +18,6 @@ DEPENDS =3D " \
     libadwaita \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 GTKIC_VERSION =3D "4"
=20
diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
5.0.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.=
0.2.bb
index 3482f76a5..30f532c63 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.b=
b
@@ -20,7 +20,6 @@ GIR_MESON_ENABLE_FLAG =3D 'false'
 GIR_MESON_DISABLE_FLAG =3D 'true'
 VALA_MESON_OPTION =3D ''
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKIC_VERSION =3D '4'
=20
 inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache g=
ettext features_check
diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
index 1f63c8aeb..bcc19fbed 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
@@ -17,7 +17,6 @@ DEPENDS =3D " \
     geocode-glib \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKIC_VERSION =3D '4'
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstre=
am-version-is-even mime-xdg
=20
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.1=
6.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.=
bb
index 6aa28fc00..474512daa 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
@@ -13,7 +13,6 @@ CXXFLAGS +=3D "-D_LIBCPP_ENABLE_CXX17_REMOVED_AUTO_PTR"
 inherit gnomebase itstool gettext gnome-help features_check meson gtk-ic=
on-cache mime-xdg
 ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.1.bb
index 34e054f99..123c0b89f 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.1.bb
@@ -3,7 +3,6 @@ DESCRIPTION =3D "GNOME Settings is GNOME's main interface=
 for configuration of var
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKIC_VERSION =3D "4"
=20
 DEPENDS =3D " \
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
index 03411c88d..19bae74ce 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LIB;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-int=
rospection features_check gtk-doc
=20
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_45.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_45.0.bb
index 7cae5dbcc..4f3738cfb 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0=
.bb
@@ -16,7 +16,6 @@ DEPENDS =3D " \
     xz \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-x=
dg
=20
diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.4=
6.0.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.=
bb
index 597cdbab9..cf1122714 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb
@@ -2,6 +2,7 @@ SUMMARY =3D "GNOME Flashback (GNOME 2) session"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gsettings gtk-icon-cache gettext upstream-version-is-e=
ven features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer=
_45.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_4=
5.0.bb
index 2b24e54fe..629bc7186 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.b=
b
@@ -10,7 +10,6 @@ DEPENDS =3D " \
     libadwaita \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
=20
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
index 241a94cd7..65c22e639 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
@@ -17,6 +17,7 @@ DEPENDS =3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
 "
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gsettings features_check gettext
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb b=
/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
index fa162510c..47b6733e4 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
=20
 DEPENDS =3D "glib-2.0"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gettext pkgconfig gobject-introspection upstream-versi=
on-is-even
=20
 SRC_URI[archive.md5sum] =3D "a8fd71fcf31a87fc799d80396a526829"
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.48.0.bb
index cd14b4850..47b234e23 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "GNOME Online Accounts - Single sign-on frame=
work for GNOME"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala fe=
atures_check
=20
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb b=
/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
index 8380c51ed..02a8b01b2 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
@@ -2,6 +2,7 @@ SUMMARY =3D "GNOME flashback panel"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gettext up=
stream-version-is-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 066a50e52..4b05e52ca 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -24,7 +24,6 @@ DEPENDS =3D " \
=20
 RDEPENDS:${PN} =3D "tracker-miners"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gettext gnome-help features_check
=20
diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_4=
1.0.bb b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.=
bb
index fa7e161e9..4f82492e6 100644
--- a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b=
29e73d4adb9f9f6552"
=20
 SECTION =3D "x11/gnome"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
-
 inherit features_check gnomebase gettext upstream-version-is-even pkgcon=
fig
=20
 SRC_URI +=3D " file://0001-meson-remove-extraneous-positional-argument.p=
atch"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
index ec5b47b97..c5e27af58 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
@@ -16,7 +16,6 @@ DEPENDS =3D " \
     json-glib \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
=20
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_45.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_45.0.bb
index 16b7f2367..90df8bbd0 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Window navigation construction toolkit"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check=
 upstream-version-is-even
=20
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
44.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.=
1.bb
index 126e5ef3f..fc3e20486 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "GNOME Shell Extensions"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cb3a392cbf81a9e685ec13b88c4c=
101"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gettext gsettings features_check
=20
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
index 472c3bdb8..d35437cb5 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "GNOME Shell is the graphical shell of the GN=
OME desktop environment"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     libxml2-native \
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
index d5ed29c8a..f363a2bbe 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "GNOME Software allows users to easily find, =
discover and install apps
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION ?=3D "gtk_doc"
=20
 inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc mi=
me mime-xdg gettext upstream-version-is-even features_check
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_45.0.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-sy=
stem-monitor_45.0.1.bb
index c8130d27e..b90bbb8e5 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
45.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
45.0.1.bb
@@ -13,7 +13,6 @@ DEPENDS =3D " \
     libhandy \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_c=
heck gettext
=20
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
index 13b440dfe..8f91f7cca 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.GFDL;md5=3Da22d0be1ce2284b67950a4d1673dd1b0 \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit pkgconfig meson gsettings gnome-help gettext itstool upstream-ve=
rsion-is-even
=20
diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_45.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
5.1.bb
index c1e8f3a99..2d310bd05 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.b=
b
@@ -2,7 +2,6 @@ SUMMARY =3D "A simple text editor"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b=
/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
index ffdf2c9d3..a8d6a2ad6 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "libhandy"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gtk-icon-cache gobject-introspection features_check
=20
diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/met=
a-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index 91cbe82ea..40603993f 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -11,7 +11,6 @@ DEPENDS =3D " \
     liboauth \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gnome-help vala
=20
diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/=
recipes-gnome/grilo/grilo_0.3.16.bb
index e86f75f0c..14e1ca9fe 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     glib-2.0 \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gobject-introspection gtk-doc gettext vala
=20
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome=
/recipes-gnome/gsound/gsound_1.0.3.bb
index d01067eb1..6a50c22c7 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     libcanberra \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 VALA_MESON_OPTION =3D "enable_vala"
=20
diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb b/meta-gnom=
e/recipes-gnome/gspell/gspell_1.12.2.bb
index 389f2fd48..67e64915b 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2e1ec1540fb3=
e0beb68361344cba7e"
=20
 DEPENDS =3D "gtk+3 iso-codes enchant2"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gettext gobject-introspection vala
=20
 SRC_URI[archive.sha256sum] =3D "b4e993bd827e4ceb6a770b1b5e8950fce3be9c8b=
2b0cbeb22fdf992808dd2139"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb b/meta-gnom=
e/recipes-gnome/gthumb/gthumb_3.12.2.bb
index 92152aca6..ecf8f6ab5 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Image viewer and browser"
 LICENSE=3D"GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
=20
@@ -24,6 +23,7 @@ DEPENDS =3D " \
     libsecret \
 "
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit features_check gnomebase gnome-help gsettings itstool mime-xdg
=20
 SRC_URI[archive.sha256sum] =3D "97f8afe522535216541ebbf1e3b546d12a6beb38=
a8f0eb85f26e676934aad425"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.1=
1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index 1e5652d3b..75f199b10 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -10,6 +10,7 @@ PNAME =3D "gtksourceview"
=20
 S =3D "${WORKDIR}/${PNAME}-${PV}"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection upstream-version-is-even
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
index 979da792f..b10a317fa 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
@@ -10,7 +10,6 @@ PNAME =3D "gtksourceview"
=20
 S =3D "${WORKDIR}/${PNAME}-${PV}"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection vala
=20
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
index 33830c6a2..f43fe2cf5 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
@@ -19,7 +19,6 @@ PNAME =3D "gtksourceview"
=20
 S =3D "${WORKDIR}/${PNAME}-${PV}"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-=
cache gobject-introspection vala
=20
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.52.1.bb
index 61c8fadfd..627b499fe 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
@@ -2,7 +2,6 @@ DESCRIPTION =3D "gvfs is a userspace virtual filesystem"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D05df38dd77c35ec8431f212410a33=
29e"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gsettings bash-completion gettext upstream-version-is-=
even features_check useradd
=20
 DEPENDS +=3D "\
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-=
gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index 126ef712d..15e3d889f 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24 \
 DEPENDS =3D "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr3 =
json-glib"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection m=
anpages features_check
=20
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.51.bb
index e213f60bc..a54991574 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
@@ -6,6 +6,7 @@ SECTION =3D "libs"
=20
 DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
=20
 SRC_URI[archive.sha256sum] =3D "f0b83251f98b0fd5592b11895910cc0e19f79811=
0b389aba7da1cb7c474017f5"
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb b/meta-gn=
ome/recipes-gnome/libgtop/libgtop_2.41.1.bb
index 9a50b5e82..a8483de1a 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb
@@ -2,6 +2,7 @@ SUMMARY =3D "A library for collecting system monitoring d=
ata"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase lib_package gtk-doc gobject-introspection gettext upst=
ream-version-is-even features_check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
index 06353efab..c30edd15c 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
@@ -3,7 +3,6 @@ SUMMARY =3D "A library to access weather information from=
 online services"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GNOMEBN =3D "libgweather"
 S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
=20
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb b/meta-gno=
me/recipes-gnome/libwnck/libwnck3_43.0.bb
index 5b4de3290..c7f798911 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "cairo glib-2.0 gtk+3"
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] =3D "-Dstartup_notification=3Denabled,-Dstartup_notif=
ication=3Ddisabled,startup-notification libxres"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gn=
ome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index 3abba9499..8655affdb 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -8,6 +8,7 @@ DEPENDS =3D "intltool-native gnome-common-native gtk+ gdk=
-pixbuf-native libxres"
 PACKAGECONFIG ??=3D "startup-notification"
 PACKAGECONFIG[startup-notification] =3D "--enable-startup-notification,-=
-disable-startup-notification,startup-notification"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gobject-introspection features_check
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb b/meta-=
gnome/recipes-gnome/metacity/metacity_3.50.0.bb
index 2f8173c01..e6921e6de 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
@@ -21,6 +21,7 @@ DEPENDS =3D " \
 # depends on startup-notification which depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gsettings gettext upstream-version-is-even features_ch=
eck
=20
 SRC_URI[archive.sha256sum] =3D "18e9b106438d46394e4148bcb83acc6367312be5=
4559cdb564e270c1ccaeb60f"
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_45.1.bb
index 541991ba8..60347aa49 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
@@ -22,7 +22,6 @@ DEPENDS =3D " \
     xwayland \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_45.1.bb
index 4853c0ce3..9c0d154ec 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
@@ -4,7 +4,6 @@ SECTION =3D "x11/gnome"
 LICENSE=3D"GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     appstream-glib-native \
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
index e46cbfc69..738b07e8c 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     glib-2.0 \
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb b/meta-gn=
ome/recipes-gnome/sysprof/sysprof_3.44.0.bb
index c9d32c394..3523bad3e 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
@@ -4,7 +4,6 @@ LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
                     file://src/sysprof/sysprof-application.c;endline=3D1=
7;md5=3Da3de8df3b0f8876dd01e1388d2d4b607"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gnome-help gettext systemd upstream-version-is-even gs=
ettings mime mime-xdg
=20
 DEPENDS +=3D " \
diff --git a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb b/meta-gnome/re=
cipes-gnome/tecla/tecla_45.0.bb
index c047e29b7..197db17e9 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
@@ -10,7 +10,6 @@ DEPENDS =3D " \
 "
=20
 REQUIRED_DISTRO_FEATURES =3D "wayland"
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase pkgconfig  features_check
=20
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
index 426082bd5..2be6beacb 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
@@ -12,7 +12,6 @@ DEPENDS =3D " \
     zlib \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection vala bash-completion f=
eatures_check
=20
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb b/meta-gno=
me/recipes-gnome/tracker/tracker_3.6.0.bb
index d2eb392a0..e7f0beb02 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
@@ -18,7 +18,6 @@ DEPENDS =3D " \
     libstemmer \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gettext gnomebase gsettings gobject-introspection vala gtk-doc  =
bash-completion python3native
=20
diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb b/meta-gnom=
e/recipes-gnome/yelp/yelp-tools_42.1.bb
index 28ba39288..f3e1efeaa 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.GPL;md5=3Deb723b61539feef013de476e68b5c50a \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
-
 inherit gnomebase itstool
=20
 DEPENDS +=3D " \
diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb b/meta-gnome/=
recipes-gnome/yelp/yelp-xsl_42.1.bb
index ba2536443..5a8089e01 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LGPL;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
 "
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gettext itstool
=20
 DEPENDS +=3D "libxml2"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_3.44.2.bb
index a152e6405..92b9f6655 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
@@ -3,7 +3,6 @@ SECTION =3D "x11/gnome"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase pkgconfig itstool gtk-icon-cache features_check gettex=
t
=20
diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudprovide=
rs_0.3.4.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudprovid=
ers_0.3.4.bb
index 21fe4d119..1c03f41c2 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
4.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
4.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "libcloudproviders is a DBus API that allows =
cloud storage sync client
 LICENSE=3D"LGPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 VALA_MESON_OPTION ?=3D 'vapigen'
=20
 DEPENDS =3D "glib-2.0"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_45.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_45.0.bb
index 91469934d..6cf706a92 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_45.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_45.0.bb
@@ -17,7 +17,6 @@ DEPENDS =3D " \
=20
 RDEPENDS:${PN} =3D "xdg-desktop-portal xdg-desktop-portal-gtk"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
index 8bc8767d8..a5df37637 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
@@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-dat=
a"
=20
 SRC_URI[archive.sha256sum] =3D "736d8adbe8615f6cbc8fcfff9845dc985fd10e16=
629da236b4b52dbedf0a348b"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_=
1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.=
9.6.bb
index 90dc6ab49..376dd15d1 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.b=
b
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.b=
b
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd653=
80cdd255951079008b364516c \
=20
 DEPENDS =3D "glib-2.0 gdk-pixbuf"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gobject-introspection vala features_check
=20
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.44.0.bb
index 8d1c877ba..d213ef650 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.44.0.bb
@@ -22,7 +22,6 @@ DEPENDS =3D " \
 "
 DEPENDS:append:class-target =3D " bash-completion"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-=
doc update-alternatives upstream-version-is-even
=20
 SRC_URI =3D " \
diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb b/meta-n=
etworking/recipes-support/spice/phodav_3.0.bb
index 990e01702..08c65eb25 100644
--- a/meta-networking/recipes-support/spice/phodav_3.0.bb
+++ b/meta-networking/recipes-support/spice/phodav_3.0.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     libsoup \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
 GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.=
0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
index af1b98cad..6b4336eb8 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gettext systemd gobject-introspection bash-completion
=20
 DEPENDS =3D "glib-2.0 libgudev libxslt-native dbus"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
index 7cac69ece..f40a8144d 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec=
7527aac53b7a89d1d8 \
=20
 DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GNOMEBN =3D "glibmm"
 inherit gnomebase
=20
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb b/meta-oe/rec=
ipes-core/glib-2.0/glibmm_2.66.2.bb
index a6dc8ff20..c78dd55ca 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec=
7527aac53b7a89d1d8 \
=20
 DEPENDS =3D "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase
=20
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb b/meta-oe/=
recipes-core/mm-common/mm-common_1.0.4.bb
index 1ffdcfd04..56f7b5af6 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Common GNOME build files for C++ bindings"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase
=20
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.20.6.bb
index f7b54b9b0..0ed6e8235 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -8,7 +8,7 @@ BBCLASSEXTEND =3D "native"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
-PE =3D "1"
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase vala gobject-introspection
=20
 do_configure:prepend() {
diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb b/meta-oe/rec=
ipes-gnome/atk/atkmm-2.36_2.36.2.bb
index a152ff2d2..fa47cbd48 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1 \
=20
 DEPENDS =3D "atk glibmm-2.68"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GNOMEBN =3D "atkmm"
=20
 inherit gnomebase features_check
diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-=
gnome/atk/atkmm_2.28.2.bb
index f6cb0a1e1..bc637470f 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1 \
=20
 DEPENDS =3D "atk glibmm"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase features_check
=20
diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-oe/recipes-g=
nome/gcr/gcr3_3.41.1.bb
index a5bb868bb..b3438b4e6 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
@@ -15,7 +15,6 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
=20
 CFLAGS +=3D "-D_GNU_SOURCE"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 VALA_MESON_OPTION ?=3D ''
=20
diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb b/meta-oe/recipe=
s-gnome/gmime/gmime_3.2.13.bb
index c4738b25b..d8a6c1d6c 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
@@ -5,6 +5,7 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "glib-2.0 zlib"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gobject-introspection vala
=20
 SRC_URI =3D "https://github.com/jstedfast/${BPN}/releases/download/${PV}=
/${BP}.tar.xz \
diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb b/=
meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
index ceebe5ebd..944747021 100644
--- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
+++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 SECTION =3D "x11/gnome"
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase allarch
=20
 SRC_URI[archive.md5sum] =3D "933258d9c23e218eb6eec9cc1951b053"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm3_3.24.7.bb
index 28d2bb138..cac6474e7 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "glib-2.0-native atkmm pangomm glibmm gtk+3=
 cairomm gdk-pixbuf-native"
=20
 BPN =3D "gtkmm"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase features_check
=20
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/re=
cipes-gnome/libpeas/libpeas_1.36.0.bb
index 992060342..016981f04 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b54a1fd55a448=
865a0b32d41598759d"
=20
 DEPENDS =3D "gtk+3"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache feature=
s_check
diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb b/meta=
-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
index b18e1614e..a6872ef0c 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
@@ -3,7 +3,6 @@ SUMMARY =3D "C++ bindings for Cairo graphics library"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f5=
4d9"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase
=20
 DEPENDS +=3D "boost cairo libsigc++-3"
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb b/meta-oe/r=
ecipes-graphics/cairo/cairomm_1.14.3.bb
index 8123509f4..54a2b07ca 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
@@ -3,7 +3,6 @@ SUMMARY =3D "C++ bindings for Cairo graphics library"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f5=
4d9"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase
=20
 DEPENDS +=3D "boost cairo libsigc++-2.0"
diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb b/meta=
-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
index b4079f783..86787a6b7 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499 \
=20
 DEPENDS =3D "mm-common cairomm-1.16 glibmm-2.68 pango"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GNOMEBN =3D "pangomm"
 inherit gnomebase features_check
=20
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb b/meta-oe/r=
ecipes-graphics/pango/pangomm_2.46.2.bb
index 42074c14a..da822f324 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499 \
=20
 DEPENDS =3D "mm-common cairomm glibmm pango"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase features_check
=20
--=20
2.42.0


