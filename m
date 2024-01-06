Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B3FC46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 19:45:36 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.1168.1704570328509575452
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jan 2024 11:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout04.t-online.de (Postfix) with SMTP id AFAE721D25
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jan 2024 20:45:25 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.51]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMCbg-3nsf5d0; Sat, 6 Jan 2024 20:45:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libplacebo: add recipe
Date: Sat,  6 Jan 2024 20:45:11 +0100
Message-ID: <20240106194511.17289-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704570320-ABFFC99C-51DCCEA6/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b55c33a-21e5-4266-bf28-2107ab02c73f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108064

libplacebo is a required build dependency for mpv-0.37

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mplayer/libplacebo_git.bb                 | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb b/meta-=
oe/recipes-multimedia/mplayer/libplacebo_git.bb
new file mode 100644
index 000000000..337ccd23b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "The core rendering algorithms and ideas of mpv rewritten as=
 an independent library."
+SECTION =3D "multimedia"
+HOMEPAGE =3D "https://opensourcelibs.com/lib/libplacebo"
+
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
+
+SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3D=
https;branch=3Dv6.338"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "2805a0d01c029084ab36bf5d0e3c8742012a0b27"
+PV =3D "6.338.1"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)}"
+
+PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader vulkan-headers shaderc spirv-shader-generator python3-mako-nativ=
e python3-jinja2-native glad-native"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad"
+PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
+PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 =
libsdl2-image"
+
+EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registr=
y/vk.xml"
+
--=20
2.43.0


