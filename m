Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10230.1795752923828448009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mL5LTAZ2;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so11212165c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752923; x=1796357723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TfgovrBV3BysHAnwzdH+Ygd8xZsbga/KykHg6Xx9WQ=;
        b=mL5LTAZ29b9Nxl6+gmJloSQ4XTwVhvCmGH4iDVLp2OlE+xLUiKXphjgMsUe+NJKRxG
         tedR/BIoHxXW9jXeoUXE8XUz3jungnaNCtNpizvDoU83kJ5Ybl8Gc903Lux25U+gpDG7
         I6KVyd49N4fNwEbJnih+OX0WTXlfi0KCzORM8yeXn2iuhfnNouVmBP/HD4HnYocKdsHp
         APkY0ja5v48/HsY4ZxFkloivjQraLTe+a1LEDWFZlOZJhgcUPs/XdXPetYc02tryoyqb
         sB/XeUgWU+/03dP15ffPVzk4kbYCef1wJkEH0vi5nCGeh1x+qB4ayqUL3ZmZ2+9GL5dL
         GwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752923; x=1796357723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TfgovrBV3BysHAnwzdH+Ygd8xZsbga/KykHg6Xx9WQ=;
        b=tmyboo8TNzT4dqE71tN7GSx37fDtrWZHGAwtxLLvfGMoizqXgJ2kNSNCmeF31AHRKZ
         fiyy2s5bGbYnDmzV/+BkQOQkHYgdgvRNgfVxmBqq2dGlkVPtY0SvZFi7gJOSZ191L/BH
         WglQWnQRJaPB9amaq3hgu3j44gdWUKkB4RT09gPY6Z/9d9m/Hi2VRglJxjOeeA9YW6r7
         +bPs1tE2QzNbrNd3qV67HtX2mvHDtsPX0NWRv9B7krn/6Fde/xPOyKQlpq3O78Sea0QS
         b+ZorrgDY5UWAIx3zZT7bBKi3JvqMatJ/+ggoMYAevoblZa3tg0Nq9pXau4jy5+5VF6A
         /hiA==
X-Gm-Message-State: APuU4Z9aIr16WJk9FYxXFgdXVJRKg2yWl1XZfDGCzbJVTUL1fMOgqcv1
	AjuJO4T3Guq33Apqvt0pvGP6gps+NRphUM/XbD/IDsl02pn34pT5w+RVCScocs2R
X-Gm-Gg: AZFdTZc7g/xFSEfAHV9kiD0uS7BEKmDl9+Rb8ZgJPkLSYA5clnJl6Rcfvf7Tq0iXlSc
	N5e9xRza4BwBfGGomsdkUV8osf36TsHSXvBp11uHOVKfDaxupmhET6RNi2NFvneO9wQoOE3QeZO
	mNpyKkPW8nXXc+bp7Yhx2THUl+hRsi2ouvg/5r+AEIc7GhW5xTWOrI5a+rbPP3CxB6bBtFHke2U
	Z1RfrGRm7NxjfvKTOEOWJ2Cj6KxhocbWMpp/2d0rE5tN6B0OnGs0CY/WUuRE8cwbPV6OI/KYKZP
	0W0JH+DRjdIOdWnPRSHCV02OI9s+DgS+dKvp24LBuwDKkulmteSMGs2u5hFqTkuWngsxQQ1WEAH
	KdNGr3/gOZ+a3jguE+MsgkQUWORY2uXzUXe8uaCylqw5agqezw0fGRwhEYmnkZmSMbKh+qGZ8Zv
	FcmgqrdRpiaorNDyTDE2geW9ce336BfSY/fc9yYrLDIFslWRjr7oyxoT1h67xQu3ECyRyWTCqsk
	OuLbO3RjpqYDwFde+8qZ0Eb9oOl5Qsl6FoUeZ+nARAwesAFKTkHA9ynNSt3mPBO1l3+a6MBwdSg
	eNqBw/k6//v/44IG9Hmi8BZ+mPCOcqv4rFLZgHwCFOfvBrkJYj2pJ+vIYzXgHaWR2KI9qTYUBnC
	JX7lMVGMcnCZx+h/n1mKGX3NepB02pQjnNQzQMsZyUCMrcjzlws+BbuGnzRH1yAiXZIUjnRtCRO
	M+5sLc6/ylgDBSFnD8Yda5PsLHmo4jyRUL0DT4uKomL4nB8oYsNuHOI0VGJtbJE5h76ywWuW0yQ
	zD2nv14j+BmohuWT5EIMZNGNhSAmgVJDHr9bYx1Cjea/X03bbVQi16WP2iDtW4HZiLYXEAPOV6l
	kPCr
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr19116907eec.34.1795752922707;
        Thu, 26 Nov 2026 20:15:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/8] opencv: upgrade 4.14.0 -> 5.1.0
Date: Thu, 26 Nov 2026 20:15:10 -0800
Message-ID: <20261127041517.1773986-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133211
Content-Type: text/plain; charset="utf-8"

OpenCV 5 is a new major series (4.x stays maintained in parallel):
- C++17 is required, Python 2 support is dropped
- legacy C API (CvMat, IplImage, cv* functions) removed
- calib3d split into geometry/calib/stereo (calib3d.hpp kept as
  a compat header), features2d renamed to features, new ptcloud
- ML, G-API and Haar/HOG detectors moved to opencv_contrib
  (ml, gapi, xobjdetect); Caffe/Darknet DNN parsers removed
- MatShape replaces MatSize, new 1D/0D array semantics
- pkg-config/CMake/include/data dirs renamed opencv4 -> opencv5;
  putText now uses HarfBuzz, FFmpeg 8 support

Track the 5.x branch in opencv and opencv_contrib and move kleidicv
to the 26.09 tag that hal/kleidicv/kleidicv.cmake expects; the other
3rdparty blobs (boostdesc, vgg, face, wechat_qrcode, fastcv) are
unchanged. Drop 29533.patch (FFmpeg pix_fmts), it is upstream, and
refresh 0001-Dont-use-isystem.patch. Follow the opencv4 -> opencv5
install path rename in FILES and do_install, fix the java package
path, drop the explicit C++17 from the dnn PACKAGECONFIG as it is
now the default, and build the bundled HarfBuzz subset since the
system HarfBuzz is only used when it has hb-raster, which oe-core
does not enable by default; its MIT license is added to LICENSE. Add an upstream version check that skips the
pre-release tags. Library package names follow the new module
names (e.g. libopencv-calib3d -> libopencv-calib/-geometry/-stereo,
libopencv-features2d -> libopencv-features).

Drop the ffmpeg RAW workaround patch: 5.x only uses AVFMT_RAWPICTURE
and CODEC_FLAG_GLOBAL_HEADER behind ffmpeg version checks. Move the
Upstream-Status of 0003-To-fix-errors-as-following.patch into the
header and mark it Inappropriate; it is only needed together with
0001-Make-ts-module-external.patch, which upstream declined.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../opencv/opencv/0001-Dont-use-isystem.patch |   8 +-
 ...-around-deprecated-ffmpeg-RAW-functi.patch |  33 ---
 .../0003-To-fix-errors-as-following.patch     |   3 +-
 .../recipes-support/opencv/opencv/29533.patch | 242 ------------------
 .../{opencv_4.14.0.bb => opencv_5.1.0.bb}     |  49 ++--
 5 files changed, 31 insertions(+), 304 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/29533.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.14.0.bb => opencv_5.1.0.bb} (88%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
index 948a80fafa..97181fff46 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
@@ -14,12 +14,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
-index 08cd06def4..46c9c02da3 100644
+index f7fb55c367..0fa86dcba5 100644
 --- a/cmake/OpenCVPCHSupport.cmake
 +++ b/cmake/OpenCVPCHSupport.cmake
-@@ -18,6 +18,8 @@ IF(CV_GCC)
-         SET(PCHSupport_FOUND TRUE)
-     ENDIF()
+@@ -16,6 +16,8 @@ IF(CV_GCC)
+ 
+     SET(PCHSupport_FOUND TRUE)
  
 +    SET(CMAKE_INCLUDE_SYSTEM_FLAG_C "-I")
 +    SET(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-I")
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
deleted file mode 100644
index a3bbefaabe..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e4ec6cea72da9e9ae5ba57140fa2f5c63f1f8295 Mon Sep 17 00:00:00 2001
-From: Jason Wessel <jason.wessel@windriver.com>
-Date: Wed, 9 May 2018 13:33:59 -0700
-Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function
- compile failure until next uprev
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
----
-Upstream-Status: Pending
-
- modules/videoio/src/cap_ffmpeg_impl.hpp | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index 6dca724a89..ae55dd4555 100644
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -774,6 +774,14 @@ struct ImplMutex::Impl
- 
- #endif
- 
-+/* NOTE This is deprecated in ffmpeg and the code should be removed */
-+#ifndef AVFMT_RAWPICTURE
-+#define AVFMT_RAWPICTURE	0x0020
-+#endif /* AVFMT_RAWPICTURE */
-+#ifndef CODEC_FLAG_GLOBAL_HEADER
-+#define CODEC_FLAG_GLOBAL_HEADER	AV_CODEC_FLAG_GLOBAL_HEADER
-+#endif
-+
- void ImplMutex::init()
- {
-     impl = new Impl();
diff --git a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
index 9df419d0b8..41f0401150 100644
--- a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
@@ -14,9 +14,8 @@ ts module.
 
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
 
+Upstream-Status: Inappropriate [only needed with 0001-Make-ts-module-external.patch, which upstream declined]
 ---
-Upstream-Status: Pending
-
  modules/ts/include/opencv2/ts.hpp          | 4 ++--
  modules/ts/include/opencv2/ts/ocl_test.hpp | 2 +-
  modules/ts/include/opencv2/ts/ts_ext.hpp   | 2 +-
diff --git a/meta-oe/recipes-support/opencv/opencv/29533.patch b/meta-oe/recipes-support/opencv/opencv/29533.patch
deleted file mode 100644
index 0dcbff932e..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/29533.patch
+++ /dev/null
@@ -1,242 +0,0 @@
-From 700cd32ffd59ed3c6f6aec1919867653d8b125ea Mon Sep 17 00:00:00 2001
-From: Aadhu23 <aadhavansalthivel5@gmail.com>
-Date: Thu, 16 Jul 2026 09:21:37 +0000
-Subject: [PATCH 1/3] videoio: support FFmpeg after AVCodec::pix_fmts removal
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/pull/29533]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/videoio/src/cap_ffmpeg_hw.hpp | 25 +++++++++++++++++++++++++
- 1 file changed, 25 insertions(+)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
-index 65045a2bc79e..bb5e4c108819 100644
---- a/modules/videoio/src/cap_ffmpeg_hw.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
-@@ -757,6 +757,30 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
- #endif
-             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
-                 hw_native_fmt = AV_PIX_FMT_CUDA;
-+#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
-+            if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
-+                const AVPixelFormat *pix_fmts = NULL;
-+                int num_pix_fmts = 0;
-+
-+                int ret = avcodec_get_supported_config(
-+                    NULL,
-+                    c,
-+                    AV_CODEC_CONFIG_PIX_FORMAT,
-+                    0,
-+                    (const void **)&pix_fmts,
-+                    &num_pix_fmts);
-+
-+            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
-+                    for (int i = 0; i < num_pix_fmts; i++) {
-+                        if (pix_fmts[i] == hw_native_fmt) {
-+                            *hw_pix_fmt = hw_native_fmt;
-+                            if (hw_check_codec(c, hw_type, disabled_codecs))
-+                                return c;
-+                        }
-+                    }
-+                }
-+            }
-+#else
-             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
-                 for (int i = 0; c->pix_fmts[i] != AV_PIX_FMT_NONE; i++) {
-                     if (c->pix_fmts[i] == hw_native_fmt) {
-@@ -766,6 +790,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
-                     }
-                 }
-             }
-+#endif
-             for (int i = 0;; i++) {
-                 const AVCodecHWConfig *hw_config = avcodec_get_hw_config(c, i);
-                 if (!hw_config)
-
-From 83ed22ca2800267050a4a9a94afab605c990c0e0 Mon Sep 17 00:00:00 2001
-From: Arnesh Banerjee <linkrinku13@gmail.com>
-Date: Tue, 4 Aug 2026 19:49:11 +0530
-Subject: [PATCH 2/3] videoio(ffmpeg): use avcodec_get_supported_config for
- framerates on FFmpeg 9
-
-AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
-FFmpeg 9, so direct field access no longer builds against FFmpeg 9.
-
-Read the supported frame rate list through avcodec_get_supported_config()
-when building against libavcodec 61.13.100 or newer. That call returns the
-same list plus its entry count, so the loop iterates by count instead of the
-old sentinel terminator. Older FFmpeg keeps the previous field access.
-Upstream-Status: Backport [https://github.com/opencv/opencv/pull/29533]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/videoio/src/cap_ffmpeg_impl.hpp | 34 +++++++++++++++++++++++++
- 1 file changed, 34 insertions(+)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index a7fb1eda9a54..d5b950392c94 100644
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -2627,6 +2627,39 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
-     c->time_base.den = frame_rate;
-     c->time_base.num = frame_rate_base;
-     /* adjust time base for supported framerates */
-+    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
-+    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
-+    // with its entry count, so use it when available.
-+#if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
-+    const AVRational *supported_framerates = NULL;
-+    int num_supported_framerates = 0;
-+    if (codec)
-+        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
-+                                     (const void **)&supported_framerates, &num_supported_framerates);
-+    if (supported_framerates && num_supported_framerates > 0){
-+        AVRational req = {frame_rate, frame_rate_base};
-+        const AVRational *best=NULL;
-+        AVRational best_error= {INT_MAX, 1};
-+        for(int i = 0; i < num_supported_framerates; i++){
-+            const AVRational *p = &supported_framerates[i];
-+            AVRational error= av_sub_q(req, *p);
-+            if(error.num <0) error.num *= -1;
-+            if(av_cmp_q(error, best_error) < 0){
-+                best_error= error;
-+                best= p;
-+            }
-+        }
-+        if (best == NULL)
-+        {
-+#ifdef CV_FFMPEG_CODECPAR
-+            avcodec_free_context(&c);
-+#endif
-+            return NULL;
-+        }
-+        c->time_base.den= best->num;
-+        c->time_base.num= best->den;
-+    }
-+#else
-     if(codec && codec->supported_framerates){
-         const AVRational *p= codec->supported_framerates;
-         AVRational req = {frame_rate, frame_rate_base};
-@@ -2650,6 +2683,7 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
-         c->time_base.den= best->num;
-         c->time_base.num= best->den;
-     }
-+#endif
-
-     c->gop_size = 12; /* emit one intra frame every twelve frames at most */
-     c->pix_fmt = pixel_format;
-
-From c0166c617d765ac707dde6b9acd8cfcd49751049 Mon Sep 17 00:00:00 2001
-From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
-Date: Tue, 11 Aug 2026 13:01:55 +0300
-Subject: [PATCH 3/3] Code review fixes.
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/pull/29533]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/videoio/src/cap_ffmpeg_hw.hpp   | 16 ++++----
- modules/videoio/src/cap_ffmpeg_impl.hpp | 51 ++++++++++++-------------
- 2 files changed, 33 insertions(+), 34 deletions(-)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
-index bb5e4c108819..6c456881122a 100644
---- a/modules/videoio/src/cap_ffmpeg_hw.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
-@@ -757,7 +757,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
- #endif
-             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
-                 hw_native_fmt = AV_PIX_FMT_CUDA;
--#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
-+#if LIBAVCODEC_BUILD >= AV_VERSION_INT(61, 13, 100)
-             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
-                 const AVPixelFormat *pix_fmts = NULL;
-                 int num_pix_fmts = 0;
-@@ -770,15 +770,15 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
-                     (const void **)&pix_fmts,
-                     &num_pix_fmts);
-
--            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
--                    for (int i = 0; i < num_pix_fmts; i++) {
--                        if (pix_fmts[i] == hw_native_fmt) {
--                            *hw_pix_fmt = hw_native_fmt;
--                            if (hw_check_codec(c, hw_type, disabled_codecs))
--                                return c;
-+                if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
-+                        for (int i = 0; i < num_pix_fmts; i++) {
-+                            if (pix_fmts[i] == hw_native_fmt) {
-+                                *hw_pix_fmt = hw_native_fmt;
-+                                if (hw_check_codec(c, hw_type, disabled_codecs))
-+                                    return c;
-+                            }
-                         }
-                     }
--                }
-             }
- #else
-             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index d5b950392c94..fc4479e07c5f 100644
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -2627,37 +2627,36 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
-     c->time_base.den = frame_rate;
-     c->time_base.num = frame_rate_base;
-     /* adjust time base for supported framerates */
--    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
--    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
--    // with its entry count, so use it when available.
- #if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
--    const AVRational *supported_framerates = NULL;
--    int num_supported_framerates = 0;
--    if (codec)
--        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
--                                     (const void **)&supported_framerates, &num_supported_framerates);
--    if (supported_framerates && num_supported_framerates > 0){
--        AVRational req = {frame_rate, frame_rate_base};
--        const AVRational *best=NULL;
--        AVRational best_error= {INT_MAX, 1};
--        for(int i = 0; i < num_supported_framerates; i++){
--            const AVRational *p = &supported_framerates[i];
--            AVRational error= av_sub_q(req, *p);
--            if(error.num <0) error.num *= -1;
--            if(av_cmp_q(error, best_error) < 0){
--                best_error= error;
--                best= p;
-+    if (codec){
-+        const AVRational *supported_framerates = NULL;
-+        int num_supported_framerates = 0;
-+        int ret = avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
-+                                               (const void **)&supported_framerates, &num_supported_framerates);
-+
-+        if (ret >= 0 && supported_framerates && num_supported_framerates > 0){
-+            AVRational req = {frame_rate, frame_rate_base};
-+            const AVRational *best=NULL;
-+            AVRational best_error= {INT_MAX, 1};
-+            for(int i = 0; i < num_supported_framerates; i++){
-+                const AVRational *p = &supported_framerates[i];
-+                AVRational error = av_sub_q(req, *p);
-+                if(error.num <0) error.num *= -1;
-+                if(av_cmp_q(error, best_error) < 0){
-+                    best_error = error;
-+                    best = p;
-+                }
-             }
--        }
--        if (best == NULL)
--        {
-+            if (best == NULL)
-+            {
- #ifdef CV_FFMPEG_CODECPAR
--            avcodec_free_context(&c);
-+                avcodec_free_context(&c);
- #endif
--            return NULL;
-+                return NULL;
-+            }
-+            c->time_base.den = best->num;
-+            c->time_base.num = best->den;
-         }
--        c->time_base.den= best->num;
--        c->time_base.num= best->den;
-     }
- #else
-     if(codec && codec->supported_framerates){
diff --git a/meta-oe/recipes-support/opencv/opencv_4.14.0.bb b/meta-oe/recipes-support/opencv/opencv_5.1.0.bb
similarity index 88%
rename from meta-oe/recipes-support/opencv/opencv_4.14.0.bb
rename to meta-oe/recipes-support/opencv/opencv_5.1.0.bb
index 7cc487c0ce..d2b7a2651c 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_5.1.0.bb
@@ -2,42 +2,44 @@ SUMMARY = "Opencv : The Open Computer Vision Library"
 HOMEPAGE = "http://opencv.org/"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+# MIT for the bundled HarfBuzz (BUILD_HARFBUZZ)
+LICENSE = "Apache-2.0 AND MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://3rdparty/harfbuzz/COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d"
 
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "0654a42e19215ef25b1d367d822f3c630447e7c7"
-SRCREV_contrib = "a8e9acd62cabd30419dba83007f2ac0d07de5e2c"
+SRCREV_opencv = "e4f78fbcf1a773fbed69e14500e8b734963eb585"
+SRCREV_contrib = "b67a855188a3d683813731010f6d39ac614733a4"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
 SRCREV_fastcv = "9e8d42b6d7e769548d70b2e5674e263b056de8b4"
 # kleidicv must match version of OpenCV
-SRCREV_kleidicv = "b1dbf474b8685b97a64d03e828b359fbdc050d1f"
+SRCREV_kleidicv = "cacea38588eb35de69075a0a1a876b82bfcd88dd"
 
-SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv_kleidicv"
-SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https;tag=${PV} \
-           git://github.com/opencv/opencv_contrib.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=contrib;branch=4.x;protocol=https;tag=${PV} \
+SRCREV_FORMAT = "opencv_contrib_boostdesc_vgg_face_wechat-qrcode_fastcv_kleidicv"
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=5.x;protocol=https;tag=${PV} \
+           git://github.com/opencv/opencv_contrib.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=contrib;branch=5.x;protocol=https;tag=${PV} \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/boostdesc;name=boostdesc;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=face;protocol=https \
            git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=wechat-qrcode;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250715;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=fastcv;protocol=https  \
            file://0003-To-fix-errors-as-following.patch \
-           file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
-           file://29533.patch \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
-SRC_URI:append:aarch64 = " git://gitlab.arm.com/kleidi/kleidicv;branch=main;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/3rdparty/kleidicv;name=kleidicv;protocol=https"
+SRC_URI:append:aarch64 = " git://gitlab.arm.com/kleidi/kleidicv;branch=main;tag=26.09;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/3rdparty/kleidicv;name=kleidicv;protocol=https"
 
 
 # OpenCV wants to download more files during configure.  We download these in
@@ -78,6 +80,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
+    -DBUILD_HARFBUZZ=ON \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41,SSE42", "", d)} \
@@ -103,7 +106,7 @@ PACKAGECONFIG:remove:libc-musl:riscv32 = "tbb"
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF -DCMAKE_CXX_STANDARD=17,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
@@ -178,12 +181,12 @@ python populate_packages:prepend () {
 PACKAGES_DYNAMIC += "^libopencv-.*"
 
 FILES:${PN} = ""
-FILES:${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
-FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig  ${libdir}/cmake/opencv4/*.cmake"
-FILES:${PN}-staticdev += "${libdir}/opencv4/3rdparty/*.a"
-FILES:${PN}-apps = "${bindir}/* ${datadir}/opencv4 ${datadir}/licenses"
-FILES:${PN}-java = "${datadir}/OpenCV/java"
-FILES:${PN}-samples = "${datadir}/opencv4/samples/"
+FILES:${PN}-dbg += "${datadir}/java/opencv5/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
+FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig  ${libdir}/cmake/opencv5/*.cmake"
+FILES:${PN}-staticdev += "${libdir}/opencv5/3rdparty/*.a"
+FILES:${PN}-apps = "${bindir}/* ${datadir}/opencv5 ${datadir}/licenses"
+FILES:${PN}-java = "${datadir}/java/opencv5"
+FILES:${PN}-samples = "${datadir}/opencv5/samples/"
 
 INSANE_SKIP:${PN}-java = "libdir"
 INSANE_SKIP:${PN}-dbg = "libdir"
@@ -209,9 +212,9 @@ do_install:append() {
         mv ${D}/usr/lib/* ${D}/${libdir}/
         rm -rf ${D}/usr/lib
     fi
-    # remove setup_vars_opencv4.sh as its content is confusing and useless
-    if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
-        rm -rf ${D}${bindir}/setup_vars_opencv4.sh
+    # remove setup_vars_opencv5.sh as its content is confusing and useless
+    if [ -f ${D}${bindir}/setup_vars_opencv5.sh ]; then
+        rm -rf ${D}${bindir}/setup_vars_opencv5.sh
     fi
 
     find ${B}/modules -name "*.cpp" | xargs -r grep -l "${S}" | while read -r fn; do
@@ -227,9 +230,9 @@ do_install:append() {
 
 do_install:append:class-target() {
     # remove build host path to improve reproducibility
-    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
+    if [ -f ${D}${libdir}/cmake/opencv5/OpenCVModules.cmake ]; then
         sed -e 's@${STAGING_DIR_HOST}@@g' \
-            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
+            -i ${D}${libdir}/cmake/opencv5/OpenCVModules.cmake
     fi
 }
 
