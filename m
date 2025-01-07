Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDF3E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:37:39 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.25242.1736267857150418212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id D4AD3695;
	Tue,  7 Jan 2025 17:37:34 +0100 (CET)
Received: from [192.168.178.67] ([84.163.46.246]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVCaE-2jkwvg0; Tue, 7 Jan 2025 17:37:34 +0100
Date: Tue, 07 Jan 2025 17:37:49 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv4] libheif: add recipe
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <1V8QPS.ZDS9HU8YEXOX2@t-online.de>
In-Reply-To: <181876620C2F138D.682@lists.openembedded.org>
References: <181876620C2F138D.682@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-vfWhx8DokAMEU2tAAwJK"
X-TOI-EXPURGATEID: 150726::1736267854-02FFAA80-97B34B67/10/3626336762 SUSPECT URL
X-TOI-MSGID: 50043ec9-0d5b-43bf-b566-799e5899908f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 16:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114715

--=-vfWhx8DokAMEU2tAAwJK
Content-Type: text/plain; charset=us-ascii; format=flowed

v4: fix LICENSE_FLAGS

On Tue, Jan 7 2025 at 17:36:44 +01:00:00, Markus Volk 
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
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
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
> index 0000000000..952851d4c1
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
> +LICENSE_FLAGS = "commercial"
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
> View/Reply Online (#114714): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114714>
> Mute This Topic: <https://lists.openembedded.org/mt/110480160/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-vfWhx8DokAMEU2tAAwJK
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v4: fix LICENSE_FLAGS</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 7 2025 at 17:36:44 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format) file format decoder and encoder. There is partial support for ISO/IEC 23008-12:2022 (2nd Edition) capabilities.

HEIF and AVIF are new image file formats employing HEVC (H.265) or AV1 image coding, respectively, for the best compression ratios currently possible.

libheif makes use of libde265 for HEIF image decoding and x265 for encoding. For AVIF, libaom, dav1d, svt-av1, or rav1e are used as codecs.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
---
 .../libheif/libheif_1.19.5.bb                 | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
new file mode 100644
index 0000000000..952851d4c1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format) file format decoder and encoder"
+HOMEPAGE = "<a href="https://github.com/strukturag/libheif">https://github.com/strukturag/libheif</a>"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=f07b2bc152eaee52edbd338825f474d4" "="">file://COPYING;md5=f07b2bc152eaee52edbd338825f474d4"</a>
+LICENSE_FLAGS = "commercial"
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
View/Reply Online (#114714): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114714">https://lists.openembedded.org/g/openembedded-devel/message/114714</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110480160/3618223">https://lists.openembedded.org/mt/110480160/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-vfWhx8DokAMEU2tAAwJK--


