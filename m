Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDD0C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:29:31 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web12.5937.1648556970850537585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 05:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 484A1928A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 14:29:04 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.227.151]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nZAy7-029dlh0; Tue, 29 Mar 2022 14:29:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCH] blueman: update; add missing RDEPENDS
Date: Tue, 29 Mar 2022 14:28:51 +0200
Message-Id: <20220329122851.518573-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1648556943-00013579-309C9727/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f6d5c91-cff8-4140-ba46-2a1ffc9d3fe9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 12:29:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96258

- update to v2.2.4
- switch to meson buildsystem
- add missing RDEPENDS

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../blueman/0001-Search-for-cython3.patch     | 29 +++++++-----------
 .../{blueman_2.2.3.bb =3D> blueman_2.2.4.bb}    | 30 +++++++++----------
 2 files changed, 26 insertions(+), 33 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.2.3.bb =3D=
> blueman_2.2.4.bb} (69%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-Se=
arch-for-cython3.patch b/meta-networking/recipes-connectivity/blueman/blu=
eman/0001-Search-for-cython3.patch
index 269174b2f..913566dce 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-Search-fo=
r-cython3.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-Search-fo=
r-cython3.patch
@@ -1,31 +1,24 @@
-From 77db892cdee265e971270c06ca1ffbaeea6449a3 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Tue, 26 Jun 2018 00:27:40 +0200
 Subject: [PATCH] Search for cython3
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate
=20
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+Signed-off-by: Markus Volk <f_l_k@gmx.net>
 ---
- configure.ac | 2 +-
+ meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
-diff --git a/configure.ac b/configure.ac
-index 727089d1..6b565cdc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,7 +58,7 @@ AC_SUBST([PYGOBJECT_LIBS])
+--- a/module/meson.build        2022-02-10 08:49:35.000000000 +0100
++++ b/module/meson.build        2022-03-29 12:58:03.456193737 +0200
+@@ -1,4 +1,4 @@
+-cython =3D find_program('cython', required: true)
++cython =3D find_program('cython3', required: true)
 =20
- AC_ARG_VAR([CYTHONEXEC], [Cython compiler])
- if test "x$CYTHONEXEC" =3D "x"; then
--   AC_PATH_PROG([CYTHONEXEC],[cython])
-+   AC_PATH_PROG([CYTHONEXEC],[cython3])
- fi
- AC_SUBST([CYTHONEXEC])
- AC_MSG_CHECKING([for cython executable])
+ blueman_c =3D custom_target(
+     'blueman_c',
+
 --=20
 2.14.3
=20
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.2.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
similarity index 69%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.2.3.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
index a16bcf77a..ea06ee67f 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.2.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
@@ -2,22 +2,18 @@ DESCRIPTION =3D "Blueman is a GTK+ Bluetooth Manager"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
-DEPENDS =3D "bluez5 python3-pygobject python3-cython-native python3-setu=
ptools-native intltool-native"
+DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
=20
-inherit autotools gettext systemd gsettings pkgconfig python3native gtk-=
icon-cache
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache
=20
 SRC_URI =3D " \
     https://github.com/blueman-project/blueman/releases/download/${PV}/b=
lueman-${PV}.tar.xz \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
 "
-SRC_URI[sha256sum] =3D "6edd791da6afd8f610ffb08d5138cfcf50e6257ad30efad6=
86287f3a2be106e9"
+SRC_URI[sha256sum] =3D "55d639feeda0b43b18a659e65985213a54b47dcb1348f3b4=
effb5238db242602"
=20
-EXTRA_OECONF =3D " \
-    --disable-appindicator \
-    --disable-runtime-deps-check \
-    --disable-schemas-compile \
-"
+EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dappindicator=3Dfalse"
=20
 SYSTEMD_SERVICE:${PN} =3D "${BPN}-mechanism.service"
 SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
@@ -26,22 +22,25 @@ RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
 RDEPENDS:${PN} +=3D " \
     python3-core \
     python3-dbus \
+    python3-pygobject \
+    python3-terminal \
     packagegroup-tools-bluetooth \
 "
=20
-PACKAGECONFIG ??=3D "thunar"
-PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-sendt=
o"
+PACKAGECONFIG ??=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit pulseaudio ', d)} \
+    thunar \
+"
+PACKAGECONFIG[thunar] =3D "-Dthunar-sendto=3Dtrue,-Dthunar-sendto=3Dfals=
e"
+PACKAGECONFIG[pulseaudio] =3D "-Dpulseaudio=3Dtrue,-Dpulseaudio=3Dfalse"
+PACKAGECONFIG[polkit] =3D "-Dpolicykit=3Dtrue,-Dpolicykit=3Dfalse"
=20
 FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${datadir}/Thunar \
+    ${datadir} \
     ${systemd_user_unitdir} \
-    ${exec_prefix}${systemd_system_unitdir} \
     ${PYTHON_SITEPACKAGES_DIR} \
 "
=20
-FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
-
 # In code, path to python is a variable that is replaced with path to na=
tive version of it
 # during the configure stage, e.g ../recipe-sysroot-native/usr/bin/pytho=
n3-native/python3.
 # Replace it with #!/usr/bin/env python3
@@ -55,3 +54,4 @@ do_install:append() {
                                               ${D}${bindir}/blueman-serv=
ices \
                                               ${D}${bindir}/blueman-tray
 }
+
--=20
2.25.1


