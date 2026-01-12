Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9C7D25044
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:06:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28992.1768205191601889525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FfUbak1s;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768205191; x=1799741191;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MDLybB/YaJ19NkqarytyMaALZXVeItQK3IGeQrRCKLY=;
  b=FfUbak1sVWIk+LnybkS3IB6QSyBYIrSKS0yxBUV57InCjjUiwRraFvdm
   SUE78IFHbFjnjC/IROc98Qs+E+fC/BsFJsK5ybGnZiOpah+8T7rytKfvU
   QJ+BHDgmWkBjIeYuhZnq3lVigrBJyareem+TA1ROjjbZMcU6L/Hd55eKZ
   t4w9OyBKMBb3lRLEp7/s/N/gb+6sm6hWYDQrsYWL3mNQ0Dg0h2zw98cG6
   rSQhCIfs76PePGuG0kJO3LZpHRU/LYsPmPnzUMpQ3ABtApXuMG44GIGYB
   Gj3ehRQg0NYsm23RwSmTxajD60Pe7eljzD2lSL8qmOaT6k6IqItRcEFJt
   g==;
X-CSE-ConnectionGUID: saCjxg6QRXyMEf5mTtoRKg==
X-CSE-MsgGUID: eJrI9ZD7SCqr9t/68anZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="212926973"
X-IronPort-AV: E=Sophos;i="6.21,219,1763391600"; 
   d="scan'208";a="212926973"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 17:06:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DFC2B1002B81
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:06:29 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9A5E8C00204
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:06:29 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 58A93180050A
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:06:27 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2] opencv: upgrade 4.12.0 -> 4.13.0
Date: Mon, 12 Jan 2026 16:06:19 +0800
Message-ID: <20260112080619.7065-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123359

1.Changelogs
  https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4130

2.Remove following patches as they have been merged in upstream.
  27691.patch
  0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch

3.After upgrading to 4.13.0, WITH_KLEIDICV is ON as default in aarch64,
so build kleidicv along with openCV in aarch64.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...d-BlocksCompensator-feed-method-to-e.patch | 55 -------------------
 .../recipes-support/opencv/opencv/27691.patch | 44 ---------------
 .../{opencv_4.12.0.bb => opencv_4.13.0.bb}    | 22 ++++----
 3 files changed, 12 insertions(+), 109 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.12.0.bb => opencv_4.13.0.bb} (94%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch b/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch
deleted file mode 100644
index ec2bb2d100..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b Mon Sep 17 00:00:00 2001
-From: Alexander Smorkalov <alexander.smorkalov@xperience.ai>
-Date: Mon, 8 Sep 2025 14:52:58 +0300
-Subject: [PATCH] Renamed templated BlocksCompensator::feed method to exclude
- claches with base class pure virtual method.
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/commit/b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- .../opencv2/stitching/detail/exposure_compensate.hpp        | 2 +-
- modules/stitching/src/exposure_compensate.cpp               | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.hpp b/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.hpp
-index dea76c957b..2954f32ca3 100644
---- a/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.hpp
-+++ b/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.hpp
-@@ -187,7 +187,7 @@ public:
- 
- protected:
-     template<class Compensator>
--    void feed(const std::vector<Point> &corners, const std::vector<UMat> &images,
-+    void feedWithStrategy(const std::vector<Point> &corners, const std::vector<UMat> &images,
-               const std::vector<std::pair<UMat,uchar> > &masks);
- 
- private:
-diff --git a/modules/stitching/src/exposure_compensate.cpp b/modules/stitching/src/exposure_compensate.cpp
-index 59542d95ba..f7c33fa4ef 100644
---- a/modules/stitching/src/exposure_compensate.cpp
-+++ b/modules/stitching/src/exposure_compensate.cpp
-@@ -460,7 +460,7 @@ void ChannelsCompensator::setMatGains(std::vector<Mat>& umv)
- 
- 
- template<class Compensator>
--void BlocksCompensator::feed(const std::vector<Point> &corners, const std::vector<UMat> &images,
-+void BlocksCompensator::feedWithStrategy(const std::vector<Point> &corners, const std::vector<UMat> &images,
-                              const std::vector<std::pair<UMat,uchar> > &masks)
- {
-     CV_Assert(corners.size() == images.size() && images.size() == masks.size());
-@@ -605,13 +605,13 @@ void BlocksCompensator::setMatGains(std::vector<Mat>& umv)
- void BlocksGainCompensator::feed(const std::vector<Point> &corners, const std::vector<UMat> &images,
-                                  const std::vector<std::pair<UMat,uchar> > &masks)
- {
--    BlocksCompensator::feed<GainCompensator>(corners, images, masks);
-+    BlocksCompensator::feedWithStrategy<GainCompensator>(corners, images, masks);
- }
- 
- void BlocksChannelsCompensator::feed(const std::vector<Point> &corners, const std::vector<UMat> &images,
-                                      const std::vector<std::pair<UMat,uchar> > &masks)
- {
--    BlocksCompensator::feed<ChannelsCompensator>(corners, images, masks);
-+    BlocksCompensator::feedWithStrategy<ChannelsCompensator>(corners, images, masks);
- }
- 
- 
diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch b/meta-oe/recipes-support/opencv/opencv/27691.patch
deleted file mode 100644
index c8c23c93aa..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/27691.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 2001
-From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
-Date: Wed, 20 Aug 2025 10:53:51 +0300
-Subject: [PATCH] FFmpeg 8.0 support.
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/commit/86df53155411b3ade57d0213bf8dd63006bf248f]
----
- modules/videoio/src/cap_ffmpeg_impl.hpp | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index 489dbe565d3d..5780b4c11361 100644
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -685,7 +685,10 @@ void CvCapture_FFMPEG::close()
-     if( video_st )
-     {
- #ifdef CV_FFMPEG_CODECPAR
-+// avcodec_close removed in FFmpeg release 8.0
-+# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
-         avcodec_close( context );
-+# endif
- #endif
-         video_st = NULL;
-     }
-@@ -2005,7 +2008,18 @@ void CvCapture_FFMPEG::get_rotation_angle()
-     rotation_angle = 0;
- #if LIBAVFORMAT_BUILD >= CALC_FFMPEG_VERSION(57, 68, 100)
-     const uint8_t *data = 0;
-+    // av_stream_get_side_data removed in FFmpeg release 8.0
-+# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
-     data = av_stream_get_side_data(video_st, AV_PKT_DATA_DISPLAYMATRIX, NULL);
-+# else
-+    AVPacketSideData* sd = video_st->codecpar->coded_side_data;
-+    int nb_sd = video_st->codecpar->nb_coded_side_data;
-+    if (sd && nb_sd > 0)
-+    {
-+        const AVPacketSideData* mtx = av_packet_side_data_get(sd,  nb_sd, AV_PKT_DATA_DISPLAYMATRIX);
-+        data = mtx->data;
-+    }
-+# endif
-     if (data)
-     {
-         rotation_angle = -cvRound(av_display_rotation_get((const int32_t*)data));
diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
similarity index 94%
rename from meta-oe/recipes-support/opencv/opencv_4.12.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.13.0.bb
index b8e83cd6be..3f4dc23da2 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
@@ -10,33 +10,33 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "49486f61fb25722cbcf586b7f4320921d46fb38e"
-SRCREV_contrib = "d943e1d61c8bc556a13783e1546ee7c1a9e0b1cf"
+SRCREV_opencv = "fe38fc608f6acb8b68953438a62305d8318f4fcd"
+SRCREV_contrib = "d99ad2a188210cc35067c2e60076eed7c2442bc3"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
-SRCREV_fastcv = "2265e79b3b9a8512a9c615b8c4d0244e88f45a9d"
+SRCREV_fastcv = "9e8d42b6d7e769548d70b2e5674e263b056de8b4"
+# kleidicv must match version of OpenCV
+SRCREV_kleidicv = "1e8fe7008c2292657b9689d70ea5d30db0e57767"
 
-
-SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv"
-SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https \
-           git://github.com/opencv/opencv_contrib.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=contrib;branch=4.x;protocol=https \
+SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv_kleidicv"
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https;tag=${PV} \
+           git://github.com/opencv/opencv_contrib.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=contrib;branch=4.x;protocol=https;tag=${PV} \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/boostdesc;name=boostdesc;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=face;protocol=https \
            git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=wechat-qrcode;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250606;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=fastcv;protocol=https  \
+           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250715;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=fastcv;protocol=https  \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
-           file://27691.patch \
-	   file://0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
+SRC_URI:append:aarch64 = " git://gitlab.arm.com/kleidi/kleidicv;branch=main;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/3rdparty/kleidicv;name=kleidicv;protocol=https"
 
 
 # OpenCV wants to download more files during configure.  We download these in
@@ -81,10 +81,12 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41,SSE42", "", d)} \
 "
+
 LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
+EXTRA_OECMAKE:append:aarch64 = " -DKLEIDICV_SOURCE_PATH=${S}/3rdparty/kleidicv"
 
 PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l samples tbb \
     ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-- 
2.43.0


