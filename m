Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65145E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:23:02 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.68909.1734387781045261421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id 434561165
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 23:22:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNJUP-0NnYR70; Mon, 16 Dec 2024 23:22:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv4] libpeas: add recipe for 2.0.5
Date: Mon, 16 Dec 2024 23:23:03 +0100
Message-ID: <20241216222303.84194-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734387777-9DFF89C7-97DE0A73/0/0 CLEAN NORMAL
X-TOI-MSGID: 4a63f58d-69f8-40d2-8bd5-e2433bf4b0d1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 22:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114343

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
- Move libpeas recipe to meta-gnome

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-and-srcdir-paths-from-test-binaries.patch |  0
 .../recipes-gnome/libpeas/libpeas-1_1.36.0.bb |  2 +
 .../libpeas/libpeas/disable-lgi-check.patch   | 37 +++++++++++++++++++
 .../recipes-gnome/libpeas/libpeas_2.0.5.bb    | 20 ++++++++++
 4 files changed, 59 insertions(+)
 rename {meta-oe/recipes-gnome/libpeas/libpeas =3D> meta-gnome/recipes-gn=
ome/libpeas/libpeas-1}/0001-Remove-builddir-and-srcdir-paths-from-test-bi=
naries.patch (100%)
 rename meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb =3D> meta-gnome/r=
ecipes-gnome/libpeas/libpeas-1_1.36.0.bb (88%)
 create mode 100644 meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-=
check.patch
 create mode 100644 meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-a=
nd-srcdir-paths-from-test-binaries.patch b/meta-gnome/recipes-gnome/libpe=
as/libpeas-1/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.pat=
ch
similarity index 100%
rename from meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-an=
d-srcdir-paths-from-test-binaries.patch
rename to meta-gnome/recipes-gnome/libpeas/libpeas-1/0001-Remove-builddir=
-and-srcdir-paths-from-test-binaries.patch
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-gnome=
/recipes-gnome/libpeas/libpeas-1_1.36.0.bb
similarity index 88%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
rename to meta-gnome/recipes-gnome/libpeas/libpeas-1_1.36.0.bb
index 016981f04d..c0b785fee7 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.36.0.bb
@@ -13,8 +13,10 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 # FIXME: When upgrading to libpeas 2, g-i is no longer needed.
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
+SRC_URI =3D "https://download.gnome.org/sources/libpeas/1.36/libpeas-${P=
V}.tar.xz;name=3Darchive"
 SRC_URI +=3D "file://0001-Remove-builddir-and-srcdir-paths-from-test-bin=
aries.patch"
 SRC_URI[archive.sha256sum] =3D "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a=
893e3527bbfd1edd13237b4c"
+S =3D "${UNPACKDIR}/libpeas-${PV}"
=20
 PACKAGECONFIG[python3] =3D "-Dpython3=3Dtrue,-Dpython3=3Dfalse,python3-p=
ygobject"
=20
diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.p=
atch b/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
new file mode 100644
index 0000000000..9ed7adb8ce
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas/disable-lgi-check.patch
@@ -0,0 +1,37 @@
+From c9bb8f5c730745b48eb86404d0297ebc15bf9fa7 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 16 Dec 2024 12:22:49 +0100
+Subject: [PATCH] meson
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 11 +++++----------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a8100af..0fb15d2 100644
+--- a/meson.build
++++ b/meson.build
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
diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb b/meta-gno=
me/recipes-gnome/libpeas/libpeas_2.0.5.bb
new file mode 100644
index 0000000000..8c7d364765
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb
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


