Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEA5C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 05:25:56 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.22153.1659936354210622119
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Aug 2022 22:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout07.t-online.de (Postfix) with SMTP id 1EFC345FB
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  8 Aug 2022 07:25:11 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.38.77]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oKvGG-0EdiRV0; Mon, 8 Aug 2022 07:25:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] waylandpp: add recipe
Date: Mon,  8 Aug 2022 07:24:51 +0200
Message-Id: <20220808052451.7568-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659936308-01447895-301B79C5/0/0 CLEAN NORMAL
X-TOI-MSGID: 39fa1564-c24b-4e7c-b8a1-b616af379327
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 05:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98150

This adds C++ bindings for Wayland as used e.g. in the Kodi project

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wayland/waylandpp_1.0.0.bb                | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-o=
e/recipes-graphics/wayland/waylandpp_1.0.0.bb
new file mode 100644
index 000000000..f075f2a3a
--- /dev/null
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
@@ -0,0 +1,37 @@
+SUMMARY =3D " C++ binding for Wayland using the most modern C++ technolo=
gy"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3aae28cc66d61975114c2b14df215=
407"
+
+SRC_URI =3D "git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;=
branch=3Dmaster"
+
+DEPENDS =3D "pugixml"
+DEPENDS:append:class-target =3D " waylandpp-native wayland virtual/egl v=
irtual/libgles2"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE:class-native =3D " \
+	-DBUILD_SCANNER=3DON \
+	-DBUILD_LIBRARIES=3DOFF \
+	-DBUILD_DOCUMENTATION=3DOFF \
+	-DCMAKE_BUILD_TYPE=3DRelease \
+	-DCMAKE_VERBOSE_MAKEFILE=3DTRUE \
+"
+
+EXTRA_OECMAKE:class-target =3D " \
+	-DBUILD_SCANNER=3DON \
+	-DBUILD_LIBRARIES=3DON \
+	-DBUILD_DOCUMENTATION=3DOFF \
+	-DBUILD_EXAMPLES=3DOFF \
+	-DOPENGL_LIBRARY=3D"-lEGL -lGLESv2" \
+	-DOPENGL_opengl_LIBRARY=3D-lEGL \
+	-DOPENGL_glx_LIBRARY=3D-lEGL \
+	-DWAYLAND_SCANNERPP=3D"${STAGING_BINDIR_NATIVE}/wayland-scanner++" \
+	-DCMAKE_BUILD_TYPE=3DRelease \
+	-DCMAKE_VERBOSE_MAKEFILE=3DTRUE \
+	-DCMAKE_EXE_LINKER_FLAGS=3D"-Wl,--enable-new-dtags" \
+"
+
+BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.34.1


