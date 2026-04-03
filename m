Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47017E85389
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:43:47 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2355.1775241824510199893
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=NBlrqopO;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 5C95E37E84
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 20:43:42 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.167.238]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w8jUZ-1aX0We0; Fri, 3 Apr 2026 20:43:39 +0200
Date: Fri, 03 Apr 2026 20:43:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv3] libavif: update 1.3.0 -> 1.4.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <MCLXCT.6GN2JGG34IWJ2@t-online.de>
In-Reply-To: <18A2ECEB09CC12AD.657799@lists.openembedded.org>
References: <18A2ECEB09CC12AD.657799@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Avp8+ANQxT5OqqYlJnMJ"
X-TOI-EXPURGATEID: 150726::1775241819-527FB82A-A016951B/0/0 CLEAN NORMAL
X-TOI-MSGID: ff90be32-e2d4-4535-837b-d7791bd8dbea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775241822; i=f_l_k@t-online.de;
	bh=BjvwmO1ZKIx7yDQtxLkwCYZ6Yy7Yp+QaayrAN70m2uI=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=NBlrqopOT7rpW9o4HBZ+0WQ5CuNYbycBRWTGT5z+Ru72QIY53RNKEn+dSfIqPfodR
	 JNKPsoWcfhAVz/Xjlx6KeX0IWkg19R6GXJSuB4eVxbrc2Za1FPzsParc40qE/zFQKL
	 BYOjr4P1H3x/8hNvKMqkQITVtprVGZ8Ykg9xxzGTB/CIMkUCX/gNCCLy+lWbJ1vjWJ
	 1wT45irYCbU/rjjQTZfHcWGscZD8NSuYTntK8NbeoXmVhtBpncIJevC31GE3HbcVIw
	 LNWfxWbShc4QSXA8jl5noiwd4wr/wUQDizsBmlgJBTBprULqKxq70tnf4DqhVJ/0nY
	 hiW7cQBGH/XLg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 18:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125992

--=-Avp8+ANQxT5OqqYlJnMJ
Content-Type: text/plain; charset=us-ascii; format=flowed

v3: disable libxml2 by default. It is only required for the binaries 
and so far we only build libs

Am Fr, 3. Apr 2026 um 20:40:49 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> - add missing dependencies
> - add PACKAGECONFIG for aom,svt-av1
> 
> 1.4.1 - 2026-03-20
> Changed since 1.4.0
> 
>     Fix build with CMake 3.22
>     Update aom.cmd/LocalAom.cmake: v3.13.2
>     Update libxml2.cmd/LocalLibXml2.cmake: v2.15.2
>     Update libyuv.cmd/LocalLibyuv.cmake: 6067afde5 (1922)
>     Support long path names in Windows
>     Fix cicp management and memory leaks in avifgainmaputil #3102.
> 
> Removed since 1.4.0
> 
>     Remove experimental status for the following options of avifenc: 
> --progressive, --layered and --scaling-mode, and the extraLayerCount 
> option of avifEncoder.
> 
> 1.4.0 - 2026-03-04
> Added since 1.3.0
> 
>     Allow avifenc to read png or jpeg files through stdin using 
> --stdin-format.
>     Support some Sample Transform schemes as defined in the version 
> 1.2 of the AVIF specification.
>     Add an optional argument to the --depth flag of avifenc used to 
> enable a bit depth extension scheme in the encoded file.
>     Add support for converting jpeg files with Apple style gain maps.
>     Add support for PNG cICP chunk when decoding PNG files. If a PNG 
> file contains a cICP chunk and other color information chunks, such 
> as iCCP (ICC profile), the other chunks are ignored as per the PNG 
> Specification Third Edition Section 4.3.
>     Support reading Sample-Transform-based 16-bit AVIF files when 
> avifDecoder::imageContentToDecode & 
> AVIF_IMAGE_CONTENT_SAMPLE_TRANSFORMS is not zero.
>     Support Sample Transform derived image items with grid input 
> image items.
>     Add --sato flag to avifdec to enable Sample Transforms support at 
> decoding.
>     Add --grid option to avifgainmaputil.
>     Apply clean aperture crop, rotation and mirror when decoding to 
> PNG or JPEG. Remove orientation information from Exif if present.
>     Add avif::RGBImageCleanup to the C++ API.
> 
> Changed since 1.3.0
> 
>     Set avifDecoder::image->depth to the same value after 
> avifDecoderParse() as after avifDecoderNextImage() when the file to 
> decode contains a 'sato' derived image item.
>     avifdec only enables Sample Transform decoding when --depth is 
> set to 16.
>     Update dav1d.cmd/dav1d_android.sh/LocalDav1d.cmake: 1.5.3
>     Update googletest.cmd/LocalGTest.cmake: v1.17.0
>     Update libgav1.cmd: v0.20.0
>     Update libjpeg.cmd/LocalJpeg.cmake: 3.1.3
>     Update libyuv.cmd/LocalLibyuv.cmake: deeb764bb (1922)
>     Update libsharpyuv.cmd/LocalLibsharpyuv.cmake: v1.6.0
>     Update libxml2.cmd/LocalLibXml2.cmake: v2.15.1
>     Update aom.cmd/LocalAom.cmake: v3.13.1
>     Update LocalAvm.cmake: research-v13.0.0
>     Update rav1e.cmd/LocalRav1e.cmake: cargo-c v0.10.20, corrosion 
> v0.6.1, rav1e v0.8.1
>     Update svt.cmd/svt.sh/LocalSvt.cmake: v4.0.1
>     Update zlibpng.cmd/LocalZlibpng.cmake: libpng 1.6.55, zlib 1.3.2
>     Fix grayscale conversion when changing the bit depth.
>     Bump cmake_minimum_required from 3.13 to 3.22
>     Associate transformative properties with alpha auxiliary image 
> items.
>     Always forward the CICP color primaries, transfer 
> characteristics, and matrix coefficients to the AV1 encoder, which 
> writes them in the Sequence Header OBU, for compatibility with 
> libraries that wrongly ignore the colr box.
>     Use a "quality to quantizer (QP)" mapping formula designed for 
> AOM_TUNE_IQ.
>     Set tuning before applying the user-provided specific aom codec 
> options.
>     Use AOM_TUNE_PSNR by default when encoding alpha with libaom 
> because AOM_TUNE_SSIM causes ringing for alpha.
>     Use AOM_TUNE_IQ by default when encoding still non-RGB color 
> samples with libaom v3.13.0 or later.
>     Converting an image containing a gain map using avifenc with the 
> --grid flag now also splits the gain map into a grid.
>     In avifenc, set Exif orientation to 1 (no transformation) when 
> converting JPEGs to AVIF.
>     Use all-intra encoding for a layered image if the total number of 
> layers is 2 and the quality of the first layer is very low (q <= 10).
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libavif/libavif_1.3.0.bb                  | 16 -----------
>  .../libavif/libavif_1.4.1.bb                  | 27 
> +++++++++++++++++++
>  2 files changed, 27 insertions(+), 16 deletions(-)
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
>  create mode 100644 
> meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb 
> b/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
> deleted file mode 100644
> index 44f5c1819a..0000000000
> --- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "This library aims to be a friendly, portable C 
> implementation of the AV1 Image File Format"
> -HOMEPAGE = "<https://github.com/AOMediaCodec/libavif>"
> -SECTION = "libs"
> -# Most is the code is under BSD-2, but libyuv is under BSD-3, and 
> iccjpeg is under IJG
> -LICENSE = "BSD-2-Clause & BSD-3-Clause & IJG"
> -LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0" 
> <file://license;md5=51549db0941829faeedcc86efec2f4c0/>
> -
> -SRC_URI = 
> "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV}"
> -
> -SRCREV = "1aadfad932c98c069a1204261b1856f81f3bc199"
> -
> -DEPENDS = "dav1d"
> -
> -inherit cmake
> -
> -EXTRA_OECMAKE += "-DAVIF_CODEC_DAV1D=ON -DAVIF_LIBYUV=OFF"
> diff --git 
> a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb 
> b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
> new file mode 100644
> index 0000000000..553b620e08
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "This library aims to be a friendly, portable C 
> implementation of the AV1 Image File Format"
> +HOMEPAGE = "<https://github.com/AOMediaCodec/libavif>"
> +SECTION = "libs"
> +# Most is the code is under BSD-2, but libyuv is under BSD-3, and 
> iccjpeg is under IJG
> +LICENSE = "BSD-2-Clause & BSD-3-Clause & IJG"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0" 
> <file://license;md5=51549db0941829faeedcc86efec2f4c0/>
> +
> +SRC_URI = 
> "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV}"
> +SRCREV = "6543b22b5bc706c53f038a16fe515f921556d9b3"
> +
> +DEPENDS = "nasm-native"
> +
> +inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE += " \
> +    -DAVIF_BUILD_APPS=OFF \
> +    -DAVIF_BUILD_MAN_PAGES=OFF \
> +    -DAVIF_CODEC_RAV1E=OFF \
> +    -DAVIF_LIBXML2=OFF \
> +    -DAVIF_BUILD_GDK_PIXBUF=OFF \
> +    -DAVIF_LIBYUV=OFF \
> +"
> +
> +PACKAGECONFIG ?= "dav1d"
> +PACKAGECONFIG[aom] = 
> "-DAVIF_CODEC_AOM=SYSTEM,-DAVIF_CODEC_AOM=OFF,aom"
> +PACKAGECONFIG[dav1d] = 
> "-DAVIF_CODEC_DAV1D=SYSTEM,-DAVIF_CODEC_DAV1D=OFF,dav1d"
> +PACKAGECONFIG[svt] = 
> "-DAVIF_CODEC_SVT=SYSTEM,-DAVIF_CODEC_SVT=OFF,svt-av1"
> --
> 2.53.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125991): 
> <https://lists.openembedded.org/g/openembedded-devel/message/125991>
> Mute This Topic: <https://lists.openembedded.org/mt/118654266/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Avp8+ANQxT5OqqYlJnMJ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v3: disable libxml2 by default. It is only required for the binaries and so far we only build libs</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 3. Apr 2026 um 20:40:49 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add missing dependencies
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

    Remove experimental status for the following options of avifenc: --progressive, --layered and --scaling-mode, and the extraLayerCount option of avifEncoder.

1.4.0 - 2026-03-04
Added since 1.3.0

    Allow avifenc to read png or jpeg files through stdin using --stdin-format.
    Support some Sample Transform schemes as defined in the version 1.2 of the AVIF specification.
    Add an optional argument to the --depth flag of avifenc used to enable a bit depth extension scheme in the encoded file.
    Add support for converting jpeg files with Apple style gain maps.
    Add support for PNG cICP chunk when decoding PNG files. If a PNG file contains a cICP chunk and other color information chunks, such as iCCP (ICC profile), the other chunks are ignored as per the PNG Specification Third Edition Section 4.3.
    Support reading Sample-Transform-based 16-bit AVIF files when avifDecoder::imageContentToDecode &amp; AVIF_IMAGE_CONTENT_SAMPLE_TRANSFORMS is not zero.
    Support Sample Transform derived image items with grid input image items.
    Add --sato flag to avifdec to enable Sample Transforms support at decoding.
    Add --grid option to avifgainmaputil.
    Apply clean aperture crop, rotation and mirror when decoding to PNG or JPEG. Remove orientation information from Exif if present.
    Add avif::RGBImageCleanup to the C++ API.

Changed since 1.3.0

    Set avifDecoder::image-&gt;depth to the same value after avifDecoderParse() as after avifDecoderNextImage() when the file to decode contains a 'sato' derived image item.
    avifdec only enables Sample Transform decoding when --depth is set to 16.
    Update dav1d.cmd/dav1d_android.sh/LocalDav1d.cmake: 1.5.3
    Update googletest.cmd/LocalGTest.cmake: v1.17.0
    Update libgav1.cmd: v0.20.0
    Update libjpeg.cmd/LocalJpeg.cmake: 3.1.3
    Update libyuv.cmd/LocalLibyuv.cmake: deeb764bb (1922)
    Update libsharpyuv.cmd/LocalLibsharpyuv.cmake: v1.6.0
    Update libxml2.cmd/LocalLibXml2.cmake: v2.15.1
    Update aom.cmd/LocalAom.cmake: v3.13.1
    Update LocalAvm.cmake: research-v13.0.0
    Update rav1e.cmd/LocalRav1e.cmake: cargo-c v0.10.20, corrosion v0.6.1, rav1e v0.8.1
    Update svt.cmd/svt.sh/LocalSvt.cmake: v4.0.1
    Update zlibpng.cmd/LocalZlibpng.cmake: libpng 1.6.55, zlib 1.3.2
    Fix grayscale conversion when changing the bit depth.
    Bump cmake_minimum_required from 3.13 to 3.22
    Associate transformative properties with alpha auxiliary image items.
    Always forward the CICP color primaries, transfer characteristics, and matrix coefficients to the AV1 encoder, which writes them in the Sequence Header OBU, for compatibility with libraries that wrongly ignore the colr box.
    Use a "quality to quantizer (QP)" mapping formula designed for AOM_TUNE_IQ.
    Set tuning before applying the user-provided specific aom codec options.
    Use AOM_TUNE_PSNR by default when encoding alpha with libaom because AOM_TUNE_SSIM causes ringing for alpha.
    Use AOM_TUNE_IQ by default when encoding still non-RGB color samples with libaom v3.13.0 or later.
    Converting an image containing a gain map using avifenc with the --grid flag now also splits the gain map into a grid.
    In avifenc, set Exif orientation to 1 (no transformation) when converting JPEGs to AVIF.
    Use all-intra encoding for a layered image if the total number of layers is 2 and the quality of the first layer is very low (q &lt;= 10).

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../libavif/libavif_1.3.0.bb                  | 16 -----------
 .../libavif/libavif_1.4.1.bb                  | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 16 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
deleted file mode 100644
index 44f5c1819a..0000000000
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "This library aims to be a friendly, portable C implementation of the AV1 Image File Format"
-HOMEPAGE = "<a href="https://github.com/AOMediaCodec/libavif">https://github.com/AOMediaCodec/libavif</a>"
-SECTION = "libs"
-# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpeg is under IJG
-LICENSE = "BSD-2-Clause &amp; BSD-3-Clause &amp; IJG"
-LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0" "="">file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0"</a>
-
-SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV}"
-
-SRCREV = "1aadfad932c98c069a1204261b1856f81f3bc199"
-
-DEPENDS = "dav1d"
-
-inherit cmake
-
-EXTRA_OECMAKE += "-DAVIF_CODEC_DAV1D=ON -DAVIF_LIBYUV=OFF"
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
new file mode 100644
index 0000000000..553b620e08
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "This library aims to be a friendly, portable C implementation of the AV1 Image File Format"
+HOMEPAGE = "<a href="https://github.com/AOMediaCodec/libavif">https://github.com/AOMediaCodec/libavif</a>"
+SECTION = "libs"
+# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpeg is under IJG
+LICENSE = "BSD-2-Clause &amp; BSD-3-Clause &amp; IJG"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0" "="">file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0"</a>
+
+SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "6543b22b5bc706c53f038a16fe515f921556d9b3"
+
+DEPENDS = "nasm-native"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += " \
+    -DAVIF_BUILD_APPS=OFF \
+    -DAVIF_BUILD_MAN_PAGES=OFF \
+    -DAVIF_CODEC_RAV1E=OFF \
+    -DAVIF_LIBXML2=OFF \
+    -DAVIF_BUILD_GDK_PIXBUF=OFF \
+    -DAVIF_LIBYUV=OFF \
+"
+
+PACKAGECONFIG ?= "dav1d"
+PACKAGECONFIG[aom] = "-DAVIF_CODEC_AOM=SYSTEM,-DAVIF_CODEC_AOM=OFF,aom"
+PACKAGECONFIG[dav1d] = "-DAVIF_CODEC_DAV1D=SYSTEM,-DAVIF_CODEC_DAV1D=OFF,dav1d"
+PACKAGECONFIG[svt] = "-DAVIF_CODEC_SVT=SYSTEM,-DAVIF_CODEC_SVT=OFF,svt-av1"
<div>-- 
</div>2.53.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#125991): <a href="https://lists.openembedded.org/g/openembedded-devel/message/125991">https://lists.openembedded.org/g/openembedded-devel/message/125991</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/118654266/3618223">https://lists.openembedded.org/mt/118654266/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Avp8+ANQxT5OqqYlJnMJ--


