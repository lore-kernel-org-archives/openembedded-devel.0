Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B977CE7A81
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 00:10:50 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.12077.1695427843388243837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 17:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 36657C2CF
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 02:10:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjqEK-23FnFa0; Sat, 23 Sep 2023 02:10:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] gjs: Upgrade 1.76.1 -> 1.78.0
Date: Sat, 23 Sep 2023 02:10:24 +0200
Message-ID: <20230923001033.2805049-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230923001033.2805049-1-f_l_k@t-online.de>
References: <20230923001033.2805049-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1695427840-56FF8F57-83ECBD12/0/0 CLEAN NORMAL
X-TOI-MSGID: a0da76a0-07ea-4990-887b-048b88284db8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 00:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105080

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Support-cross-builds-a-bit-better.patch | 11 ++++++-----
 ...o-not-add-dir-installed-tests-when-inst.patch | 16 +++++++++++-----
 .../gjs/{gjs_1.76.1.bb =3D> gjs_1.78.0.bb}         |  4 ++--
 3 files changed, 19 insertions(+), 12 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.76.1.bb =3D> gjs_1.78.0.bb} (=
90%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a=
-bit-better.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-b=
uilds-a-bit-better.patch
index c46f85b7d..8ebc8bad8 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-be=
tter.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-be=
tter.patch
@@ -1,4 +1,4 @@
-From fa47185d9c8150a0dcb0ea12b92fcf139edbef35 Mon Sep 17 00:00:00 2001
+From 95cacf345eaec898a47486fc0d33382f303275aa Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Wed, 27 Oct 2021 20:18:47 +0200
 Subject: [PATCH] Support cross builds a bit better
@@ -12,15 +12,16 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gjs/-/merge_r=
equests/690]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+
 ---
  meson.build | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 136e812..f5b91e0 100644
+index 961660f..86239a4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -252,6 +252,7 @@ release builds of SpiderMonkey. Try configuring Spid=
erMonkey with
+@@ -255,6 +255,7 @@ release builds of SpiderMonkey. Try configuring Spid=
erMonkey with
  --disable-debug.''')
  endif
 =20
@@ -28,7 +29,7 @@ index 136e812..f5b91e0 100644
  # Check if a minimal SpiderMonkey program compiles, links, and runs. If=
 not,
  # it's most likely the case that SpiderMonkey was configured incorrectl=
y, for
  # example by building mozglue as a shared library.
-@@ -282,6 +283,7 @@ elif minimal_program.returncode() !=3D 0
+@@ -285,6 +286,7 @@ elif minimal_program.returncode() !=3D 0
  failed to execute. Most likely you should build it with a different
  configuration.''' + recommended_configuration)
  endif
@@ -36,7 +37,7 @@ index 136e812..f5b91e0 100644
 =20
  have_printf_alternative_int =3D cc.compiles('''
  #include <stdio.h>
-@@ -682,7 +684,7 @@ subdir('installed-tests')
+@@ -683,7 +685,7 @@ subdir('installed-tests')
 =20
  # Note: The test program in test/ needs to be ported
  #       to Windows before we can build it on Windows.
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add=
-dir-installed-tests-when-inst.patch b/meta-gnome/recipes-gnome/gjs/gjs/0=
002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
index e281717ea..f05e52c38 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-in=
stalled-tests-when-inst.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-in=
stalled-tests-when-inst.patch
@@ -1,7 +1,12 @@
-From 2b8aa1ea4a4d1836164c934b1ab2556a32cb5af7 Mon Sep 17 00:00:00 2001
+From e6889d60891383ce6aa66aa3db30255af58bcf3c Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Wed, 27 Oct 2021 20:04:02 +0200
 Subject: [PATCH] meson.build: Do not add dir installed-tests when
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
  installed_tests is false
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
@@ -10,17 +15,18 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gjs/-/merge_r=
equests/690]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+
 ---
  meson.build | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index f5b91e0..3110530 100644
+index 86239a4..11c04e2 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -680,7 +680,9 @@ if not get_option('skip_gtk_tests')
-     have_gtk4 =3D dependency('gtk4', required: false).found()
- endif
+@@ -681,7 +681,9 @@ endif
+=20
+ ### Tests and test setups #############################################=
#########
 =20
 -subdir('installed-tests')
 +if get_option('installed_tests')
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.76.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.78.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.76.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
index 93711bc3b..0af9f5600 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.76.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6ac=
f45d856abfeb2d51ec48"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-DEPENDS =3D "mozjs-102 cairo"
+DEPENDS =3D "mozjs-115 cairo"
=20
 inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even pkgconfig
=20
-SRC_URI[archive.sha256sum] =3D "7b867c18a9b30333ebbcff9ad3f20299f0372ffa=
d439d49b87d40a1d1798b78d"
+SRC_URI[archive.sha256sum] =3D "fbaa20e0917668830800f92951688f9fc08f0129=
6affd5cdb4b35f750be27dc9"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
--=20
2.42.0


