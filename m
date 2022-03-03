Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A24FC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:09:45 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.11059.1646316584443468572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 4F7144B36
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  3 Mar 2022 15:09:08 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.177]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nPm8h-1puN5V0; Thu, 3 Mar 2022 15:09:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gjs: update; customize dependencies
Date: Thu,  3 Mar 2022 15:09:00 +0100
Message-Id: <20220303140900.8172-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
X-TOI-EXPURGATEID: 150726::1646316547-000184BD-7CCC7C75/0/0 CLEAN NORMAL
X-TOI-MSGID: f19da707-40a1-4a8d-b756-ca2efc836e09
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 14:09:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95748

Disable gtk_tests to be able to drop gtk4 dependency

Update mozjs dependency to mozjs-91 since polkit also builds with it.

These changes should reduce the compilation of additional packages and th=
us save
space and time during build.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...0001-Support-cross-builds-a-bit-better.patch | 17 +++++++----------
 ...-not-add-dir-installed-tests-when-inst.patch |  9 +++------
 .../gjs/{gjs_1.70.1.bb =3D> gjs_1.71.1.bb}        |  5 +++--
 3 files changed, 13 insertions(+), 18 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.70.1.bb =3D> gjs_1.71.1.bb} (=
88%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a=
-bit-better.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-b=
uilds-a-bit-better.patch
index 55af681af..0c45e6095 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-be=
tter.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-be=
tter.patch
@@ -1,4 +1,4 @@
-From 550e98013b0e003c1a6771d8e811375913adf16b Mon Sep 17 00:00:00 2001
+From fa47185d9c8150a0dcb0ea12b92fcf139edbef35 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Wed, 27 Oct 2021 20:18:47 +0200
 Subject: [PATCH] Support cross builds a bit better
@@ -17,10 +17,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index dfcc2c3..192b1b5 100644
+index 136e812..f5b91e0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -234,6 +234,7 @@ release builds of SpiderMonkey. Try configuring Spid=
erMonkey with
+@@ -252,6 +252,7 @@ release builds of SpiderMonkey. Try configuring Spid=
erMonkey with
  --disable-debug.''')
  endif
 =20
@@ -28,15 +28,15 @@ index dfcc2c3..192b1b5 100644
  # Check if a minimal SpiderMonkey program compiles, links, and runs. If=
 not,
  # it's most likely the case that SpiderMonkey was configured incorrectl=
y, for
  # example by building mozglue as a shared library.
-@@ -254,6 +255,7 @@ could not be compiled, linked, or run. Most likely y=
ou should build it with a
- different configuration. Check the recommended configuration:
- https://github.com/spidermonkey-embedders/spidermonkey-embedding-exampl=
es/blob/esr78/docs/Building%20SpiderMonkey.md''')
+@@ -282,6 +283,7 @@ elif minimal_program.returncode() !=3D 0
+ failed to execute. Most likely you should build it with a different
+ configuration.''' + recommended_configuration)
  endif
 +endif # not meson.is_cross_build()
 =20
  have_printf_alternative_int =3D cc.compiles('''
  #include <stdio.h>
-@@ -662,7 +664,7 @@ endif
+@@ -682,7 +684,7 @@ subdir('installed-tests')
 =20
  # Note: The test program in test/ needs to be ported
  #       to Windows before we can build it on Windows.
@@ -45,6 +45,3 @@ index dfcc2c3..192b1b5 100644
      subdir('test')
  endif
 =20
---=20
-2.31.1
-
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add=
-dir-installed-tests-when-inst.patch b/meta-gnome/recipes-gnome/gjs/gjs/0=
002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
index 8777d14f5..6e7b5504e 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-in=
stalled-tests-when-inst.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-in=
stalled-tests-when-inst.patch
@@ -1,4 +1,4 @@
-From 6a29818204e647d5fad68ed7ca8cac53d301cae6 Mon Sep 17 00:00:00 2001
+From 2b8aa1ea4a4d1836164c934b1ab2556a32cb5af7 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Wed, 27 Oct 2021 20:04:02 +0200
 Subject: [PATCH] meson.build: Do not add dir installed-tests when
@@ -15,10 +15,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 6878e2e..edbbf79 100644
+index f5b91e0..3110530 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -635,7 +635,9 @@ if not get_option('skip_gtk_tests')
+@@ -680,7 +680,9 @@ if not get_option('skip_gtk_tests')
      have_gtk4 =3D dependency('gtk4', required: false).found()
  endif
 =20
@@ -29,6 +29,3 @@ index 6878e2e..edbbf79 100644
 =20
  # Note: The test program in test/ needs to be ported
  #       to Windows before we can build it on Windows.
---=20
-2.31.1
-
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.71.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.70.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.71.1.bb
index 90ea14044..9c3d441d1 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.71.1.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6ac=
f45d856abfeb2d51ec48"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-DEPENDS =3D "mozjs-78 gtk4"
+DEPENDS =3D "mozjs-91"
=20
 inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even pkgconfig
=20
-SRC_URI[archive.sha256sum] =3D "bbdc0eec7cf25fbc534769f6a1fb2c7a18e17b87=
1efdb0ca58e9abf08b28003f"
+SRC_URI[archive.sha256sum] =3D "f15ad0d45a7d31a1ac4e07479038c0536713cca3=
c5492ca2f2731c04a3a5f1e9"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
@@ -21,6 +21,7 @@ GIR_MESON_OPTION =3D ""
 EXTRA_OEMESON =3D " \
     -Dinstalled_tests=3Dfalse \
     -Dskip_dbus_tests=3Dtrue \
+    -Dskip_gtk_tests=3Dtrue \
 "
=20
 LDFLAGS:append:mipsarch =3D " -latomic"
--=20
2.25.1


