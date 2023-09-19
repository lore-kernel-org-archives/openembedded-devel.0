Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D8CD3427
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 00:19:50 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.7359.1695082784068138646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 17:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 9E43310132
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 02:19:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.233.37]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiOSq-0iX64v0; Tue, 19 Sep 2023 02:19:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] tracker: add missing Upstream-Status
Date: Tue, 19 Sep 2023 02:19:41 +0200
Message-ID: <20230919001941.19809-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695082780-737FD980-13BCE297/0/0 CLEAN NORMAL
X-TOI-MSGID: 8348d37c-793e-4446-97e2-18c96d84f97a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 00:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104953

-remove unused patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tracker/0001-fix-reproducibility.patch    |  2 ++
 .../0001-meson-Do-not-define-TOP_SRCDIR.patch | 24 -------------------
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/tracker/tracker/0001-meson-D=
o-not-define-TOP_SRCDIR.patch

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducib=
ility.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproduci=
bility.patch
index 30a58923c..4a11f8314 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
+++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
@@ -8,6 +8,8 @@ binaries at various places. Avoid this to improve binary =
reproducibility.
=20
 todo: Some of these paths may need to be adjusted to make the test envir=
onment work
=20
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  meson.build                       | 6 +++---
diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-d=
efine-TOP_SRCDIR.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-me=
son-Do-not-define-TOP_SRCDIR.patch
deleted file mode 100644
index 5c6ab71a9..000000000
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-T=
OP_SRCDIR.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 3e262192ffebf5d6fec92d5b7ba08348a94df1ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 25 May 2023 20:54:47 -0700
-Subject: [PATCH] meson: Do not define TOP_SRCDIR
-
-This is passed from build env
-
-Upstream-Status: Inappropriate [Cross compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
---- a/meson.build
-+++ b/meson.build
-@@ -353,7 +353,7 @@ subdir('utils')
-=20
- test_c_args =3D tracker_c_args + [
-     '-DTOP_BUILDDIR=3D"@0@"'.format(build_root),
--    '-DTOP_SRCDIR=3D"@0@"'.format(source_root),
-+    '-DTOP_SRCDIR=3D"@0@"'.format('/usr/src/debug/tracker'),
- ]
-=20
- tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
--=20
2.42.0


