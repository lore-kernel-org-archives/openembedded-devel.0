Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE98CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 05:50:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.5565.1712037000153078085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 22:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout11.t-online.de (Postfix) with SMTP id 2A512B69F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 07:49:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.110]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrX1r-1RxBwH0; Tue, 2 Apr 2024 07:49:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libjxl: add recipe
Date: Tue,  2 Apr 2024 07:49:47 +0200
Message-ID: <20240402054947.10487-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712036991-36FFA846-99A44CE9/0/0 CLEAN NORMAL
X-TOI-MSGID: ddc3543b-161e-4791-9b8c-7ef4df4cb734
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 05:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109774

Import this recipe from meta-wayland, because it is a prerequisite
for the Gnome desktop. The recently updated gnome-backgrounds package
has converted most of the backgrounds to jxl and to keep them usable
the gdk-pixbuf-loader for jpegxl must be provided. This is included
in the libjxl package itself.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libjxl/libjxl_2.10.0.bb                   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe=
/recipes-multimedia/libjxl/libjxl_2.10.0.bb
new file mode 100644
index 000000000..0c4f79fdb
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
@@ -0,0 +1,42 @@
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


