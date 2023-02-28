Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E44C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:48:29 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.26951.1677599301402118872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id 9214F23EC5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Feb 2023 16:48:19 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.42.35]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pX2DD-2nsxSj0; Tue, 28 Feb 2023 16:48:19 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [RFC][meta-oe][PATCH] libdecor: update 1.1.0 -> 1.1.99
Date: Tue, 28 Feb 2023 16:48:06 +0100
Message-Id: <20230228154806.881483-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1677599299-AA7F5A74-7EB6B0D9/0/0 CLEAN NORMAL
X-TOI-MSGID: 4dd147fd-88fa-49b3-ab17-4ba78a6e75cc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Feb 2023 15:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101309

libdecor is needed under wayland for compositors that require client-side=
 decoration (gnome/weston).
Its consumers at the moment are at least libsdl2 and blender. Upstream ha=
s added a plugin for gtk.
This is quite a useful feature, since programs that use libdecor don't fi=
t well into gtk otherwise.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ....c-dont-skip-for-conflicting-symbols.patch | 31 +++++++++++++++++++
 .../{libdecor_0.1.1.bb =3D> libdecor_0.1.99.bb} | 23 ++++++++------
 2 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libdecor/libdecor/0001-libde=
cor-gtk.c-dont-skip-for-conflicting-symbols.patch
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.1.1.bb =3D> libdeco=
r_0.1.99.bb} (52%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk=
.c-dont-skip-for-conflicting-symbols.patch b/meta-oe/recipes-graphics/lib=
decor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patc=
h
new file mode 100644
index 000000000..c9d63c907
--- /dev/null
+++ b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont=
-skip-for-conflicting-symbols.patch
@@ -0,0 +1,31 @@
+From fb6eb15b34b5b07a431bb4c3585341411a3e088f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 28 Feb 2023 13:42:18 +0100
+Subject: [PATCH] libdecor-gtk.c: dont skip for conflicting_symbols
+
+This is a hack that should be removed, once the underlying bug in glibc =
was fixed and
+libdecor was updated to use dlmopen() instead of dlopen()
+
+https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/47
+https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/44
+
+---
+ src/plugins/gtk/libdecor-gtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/gtk/libdecor-gtk.c b/src/plugins/gtk/libdecor-g=
tk.c
+index 228161e..fd91afb 100644
+--- a/src/plugins/gtk/libdecor-gtk.c
++++ b/src/plugins/gtk/libdecor-gtk.c
+@@ -2606,7 +2606,7 @@ libdecor_plugin_description =3D {
+ 	.priorities =3D priorities,
+ 	.constructor =3D libdecor_plugin_new,
+ 	.conflicting_symbols =3D {
+-		"png_free",
++		//"png_free",
+ 		NULL,
+ 	},
+ };
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb b/meta-o=
e/recipes-graphics/libdecor/libdecor_0.1.99.bb
similarity index 52%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
index 4e396d83e..ed0b05f41 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
@@ -2,25 +2,28 @@ SUMMARY =3D "libdecor - A client-side decorations libra=
ry for Wayland clients"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7ae2be7fb1637141840314b51970a=
9f7"
=20
-SRC_URI =3D "git://gitlab.gnome.org/jadahl/libdecor.git;protocol=3Dhttps=
;branch=3Dmaster"
+SRC_URI =3D " \
+    git://gitlab.freedesktop.org/libdecor/libdecor.git;protocol=3Dhttps;=
branch=3Dmaster \
+    file://0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch \
+"
=20
 DEPENDS =3D " \
-	cairo \
-	pango \
-	wayland \
-	wayland-native \
-	wayland-protocols \
+    cairo \
+    pango \
+    wayland \
+    wayland-native \
+    wayland-protocols \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "e87dcfdaf83f332fa83b43c804fcf93c151ff0f5"
+SRCREV =3D "a254d0c2ff0cbfcf0bbf14cc67cc403640880c01"
=20
-PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk3 ope=
ngl', d)}"
+PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', =
d)}"
=20
 PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
 PACKAGECONFIG[demo] =3D "-Ddemo=3Dtrue,-Ddemo=3Dfalse,virtual/libegl lib=
xkbcommon"
-PACKAGECONFIG[gtk3] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk+3"
-PACKAGECONFIG[opengl] =3D ",,virtual/libgl"
+PACKAGECONFIG[install_demo] =3D "-Dinstall_demo=3Dtrue,-Dinstall_demo=3D=
false"
+PACKAGECONFIG[gtk+3] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk+3"
=20
 inherit meson pkgconfig
=20
--=20
2.34.1


