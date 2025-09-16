Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34158CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 06:35:02 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.13171.1758004500596085934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 23:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id 5B568F0CE
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 08:34:46 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.32.95]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyPGy-0UV3Kq0; Tue, 16 Sep 2025 08:34:40 +0200
Date: Tue, 16 Sep 2025 08:34:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] opencv: add support for ffmpeg 8.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <MX4O2T.KLFR8K9QCH2T@t-online.de>
In-Reply-To: <1865AF99B01D35D1.11775@lists.openembedded.org>
References: <1865AF99B01D35D1.11775@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-SfFJ8Bw+uaEGiMEyZroQ"
X-TOI-EXPURGATEID: 150726::1758004480-BEFFA9B4-7EEC709C/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f82ed09-f9d3-4fe6-a5ae-7d32604f899e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 06:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119415

--=-SfFJ8Bw+uaEGiMEyZroQ
Content-Type: text/plain; charset=us-ascii; format=flowed

Maybe it would be a good idea to use virtual/ffmpeg ?

On Tue, Sep 16 2025 at 08:31:29 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> - add a backport patch that adds support for ffmpeg-8.0
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-support/opencv/opencv/27691.patch | 44 
> +++++++++++++++++++
>  .../recipes-support/opencv/opencv_4.12.0.bb   |  3 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch 
> b/meta-oe/recipes-support/opencv/opencv/27691.patch
> new file mode 100644
> index 0000000000..c8c23c93aa
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/27691.patch
> @@ -0,0 +1,44 @@
> +From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 
> 2001
> +From: Alexander Smorkalov <alexander.smorkalov@opencv.ai 
> <mailto:alexander.smorkalov@opencv.ai>>
> +Date: Wed, 20 Aug 2025 10:53:51 +0300
> +Subject: [PATCH] FFmpeg 8.0 support.
> +
> +Upstream-Status: Backport 
> [<https://github.com/opencv/opencv/commit/86df53155411b3ade57d0213bf8dd63006bf248f>]
> +---
> + modules/videoio/src/cap_ffmpeg_impl.hpp | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp 
> b/modules/videoio/src/cap_ffmpeg_impl.hpp
> +index 489dbe565d3d..5780b4c11361 100644
> +--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
> ++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
> +@@ -685,7 +685,10 @@ void CvCapture_FFMPEG::close()
> +     if( video_st )
> +     {
> + #ifdef CV_FFMPEG_CODECPAR
> ++// avcodec_close removed in FFmpeg release 8.0
> ++# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
> +         avcodec_close( context );
> ++# endif
> + #endif
> +         video_st = NULL;
> +     }
> +@@ -2005,7 +2008,18 @@ void CvCapture_FFMPEG::get_rotation_angle()
> +     rotation_angle = 0;
> + #if LIBAVFORMAT_BUILD >= CALC_FFMPEG_VERSION(57, 68, 100)
> +     const uint8_t *data = 0;
> ++    // av_stream_get_side_data removed in FFmpeg release 8.0
> ++# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
> +     data = av_stream_get_side_data(video_st, 
> AV_PKT_DATA_DISPLAYMATRIX, NULL);
> ++# else
> ++    AVPacketSideData* sd = video_st->codecpar->coded_side_data;
> ++    int nb_sd = video_st->codecpar->nb_coded_side_data;
> ++    if (sd && nb_sd > 0)
> ++    {
> ++        const AVPacketSideData* mtx = av_packet_side_data_get(sd,  
> nb_sd, AV_PKT_DATA_DISPLAYMATRIX);
> ++        data = mtx->data;
> ++    }
> ++# endif
> +     if (data)
> +     {
> +         rotation_angle = -cvRound(av_display_rotation_get((const 
> int32_t*)data));
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb 
> b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> index 539190553d..7a5bfc93a6 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> @@ -33,6 +33,7 @@ SRC_URI = 
> "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
>             file://download.patch <file://download.patch/> \
>             file://0001-Make-ts-module-external.patch 
> <file://0001-make-ts-module-external.patch/> \
>             
> file://0008-Do-not-embed-build-directory-in-binaries.patch 
> <file://0008-do-not-embed-build-directory-in-binaries.patch/> \
> +           file://27691.patch <file://27691.patch/> \
>             "
>  SRC_URI:append:riscv64 = " 
> file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib" 
> <file://0001-use-os-to-compile-tinyxml2.cpp.patch;patchdir=contrib/>
> 
> @@ -106,7 +107,7 @@ PACKAGECONFIG[gtk] = 
> "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
>  PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
>  PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include 
> -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux 
> -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include 
> -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so 
> -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native 
> fastjar-native openjdk-8-native,"
>  PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
> -PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
> +PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,ffmpeg,"
>  PACKAGECONFIG[libv4l] = 
> "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
>  PACKAGECONFIG[opencl] = 
> "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers 
> virtual/opencl-icd,"
>  PACKAGECONFIG[openvino] = 
> "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
> --
> 2.50.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119414): 
> <https://lists.openembedded.org/g/openembedded-devel/message/119414>
> Mute This Topic: <https://lists.openembedded.org/mt/115268996/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-SfFJ8Bw+uaEGiMEyZroQ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Maybe it would be a good idea to use virtual/ffmpeg ?</div><div id="geary-quote" dir="auto"><br>On Tue, Sep 16 2025 at 08:31:29 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add a backport patch that adds support for ffmpeg-8.0

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-support/opencv/opencv/27691.patch | 44 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.12.0.bb   |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch b/meta-oe/recipes-support/opencv/opencv/27691.patch
new file mode 100644
index 0000000000..c8c23c93aa
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/27691.patch
@@ -0,0 +1,44 @@
+From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov &lt;<a href="mailto:alexander.smorkalov@opencv.ai">alexander.smorkalov@opencv.ai</a>&gt;
+Date: Wed, 20 Aug 2025 10:53:51 +0300
+Subject: [PATCH] FFmpeg 8.0 support.
+
+Upstream-Status: Backport [<a href="https://github.com/opencv/opencv/commit/86df53155411b3ade57d0213bf8dd63006bf248f">https://github.com/opencv/opencv/commit/86df53155411b3ade57d0213bf8dd63006bf248f</a>]
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index 489dbe565d3d..5780b4c11361 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -685,7 +685,10 @@ void CvCapture_FFMPEG::close()
+     if( video_st )
+     {
+ #ifdef CV_FFMPEG_CODECPAR
++// avcodec_close removed in FFmpeg release 8.0
++# if (LIBAVCODEC_BUILD &lt; CALC_FFMPEG_VERSION(62, 11, 100))
+         avcodec_close( context );
++# endif
+ #endif
+         video_st = NULL;
+     }
+@@ -2005,7 +2008,18 @@ void CvCapture_FFMPEG::get_rotation_angle()
+     rotation_angle = 0;
+ #if LIBAVFORMAT_BUILD &gt;= CALC_FFMPEG_VERSION(57, 68, 100)
+     const uint8_t *data = 0;
++    // av_stream_get_side_data removed in FFmpeg release 8.0
++# if (LIBAVCODEC_BUILD &lt; CALC_FFMPEG_VERSION(62, 11, 100))
+     data = av_stream_get_side_data(video_st, AV_PKT_DATA_DISPLAYMATRIX, NULL);
++# else
++    AVPacketSideData* sd = video_st-&gt;codecpar-&gt;coded_side_data;
++    int nb_sd = video_st-&gt;codecpar-&gt;nb_coded_side_data;
++    if (sd &amp;&amp; nb_sd &gt; 0)
++    {
++        const AVPacketSideData* mtx = av_packet_side_data_get(sd,  nb_sd, AV_PKT_DATA_DISPLAYMATRIX);
++        data = mtx-&gt;data;
++    }
++# endif
+     if (data)
+     {
+         rotation_angle = -cvRound(av_display_rotation_get((const int32_t*)data));
diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 539190553d..7a5bfc93a6 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            <a href="file://download.patch">file://download.patch</a> \
            <a href="file://0001-Make-ts-module-external.patch">file://0001-Make-ts-module-external.patch</a> \
            <a href="file://0008-Do-not-embed-build-directory-in-binaries.patch">file://0008-Do-not-embed-build-directory-in-binaries.patch</a> \
+           <a href="file://27691.patch">file://27691.patch</a> \
            "
 SRC_URI:append:riscv64 = " <a href="file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib" "="">file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"</a>
 
@@ -106,7 +107,7 @@ PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
 PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
 PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,ffmpeg,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
<div>-- 
</div>2.50.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#119414): <a href="https://lists.openembedded.org/g/openembedded-devel/message/119414">https://lists.openembedded.org/g/openembedded-devel/message/119414</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/115268996/3618223">https://lists.openembedded.org/mt/115268996/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-SfFJ8Bw+uaEGiMEyZroQ--


