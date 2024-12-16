Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E184E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 12:15:49 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.55290.1734351341417405342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 04:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 48C69A3D
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 13:15:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNA0a-0JvUjz0; Mon, 16 Dec 2024 13:15:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] libpeas: update 1.36.0 -> 2.0.5
Date: Mon, 16 Dec 2024 13:15:27 +0100
Message-ID: <20241216121527.1428075-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216121527.1428075-1-f_l_k@t-online.de>
References: <20241216121527.1428075-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734351332-2EFFA9BF-55055F54/0/0 CLEAN NORMAL
X-TOI-MSGID: ef77aeaa-bc57-4554-bfee-3b284cd86366
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 12:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114333

- Drop 0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
  peas-demo is not built anymore
- Add patch to disable the broken check for lgi
  lgi does not support pkgconfig but it hasn't changed version since 2017
- Remove gtk+3 from depends and dont inherit gtk-icon-cache to not pull i=
t
  in again indirectly
- g-i is not required anymore and will be built depending on DISTRO_FEATU=
RES
- Dont package the loaders into separate packages to reduce required RDEP=
ENDS.
  If a loader is not wanted on target it will be better to remove the acc=
ording
  PACKAGECONFIG option to also remove the dependencies?

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-and-srcdir-paths-from-test-binaries.patch | 82 -------------------
 .../libpeas/libpeas/disable-lgi-check.patch   | 48 +++++++++++
 .../recipes-gnome/libpeas/libpeas_1.36.0.bb   | 28 -------
 .../recipes-gnome/libpeas/libpeas_2.0.5.bb    | 20 +++++
 4 files changed, 68 insertions(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-bui=
lddir-and-srcdir-paths-from-test-binaries.patch
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-che=
ck.patch
 delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-a=
nd-srcdir-paths-from-test-binaries.patch b/meta-oe/recipes-gnome/libpeas/=
libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
deleted file mode 100644
index 6bb48777ec..0000000000
--- a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcd=
ir-paths-from-test-binaries.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From d798af685e9e1166400acbdab082c17b02dad85b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 18 May 2023 23:28:10 -0700
-Subject: [PATCH] Remove builddir and srcdir paths from test binaries
-
-Encoding buildtime paths is not needed since if these tests are to be
-run they will be run on target where builddir structure most certainly
-wont be available.
-
-Fixes
-WARNING: libpeas-1.36.0-r0 do_package_qa: QA Issue: File /usr/bin/peas-d=
emo in package libpeas-demo contains reference to TMPDIR [buildpaths]
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- peas-demo/meson.build                 | 2 +-
- tests/libpeas-gtk/testing/meson.build | 4 ++--
- tests/libpeas/testing/meson.build     | 4 ++--
- tests/testing-util/meson.build        | 4 ++--
- 4 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/peas-demo/meson.build b/peas-demo/meson.build
-index a3ec53b..855ebf2 100644
---- a/peas-demo/meson.build
-+++ b/peas-demo/meson.build
-@@ -9,7 +9,7 @@ peas_demo_c =3D [
-=20
- peas_demo_c_args =3D [
-   '-DHAVE_CONFIG_H',
--  '-DPEAS_BUILDDIR=3D"@0@"'.format(builddir),
-+  '-DPEAS_BUILDDIR=3D"/usr/src/debug/libpeas"',
-   '-DPEAS_PREFIX=3D"@0@"'.format(prefix),
-   '-DPEAS_LIBDIR=3D"@0@"'.format(libdir),
- ]
-diff --git a/tests/libpeas-gtk/testing/meson.build b/tests/libpeas-gtk/t=
esting/meson.build
-index 646f42d..fd9a692 100644
---- a/tests/libpeas-gtk/testing/meson.build
-+++ b/tests/libpeas-gtk/testing/meson.build
-@@ -19,8 +19,8 @@ libpeas_gtk_testing_deps =3D [
-=20
- libpeas_gtk_testing_c_args =3D [
-   '-DHAVE_CONFIG_H',
--  '-DBUILDDIR=3D"@0@"'.format(builddir),
--  '-DSRCDIR=3D"@0@"'.format(srcdir),
-+  '-DBUILDDIR=3D"/usr/src/debug/libpeas"',
-+  '-DSRCDIR=3D"/usr/src/debug/libpeas"',
- ]
-=20
- libpeas_gtk_testing_lib =3D library(
-diff --git a/tests/libpeas/testing/meson.build b/tests/libpeas/testing/m=
eson.build
-index 74ba7b1..084daa9 100644
---- a/tests/libpeas/testing/meson.build
-+++ b/tests/libpeas/testing/meson.build
-@@ -21,8 +21,8 @@ libpeas_testing_deps =3D [
-=20
- libpeas_testing_c_args =3D [
-   '-DHAVE_CONFIG_H',
--  '-DBUILDDIR=3D"@0@"'.format(builddir),
--  '-DSRCDIR=3D"@0@"'.format(srcdir),
-+  '-DBUILDDIR=3D"/usr/src/debug/libpeas"',
-+  '-DSRCDIR=3D"/usr/src/debug/libpeas"',
- ]
-=20
- libpeas_testing_lib =3D library(
-diff --git a/tests/testing-util/meson.build b/tests/testing-util/meson.b=
uild
-index 1c40740..83ad059 100644
---- a/tests/testing-util/meson.build
-+++ b/tests/testing-util/meson.build
-@@ -17,8 +17,8 @@ libtesting_util_deps =3D [
-=20
- libtesting_util_c_args =3D [
-   '-DHAVE_CONFIG_H',
--  '-DBUILDDIR=3D"@0@"'.format(builddir),
--  '-DSRCDIR=3D"@0@"'.format(srcdir),
-+  '-DBUILDDIR=3D"/usr/src/debug/libpeas"',
-+  '-DSRCDIR=3D"/usr/src/debug/libpeas"',
-   '-UG_DISABLE_ASSERT',
-   '-UG_DISABLE_CAST_CHECKS',
- ]
---=20
-2.40.1
-
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patc=
h b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
new file mode 100644
index 0000000000..347731051f
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
@@ -0,0 +1,48 @@
+From c9bb8f5c730745b48eb86404d0297ebc15bf9fa7 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 16 Dec 2024 12:22:49 +0100
+Subject: [PATCH] meson
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 15 +++++----------
+ 1 file changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a8100af..0fb15d2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -148,8 +148,8 @@ if not lua51_dep.found()
+   lua51_dep =3D dependency('lua-5.1', version: lua_req, required: false=
)
+ endif
+ luajit_dep =3D dependency('luajit', version: luajit_req, required: fals=
e)
+-lua_lgi_found =3D false
+-lua_lgi_ver =3D 'not found'
++lua_lgi_found =3D true
++lua_lgi_ver =3D '0.9.0'
+ lua51_prg =3D find_program('lua5.1', required: false)
+ if not lua51_prg.found()
+   lua51_prg =3D find_program('lua51', required: false)
+@@ -209,14 +209,9 @@ if lua_found
+     else
+         lua_prg =3D lua51_prg
+     endif
+-    lua_lgi_check =3D run_command(lua_prg, ['-e', 'print(require("lgi")=
._VERSION)'])
+-    if lua_lgi_check.returncode() =3D=3D 0
+-        lua_lgi_ver =3D lua_lgi_check.stdout().strip()
+-        if lua_lgi_ver.version_compare(lua_lgi_req)
+-            lua51_lgi_dep =3D declare_dependency(version: lua_lgi_ver)
+-            lua_lgi_found =3D true
+-        endif
+-    endif
++    lua_lgi_ver =3D '0.9.0'
++    lua_lgi_found =3D true
++    lua51_lgi_dep =3D declare_dependency(version: lua_lgi_ver)
+     message('lua-lgi version: ' + lua_lgi_ver)
+ endif
+=20
+--=20
+2.47.0
+
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/re=
cipes-gnome/libpeas/libpeas_1.36.0.bb
deleted file mode 100644
index 016981f04d..0000000000
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "libpeas is a gobject-based plugins engine"
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/Libpeas"
-LICENSE =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b54a1fd55a448865a0b32d415987=
59d"
-
-DEPENDS =3D "gtk+3"
-
-GTKDOC_MESON_OPTION =3D "gtk_doc"
-
-inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache feature=
s_check
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-# FIXME: When upgrading to libpeas 2, g-i is no longer needed.
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
-
-SRC_URI +=3D "file://0001-Remove-builddir-and-srcdir-paths-from-test-bin=
aries.patch"
-SRC_URI[archive.sha256sum] =3D "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a=
893e3527bbfd1edd13237b4c"
-
-PACKAGECONFIG[python3] =3D "-Dpython3=3Dtrue,-Dpython3=3Dfalse,python3-p=
ygobject"
-
-PACKAGES =3D+ "${PN}-demo ${PN}-python3"
-FILES:${PN}-demo =3D " \
-    ${bindir}/peas-demo \
-    ${libdir}/peas-demo \
-"
-
-RDEPENDS:${PN}-python3 =3D "python3-pygobject"
-FILES:${PN}-python3 =3D "${libdir}/libpeas-1.0/loaders/libpython3loader.=
so"
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb b/meta-oe/rec=
ipes-gnome/libpeas/libpeas_2.0.5.bb
new file mode 100644
index 0000000000..8c7d364765
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "libpeas is a gobject-based plugins engine"
+HOMEPAGE =3D "https://wiki.gnome.org/Projects/Libpeas"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b54a1fd55a448865a0b32d415987=
59d"
+
+DEPENDS =3D "glib-2.0"
+
+inherit gnomebase gobject-introspection vala gi-docgen
+
+SRC_URI +=3D "file://disable-lgi-check.patch"
+SRC_URI[archive.sha256sum] =3D "376f2f73d731b54e13ddbab1d91b6382cf6a9805=
24def44df62add15489de6dd"
+
+PACKAGECONFIG ?=3D "python3 gjs lua51 ${@bb.utils.contains('DISTRO_FEATU=
RES', 'gobject-introspection', 'vala', '', d)}"
+PACKAGECONFIG[python3] =3D "-Dpython3=3Dtrue,-Dpython3=3Dfalse,python3-p=
ygobject,python3-pygobject"
+PACKAGECONFIG[gjs] =3D "-Dgjs=3Dtrue,-Dgjs=3Dfalse,gjs mozjs-128"
+PACKAGECONFIG[lua51] =3D "-Dlua51=3Dtrue,-Dlua51=3Dfalse,luajit luajit-n=
ative,lua-lgi"
+PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
+
+FILES:${PN} +=3D "${libdir}/libpeas-2"
+
--=20
2.47.0


