Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881F8C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 05:39:38 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5638.1712036370649268659
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 22:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id 68BCD474C0
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 07:39:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.110]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrWrm-1OhM2b0; Tue, 2 Apr 2024 07:39:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libjxl: add recipe
Date: Tue,  2 Apr 2024 07:39:43 +0200
Message-ID: <20240402053944.7305-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712036366-517F9995-F2EC9008/0/0 CLEAN NORMAL
X-TOI-MSGID: 69d34612-6deb-4b2d-9695-c0c9ecd6de23
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 05:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109772

Import this recipe from meta-wayland, because it is a prerequisite
for the Gnome desktop. The recently updated gnome-backgrounds package
has converted most of the backgrounds to jxl and to keep them usable
the gdk-pixbuf-loader for jpegxl must be provided. This is included
in the libjxl package itself.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/libjxl/libjxl_git.bb   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_git.bb

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_git.bb b/meta-oe/re=
cipes-multimedia/libjxl/libjxl_git.bb
new file mode 100644
index 000000000..ce5cb660b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_git.bb
@@ -0,0 +1,43 @@
+SUMMARY =3D "Reference implementation of JPEG XL (encoder and decoder)"
+HOMEPAGE =3D "https://github.com/libjxl/libjxl/"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a337cc228a1f68f0b5416f52=
a7f"
+
+inherit cmake pkgconfig mime
+
+DEPENDS =3D "highway brotli"
+
+SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=3Dhttps;nobra=
nch=3D1"
+
+PV =3D "0.10.2"
+SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515"
+S =3D "${WORKDIR}/git"
+
+EXTRA_OECMAKE =3D " \
+	-DCMAKE_BUILD_TYPE=3DRelease \
+	-DJPEGXL_ENABLE_PLUGINS=3DON \
+	-DBUILD_TESTING=3DOFF \
+	-DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \
+	-DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \
+	-DJPEGXL_ENABLE_SJPEG=3DOFF \
+	-DJPEGXL_ENABLE_BENCHMARK=3DOFF \
+	-DJPEGXL_ENABLE_EXAMPLES=3DOFF \
+	-DJPEGXL_ENABLE_MANPAGES=3DOFF \
+	-DJPEGXL_ENABLE_SKCMS=3DON \
+	-DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \
+	-DJPEGXL_FORCE_SYSTEM_HWY=3DON \
+	-DJPEGXL_ENABLE_JNI=3DOFF \
+	-DJPEGXL_ENABLE_TCMALLOC=3DOFF \
+	-DJPEGXL_ENABLE_TOOLS=3DOFF \
+"
+
+PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
+PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3D=
ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf"
+PACKAGECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_EN=
ABLE_PLUGIN_GIMP210=3DOFF,gimp"
+PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_ENABL=
E_PLUGIN_MIME=3DOFF"
+
+FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
+
+CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
+
--=20
2.44.0


