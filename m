Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8B9C10DC2
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 06:57:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.66967.1701327412837980728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 22:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id B8103425CF
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 07:56:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.44.42]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r8ayf-4TUGtF0; Thu, 30 Nov 2023 07:56:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv2 1/3] libcacard: set meson version based on PV
Date: Thu, 30 Nov 2023 07:57:20 +0100
Message-ID: <20231130065722.18367-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701327409-57FA8986-531736DC/0/0 CLEAN NORMAL
X-TOI-MSGID: 1108e240-8c3c-4653-aa0f-ef2e6d5986d8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 06:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107168

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n.build-set-hardcoded-version-string.patch | 34 -------------------
 .../recipes-support/spice/libcacard_2.8.1.bb  |  9 ++---
 2 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-support/spice/libcacard/0001-=
meson.build-set-hardcoded-version-string.patch

diff --git a/meta-networking/recipes-support/spice/libcacard/0001-meson.b=
uild-set-hardcoded-version-string.patch b/meta-networking/recipes-support=
/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
deleted file mode 100644
index b9d31c458..000000000
--- a/meta-networking/recipes-support/spice/libcacard/0001-meson.build-se=
t-hardcoded-version-string.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dbfc08b9dc879e21bfacbd153948d21db36d50cd Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Thu, 23 Nov 2023 13:20:40 +0100
-Subject: [PATCH] meson.build: set hardcoded version string
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-This fixes version string in the pkgconfig file and thus unbreaks spice =
build
-| spice-common| Run-time dependency libcacard found: NO
-|=20
-| ../git/subprojects/spice-common/meson.build:144:16: ERROR: Dependency =
lookup for libcacard with method 'pkgconfig' failed: Invalid version, nee=
d 'libcacard' ['>=3D 2.5.1'] found 'UNKNOWN'.
-|=20
-| A full log can be found at /home/flk/poky/build/tmp/work/corei7-64-pok=
y-linux/spice/0.15.2/build/meson-logs/meson-log.txt
-| ERROR: meson failed
-
-Upstream-Status: Inappropriate [oe-specific]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9cfe248..00745e5 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project('libcacard', 'c', 'cpp',
--  version: run_command('build-aux/git-version-gen', '@0@/.tarball-versi=
on'.format(meson.source_root()), check: true).stdout().strip(),
-+  version: '2.8.1',
-   license: 'LGPLv2.1',
-   default_options: ['warning_level=3D2'],
- )
---=20
-2.42.0
-
diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/m=
eta-networking/recipes-support/spice/libcacard_2.8.1.bb
index 44cccba9d..65f2f80ac 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -6,11 +6,12 @@ DEPENDS =3D "glib-2.0 pcsc-lite nss"
=20
 SRCREV =3D "7b07684ea6698d4885ff2062350ad8798a04de42"
=20
-SRC_URI =3D " \
-	git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3Dhttps;branc=
h=3Dmaster \
-	file://0001-meson.build-set-hardcoded-version-string.patch \
-"
+SRC_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3D=
https;branch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
+
+do_configure:prepend() {
+	echo ${PV} > ${S}/.tarball-version
+}
--=20
2.42.1


