Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77FDC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:36:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.929.1670355384075462513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 1E62E4C5F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Dec 2022 20:36:03 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.136]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2djU-1Ur1vP0; Tue, 6 Dec 2022 20:36:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH 3/4] xfce4: update to v4.17
Date: Tue,  6 Dec 2022 20:35:46 +0100
Message-Id: <20221206193547.144679-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206193547.144679-1-f_l_k@t-online.de>
References: <20221206193547.144679-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1670355360-793AD9DD-36C15CB6/0/0 CLEAN NORMAL
X-TOI-MSGID: 73ad8489-d879-40c7-8f1f-f0ab7a2c2334
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 19:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99964

For most recipes the license file has been changed, but they all are stil=
l under gpl-2.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
 .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
 .../exo/{exo_4.16.4.bb =3D> exo_4.17.4.bb}      |  7 +-
 .../{garcon_4.16.1.bb =3D> garcon_4.17.3.bb}    |  2 +-
 ...xfce4ui_4.16.1.bb =3D> libxfce4ui_4.17.9.bb} |  4 +-
 ...4util_4.16.0.bb =3D> libxfce4util_4.17.4.bb} |  4 +-
 ...lman_4.16.0.bb =3D> thunar-volman_4.17.1.bb} |  4 +-
 .../{thunar_4.16.9.bb =3D> thunar_4.17.12.bb}   | 10 +--
 .../{tumbler_4.16.0.bb =3D> tumbler_4.17.3.bb}  |  5 +-
 ...er_4.16.1.bb =3D> xfce4-appfinder_4.17.1.bb} |  4 +-
 ...ls_4.16.0.bb =3D> xfce4-dev-tools_4.17.1.bb} |  4 +-
 ...t-display-desktop-icon-when-no-windo.patch | 60 -------------
 ...-panel_4.16.3.bb =3D> xfce4-panel_4.17.5.bb} |  3 +-
 ....16.0.bb =3D> xfce4-power-manager_4.17.0.bb} |  4 +-
 ...sion_4.16.0.bb =3D> xfce4-session_4.17.1.bb} |  6 +-
 ...ngs_4.16.5.bb =3D> xfce4-settings_4.17.3.bb} |  6 +-
 .../{xfconf_4.16.0.bb =3D> xfconf_4.17.2.bb}    |  2 +-
 ...fdesktop_4.16.0.bb =3D> xfdesktop_4.17.2.bb} |  4 +-
 .../{xfwm4_4.16.1.bb =3D> xfwm4_4.17.2.bb}      |  4 +-
 19 files changed, 33 insertions(+), 247 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-cs=
ource-only.patch
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb =3D> exo_4.17.4.bb} (81=
%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb =3D> garcon_4.17.=
3.bb} (89%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb =3D> libx=
fce4ui_4.17.9.bb} (86%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.16.0.bb =3D> =
libxfce4util_4.17.4.bb} (55%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb =3D=
> thunar-volman_4.17.1.bb} (68%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb =3D> thunar_4.17.=
12.bb} (61%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb =3D> tumbler_4.=
17.3.bb} (82%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb=
 =3D> xfce4-appfinder_4.17.1.bb} (60%)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb=
 =3D> xfce4-dev-tools_4.17.1.bb} (81%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowm=
enu-do-not-display-desktop-icon-when-no-windo.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb =3D> xf=
ce4-panel_4.17.5.bb} (90%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4=
.16.0.bb =3D> xfce4-power-manager_4.17.0.bb} (85%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb =3D=
> xfce4-session_4.17.1.bb} (77%)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb =3D=
> xfce4-settings_4.17.3.bb} (80%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb =3D> xfconf_4.17.=
2.bb} (89%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb =3D> xfdesk=
top_4.17.2.bb} (68%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb =3D> xfwm4_4.17.2.b=
b} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/r=
ecipes-xfce/exo/exo/configure.patch
deleted file mode 100644
index 89cc1f387..000000000
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 13a74582ffd7f81dbd66a7296fc76007718e9d4d Mon Sep 17 00:00:00 2001
-From: Andreas Mueller <schnitzeltony@gmx.de>
-Date: Mon, 1 Aug 2011 17:16:29 +0200
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
----
- configure.ac | 34 ++++++++++++++++++----------------
- 1 file changed, 18 insertions(+), 16 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0de5ceb..3f92d1b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -143,22 +143,24 @@ AC_FUNC_MMAP()
- dnl ***************************************
- dnl *** Check for strftime() extensions ***
- dnl ***************************************
--AC_TRY_RUN([
--  #include <string.h>
--  #include <time.h>
--  int
--  main (int argc, char **argv)
--  {
--    struct tm tm;
--    char      buffer[16];
--    tm.tm_year =3D 81;
--    if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer, "=
1981") =3D=3D 0)
--      return 0;
--    return 1;
--  }
--], [
--  AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports =
%E and %O modifiers.])
--])
-+dnl grrrr...  this doesn't work for cross compiling, define it for OE
-+AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E=
 and %O modifiers.])
-+dnl AC_TRY_RUN([
-+dnl   #include <string.h>
-+dnl   #include <time.h>
-+dnl   int
-+dnl   main (int argc, char **argv)
-+dnl   {
-+dnl     struct tm tm;
-+dnl     char      buffer[16];
-+dnl     tm.tm_year =3D 81;
-+dnl     if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffe=
r, "1981") =3D=3D 0)
-+dnl       return 0;
-+dnl     return 1;
-+dnl   }
-+dnl ], [
-+dnl   AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime suppo=
rts %E and %O modifiers.])
-+dnl ])
-=20
- dnl ******************************
- dnl *** Check for i18n support ***
diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-o=
nly.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-on=
ly.patch
deleted file mode 100644
index 8c950299f..000000000
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.pat=
ch
+++ /dev/null
@@ -1,90 +0,0 @@
-From e710d8d4a3e3480416826c70d56ea3d2598a77e4 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Sat, 4 May 2019 14:50:11 +0200
-Subject: [PATCH] reduce build to exo-csource only
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-exo-csource creates c-header files from glade resource output files. Whe=
n
-building xfce-packages from git instead of tarball this exo-csource-nati=
ve is
-required.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
----
- Makefile.am  | 10 +---------
- configure.ac | 20 --------------------
- 2 files changed, 1 insertion(+), 29 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 62ad18d..8934f1f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,15 +1,7 @@
- ACLOCAL_AMFLAGS =3D -I m4 ${ACLOCAL_FLAGS}
-=20
- SUBDIRS =3D								\
--	exo								\
--	exo-csource							\
--	exo-desktop-item-edit						\
--	exo-helper							\
--	exo-open							\
--	docs								\
--	icons								\
--	pixmaps								\
--	po
-+	exo-csource
-=20
- distclean-local:
- 	rm -rf *.cache *~
-diff --git a/configure.ac b/configure.ac
-index 4e4eb5e..237184c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -120,15 +120,6 @@ AC_PROG_CC()
- AM_PROG_CC_C_O()
- AC_PROG_INSTALL()
- IT_PROG_INTLTOOL([intltool_minimum_version], [no-xml])
--AC_CHECK_PROGS([PERL], [perl5 perl])
--
--dnl ***************************************
--dnl *** Check for required Perl modules ***
--dnl ***************************************
--AC_PROG_PERL_MODULES([URI::Escape URI::file URI::URL], [],
--[
--  AC_MSG_ERROR([Atleast one of the required Perl modules (URI::Escape, =
URI::file and URI::URL) was not found on your system])
--])
-=20
- dnl ***************************************
- dnl *** Check for standard header files ***
-@@ -175,12 +166,6 @@ dnl ***********************************
- dnl *** Check for required packages ***
- dnl ***********************************
- XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.22.0])
--XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])
--XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0], [gio-u=
nix], [GIO-Unix features])
-=20
- dnl ***********************************************************
- dnl *** Optional support for a GTK+2 version of the library ***
-@@ -190,11 +175,6 @@ XDT_CHECK_OPTIONAL_PACKAGE([GTK2],
-                            [GTK+ 2 support])
- AM_CONDITIONAL([ENABLE_GTK2_LIBRARY], [test "x$GTK2_FOUND" =3D "xyes"])
-=20
--dnl *********************
--dnl *** Check for X11 ***
--dnl *********************
--XDT_CHECK_LIBX11_REQUIRE()
--
- dnl *************************
- dnl *** Check for gtk-doc ***
- dnl *************************
---=20
-2.20.1
-
diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb b/meta-xfce/recipes=
-xfce/exo/exo_4.17.4.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.17.4.bb
index 01c3bff06..12aae5aef 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.17.4.bb
@@ -11,12 +11,9 @@ inherit xfce perlnative gtk-doc features_check mime-xd=
g
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 # SRC_URI must follow inherited one
-SRC_URI +=3D " \
-    file://exo-no-tests-0.8.patch \
-    file://configure.patch \
-"
+SRC_URI +=3D "file://exo-no-tests-0.8.patch"
=20
-SRC_URI[sha256sum] =3D "82a50c67e78f1e5c420b7615515bcca759b86eeab99224ab=
8eca4306b89d2eca"
+SRC_URI[sha256sum] =3D "83f4b9b9217e96d0991a6cdf060fb1357f32138f4127dcb3=
e45c3de7de392c82"
=20
 # Note: python bindings did not work in oe-dev and are about to be moved=
 to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.ver=
sion4/19560
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb b/meta-xfce/r=
ecipes-xfce/garcon/garcon_4.17.3.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.17.3.bb
index 14f0c4a64..2b51a7379 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.17.3.bb
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_che=
ck
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-xfce-applications.menu-don-t-bloat-settings-me=
nu-by-.patch"
-SRC_URI[sha256sum] =3D "84914927a2c1fda167f67af26a6640630a744a22940df508=
aa6c752cdbd3d21d"
+SRC_URI[sha256sum] =3D "8748d3b8a35a3211f6745468d4e5c4a78e807551ced35df4=
671c302d5e42721e"
=20
 EXTRA_OECONF =3D "--disable-gtk-doc"
=20
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.17.9.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.17.9.bb
index 692c79f3c..17c9a6fa5 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.17.9.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Xfce4 Widget library and X Window System interaction"
 SECTION =3D "x11/libs"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
 DEPENDS =3D "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-to=
ols xfconf"
=20
 inherit xfce gtk-doc gobject-introspection features_check
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 # TODO: Check if 0001-... can go
 SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.x=
ml-fix.patch"
-SRC_URI[sha256sum] =3D "d96946ae5af6bf078dda415419e0021909f763ee0020b42f=
3e26f603e51585f6"
+SRC_URI[sha256sum] =3D "d78c1852443a930bf1cdc5a90a68ffbf302fa3c34ed0885d=
a41c7ee2f1c57b65"
=20
 EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
 EXTRA_OECONF +=3D "--disable-vala"
diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b=
/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.17.4.bb
similarity index 55%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.17.4.bb
index 6824ac67e..64fa120eb 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.17.4.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Basic utility library for Xfce4"
 SECTION =3D "x11/libs"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
 DEPENDS =3D "intltool-native xfce4-dev-tools-native glib-2.0"
=20
 inherit xfce gtk-doc gobject-introspection vala
=20
-SRC_URI[sha256sum] =3D "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743=
f55abd87d8b55b83"
+SRC_URI[sha256sum] =3D "bc75cb211994a816c7673618fdbff37ead7a643181ea6adb=
138fe004ae9d02b4"
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb=
 b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.17.1.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.17.1.bb
index 4b72d3a79..9a30c5f3a 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.17.1.bb
@@ -1,14 +1,14 @@
 SUMMARY =3D "Automatic management of removable drives and media for thun=
ar"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
 DEPENDS =3D "exo libnotify libgudev"
=20
 inherit xfce features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI[sha256sum] =3D "d2c0e719b242b7fd3db70bc6678a2df1abf2cfaa899b775a=
1591a5efa08a547d"
+SRC_URI[sha256sum] =3D "9ac33664dbef4c425ccb96cdb5dd376ebe023281c987a464=
b7900cc7139dc605"
=20
 PACKAGECONFIG ??=3D "notify"
 PACKAGECONFIG[notify] =3D "--enable-notifications,--disable-notification=
s,libnotify"
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb b/meta-xfce/r=
ecipes-xfce/thunar/thunar_4.17.12.bb
similarity index 61%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.17.12.bb
index d3702c83c..dc95d446d 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.17.12.bb
@@ -1,8 +1,8 @@
 SUMMARY =3D "File manager for the Xfce Desktop Environment"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
-DEPENDS =3D "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnoti=
fy xfce4-panel udev"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+DEPENDS =3D "exo gdk-pixbuf libxfce4ui xfce4-panel xfconf gtk+3 glib-2.0=
 pango udev"
=20
 inherit xfce gobject-introspection features_check mime-xdg perlnative
=20
@@ -10,11 +10,7 @@ inherit xfce gobject-introspection features_check mime=
-xdg perlnative
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[sha256sum] =3D "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d=
6f092e15264ee5af"
-
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
-PACKAGECONFIG[x11] =3D ",,libsm startup-notification"
+SRC_URI[sha256sum] =3D "b0cd2a8b6e1b9d3fbd59c6e1202b8f54b970f66f5bd22540=
46d00968bd08ca36"
=20
 FILES:${PN} +=3D " \
     ${libdir}/thunarx-3/* \
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb b/meta-xfce=
/recipes-xfce/tumbler/tumbler_4.17.3.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.17.3.bb
index 6a583ade7..1e5f34fbc 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.17.3.bb
@@ -2,11 +2,11 @@ DESCRIPTION =3D "Thumbnail service implementing the thu=
mbnail management D-Bus spe
 SECTION =3D "x11/libs"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-DEPENDS =3D "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native lib=
xml2 libgsf"
+DEPENDS =3D "freetype gdk-pixbuf poppler xfce4-dev-tools-native libxfce4=
util"
=20
 inherit xfce gtk-doc
=20
-SRC_URI[sha256sum] =3D "9b0b7fed0c64041733d490b1b307297984629d0dd8536974=
9617a8766850af66"
+SRC_URI[sha256sum] =3D "61181220ca5cfcf50112af2c5047f14154944a9253a69706=
2d42e99203638821"
=20
 INSANE_SKIP:${PN} =3D "dev-so"
=20
@@ -23,6 +23,7 @@ FILES:${PN} +=3D "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
                 ${libdir}/tumbler-1/plugins/cache/*.so \
+                ${systemd_user_unitdir} \
 "
=20
 FILES:${PN}-dev +=3D "${libdir}/tumbler-1/plugins/*.la \
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.=
1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.17.1.bb
similarity index 60%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1=
.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.17.1.b=
b
index 18d9fedfc..5f96417bc 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.17.1.bb
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "Xfce4 Application Finder"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
 DEPENDS =3D "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
=20
 inherit xfce features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI[sha256sum] =3D "bfe3e9bd92695014ee74a2fbb7f5fd1b4c29cf043c4a1159=
8b8958324c81e7ec"
+SRC_URI[sha256sum] =3D "5482dc18c2b8bdeebc95ccadacc6ce46d717d32009509a84=
91b8720cf1c2c996"
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.=
0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.17.1.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0=
.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.17.1.b=
b
index 586a77efc..2c01bb7e3 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.17.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Xfce4 development tools"
 HOMEPAGE =3D "http://www.xfce.org"
 SECTION =3D "x11/libs"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D "glib-2.0"
 DEPENDS:append:class-target =3D " ${BPN}-native"
@@ -15,7 +15,7 @@ SRC_URI =3D "http://archive.xfce.org/src/xfce/${BPN}/${=
@'${PV}'[0:4]}/${BPN}-${PV}
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-=
in-.patch \
            "
 SRC_URI:append:class-target =3D " file://0001-Run-native-xdt-csource-on-=
tests.patch"
-SRC_URI[sha256sum] =3D "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e1=
5ce05545e8eb4f04"
+SRC_URI[sha256sum] =3D "e9af0efc1acfe443cf513e7f82621f81ef62b50e2bf24109=
6a41b90489ef4f9f"
=20
 do_install:append() {
     install -d ${D}${datadir}/aclocal
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-=
not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfc=
e4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.=
patch
deleted file mode 100644
index 1adb14552..000000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0651f228cef01a6c3e4758a991cace1cd7721031 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Mon, 24 Sep 2012 09:57:46 +0200
-Subject: [PATCH] windowmenu: do not display desktop icon when no window =
is
- active
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-* desktop icon is of no use
-* desktop icon confuses when using showdesktop plugin
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
- plugins/windowmenu/windowmenu.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/window=
menu.c
-index f47e993e..061d6544 100644
---- a/plugins/windowmenu/windowmenu.c
-+++ b/plugins/windowmenu/windowmenu.c
-@@ -251,7 +251,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
-   g_signal_connect (G_OBJECT (plugin->button), "toggled",
-       G_CALLBACK (window_menu_plugin_menu), plugin);
-=20
--  plugin->icon =3D gtk_image_new_from_icon_name ("user-desktop", GTK_IC=
ON_SIZE_BUTTON);
-+  plugin->icon =3D gtk_image_new_from_icon_name (NULL, GTK_ICON_SIZE_BU=
TTON);
-   gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
-   gtk_widget_show (plugin->icon);
- }
-@@ -640,7 +640,7 @@ window_menu_plugin_active_window_changed (WnckScreen=
       *screen,
-           /* skip 'fake' windows */
-           type =3D wnck_window_get_window_type (window);
-           if (type =3D=3D WNCK_WINDOW_DESKTOP || type =3D=3D WNCK_WINDO=
W_DOCK)
--            goto show_desktop_icon;
-+            goto show_no_icon;
-=20
-           /* get the window icon and set the tooltip */
-           gtk_widget_set_tooltip_text (GTK_WIDGET (icon),
-@@ -660,12 +660,12 @@ window_menu_plugin_active_window_changed (WnckScre=
en       *screen,
-         }
-       else
-         {
--          show_desktop_icon:
-+          show_no_icon:
-=20
-           /* desktop is shown right now */
--          gtk_image_set_from_icon_name (GTK_IMAGE (icon), "user-desktop=
", icon_size);
-+          gtk_image_set_from_icon_name (GTK_IMAGE (icon), NULL, icon_si=
ze);
-           gtk_image_set_pixel_size (GTK_IMAGE (icon), icon_size);
--          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("Desktop"))=
;
-+          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("No Windows=
"));
-         }
-     }
- }
---=20
-2.14.3
-
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.17.5.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.17.5.bb
index 46d26159a..b9e55960a 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.17.5.bb
@@ -10,9 +10,8 @@ inherit xfce gtk-doc gobject-introspection features_che=
ck mime-xdg
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[sha256sum] =3D "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8f=
d9f066379af1e092"
+SRC_URI[sha256sum] =3D "096b1230f6cde17f2497daa7cbe8316478a5500944e7a90b=
8a61e26961414fef"
 SRC_URI +=3D " \
-    file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.pat=
ch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
=20
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manag=
er_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-man=
ager_4.17.0.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manage=
r_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_=
4.17.0.bb
index 34de7a708..dca9d18e4 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16=
.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.17=
.0.bb
@@ -9,9 +9,9 @@ inherit xfce features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-DEPENDS +=3D "libnotify libxrandr virtual/libx11 libxext xfce4-panel upo=
wer libxscrnsaver"
+DEPENDS +=3D "libnotify libxfce4ui libxfce4util gtk+3 glib-2.0 xrandr vi=
rtual/libx11 xfce4-panel upower"
=20
-SRC_URI[sha256sum] =3D "eb9c587c01b502fa45a32e7fc2aba98fa6d8391475133883=
654f77e562c43bf3"
+SRC_URI[sha256sum] =3D "2deca68f816705de5c4f11aad48b1157ce715da467bd3eab=
a723299df861615b"
=20
 EXTRA_OECONF =3D " \
     --enable-network-manager \
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.17.1.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.17.1.bb
index e6613b8ee..014ae589e 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.17.1.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "xfce4-session is a session manager for Xfce 4 Desktop Envir=
onment"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-DEPENDS =3D "libwnck3 libsm libxfce4ui virtual/libx11"
+DEPENDS =3D "libxfce4util libxfce4ui xfconf libwnck3 libsm libxfce4ui vi=
rtual/libx11"
=20
 inherit xfce update-alternatives features_check
=20
@@ -13,7 +13,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'polkit', d)}"
 PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, polkit"
=20
 SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] =3D "22f273f212481d71e0b5618c62710cd85f69aea74f5ea5c0=
093f7918b07d17b7"
+SRC_URI[sha256sum] =3D "6c2d1dd49200a4f4e39a9459b055d8c1792188d4fb23400e=
ff5a6795b204a48b"
=20
 ALTERNATIVE:${PN} =3D "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.17.3.bb
similarity index 80%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.b=
b
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.17.3.bb
index 4a4e9f188..662d85a4e 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.17.3.bb
@@ -1,15 +1,15 @@
 SUMMARY =3D "Xfce4 settings"
 SECTION =3D "x11/wm"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
-DEPENDS =3D "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavi=
er upower"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+DEPENDS =3D "exo garcon gtk+3 glib-2.0 libxfce4util libxfce4ui xfconf fo=
ntconfig intltool-native"
=20
 inherit xfce features_check mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] =3D "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f3=
67e34fa82b40d28e"
+SRC_URI[sha256sum] =3D "8bc5905d2157186e0b9c01421df0b7cbb7e8618653b49581=
0dd95e95888162e2"
=20
 EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
=20
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb b/meta-xfce/r=
ecipes-xfce/xfconf/xfconf_4.17.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.17.2.bb
index be742192b..716fe3cf0 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.17.2.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completio=
n vala
=20
 EXTRA_OECONF +=3D "PERL=3D${STAGING_DIR_TARGET}/usr/bin/perl"
=20
-SRC_URI[sha256sum] =3D "652a119007c67d9ba6c0bc7a740c923d33f32d03dc76dfc7=
ba682584e72a5425"
+SRC_URI[sha256sum] =3D "e4eefa03cdd3672f928e80bf86f68ba9e9ea3e1ee8208f8d=
964610c416ee8db0"
=20
 FILES:${PN} +=3D "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb b/meta-=
xfce/recipes-xfce/xfdesktop/xfdesktop_4.17.2.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.17.2.bb
index 4a1ece8be..3b0698075 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.17.2.bb
@@ -2,13 +2,13 @@ SUMMARY =3D "Xfce4 Desktop Manager"
 SECTION =3D "x11/base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
-DEPENDS =3D "libxfce4ui libwnck thunar garcon exo"
+DEPENDS =3D "libxfce4ui libxfce4util cairo xfconf gtk+3 libwnck3 thunar =
garcon exo"
=20
 inherit xfce features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI[sha256sum] =3D "934ba5affecff21e62d9fac1dd50c50cd94b3a807fefa5f5=
bff59f3d6f155bae"
+SRC_URI[sha256sum] =3D "e68128dc72924680ed384d32b95e3a18d94a1ec490c05dab=
43155cac737bcdd1"
=20
 PACKAGECONFIG ??=3D "notify"
 PACKAGECONFIG[notify] =3D "--enable-notifications,--disable-notification=
s,libnotify"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb b/meta-xfce/rec=
ipes-xfce/xfwm4/xfwm4_4.17.2.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.17.2.bb
index a32bad47e..b24130216 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.17.2.bb
@@ -2,13 +2,13 @@ DESCRIPTION =3D "Xfce4 Window Manager"
 SECTION =3D "x11/wm"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599=
855"
-DEPENDS =3D "virtual/libx11 libxfce4ui libwnck3 libxinerama"
+DEPENDS =3D "virtual/libx11 libxfce4ui libxfce4util xfconf libwnck3 libx=
inerama"
=20
 inherit xfce update-alternatives features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI[sha256sum] =3D "b5b24ca04bd73c642db0a4b4df81d262381d758f01b51108=
257d48b391b8718c"
+SRC_URI[sha256sum] =3D "b7200498ce57d1f2d11ef2191b4853c5cf65d3b5206afb6f=
1af6bf4f22469d29"
=20
 PACKAGECONFIG ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
--=20
2.34.1


