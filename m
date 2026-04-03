Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49794D6AB19
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:41:47 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2295.1775241696800165780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Cd83hf9/;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id E6BF7E796
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 20:40:54 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.167.238]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w8jRu-4bDqBV0; Fri, 3 Apr 2026 20:40:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv3] libavif: update 1.3.0 -> 1.4.1
Date: Fri,  3 Apr 2026 20:40:49 +0200
Message-ID: <20260403184049.90543-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775241654-6FFFC882-9F9676E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 02c35467-1047-453e-8684-767078682711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775241654; i=f_l_k@t-online.de;
	bh=Djnc1X48eonMFG8FqIjS3XOsc2cPqJyvuvDrCkatdJI=;
	h=From:To:Subject:Date;
	b=Cd83hf9/wrOTp5Q7na7Ooa3vW5ITw7rUbqNAtP9a63jZCz8xLDpdIKT0vpbCyGtqB
	 nfhOasFcWqx1+L+XMQf+1BWYKbutr8e7ol9DdTM1i7OPxu81BIjP4LWBFMSEwJ7HUy
	 sFafjSmDwhpAoDivFzY4gNwnbV8f+nFvkKcUUWCuVacCTzzosNp/KJgzNBk6DcLBOQ
	 dKBSW2EMTbx3Ahn57LbjqcnAG7Po+qB8RFdqbdez5Ypehx3Kgo9xnS9A/GtLIrYm1W
	 Am4iPlFV2KDGlVgZaJ/tjXqiiK4ZSUwgt4WI3uktFqRFScgtL6/HeQKPvlWNq5mN6c
	 DQ+epmHxGj60w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125991

- add missing dependencies
- add PACKAGECONFIG for aom,svt-av1

1.4.1 - 2026-03-20
Changed since 1.4.0

    Fix build with CMake 3.22
    Update aom.cmd/LocalAom.cmake: v3.13.2
    Update libxml2.cmd/LocalLibXml2.cmake: v2.15.2
    Update libyuv.cmd/LocalLibyuv.cmake: 6067afde5 (1922)
    Support long path names in Windows
    Fix cicp management and memory leaks in avifgainmaputil #3102.

Removed since 1.4.0

    Remove experimental status for the following options of avifenc: --pr=
ogressive, --layered and --scaling-mode, and the extraLayerCount option o=
f avifEncoder.

1.4.0 - 2026-03-04
Added since 1.3.0

    Allow avifenc to read png or jpeg files through stdin using --stdin-f=
ormat.
    Support some Sample Transform schemes as defined in the version 1.2 o=
f the AVIF specification.
    Add an optional argument to the --depth flag of avifenc used to enabl=
e a bit depth extension scheme in the encoded file.
    Add support for converting jpeg files with Apple style gain maps.
    Add support for PNG cICP chunk when decoding PNG files. If a PNG file=
 contains a cICP chunk and other color information chunks, such as iCCP (=
ICC profile), the other chunks are ignored as per the PNG Specification T=
hird Edition Section 4.3.
    Support reading Sample-Transform-based 16-bit AVIF files when avifDec=
oder::imageContentToDecode & AVIF_IMAGE_CONTENT_SAMPLE_TRANSFORMS is not =
zero.
    Support Sample Transform derived image items with grid input image it=
ems.
    Add --sato flag to avifdec to enable Sample Transforms support at dec=
oding.
    Add --grid option to avifgainmaputil.
    Apply clean aperture crop, rotation and mirror when decoding to PNG o=
r JPEG. Remove orientation information from Exif if present.
    Add avif::RGBImageCleanup to the C++ API.

Changed since 1.3.0

    Set avifDecoder::image->depth to the same value after avifDecoderPars=
e() as after avifDecoderNextImage() when the file to decode contains a 's=
ato' derived image item.
    avifdec only enables Sample Transform decoding when --depth is set to=
 16.
    Update dav1d.cmd/dav1d_android.sh/LocalDav1d.cmake: 1.5.3
    Update googletest.cmd/LocalGTest.cmake: v1.17.0
    Update libgav1.cmd: v0.20.0
    Update libjpeg.cmd/LocalJpeg.cmake: 3.1.3
    Update libyuv.cmd/LocalLibyuv.cmake: deeb764bb (1922)
    Update libsharpyuv.cmd/LocalLibsharpyuv.cmake: v1.6.0
    Update libxml2.cmd/LocalLibXml2.cmake: v2.15.1
    Update aom.cmd/LocalAom.cmake: v3.13.1
    Update LocalAvm.cmake: research-v13.0.0
    Update rav1e.cmd/LocalRav1e.cmake: cargo-c v0.10.20, corrosion v0.6.1=
, rav1e v0.8.1
    Update svt.cmd/svt.sh/LocalSvt.cmake: v4.0.1
    Update zlibpng.cmd/LocalZlibpng.cmake: libpng 1.6.55, zlib 1.3.2
    Fix grayscale conversion when changing the bit depth.
    Bump cmake_minimum_required from 3.13 to 3.22
    Associate transformative properties with alpha auxiliary image items.
    Always forward the CICP color primaries, transfer characteristics, an=
d matrix coefficients to the AV1 encoder, which writes them in the Sequen=
ce Header OBU, for compatibility with libraries that wrongly ignore the c=
olr box.
    Use a "quality to quantizer (QP)" mapping formula designed for AOM_TU=
NE_IQ.
    Set tuning before applying the user-provided specific aom codec optio=
ns.
    Use AOM_TUNE_PSNR by default when encoding alpha with libaom because =
AOM_TUNE_SSIM causes ringing for alpha.
    Use AOM_TUNE_IQ by default when encoding still non-RGB color samples =
with libaom v3.13.0 or later.
    Converting an image containing a gain map using avifenc with the --gr=
id flag now also splits the gain map into a grid.
    In avifenc, set Exif orientation to 1 (no transformation) when conver=
ting JPEGs to AVIF.
    Use all-intra encoding for a layered image if the total number of lay=
ers is 2 and the quality of the first layer is very low (q <=3D 10).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libavif/libavif_1.3.0.bb                  | 16 -----------
 .../libavif/libavif_1.4.1.bb                  | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 16 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.=
3.0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.=
4.1.bb

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
deleted file mode 100644
index 44f5c1819a..0000000000
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY =3D "This library aims to be a friendly, portable C implementati=
on of the AV1 Image File Format"
-HOMEPAGE =3D "https://github.com/AOMediaCodec/libavif"
-SECTION =3D "libs"
-# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpe=
g is under IJG
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & IJG"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51549db0941829faeedcc86efec2f=
4c0"
-
-SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dmain;tag=3Dv${PV}"
-
-SRCREV =3D "1aadfad932c98c069a1204261b1856f81f3bc199"
-
-DEPENDS =3D "dav1d"
-
-inherit cmake
-
-EXTRA_OECMAKE +=3D "-DAVIF_CODEC_DAV1D=3DON -DAVIF_LIBYUV=3DOFF"
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
new file mode 100644
index 0000000000..553b620e08
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "This library aims to be a friendly, portable C implementati=
on of the AV1 Image File Format"
+HOMEPAGE =3D "https://github.com/AOMediaCodec/libavif"
+SECTION =3D "libs"
+# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpe=
g is under IJG
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & IJG"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51549db0941829faeedcc86efec2f=
4c0"
+
+SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "6543b22b5bc706c53f038a16fe515f921556d9b3"
+
+DEPENDS =3D "nasm-native"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE +=3D " \
+    -DAVIF_BUILD_APPS=3DOFF \
+    -DAVIF_BUILD_MAN_PAGES=3DOFF \
+    -DAVIF_CODEC_RAV1E=3DOFF \
+    -DAVIF_LIBXML2=3DOFF \
+    -DAVIF_BUILD_GDK_PIXBUF=3DOFF \
+    -DAVIF_LIBYUV=3DOFF \
+"
+
+PACKAGECONFIG ?=3D "dav1d"
+PACKAGECONFIG[aom] =3D "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF=
,aom"
+PACKAGECONFIG[dav1d] =3D "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=
=3DOFF,dav1d"
+PACKAGECONFIG[svt] =3D "-DAVIF_CODEC_SVT=3DSYSTEM,-DAVIF_CODEC_SVT=3DOFF=
,svt-av1"
--=20
2.53.0


