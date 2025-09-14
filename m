Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAC0CAC593
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 06:08:16 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4317.1757830090149062481
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 23:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id B40551C06F
	for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 08:08:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.171]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uxfuA-3ggMiI0; Sun, 14 Sep 2025 08:08:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][RFC][PATCH 2/2] gjs: update
Date: Sun, 14 Sep 2025 08:07:58 +0200
Message-ID: <20250914060758.18953-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250914060758.18953-1-f_l_k@t-online.de>
References: <20250914060758.18953-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757830086-F0FF74E6-61778293/0/0 CLEAN NORMAL
X-TOI-MSGID: a71e1032-d6d0-4b39-9bbc-80d58b7adbed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 06:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119389

- add -DRUST_BINDGEN to avoid undefined FileHandleType
- disable 'attributes' in CXX to fix build for vendored third party code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...0001-meson.build-define-RUST_BINDGEN.patch | 30 +++++++++++++++++++
 .../gjs/{gjs_1.84.1.bb =3D> gjs_1.85.90.bb}     |  7 +++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-meson.build-def=
ine-RUST_BINDGEN.patch
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb =3D> gjs_1.85.90.bb} =
(87%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-meson.build-define-RUS=
T_BINDGEN.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-meson.build-defin=
e-RUST_BINDGEN.patch
new file mode 100644
index 0000000000..0bc055ec55
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-meson.build-define-RUST_BINDG=
EN.patch
@@ -0,0 +1,30 @@
+From 7a4be0eb347c0628de87557903c885bf080c2244 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 10 Sep 2025 14:50:44 +0200
+Subject: [PATCH] meson.build: define RUST_BINDGEN
+
+This is to avoid undefined  FileHandleType with mozjs-140:
+| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/gjs/1.85.90/recipe-=
sysroot/usr/include/mozjs-140/mozilla/UniquePtrExtensions.h:104:6: error:=
 #error "Unsupported OS?"
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index c1474403..d0885b85 100644
+--- a/meson.build
++++ b/meson.build
+@@ -70,6 +70,7 @@ else
+         '-Wno-variadic-macros',  # GLib uses these in header files
+         '-Wno-missing-field-initializers',  # SpiderMonkey JSClass, amo=
ng others
+         '-Wno-dangling-pointer',  # Root list in JS::Rooted<T> with GCC=
 12
++	'-DRUST_BINDGEN',
+     ]), language: 'cpp')
+=20
+     add_project_arguments(cc.get_supported_arguments([
+--=20
+2.50.1
+
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.85.90.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.85.90.bb
index 55bd38c97c..db3239ca2b 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.85.90.bb
@@ -3,16 +3,18 @@ LICENSE =3D "MIT & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
=20
=20
-DEPENDS =3D "mozjs-128 cairo"
+DEPENDS =3D "mozjs-140 cairo"
=20
 inherit gnomebase gobject-introspection gettext features_check upstream-=
version-is-even pkgconfig multilib_script
=20
-SRC_URI[archive.sha256sum] =3D "44796b91318dbbe221a13909f00fd872ef92f38c=
68603e0e3574e46bc6bac32c"
+SRC_URI[archive.sha256sum] =3D "b455400f134b12cdccb4f3bddb23cc64eab1958d=
1c9f484bb0a42593fb783265"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
+    file://0001-meson.build-define-RUST_BINDGEN.patch \
 "
=20
+
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
@@ -27,6 +29,7 @@ LDFLAGS:append:mipsarch =3D " -latomic"
 LDFLAGS:append:powerpc =3D " -latomic"
 LDFLAGS:append:powerpc64 =3D " -latomic"
 LDFLAGS:append:riscv32 =3D " -latomic"
+CXXFLAGS +=3D "-Wno-attributes"
=20
 FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
=20
--=20
2.50.1


