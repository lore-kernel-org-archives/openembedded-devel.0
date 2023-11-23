Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F7DC624B4
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:32:47 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.89544.1700742756914014878
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 57D0F220DE
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 13:32:35 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.134]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r68sl-2H6YzJ0; Thu, 23 Nov 2023 13:32:35 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libcacard: fix version string in libcacard.pc
Date: Thu, 23 Nov 2023 13:33:02 +0100
Message-ID: <20231123123302.1989816-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700742755-94855968-EB5EE8FE/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e5edaa7-015e-476a-a409-0840e85de979
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107022

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n.build-set-hardcoded-version-string.patch | 34 +++++++++++++++++++
 .../recipes-support/spice/libcacard_2.8.1.bb  |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/spice/libcacard/0001-=
meson.build-set-hardcoded-version-string.patch

diff --git a/meta-networking/recipes-support/spice/libcacard/0001-meson.b=
uild-set-hardcoded-version-string.patch b/meta-networking/recipes-support=
/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
new file mode 100644
index 000000000..b9d31c458
--- /dev/null
+++ b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-se=
t-hardcoded-version-string.patch
@@ -0,0 +1,34 @@
+From dbfc08b9dc879e21bfacbd153948d21db36d50cd Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 23 Nov 2023 13:20:40 +0100
+Subject: [PATCH] meson.build: set hardcoded version string
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+This fixes version string in the pkgconfig file and thus unbreaks spice =
build
+| spice-common| Run-time dependency libcacard found: NO
+|=20
+| ../git/subprojects/spice-common/meson.build:144:16: ERROR: Dependency =
lookup for libcacard with method 'pkgconfig' failed: Invalid version, nee=
d 'libcacard' ['>=3D 2.5.1'] found 'UNKNOWN'.
+|=20
+| A full log can be found at /home/flk/poky/build/tmp/work/corei7-64-pok=
y-linux/spice/0.15.2/build/meson-logs/meson-log.txt
+| ERROR: meson failed
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9cfe248..00745e5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project('libcacard', 'c', 'cpp',
+-  version: run_command('build-aux/git-version-gen', '@0@/.tarball-versi=
on'.format(meson.source_root()), check: true).stdout().strip(),
++  version: '2.8.1',
+   license: 'LGPLv2.1',
+   default_options: ['warning_level=3D2'],
+ )
+--=20
+2.42.0
+
diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/m=
eta-networking/recipes-support/spice/libcacard_2.8.1.bb
index c81322e68..44cccba9d 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -6,7 +6,10 @@ DEPENDS =3D "glib-2.0 pcsc-lite nss"
=20
 SRCREV =3D "7b07684ea6698d4885ff2062350ad8798a04de42"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3D=
https;branch=3Dmaster"
+SRC_URI =3D " \
+	git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3Dhttps;branc=
h=3Dmaster \
+	file://0001-meson.build-set-hardcoded-version-string.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.42.0


