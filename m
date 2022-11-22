Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11396C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 06:47:48 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.12794.1669099663992374872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Nov 2022 22:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 27C1F12D6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 07:47:42 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.106]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxN4C-4c2iEU0; Tue, 22 Nov 2022 07:47:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/2] spirv-cross: upgrade; fix build
Date: Tue, 22 Nov 2022 07:47:22 +0100
Message-Id: <20221122064723.314310-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122064723.314310-1-f_l_k@t-online.de>
References: <20221122064723.314310-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669099656-C23211D1-4D989007/0/0 CLEAN NORMAL
X-TOI-MSGID: 510da97b-00b8-4a7f-9bab-11eb7a4063ce
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 06:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99680

This updates spirv-cross to the latest release
 - use cmake and build shared.
 - get pc files created for use with pkgconfig

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../spir/spirv-shader-generator_git.bb         | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb =
b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
index bf0a5947b..bf3070701 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
@@ -5,18 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57"
 SECTION =3D "graphics"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
-SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=3Dmast=
er;protocol=3Dhttps \
-	file://0001-Add-install-PHONY-target-in-Makefile.patch \
-"
+SRCREV =3D "f09ba2777714871bddb70d049878af34b94fa54d"
+SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=3Dmast=
er;protocol=3Dhttps"
+inherit cmake pkgconfig
=20
-EXTRA_OEMAKE +=3D 'TARGET_DIR_LIB=3D"${D}${libdir}"'=20
-EXTRA_OEMAKE +=3D 'TARGET_DIR_BIN=3D"${D}${bindir}"'
+EXTRA_OECMAKE =3D "-DSPIRV_CROSS_SHARED=3DON"
=20
-do_compile () {
-	cd ${S} && oe_runmake
-}
-
-do_install () {
-	cd ${S} && oe_runmake install
-}
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


