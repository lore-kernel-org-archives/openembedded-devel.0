Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0ADC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 09:11:34 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web12.5287.1654074691496614428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 02:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 82DFA117AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  1 Jun 2022 11:11:28 +0200 (CEST)
Received: from localhost.localdomain ([84.163.46.87]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nwKNz-1tDEWX0; Wed, 1 Jun 2022 11:11:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] unblock some recipes for wayland
Date: Wed,  1 Jun 2022 11:11:18 +0200
Message-Id: <20220601091118.1542331-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654074688-0143D1EA-B6CF51DD/0/0 CLEAN NORMAL
X-TOI-MSGID: bc1e30c6-1733-443e-a057-0f9fe0659935
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 09:11:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97358

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/geary/geary_40.0.bb |  4 ++--
 meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb         |  2 +-
 .../evolution-data-server/evolution-data-server.bb  |  2 +-
 meta-gnome/recipes-gnome/gedit/gedit_42.1.bb        |  5 +++--
 .../gnome-keyring/gnome-keyring_40.0.bb             |  2 +-
 .../gnome-online-accounts_3.44.0.bb                 |  3 +--
 .../gnome-system-monitor_42.0.bb                    |  3 ++-
 .../gtksourceview/gtksourceview4_4.8.2.bb           |  2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb        |  3 +--
 .../recipes-gnome/libgdata/libgdata_0.18.1.bb       |  3 +--
 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb  |  6 ++----
 meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb   | 11 ++++++-----
 meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb        |  3 +--
 meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb    |  2 +-
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb      |  7 ++++---
 meta-xfce/classes/thunar-plugin.bbclass             |  4 +++-
 .../shares/thunar-shares-plugin_0.3.1.bb            |  5 +++--
 meta-xfce/recipes-xfce/exo/exo_4.16.3.bb            |  6 ++++--
 meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb      |  4 +++-
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb    | 13 +++++++++----
 meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb      |  9 ++++++---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb  |  4 +++-
 22 files changed, 59 insertions(+), 44 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_40.0.bb
index 501b27a54..4b454dc02 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -41,8 +41,8 @@ SRC_URI =3D " \
 S =3D "${WORKDIR}/git"
 SRCREV =3D "e561775c1580a9f60a726355b2b897bfc9cb3382"
=20
-# for gnome-online-accounts
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 GIR_MESON_OPTION =3D ""
 EXTRA_OEMESON =3D "-Dprofile=3Drelease"
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.36.bb
index a6e5fa030..64291bee5 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
@@ -17,7 +17,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit features_check gnomebase vala gobject-introspection
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SHPV =3D "${@gnome_verdir("${PV}")}"
=20
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index b4931d796..64774b0fe 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -8,7 +8,7 @@ DEPENDS =3D " \
=20
 inherit pkgconfig gsettings gobject-introspection features_check cmake g=
tk-doc gettext perlnative vala
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D " \
     file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_42.1.bb
index e2bbf1889..3efd2a9b3 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
@@ -24,8 +24,9 @@ def gnome_verdir(v):
 SRC_URI[archive.sha256sum] =3D "7f1fd43df5110d4c37de6541993f41f0fbc3efc7=
90900e92053479ba069920e9"
=20
 # gobject-introspection is mandatory and cannot be configured
-# x11 is needed for tepl and gtksourceview4
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
 GIR_MESON_OPTION =3D ""
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
index 5aa52d1a5..b6d9a58e8 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
@@ -19,7 +19,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings features_check remove-libtool gettext
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[archive.sha256sum] =3D "a3d24db08ee2fdf240fbbf0971a98c8ee295aa0e=
1a774537f4ea938038a3b931"
 SRC_URI +=3D " \
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.44.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.44.0.bb
index 64aa2f4d9..451670e64 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.44.0.bb
@@ -6,8 +6,7 @@ GNOMEBASEBUILDCLASS =3D "autotools"
=20
 inherit gnomebase gsettings gobject-introspection gsettings gtk-doc vala=
 gettext features_check
=20
-# for webkitgtk
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 DEPENDS =3D "glib-2.0"
=20
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_42.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_42.0.bb
index 219a069b6..32ecc90eb 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
42.0.bb
@@ -17,7 +17,8 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_c=
heck gettext
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 polkit"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
index db4d89de2..979da792f 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
@@ -14,7 +14,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection vala
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/4.8/${PNAM=
E}-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "842de7e5cb52000fd810e4be39cd9fe29ffa87477f15da85=
c18f7b82d45637cc"
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.50.0.bb
index 93f7f5761..21d351a7b 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
@@ -14,8 +14,7 @@ SRC_URI =3D "https://download.gnome.org/sources/${BPN}/=
${@gnome_verdir("${PV}")}/$
=20
 SRC_URI[archive.sha256sum] =3D "cbc2f564d2e9f00c760673f42d6803bce3e081ab=
7ffb4456deffffba9339b4dd"
=20
-# depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 EXTRA_OEMESON =3D " \
     -Dbluray=3Dfalse \
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-=
gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index 921c3ee80..bd9180e8a 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -14,8 +14,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection m=
anpages features_check
=20
-# gcr
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH=3D"${B}/gdata/.libs"
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gn=
ome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 3ee7746c1..2e60264e0 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -2,11 +2,9 @@ SUMMARY =3D "A library for collecting system monitoring =
data"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
-inherit gnomebase lib_package gtk-doc gobject-introspection gettext upst=
ream-version-is-even
+inherit gnomebase lib_package gtk-doc gobject-introspection gettext upst=
ream-version-is-even features_check
=20
-# depends on libxau
-inherit features_check
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-fix-compile-error-for-cross-compile.patch"
=20
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb b/meta-gno=
me/recipes-gnome/libwnck/libwnck3_40.1.bb
index cb4e459b3..a6c82b2cb 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfd=
d0d91eb439ebec522ec2"
 BPN =3D "libwnck"
=20
 SECTION =3D "x11/libs"
-DEPENDS =3D "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native=
 libxres"
+DEPENDS =3D "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native=
"
=20
-PACKAGECONFIG ??=3D "startup-notification"
-PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Denable=
d,-Dstartup_notification=3Ddisabled,startup-notification"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[x11] =3D "-Dstartup_notification=3Denabled,-Dstartup_notif=
ication=3Ddisabled,startup-notification libxres"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
@@ -22,5 +22,6 @@ def gnome_verdir(v):
=20
 SRC_URI[archive.sha256sum] =3D "03134fa114ef3fbe34075aa83678f58aa2debe9f=
cef4ea23c0779e28601d6611"
=20
-# libxres means x11 only
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb b/meta-gnome/re=
cipes-gnome/tepl/tepl_6.00.0.bb
index 61e82e285..66de215cf 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
@@ -15,8 +15,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gobject-introspection gettext features_check
=20
-# for gtksourceview4
-REQUIRED_DISTRO_FEATURES +=3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[archive.sha256sum] =3D "a86397a895dca9c0de7a5ccb063bda8f7ef691cc=
cb950ce2cfdee367903e7a63"
=20
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_3.42.1.bb
index d48eb826f..2bcd8cc6b 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
@@ -12,7 +12,7 @@ DEPENDS =3D " \
     gtk+3 \
 "
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[archive.sha256sum] =3D "a08e0c8e626615ee2c23ff74628eba6f8b486875=
dd54371ca7e2d7605b72a87c"
 SRC_URI +=3D "file://0001-Harcode-shebang-to-avoid-pointing-to-build-sys=
tem-s-.patch"
diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/rec=
ipes-devtools/glade/glade_3.22.2.bb
index c7f98fac9..6c1112038 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -4,14 +4,15 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8ae0f3c68be6977bb5=
522 \
                     file://COPYING.GPL;md5=3D9ac2e7cff1ddaf48b6eab6028f2=
3ef88 \
                     file://COPYING.LGPL;md5=3D252890d9eee26aab7b432e8b8a=
616475"
-DEPENDS =3D "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
+DEPENDS =3D "gtk+3 glib-2.0 libxml2 intltool-native \
            gnome-common-native \
 "
=20
-
 inherit features_check autotools pkgconfig gnomebase gobject-introspecti=
on mime-xdg
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${P=
V}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/=
thunar-plugin.bbclass
index 423f337be..3719cba21 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -1,6 +1,8 @@
 inherit xfce features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 DEPENDS +=3D "thunar"
=20
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin=
_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_=
0.3.1.bb
index 6ed9cecef..fb7589637 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.=
bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.=
bb
@@ -3,8 +3,9 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
 inherit thunar-plugin features_check
-# x11 is needed for thunar
-REQUIRED_DISTRO_FEATURES =3D "pam x11"
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "pam"
=20
 SRC_URI[md5sum] =3D "0884855d60cf1031b9013b6f5b125372"
 SRC_URI[sha256sum] =3D "dc1d8c7caa727e76d033d4653dc0742613f57a1711d00509=
00659c90a84452a0"
diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb b/meta-xfce/recipes=
-xfce/exo/exo_4.16.3.bb
index 2b164442f..32735bc6e 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
@@ -2,11 +2,13 @@ DESCRIPTION =3D "Application library for the Xfce deskt=
op environment"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-DEPENDS =3D "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
+DEPENDS =3D "gtk+3 libxfce4ui liburi-perl-native cairo"
=20
 inherit xfce perlnative gtk-doc features_check mime-xdg
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 # SRC_URI must follow inherited one
 SRC_URI +=3D " \
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb b/meta-xfce/r=
ecipes-xfce/garcon/garcon_4.16.1.bb
index a6c56edf3..14f0c4a64 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
@@ -6,7 +6,9 @@ DEPENDS =3D "xfce4-dev-tools-native libxfce4ui intltool-n=
ative"
=20
 inherit xfce gtk-doc gobject-introspection features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-xfce-applications.menu-don-t-bloat-settings-me=
nu-by-.patch"
 SRC_URI[sha256sum] =3D "84914927a2c1fda167f67af26a6640630a744a22940df508=
aa6c752cdbd3d21d"
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
index e3d2a00ee..bb45ee6f4 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
@@ -2,11 +2,13 @@ SUMMARY =3D "Xfce4 Widget library and X Window System i=
nteraction"
 SECTION =3D "x11/libs"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
-DEPENDS =3D "intltool-native perl-native gtk+3 libice libsm libxfce4util=
 xfce4-dev-tools xfconf virtual/libx11"
+DEPENDS =3D "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-to=
ols xfconf"
=20
 inherit xfce gtk-doc gobject-introspection features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3. gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 # TODO: Check if 0001-... can go
 SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.x=
ml-fix.patch"
@@ -15,9 +17,12 @@ SRC_URI[sha256sum] =3D "d96946ae5af6bf078dda415419e002=
1909f763ee0020b42f3e26f603e5
 EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
 EXTRA_OECONF +=3D "--disable-vala"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D " \
+       ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+"
 PACKAGECONFIG[gladeui2] =3D "--enable-gladeui2,--disable-gladeui2,glade"
-PACKAGECONFIG[startup-notification] =3D "--enable-startup-notification,-=
-disable-startup-notification,startup-notification"
+PACKAGECONFIG[x11] =3D "--enable-startup-notification,--disable-startup-=
notification,libepoxy libice libsm startup-notification"
+
=20
 PACKAGES +=3D "${PN}-glade"
 FILES:${PN}-glade =3D " \
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb b/meta-xfce/r=
ecipes-xfce/thunar/thunar_4.16.9.bb
index 93c41aedf..d3702c83c 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
@@ -2,16 +2,19 @@ SUMMARY =3D "File manager for the Xfce Desktop Environm=
ent"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
-DEPENDS =3D "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libsm s=
tartup-notification libnotify xfce4-panel udev"
+DEPENDS =3D "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnoti=
fy xfce4-panel udev"
=20
 inherit xfce gobject-introspection features_check mime-xdg perlnative
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[sha256sum] =3D "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d=
6f092e15264ee5af"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
+PACKAGECONFIG[x11] =3D ",,libsm startup-notification"
=20
 FILES:${PN} +=3D " \
     ${libdir}/thunarx-3/* \
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
index b9201bc65..d47f9cefc 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
@@ -6,7 +6,9 @@ DEPENDS =3D "garcon exo gtk+3 cairo virtual/libx11 libxml=
2 libwnck3 vala-native"
=20
 inherit xfce gtk-doc gobject-introspection features_check remove-libtool=
 mime-xdg
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[sha256sum] =3D "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8f=
d9f066379af1e092"
 SRC_URI +=3D " \
--=20
2.25.1


