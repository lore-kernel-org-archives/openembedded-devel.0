Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C13D3C532
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 20:54:53 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.8288.1729198490730781757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 13:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id AFC8B61C9
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 22:54:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.19]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t1XWA-0ddW5J0; Thu, 17 Oct 2024 22:54:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libplacebo: reorganize dependencies
Date: Thu, 17 Oct 2024 22:56:46 +0200
Message-ID: <20241017205646.549321-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729198486-1D7F98C0-02017B79/0/0 CLEAN NORMAL
X-TOI-MSGID: 449492a1-0505-4756-a170-cabb39326b02
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 20:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112971

- vulkan-headers and glad are also required without 'vulkan' DISTRO_FEATU=
RE, because
  a vulkan stub is then built

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
index f0f18f2e4..15f324ff4 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D"Reusable library for GPU-accelerated video/im=
age rendering primitives"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
=20
-DEPENDS +=3D "fastfloat"
+DEPENDS +=3D "fastfloat glad-native python3-mako-native python3-jinja2-n=
ative vulkan-headers"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3D=
https;branch=3Dv7.349"
 SRCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
@@ -13,9 +13,9 @@ S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)} lcms"
=20
-PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader vulkan-headers shaderc spirv-shader-generator python3-mako-nativ=
e python3-jinja2-native glad-native"
+PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader shaderc spirv-shader-generator"
 PACKAGECONFIG[glslang] =3D "-Dglslang=3Denabled,-Dglslang=3Ddisabled,gls=
lang"
-PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled"
 PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
 PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 =
libsdl2-image"
=20
--=20
2.47.0


