Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD171E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 19:15:31 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.2716.1736190924703725249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 11:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout08.t-online.de (Postfix) with SMTP id D57C9476;
	Mon,  6 Jan 2025 20:14:21 +0100 (CET)
Received: from [192.168.178.67] ([79.219.236.190]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tUsYO-0H0pbk0; Mon, 6 Jan 2025 20:14:20 +0100
Date: Mon, 06 Jan 2025 20:14:39 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv3] libheif: add recipe
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <FGLOPS.LF1B0BVTVH2N1@t-online.de>
In-Reply-To: <181830490C22CB37.5240@lists.openembedded.org>
References: <181830490C22CB37.5240@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sUJn8EXP31orCXOZKPeM"
X-TOI-EXPURGATEID: 150726::1736190860-CE7FB959-6202BB9A/10/3626336762 SUSPECT URL
X-TOI-MSGID: 4d20694f-8757-41e5-aa50-f40d9ad23781
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 19:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114672

--=-sUJn8EXP31orCXOZKPeM
Content-Type: text/plain; charset=us-ascii; format=flowed

v3 adds libwebp dependency and enables aom PACKAGECONFIG option

On Mon, Jan 6 2025 at 20:12:36 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File 
> Format) file format decoder and encoder. There is partial support for 
> ISO/IEC 23008-12:2022 (2nd Edition) capabilities.
> 
> HEIF and AVIF are new image file formats employing HEVC (H.265) or 
> AV1 image coding, respectively, for the best compression ratios 
> currently possible.
> 
> libheif makes use of libde265 for HEIF image decoding and x265 for 
> encoding. For AVIF, libaom, dav1d, svt-av1, or rav1e are used as 
> codecs.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libheif/libheif_1.19.5.bb                 | 24 
> +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 
> meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb 
> b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> new file mode 100644
> index 0000000000..f208018a59
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 
> Image File Format) file format decoder and encoder"
> +HOMEPAGE = "<https://github.com/strukturag/libheif>"
> +LICENSE = "LGPL-3.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=f07b2bc152eaee52edbd338825f474d4" 
> <file://copying;md5=f07b2bc152eaee52edbd338825f474d4/>
> +LICENSE_FLAGS_ACCEPTED += "commercial"
> +
> +SRC_URI = 
> "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS += "gdk-pixbuf openh264 x265 libde265 tiff zlib libpng 
> libwebp"
> +
> +PACKAGECONFIG += "dav1d jpeg jpeg2000 ffmpeg aom"
> +PACKAGECONFIG[aom] = "-DWITH_AOM_ENCODER=ON 
> -DWITH_AOM_DECODER=ON,-DWITH_AOM_ENCODER=OFF 
> -DWITH_AOM_DECODER=OFF,aom"
> +PACKAGECONFIG[dav1d] = "-DWITH_DAV1D=ON, -DWITH_DAV1D=OFF,dav1d"
> +PACKAGECONFIG[svt-av1] = "-DWITH_SvtEnc=ON,-DWITH_SvtEnc=OFF,svt-av1"
> +PACKAGECONFIG[jpeg] = "-DWITH_JPEG_DECODER=ON 
> -DWITH_JPEG_ENCODER=ON,-DWITH_JPEG_ENCODER=OFF 
> -DWITH_JPEG_DECODER=OFF,jpeg"
> +PACKAGECONFIG[ffmpeg] = 
> "-DWITH_FFMPEG_DECODER=ON,-DWITH_FFMPEG_DECODER=OFF,ffmpeg"
> +PACKAGECONFIG[jpeg2000] = "-DWITH_OpenJPEG_ENCODER=ON 
> -DWITH_OpenJPEG_DECODER=ON,-DWITH_OpenJPEG_ENCODER=OFF 
> -DWITH_OpenJPEG_DECODER=OFF,openjpeg"
> +
> +FILES:${PN} += "${libdir}/libheif ${datadir}/thumbnailers 
> ${libdir}/gdk-pixbuf*"
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114671): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114671>
> Mute This Topic: <https://lists.openembedded.org/mt/110463744/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-sUJn8EXP31orCXOZKPeM
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v3 adds libwebp dependency and enables aom PACKAGECONFIG option</div></div><div id="geary-quote" dir="auto"><br>On Mon, Jan 6 2025 at 20:12:36 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format) file format decoder and encoder. There is partial support for ISO/IEC 23008-12:2022 (2nd Edition) capabilities.

HEIF and AVIF are new image file formats employing HEVC (H.265) or AV1 image coding, respectively, for the best compression ratios currently possible.

libheif makes use of libde265 for HEIF image decoding and x265 for encoding. For AVIF, libaom, dav1d, svt-av1, or rav1e are used as codecs.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../libheif/libheif_1.19.5.bb                 | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
new file mode 100644
index 0000000000..f208018a59
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format) file format decoder and encoder"
+HOMEPAGE = "<a href="https://github.com/strukturag/libheif">https://github.com/strukturag/libheif</a>"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=f07b2bc152eaee52edbd338825f474d4" "="">file://COPYING;md5=f07b2bc152eaee52edbd338825f474d4"</a>
+LICENSE_FLAGS_ACCEPTED += "commercial"
+
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
+
+inherit cmake pkgconfig
+
+DEPENDS += "gdk-pixbuf openh264 x265 libde265 tiff zlib libpng libwebp"
+
+PACKAGECONFIG += "dav1d jpeg jpeg2000 ffmpeg aom"
+PACKAGECONFIG[aom] = "-DWITH_AOM_ENCODER=ON -DWITH_AOM_DECODER=ON,-DWITH_AOM_ENCODER=OFF -DWITH_AOM_DECODER=OFF,aom"
+PACKAGECONFIG[dav1d] = "-DWITH_DAV1D=ON, -DWITH_DAV1D=OFF,dav1d"
+PACKAGECONFIG[svt-av1] = "-DWITH_SvtEnc=ON,-DWITH_SvtEnc=OFF,svt-av1"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON,-DWITH_JPEG_ENCODER=OFF -DWITH_JPEG_DECODER=OFF,jpeg"
+PACKAGECONFIG[ffmpeg] = "-DWITH_FFMPEG_DECODER=ON,-DWITH_FFMPEG_DECODER=OFF,ffmpeg"
+PACKAGECONFIG[jpeg2000] = "-DWITH_OpenJPEG_ENCODER=ON -DWITH_OpenJPEG_DECODER=ON,-DWITH_OpenJPEG_ENCODER=OFF -DWITH_OpenJPEG_DECODER=OFF,openjpeg"
+
+FILES:${PN} += "${libdir}/libheif ${datadir}/thumbnailers ${libdir}/gdk-pixbuf*"
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114671): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114671">https://lists.openembedded.org/g/openembedded-devel/message/114671</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110463744/3618223">https://lists.openembedded.org/mt/110463744/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-sUJn8EXP31orCXOZKPeM--


