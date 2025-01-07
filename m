Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA25E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:37:09 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.25223.1736267819416956882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id 143091B0;
	Tue,  7 Jan 2025 17:36:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.46.246]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVCZA-2hUz2H0; Tue, 7 Jan 2025 17:36:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCHv4] libheif: add recipe
Date: Tue,  7 Jan 2025 17:36:44 +0100
Message-ID: <20250107163644.2845120-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736267788-4EFFA9D3-BDCCD2F0/10/3626336762 SUSPECT URL
X-TOI-MSGID: a8192f77-7657-4157-9467-9a5b74d2e404
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 16:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114714

libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format)=
 file format decoder and encoder. There is partial support for ISO/IEC 23=
008-12:2022 (2nd Edition) capabilities.

HEIF and AVIF are new image file formats employing HEVC (H.265) or AV1 im=
age coding, respectively, for the best compression ratios currently possi=
ble.

libheif makes use of libde265 for HEIF image decoding and x265 for encodi=
ng. For AVIF, libaom, dav1d, svt-av1, or rav1e are used as codecs.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libheif/libheif_1.19.5.bb                 | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif_1.=
19.5.bb

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb=
 b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
new file mode 100644
index 0000000000..952851d4c1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Imag=
e File Format) file format decoder and encoder"
+HOMEPAGE =3D "https://github.com/strukturag/libheif"
+LICENSE =3D "LGPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df07b2bc152eaee52edbd338825f47=
4d4"
+LICENSE_FLAGS =3D "commercial"
+
+SRC_URI =3D "git://github.com/strukturag/libheif.git;protocol=3Dhttps;br=
anch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "cd95b113d78d0696105a9e678cbd19487ee13d6c"
+
+inherit cmake pkgconfig
+
+DEPENDS +=3D "gdk-pixbuf openh264 x265 libde265 tiff zlib libpng libwebp=
"
+
+PACKAGECONFIG +=3D "dav1d jpeg jpeg2000 ffmpeg aom"
+PACKAGECONFIG[aom] =3D "-DWITH_AOM_ENCODER=3DON -DWITH_AOM_DECODER=3DON,=
-DWITH_AOM_ENCODER=3DOFF -DWITH_AOM_DECODER=3DOFF,aom"
+PACKAGECONFIG[dav1d] =3D "-DWITH_DAV1D=3DON, -DWITH_DAV1D=3DOFF,dav1d"
+PACKAGECONFIG[svt-av1] =3D "-DWITH_SvtEnc=3DON,-DWITH_SvtEnc=3DOFF,svt-a=
v1"
+PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG_DECODER=3DON -DWITH_JPEG_ENCODER=3D=
ON,-DWITH_JPEG_ENCODER=3DOFF -DWITH_JPEG_DECODER=3DOFF,jpeg"
+PACKAGECONFIG[ffmpeg] =3D "-DWITH_FFMPEG_DECODER=3DON,-DWITH_FFMPEG_DECO=
DER=3DOFF,ffmpeg"
+PACKAGECONFIG[jpeg2000] =3D "-DWITH_OpenJPEG_ENCODER=3DON -DWITH_OpenJPE=
G_DECODER=3DON,-DWITH_OpenJPEG_ENCODER=3DOFF -DWITH_OpenJPEG_DECODER=3DOF=
F,openjpeg"
+
+FILES:${PN} +=3D "${libdir}/libheif ${datadir}/thumbnailers ${libdir}/gd=
k-pixbuf*"
--=20
2.47.1


