Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26670CF258E
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 20:41:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.39623.1728852099593421941
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 13:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id BA3D023A31
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 22:33:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.41]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t05Gw-47rSPy0; Sun, 13 Oct 2024 22:33:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] libplacebo: dont use gitsm
Date: Sun, 13 Oct 2024 22:34:58 +0200
Message-ID: <20241013203459.47304-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241013203459.47304-1-f_l_k@t-online.de>
References: <20241013203459.47304-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1728851582-A6FFB467-F6F0BC1D/0/0 CLEAN NORMAL
X-TOI-MSGID: fa74fabb-7afc-4b23-b968-1824d731eced
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 20:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112842

- Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES
- Add path to vulkan-registry

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mplayer/libplacebo_7.349.0.bb             | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
index b68e67a8c..26e946370 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -1,22 +1,21 @@
 SUMMARY =3D"Reusable library for GPU-accelerated video/image rendering p=
rimitives"
 LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSL-1.0 & MIT"
-LIC_FILES_CHKSUM =3D "file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3D3=
b83ef96387f14655fc854ddc3c6bd57 \
-                    file://3rdparty/fast_float/LICENSE-APACHE;md5=3D81db=
248e90379bcfc0582b578b009bc3 \
-                    file://3rdparty/fast_float/LICENSE-BOOST;md5=3D2c7a3=
fa82e66676005cd4ee2608fd7d2 \
-                    file://3rdparty/fast_float/LICENSE-MIT;md5=3D32b11d5=
0c7d9788d4270f6a83f3e68eb \
-                    file://3rdparty/glad/LICENSE;md5=3Dae570f26774ac096c=
ff8f992091a223c \
-                    file://3rdparty/jinja/LICENSE.rst;md5=3D5dc88300786f=
1c214c1e9827a5229462 \
-                    file://3rdparty/jinja/docs/license.rst;md5=3D5f4c795=
946979fabc2361be4c70d0a9f \
-                    file://3rdparty/markupsafe/LICENSE.rst;md5=3Dffeffa5=
9c90c9c4a033c7574f8f3fb75 \
-                    file://3rdparty/markupsafe/docs/license.rst;md5=3D5f=
4c795946979fabc2361be4c70d0a9f \
-                    file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85d=
a \
-                    file://demos/3rdparty/nuklear/src/LICENSE;md5=3D6052=
431ae6cd4f0082276c54996e7770 \
-                    file://demos/LICENSE;md5=3D65d3616852dbf7b1a6d4b53b0=
0626032"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
=20
-SRC_URI =3D "gitsm://github.com/haasn/libplacebo;protocol=3Dhttps;branch=
=3Dmaster"
+SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3D=
https;branch=3Dv7.349"
=20
 SRCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
=20
 inherit meson pkgconfig
=20
 S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)}"
+
+PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader vulkan-headers shaderc spirv-shader-generator python3-mako-nativ=
e python3-jinja2-native glad-native"
+PACKAGECONFIG[glslang] =3D "-Dglslang=3Denabled,-Dglslang=3Ddisabled,gls=
lang"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad"
+PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
+PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 =
libsdl2-image"
+
+EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registr=
y/vk.xml"
--=20
2.47.0


