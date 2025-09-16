Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF00CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 06:31:52 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.13144.1758004303753428708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 23:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id BCA35A75
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 08:31:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.95]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyPE2-04RFxJ0; Tue, 16 Sep 2025 08:31:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencv: add support for ffmpeg 8.0
Date: Tue, 16 Sep 2025 08:31:29 +0200
Message-ID: <20250916063129.2890982-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758004298-5F7F58B3-9A73FA15/0/0 CLEAN NORMAL
X-TOI-MSGID: cd6015b3-ae04-4c43-99b5-2615f3a3e1be
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119414

- add a backport patch that adds support for ffmpeg-8.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/opencv/opencv/27691.patch | 44 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.12.0.bb   |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch b/meta-oe/=
recipes-support/opencv/opencv/27691.patch
new file mode 100644
index 0000000000..c8c23c93aa
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/27691.patch
@@ -0,0 +1,44 @@
+From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Date: Wed, 20 Aug 2025 10:53:51 +0300
+Subject: [PATCH] FFmpeg 8.0 support.
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/86df5=
3155411b3ade57d0213bf8dd63006bf248f]
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/s=
rc/cap_ffmpeg_impl.hpp
+index 489dbe565d3d..5780b4c11361 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -685,7 +685,10 @@ void CvCapture_FFMPEG::close()
+     if( video_st )
+     {
+ #ifdef CV_FFMPEG_CODECPAR
++// avcodec_close removed in FFmpeg release 8.0
++# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
+         avcodec_close( context );
++# endif
+ #endif
+         video_st =3D NULL;
+     }
+@@ -2005,7 +2008,18 @@ void CvCapture_FFMPEG::get_rotation_angle()
+     rotation_angle =3D 0;
+ #if LIBAVFORMAT_BUILD >=3D CALC_FFMPEG_VERSION(57, 68, 100)
+     const uint8_t *data =3D 0;
++    // av_stream_get_side_data removed in FFmpeg release 8.0
++# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
+     data =3D av_stream_get_side_data(video_st, AV_PKT_DATA_DISPLAYMATRI=
X, NULL);
++# else
++    AVPacketSideData* sd =3D video_st->codecpar->coded_side_data;
++    int nb_sd =3D video_st->codecpar->nb_coded_side_data;
++    if (sd && nb_sd > 0)
++    {
++        const AVPacketSideData* mtx =3D av_packet_side_data_get(sd,  nb=
_sd, AV_PKT_DATA_DISPLAYMATRIX);
++        data =3D mtx->data;
++    }
++# endif
+     if (data)
+     {
+         rotation_angle =3D -cvRound(av_display_rotation_get((const int3=
2_t*)data));
diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.12.0.bb
index 539190553d..7a5bfc93a6 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -33,6 +33,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3D4.x;protocol=3Dht
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
+           file://27691.patch \
            "
 SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.=
patch;patchdir=3Dcontrib"
=20
@@ -106,7 +107,7 @@ PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3D=
OFF,gtk+3,"
 PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper=
,"
 PACKAGECONFIG[java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}/include -DJA=
VA_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=3D$=
{JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/libjawt.s=
o -DJAVA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-nativ=
e fastjar-native openjdk-8-native,"
 PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
-PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
+PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,ffmpeg,=
"
 PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-ut=
ils,"
 PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers virtual/opencl-icd,"
 PACKAGECONFIG[openvino] =3D "-DWITH_OPENVINO=3DON,-DWITH_OPENVINO=3DOFF,=
openvino-inference-engine,openvino-inference-engine"
--=20
2.50.1


