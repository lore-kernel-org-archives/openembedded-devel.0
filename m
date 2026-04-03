Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C09E8538C
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:30:45 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2103.1775241041187067268
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=H90CJG8L;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd93.mgt.mul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout05.t-online.de (Postfix) with SMTP id 68C9CB26
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 20:30:39 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.167.238]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w8jHy-2IU5CK0; Fri, 3 Apr 2026 20:30:38 +0200
Date: Fri, 03 Apr 2026 20:30:33 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] libavif: update 1.3.0 -> 1.4.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <XQKXCT.F0Z6XLWJ1VRQ@t-online.de>
In-Reply-To: <18A2EC3A7D8D459F.657799@lists.openembedded.org>
References: <18A2EC3A7D8D459F.657799@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yi+A1OqZle0yTHzPwDjt"
X-TOI-EXPURGATEID: 150726::1775241038-DEFFAA96-73B03495/0/0 CLEAN NORMAL
X-TOI-MSGID: 423ca2f8-3877-4d36-ba5e-8eaf1bbeac31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775241039; i=f_l_k@t-online.de;
	bh=NiXMuQjcs3QDLefpopargHirnUdONh0BkcsOk/9eDBc=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=H90CJG8L5KiuQv0MzwPRN3R6pReMVuwtj3GNTom+4odsWNOh6GMR6NqIFR2WosUTm
	 afKPWFYYe5oZnKFcetyTpsEbdUAJusnZHJTpOtG6+Dsh9LZHyv+zlq9ZJ1b59LHv6I
	 oZo0wJnmrdMeVXrrtZ+4R6zvR7oOIcKDgqptZL+w7uzpOsfY7E5a2fBE7VHtsJTpZM
	 PbamQuHsiUElaN8nMNgojECCLWX0XTpaa+sUNGjw7vAaMRqPPf+EffAaCgPa42gxME
	 EHldcXT3dlrXcwj9UOjsVmD7fITVvcJoQSHlNa/DTE9uP0v+qd2lNvpMxtav5A+fex
	 0BYzDv4x822Uw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 18:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125990

--=-yi+A1OqZle0yTHzPwDjt
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

v2: Currently, codec options are disabled if they are not set to=20
=B4system,=A1 even if the required code is present in the sysroot. To=20
be on the safe side, also include disable options.

Am Fr, 3. Apr 2026 um 20:28:41 +02:00:00 schrieb Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>:
> - add missing dependencies
> - add PACKAGECONFIG for aom,svt-av1
>=20
> 1.4.1 - 2026-03-20
> Changed since 1.4.0
>=20
>     Fix build with CMake 3.22
>     Update aom.cmd/LocalAom.cmake: v3.13.2
>     Update libxml2.cmd/LocalLibXml2.cmake: v2.15.2
>     Update libyuv.cmd/LocalLibyuv.cmake: 6067afde5 (1922)
>     Support long path names in Windows
>     Fix cicp management and memory leaks in avifgainmaputil #3102.
>=20
> Removed since 1.4.0
>=20
>     Remove experimental status for the following options of avifenc:=20
> --progressive, --layered and --scaling-mode, and the extraLayerCount=20
> option of avifEncoder.
>=20
> 1.4.0 - 2026-03-04
> Added since 1.3.0
>=20
>     Allow avifenc to read png or jpeg files through stdin using=20
> --stdin-format.
>     Support some Sample Transform schemes as defined in the version=20
> 1.2 of the AVIF specification.
>     Add an optional argument to the --depth flag of avifenc used to=20
> enable a bit depth extension scheme in the encoded file.
>     Add support for converting jpeg files with Apple style gain maps.
>     Add support for PNG cICP chunk when decoding PNG files. If a PNG=20
> file contains a cICP chunk and other color information chunks, such=20
> as iCCP (ICC profile), the other chunks are ignored as per the PNG=20
> Specification Third Edition Section 4.3.
>     Support reading Sample-Transform-based 16-bit AVIF files when=20
> avifDecoder::imageContentToDecode &=20
> AVIF_IMAGE_CONTENT_SAMPLE_TRANSFORMS is not zero.
>     Support Sample Transform derived image items with grid input=20
> image items.
>     Add --sato flag to avifdec to enable Sample Transforms support at=20
> decoding.
>     Add --grid option to avifgainmaputil.
>     Apply clean aperture crop, rotation and mirror when decoding to=20
> PNG or JPEG. Remove orientation information from Exif if present.
>     Add avif::RGBImageCleanup to the C++ API.
>=20
> Changed since 1.3.0
>=20
>     Set avifDecoder::image->depth to the same value after=20
> avifDecoderParse() as after avifDecoderNextImage() when the file to=20
> decode contains a 'sato' derived image item.
>     avifdec only enables Sample Transform decoding when --depth is=20
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
>     Update rav1e.cmd/LocalRav1e.cmake: cargo-c v0.10.20, corrosion=20
> v0.6.1, rav1e v0.8.1
>     Update svt.cmd/svt.sh/LocalSvt.cmake: v4.0.1
>     Update zlibpng.cmd/LocalZlibpng.cmake: libpng 1.6.55, zlib 1.3.2
>     Fix grayscale conversion when changing the bit depth.
>     Bump cmake_minimum_required from 3.13 to 3.22
>     Associate transformative properties with alpha auxiliary image=20
> items.
>     Always forward the CICP color primaries, transfer=20
> characteristics, and matrix coefficients to the AV1 encoder, which=20
> writes them in the Sequence Header OBU, for compatibility with=20
> libraries that wrongly ignore the colr box.
>     Use a "quality to quantizer (QP)" mapping formula designed for=20
> AOM_TUNE_IQ.
>     Set tuning before applying the user-provided specific aom codec=20
> options.
>     Use AOM_TUNE_PSNR by default when encoding alpha with libaom=20
> because AOM_TUNE_SSIM causes ringing for alpha.
>     Use AOM_TUNE_IQ by default when encoding still non-RGB color=20
> samples with libaom v3.13.0 or later.
>     Converting an image containing a gain map using avifenc with the=20
> --grid flag now also splits the gain map into a grid.
>     In avifenc, set Exif orientation to 1 (no transformation) when=20
> converting JPEGs to AVIF.
>     Use all-intra encoding for a layered image if the total number of=20
> layers is 2 and the quality of the first layer is very low (q <=3D 10).
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libavif/libavif_1.3.0.bb                  | 16 -----------
>  .../libavif/libavif_1.4.1.bb                  | 27=20
> +++++++++++++++++++
>  2 files changed, 27 insertions(+), 16 deletions(-)
>  delete mode 100644=20
> meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
>  create mode 100644=20
> meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
>=20
> diff --git=20
> a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb=20
> b/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
> deleted file mode 100644
> index 44f5c1819a..0000000000
> --- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =3D "This library aims to be a friendly, portable C=20
> implementation of the AV1 Image File Format"
> -HOMEPAGE =3D "<https://github.com/AOMediaCodec/libavif>"
> -SECTION =3D "libs"
> -# Most is the code is under BSD-2, but libyuv is under BSD-3, and=20
> iccjpeg is under IJG
> -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & IJG"
> -LIC_FILES_CHKSUM =3D=20
> "file://LICENSE;md5=3D51549db0941829faeedcc86efec2f4c0"=20
> <file://license;md5=3D51549db0941829faeedcc86efec2f4c0/>
> -
> -SRC_URI =3D=20
> "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;branch=3Dmain=
;tag=3Dv${PV}"
> -
> -SRCREV =3D "1aadfad932c98c069a1204261b1856f81f3bc199"
> -
> -DEPENDS =3D "dav1d"
> -
> -inherit cmake
> -
> -EXTRA_OECMAKE +=3D "-DAVIF_CODEC_DAV1D=3DON -DAVIF_LIBYUV=3DOFF"
> diff --git=20
> a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb=20
> b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
> new file mode 100644
> index 0000000000..6f6aea0599
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "This library aims to be a friendly, portable C=20
> implementation of the AV1 Image File Format"
> +HOMEPAGE =3D "<https://github.com/AOMediaCodec/libavif>"
> +SECTION =3D "libs"
> +# Most is the code is under BSD-2, but libyuv is under BSD-3, and=20
> iccjpeg is under IJG
> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause & IJG"
> +LIC_FILES_CHKSUM =3D=20
> "file://LICENSE;md5=3D51549db0941829faeedcc86efec2f4c0"=20
> <file://license;md5=3D51549db0941829faeedcc86efec2f4c0/>
> +
> +SRC_URI =3D=20
> "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;branch=3Dmain=
;tag=3Dv${PV}"
> +SRCREV =3D "6543b22b5bc706c53f038a16fe515f921556d9b3"
> +
> +DEPENDS =3D "nasm-native libxml2"
> +
> +inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE +=3D " \
> +    -DAVIF_BUILD_APPS=3DOFF \
> +    -DAVIF_BUILD_MAN_PAGES=3DOFF \
> +    -DAVIF_CODEC_RAV1E=3DOFF \
> +    -DAVIF_LIBXML2=3DSYSTEM \
> +    -DAVIF_BUILD_GDK_PIXBUF=3DOFF \
> +    -DAVIF_LIBYUV=3DOFF \
> +"
> +
> +PACKAGECONFIG ?=3D "dav1d"
> +PACKAGECONFIG[aom] =3D=20
> "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF,aom"
> +PACKAGECONFIG[dav1d] =3D=20
> "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=3DOFF,dav1d"
> +PACKAGECONFIG[svt] =3D=20
> "-DAVIF_CODEC_SVT=3DSYSTEM,-DAVIF_CODEC_SVT=3DOFF,svt-av1"
> --
> 2.53.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125989):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/125989>
> Mute This Topic: <https://lists.openembedded.org/mt/118654042/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-yi+A1OqZle0yTHzPwDjt
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v2: Currently, codec options are d=
isabled if they are not set to =B4system,=A1 even if the required code is p=
resent in the sysroot. To be on the safe side, also include disable options=
.</div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Fr, 3. Apr 2026 um=
 20:28:41 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_=
k=3Dt-online.de@lists.openembedded.org&gt;:<br><blockquote type=3D"cite"><d=
iv class=3D"plaintext" style=3D"white-space: break-spaces;">- add missing d=
ependencies
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

    Remove experimental status for the following options of avifenc: --prog=
ressive, --layered and --scaling-mode, and the extraLayerCount option of av=
ifEncoder.

1.4.0 - 2026-03-04
Added since 1.3.0

    Allow avifenc to read png or jpeg files through stdin using --stdin-for=
mat.
    Support some Sample Transform schemes as defined in the version 1.2 of =
the AVIF specification.
    Add an optional argument to the --depth flag of avifenc used to enable =
a bit depth extension scheme in the encoded file.
    Add support for converting jpeg files with Apple style gain maps.
    Add support for PNG cICP chunk when decoding PNG files. If a PNG file c=
ontains a cICP chunk and other color information chunks, such as iCCP (ICC =
profile), the other chunks are ignored as per the PNG Specification Third E=
dition Section 4.3.
    Support reading Sample-Transform-based 16-bit AVIF files when avifDecod=
er::imageContentToDecode &amp; AVIF_IMAGE_CONTENT_SAMPLE_TRANSFORMS is not =
zero.
    Support Sample Transform derived image items with grid input image item=
s.
    Add --sato flag to avifdec to enable Sample Transforms support at decod=
ing.
    Add --grid option to avifgainmaputil.
    Apply clean aperture crop, rotation and mirror when decoding to PNG or =
JPEG. Remove orientation information from Exif if present.
    Add avif::RGBImageCleanup to the C++ API.

Changed since 1.3.0

    Set avifDecoder::image-&gt;depth to the same value after avifDecoderPar=
se() as after avifDecoderNextImage() when the file to decode contains a 'sa=
to' derived image item.
    avifdec only enables Sample Transform decoding when --depth is set to 1=
6.
    Update dav1d.cmd/dav1d_android.sh/LocalDav1d.cmake: 1.5.3
    Update googletest.cmd/LocalGTest.cmake: v1.17.0
    Update libgav1.cmd: v0.20.0
    Update libjpeg.cmd/LocalJpeg.cmake: 3.1.3
    Update libyuv.cmd/LocalLibyuv.cmake: deeb764bb (1922)
    Update libsharpyuv.cmd/LocalLibsharpyuv.cmake: v1.6.0
    Update libxml2.cmd/LocalLibXml2.cmake: v2.15.1
    Update aom.cmd/LocalAom.cmake: v3.13.1
    Update LocalAvm.cmake: research-v13.0.0
    Update rav1e.cmd/LocalRav1e.cmake: cargo-c v0.10.20, corrosion v0.6.1, =
rav1e v0.8.1
    Update svt.cmd/svt.sh/LocalSvt.cmake: v4.0.1
    Update zlibpng.cmd/LocalZlibpng.cmake: libpng 1.6.55, zlib 1.3.2
    Fix grayscale conversion when changing the bit depth.
    Bump cmake_minimum_required from 3.13 to 3.22
    Associate transformative properties with alpha auxiliary image items.
    Always forward the CICP color primaries, transfer characteristics, and =
matrix coefficients to the AV1 encoder, which writes them in the Sequence H=
eader OBU, for compatibility with libraries that wrongly ignore the colr bo=
x.
    Use a "quality to quantizer (QP)" mapping formula designed for AOM_TUNE=
_IQ.
    Set tuning before applying the user-provided specific aom codec options=
.
    Use AOM_TUNE_PSNR by default when encoding alpha with libaom because AO=
M_TUNE_SSIM causes ringing for alpha.
    Use AOM_TUNE_IQ by default when encoding still non-RGB color samples wi=
th libaom v3.13.0 or later.
    Converting an image containing a gain map using avifenc with the --grid=
 flag now also splits the gain map into a grid.
    In avifenc, set Exif orientation to 1 (no transformation) when converti=
ng JPEGs to AVIF.
    Use all-intra encoding for a layered image if the total number of layer=
s is 2 and the quality of the first layer is very low (q &lt;=3D 10).

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../libavif/libavif_1.3.0.bb                  | 16 -----------
 .../libavif/libavif_1.4.1.bb                  | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 16 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.3.=
0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_1.4.=
1.bb

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb b/=
meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
deleted file mode 100644
index 44f5c1819a..0000000000
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.3.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY =3D "This library aims to be a friendly, portable C implementation=
 of the AV1 Image File Format"
-HOMEPAGE =3D "<a href=3D"https://github.com/AOMediaCodec/libavif">https://=
github.com/AOMediaCodec/libavif</a>"
-SECTION =3D "libs"
-# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpeg =
is under IJG
-LICENSE =3D "BSD-2-Clause &amp; BSD-3-Clause &amp; IJG"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D51549db0941829faeedc=
c86efec2f4c0" "=3D"">file://LICENSE;md5=3D51549db0941829faeedcc86efec2f4c0"=
</a>
-
-SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3Dv${PV}"
-
-SRCREV =3D "1aadfad932c98c069a1204261b1856f81f3bc199"
-
-DEPENDS =3D "dav1d"
-
-inherit cmake
-
-EXTRA_OECMAKE +=3D "-DAVIF_CODEC_DAV1D=3DON -DAVIF_LIBYUV=3DOFF"
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb b/=
meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
new file mode 100644
index 0000000000..6f6aea0599
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "This library aims to be a friendly, portable C implementation=
 of the AV1 Image File Format"
+HOMEPAGE =3D "<a href=3D"https://github.com/AOMediaCodec/libavif">https://=
github.com/AOMediaCodec/libavif</a>"
+SECTION =3D "libs"
+# Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpeg =
is under IJG
+LICENSE =3D "BSD-2-Clause &amp; BSD-3-Clause &amp; IJG"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D51549db0941829faeedc=
c86efec2f4c0" "=3D"">file://LICENSE;md5=3D51549db0941829faeedcc86efec2f4c0"=
</a>
+
+SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "6543b22b5bc706c53f038a16fe515f921556d9b3"
+
+DEPENDS =3D "nasm-native libxml2"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE +=3D " \
+    -DAVIF_BUILD_APPS=3DOFF \
+    -DAVIF_BUILD_MAN_PAGES=3DOFF \
+    -DAVIF_CODEC_RAV1E=3DOFF \
+    -DAVIF_LIBXML2=3DSYSTEM \
+    -DAVIF_BUILD_GDK_PIXBUF=3DOFF \
+    -DAVIF_LIBYUV=3DOFF \
+"
+
+PACKAGECONFIG ?=3D "dav1d"
+PACKAGECONFIG[aom] =3D "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF,a=
om"
+PACKAGECONFIG[dav1d] =3D "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=
=3DOFF,dav1d"
+PACKAGECONFIG[svt] =3D "-DAVIF_CODEC_SVT=3DSYSTEM,-DAVIF_CODEC_SVT=3DOFF,s=
vt-av1"
<div>--=20
</div>2.53.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#125989): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125989">https://lists.openembedded.org/g/openembed=
ded-devel/message/125989</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118654042/361=
8223">https://lists.openembedded.org/mt/118654042/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-yi+A1OqZle0yTHzPwDjt--


