Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC06C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 11:30:02 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4933.1659439797795095988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 04:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 7B44C151E0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 13:29:55 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.47.193]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oIq5z-286tnt0; Tue, 2 Aug 2022 13:29:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] libass: update to v1.16.0
Date: Tue,  2 Aug 2022 13:29:46 +0200
Message-Id: <20220802112946.208875-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659439795-01447895-E0A33215/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f1bdd8d-912a-4aa3-a9f3-3f6363fa0f6b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 11:30:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98081

- enca support has been dropped
- add PACKAGECONFIG for asm
- build with asm support for x86_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libass_0.14.0.bb =3D> libass_0.16.0.bb}    | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.14.0.bb =3D> libass_0=
.16.0.bb} (53%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb b/meta-oe=
/recipes-multimedia/libass/libass_0.16.0.bb
similarity index 53%
rename from meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.16.0.bb
index 0e6230736..6befd31b8 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.16.0.bb
@@ -5,23 +5,20 @@ SECTION =3D "libs/multimedia"
 LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da42532a0684420bdb15556c3cdd49=
a75"
=20
-DEPENDS =3D "enca fontconfig freetype libpng fribidi"
+DEPENDS =3D "fontconfig freetype fribidi harfbuzz"
=20
-SRC_URI =3D "git://github.com/libass/libass.git;branch=3Dmaster;protocol=
=3Dhttps"
-SRCREV =3D "73284b676b12b47e17af2ef1b430527299e10c17"
+SRC_URI =3D "git://github.com/libass/libass.git;protocol=3Dhttps;branch=3D=
master"
+SRCREV =3D "1af6240c5d1e499326146e0b88c987e626b13c23"
 S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[harfbuzz] =3D "--enable-harfbuzz,--disable-harfbuzz,harfbu=
zz"
-
-EXTRA_OECONF =3D " \
-    --enable-fontconfig \
-"
+PACKAGECONFIG[asm] =3D "--enable-asm,--disable-asm,nasm-native"
+# use larger tiles in the rasterizer (better performance, slightly worse=
 quality)
+PACKAGECONFIG[largetiles] =3D "--enable-large-tiles,--disable-large-tile=
s"
=20
-# Disable compiling with ASM for x86 to avoid textrel
-EXTRA_OECONF:append:x86 =3D " --disable-asm"
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG:append:x86-64 =3D " asm"
=20
 PACKAGES =3D+ "${PN}-tests"
=20
--=20
2.34.1


