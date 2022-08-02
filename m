Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CFEC19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 10:55:31 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.4720.1659437723492044088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 03:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 1D080194A
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 12:55:21 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.47.193]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oIpYV-1Z23zl0; Tue, 2 Aug 2022 12:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libass: update to v1.16.0
Date: Tue,  2 Aug 2022 12:55:06 +0200
Message-Id: <20220802105506.97992-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659437719-01449CE0-AB40B4BF/0/0 CLEAN NORMAL
X-TOI-MSGID: 9973fe9c-3908-43e4-9755-59a5485f3cf2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 10:55:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98080

- enca support has been dropped
- add PACKAGECONFIG for asm
- build with asm support for x86_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libass/libass_0.14.0.bb                   | 30 -------------------
 .../libass/libass_0.16.0.bb                   | 28 +++++++++++++++++
 2 files changed, 28 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.16.0.bb

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb b/meta-oe=
/recipes-multimedia/libass/libass_0.14.0.bb
deleted file mode 100644
index 0e6230736..000000000
--- a/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "libass is a portable subtitle renderer for the ASS/SSA =
(Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostl=
y compatible with VSFilter."
-HOMEPAGE =3D "https://github.com/libass/libass"
-SECTION =3D "libs/multimedia"
-
-LICENSE =3D "ISC"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da42532a0684420bdb15556c3cdd49=
a75"
-
-DEPENDS =3D "enca fontconfig freetype libpng fribidi"
-
-SRC_URI =3D "git://github.com/libass/libass.git;branch=3Dmaster;protocol=
=3Dhttps"
-SRCREV =3D "73284b676b12b47e17af2ef1b430527299e10c17"
-S =3D "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[harfbuzz] =3D "--enable-harfbuzz,--disable-harfbuzz,harfbu=
zz"
-
-EXTRA_OECONF =3D " \
-    --enable-fontconfig \
-"
-
-# Disable compiling with ASM for x86 to avoid textrel
-EXTRA_OECONF:append:x86 =3D " --disable-asm"
-
-PACKAGES =3D+ "${PN}-tests"
-
-FILES:${PN}-tests =3D " \
-    ${libdir}/test/test \
-"
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.16.0.bb b/meta-oe=
/recipes-multimedia/libass/libass_0.16.0.bb
new file mode 100644
index 000000000..946d99a67
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass_0.16.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION =3D "libass is a portable subtitle renderer for the ASS/SSA =
(Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostl=
y compatible with VSFilter."
+HOMEPAGE =3D "https://github.com/libass/libass"
+SECTION =3D "libs/multimedia"
+
+LICENSE =3D "ISC"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da42532a0684420bdb15556c3cdd49=
a75"
+
+DEPENDS =3D "fontconfig freetype fribidi harfbuzz"
+
+SRC_URI =3D "git://github.com/libass/libass.git;protocol=3Dhttps;branch=3D=
master"
+PV =3D "0.16.0"
+SRCREV =3D "1af6240c5d1e499326146e0b88c987e626b13c23"
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG[asm] =3D "--enable-asm,--disable-asm,nasm-native"
+# use larger tiles in the rasterizer (better performance, slightly worse=
 quality)
+PACKAGECONFIG[largetiles] =3D "--enable-large-tiles,--disable-large-tile=
s"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG:append:x86-64 =3D " asm"
+
+PACKAGES =3D+ "${PN}-tests"
+
+FILES:${PN}-tests =3D " \
+    ${libdir}/test \
+"
--=20
2.34.1


