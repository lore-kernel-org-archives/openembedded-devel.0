Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22C9C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:34:23 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7845.1789022063100096018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h+RXggya;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so13546525ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 23:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022062; x=1789626862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8CMY2oJhXkNcSDT0uXeBJC5wZav93ZRwS28cTX1FMY=;
        b=h+RXggyatniTABN0qSkXd9MrbfSXvaq9ceY064PKLMz1DuLb8Q3wqr6spalxGGYH46
         b1LZ4AOpuubr7ocb9g0zRQcWSqH+dAC3vbYecNneUD6rstgyjJYJ3/JV85zYga967Son
         hFxsTMDLHkLqa+TQfxUNIRhh6LgreV3MV4VFWniwBWYe3e/TBUw3VXuBa7hsrk75Hguy
         KCrM0VZYW1IW2D8sbQXq2/p72C8qXWlHe1LdDAN4h56XRYRNUWD26QzgOYh2zhEQXpn6
         oXt1WQ3VH1RqYFdyoUjDwJbxQx2tnP75xkZzTHWdw8gPBqyX3jUgvA//DJUm19lFlLyT
         q/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022062; x=1789626862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8CMY2oJhXkNcSDT0uXeBJC5wZav93ZRwS28cTX1FMY=;
        b=fz7UyetF7spLCF3o35JNKKhyWtfXoWEUqZUPpwK8BVLN8E43A6+nvJ50qn2yj4kWC0
         0/fjUpVHsp95ecIo1CiDXm5GUY/OuDsSfCd+y/AYIRkE3ZKLr9OD9VSMYLDFzjvmi8p1
         Alz3IIC2XizajMwWNgcT6j6xmFiSLydKsRrkdVed5mNq7PouhOw8rdB/TlJQS355QxAo
         rU2fg76I8aYscq0THQMdSGv5+Efud7KzPFBTaDWsR/54AFQH1JCdn50c168rGf77cpXC
         NZVeTxU7O0EZYDKqUCiJhAboYL2AbotE86PQ6ZN/fLVLBG/Fj2k2f8dUHhP0jdVnaSov
         T8MA==
X-Gm-Message-State: AFuF++m3YA0+V/uqXhqasj8VvwpzuEJoFODG1/sALHUoYumKCbSOtf6D
	2uDVJq68LfF8p0X3x3MZydm6dSwsVjpmBtomx067rGiCamA8wmpfK09degHmrA==
X-Gm-Gg: AYBFou3UHDeeFbDbNuSVXw5UzkFORrQCiGhOOt3+AyIG0qnD1ZhPp58YkZV+l3ZCcXs
	9eyjHA0eSrS9mnJTbbj03oyj4HopJev1yq9Fl2L7BrnScEFvL4RzeBVZZY6VhjNre/GvCfh1qIB
	Z0E2/AwJKdqhE6Zev1cO73+QA6vNBHQ5nKM0QrQKVOKd039qSPBBg6U/y92+sZBpfbTI+N5ODxf
	ukEvLA/JbGf9u/1x3pwbaD4NZd9ye+5aDDw2l7kvmAG8Nc0iSWay08ydZaGKdCVoR2B5D4kKQS/
	RsJaRtjnS9L+JPgL63VJnr3fPDWhIKNFFrK5rQ1/dgelW0CU1vZmCNDRG+Tx8uo5jMmGYCZnvKt
	hKoZOy3XZQc6yGaeyqdVtrDRzlSAw53BEIv6tFAdAdFJ5EunRZYp57VyyFIWvSNqp8QztTAKILs
	YR/971lChzxbL3r4TZArv1NDADwog1F+SCsRDQXcP2MAFOUOBOvl3sfX2GicscHa4gPFNRcsRfc
	869DdIEuCQhQiW5CpywE0UA/mmUZKAzkHC7LxhPvvvwEZ3YdEkWnja6o5Dfmp7WnHLFuIISUp8X
	WQ/sODcZxRjleufM+t2uVeDenPN94Ihx6GbV7D5SKB8+qq6dxLVGKyyMpPlaaJVXDIeI/K9ZQ2/
	T7SEa4sokjWoPQ3uYTCY+jbJFBPbl8KqNmVQ9dqQ3U9oYnlKSg0+aS5BV
X-Received: by 2002:a17:902:e74c:b0:2d9:51b7:c0bc with SMTP id d9443c01a7336-2dd0797a884mr74575325ad.12.1789022062083;
        Wed, 09 Sep 2026 23:34:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm49334199eec.12.2026.09.09.23.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] opencv: Backport videoio fixes for ffmpeg 9
Date: Wed,  9 Sep 2026 23:34:18 -0700
Message-ID: <20260910063418.2748646-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 06:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129908

oe-core upgraded ffmpeg 8.1.2 -> 9.0, which removed the AVCodec::pix_fmts
and AVCodec::supported_framerates fields (deprecated since FFmpeg 7.1 /
libavcodec 61.13.100). opencv's videoio ffmpeg backend still reads both
of them directly in cap_ffmpeg_hw.hpp and cap_ffmpeg_impl.hpp, so it does
not build against ffmpeg 9.

Backport the merged upstream series from opencv/opencv#29533, which reads
those lists through avcodec_get_supported_config() when building against
libavcodec 61.13.100 or newer and keeps the old field access otherwise.
The series was merged on 2026-08-11, after the 4.14.0 tag (2026-07-17),
so it is not part of the release we build.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/opencv/opencv/29533.patch | 242 ++++++++++++++++++
 .../recipes-support/opencv/opencv_4.14.0.bb   |   1 +
 2 files changed, 243 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/29533.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/29533.patch b/meta-oe/recipes-support/opencv/opencv/29533.patch
new file mode 100644
index 0000000000..0dcbff932e
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/29533.patch
@@ -0,0 +1,242 @@
+From 700cd32ffd59ed3c6f6aec1919867653d8b125ea Mon Sep 17 00:00:00 2001
+From: Aadhu23 <aadhavansalthivel5@gmail.com>
+Date: Thu, 16 Jul 2026 09:21:37 +0000
+Subject: [PATCH 1/3] videoio: support FFmpeg after AVCodec::pix_fmts removal
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/pull/29533]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/videoio/src/cap_ffmpeg_hw.hpp | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
+index 65045a2bc79e..bb5e4c108819 100644
+--- a/modules/videoio/src/cap_ffmpeg_hw.hpp
++++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
+@@ -757,6 +757,30 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+ #endif
+             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
+                 hw_native_fmt = AV_PIX_FMT_CUDA;
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++            if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
++                const AVPixelFormat *pix_fmts = NULL;
++                int num_pix_fmts = 0;
++
++                int ret = avcodec_get_supported_config(
++                    NULL,
++                    c,
++                    AV_CODEC_CONFIG_PIX_FORMAT,
++                    0,
++                    (const void **)&pix_fmts,
++                    &num_pix_fmts);
++
++            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
++                    for (int i = 0; i < num_pix_fmts; i++) {
++                        if (pix_fmts[i] == hw_native_fmt) {
++                            *hw_pix_fmt = hw_native_fmt;
++                            if (hw_check_codec(c, hw_type, disabled_codecs))
++                                return c;
++                        }
++                    }
++                }
++            }
++#else
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
+                 for (int i = 0; c->pix_fmts[i] != AV_PIX_FMT_NONE; i++) {
+                     if (c->pix_fmts[i] == hw_native_fmt) {
+@@ -766,6 +790,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+                     }
+                 }
+             }
++#endif
+             for (int i = 0;; i++) {
+                 const AVCodecHWConfig *hw_config = avcodec_get_hw_config(c, i);
+                 if (!hw_config)
+
+From 83ed22ca2800267050a4a9a94afab605c990c0e0 Mon Sep 17 00:00:00 2001
+From: Arnesh Banerjee <linkrinku13@gmail.com>
+Date: Tue, 4 Aug 2026 19:49:11 +0530
+Subject: [PATCH 2/3] videoio(ffmpeg): use avcodec_get_supported_config for
+ framerates on FFmpeg 9
+
+AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
+FFmpeg 9, so direct field access no longer builds against FFmpeg 9.
+
+Read the supported frame rate list through avcodec_get_supported_config()
+when building against libavcodec 61.13.100 or newer. That call returns the
+same list plus its entry count, so the loop iterates by count instead of the
+old sentinel terminator. Older FFmpeg keeps the previous field access.
+Upstream-Status: Backport [https://github.com/opencv/opencv/pull/29533]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 34 +++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index a7fb1eda9a54..d5b950392c94 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -2627,6 +2627,39 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+     c->time_base.den = frame_rate;
+     c->time_base.num = frame_rate_base;
+     /* adjust time base for supported framerates */
++    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
++    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
++    // with its entry count, so use it when available.
++#if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
++    const AVRational *supported_framerates = NULL;
++    int num_supported_framerates = 0;
++    if (codec)
++        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
++                                     (const void **)&supported_framerates, &num_supported_framerates);
++    if (supported_framerates && num_supported_framerates > 0){
++        AVRational req = {frame_rate, frame_rate_base};
++        const AVRational *best=NULL;
++        AVRational best_error= {INT_MAX, 1};
++        for(int i = 0; i < num_supported_framerates; i++){
++            const AVRational *p = &supported_framerates[i];
++            AVRational error= av_sub_q(req, *p);
++            if(error.num <0) error.num *= -1;
++            if(av_cmp_q(error, best_error) < 0){
++                best_error= error;
++                best= p;
++            }
++        }
++        if (best == NULL)
++        {
++#ifdef CV_FFMPEG_CODECPAR
++            avcodec_free_context(&c);
++#endif
++            return NULL;
++        }
++        c->time_base.den= best->num;
++        c->time_base.num= best->den;
++    }
++#else
+     if(codec && codec->supported_framerates){
+         const AVRational *p= codec->supported_framerates;
+         AVRational req = {frame_rate, frame_rate_base};
+@@ -2650,6 +2683,7 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+         c->time_base.den= best->num;
+         c->time_base.num= best->den;
+     }
++#endif
+
+     c->gop_size = 12; /* emit one intra frame every twelve frames at most */
+     c->pix_fmt = pixel_format;
+
+From c0166c617d765ac707dde6b9acd8cfcd49751049 Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Date: Tue, 11 Aug 2026 13:01:55 +0300
+Subject: [PATCH 3/3] Code review fixes.
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/pull/29533]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/videoio/src/cap_ffmpeg_hw.hpp   | 16 ++++----
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 51 ++++++++++++-------------
+ 2 files changed, 33 insertions(+), 34 deletions(-)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
+index bb5e4c108819..6c456881122a 100644
+--- a/modules/videoio/src/cap_ffmpeg_hw.hpp
++++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
+@@ -757,7 +757,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+ #endif
+             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
+                 hw_native_fmt = AV_PIX_FMT_CUDA;
+-#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++#if LIBAVCODEC_BUILD >= AV_VERSION_INT(61, 13, 100)
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
+                 const AVPixelFormat *pix_fmts = NULL;
+                 int num_pix_fmts = 0;
+@@ -770,15 +770,15 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+                     (const void **)&pix_fmts,
+                     &num_pix_fmts);
+
+-            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
+-                    for (int i = 0; i < num_pix_fmts; i++) {
+-                        if (pix_fmts[i] == hw_native_fmt) {
+-                            *hw_pix_fmt = hw_native_fmt;
+-                            if (hw_check_codec(c, hw_type, disabled_codecs))
+-                                return c;
++                if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
++                        for (int i = 0; i < num_pix_fmts; i++) {
++                            if (pix_fmts[i] == hw_native_fmt) {
++                                *hw_pix_fmt = hw_native_fmt;
++                                if (hw_check_codec(c, hw_type, disabled_codecs))
++                                    return c;
++                            }
+                         }
+                     }
+-                }
+             }
+ #else
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index d5b950392c94..fc4479e07c5f 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -2627,37 +2627,36 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+     c->time_base.den = frame_rate;
+     c->time_base.num = frame_rate_base;
+     /* adjust time base for supported framerates */
+-    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
+-    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
+-    // with its entry count, so use it when available.
+ #if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
+-    const AVRational *supported_framerates = NULL;
+-    int num_supported_framerates = 0;
+-    if (codec)
+-        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
+-                                     (const void **)&supported_framerates, &num_supported_framerates);
+-    if (supported_framerates && num_supported_framerates > 0){
+-        AVRational req = {frame_rate, frame_rate_base};
+-        const AVRational *best=NULL;
+-        AVRational best_error= {INT_MAX, 1};
+-        for(int i = 0; i < num_supported_framerates; i++){
+-            const AVRational *p = &supported_framerates[i];
+-            AVRational error= av_sub_q(req, *p);
+-            if(error.num <0) error.num *= -1;
+-            if(av_cmp_q(error, best_error) < 0){
+-                best_error= error;
+-                best= p;
++    if (codec){
++        const AVRational *supported_framerates = NULL;
++        int num_supported_framerates = 0;
++        int ret = avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
++                                               (const void **)&supported_framerates, &num_supported_framerates);
++
++        if (ret >= 0 && supported_framerates && num_supported_framerates > 0){
++            AVRational req = {frame_rate, frame_rate_base};
++            const AVRational *best=NULL;
++            AVRational best_error= {INT_MAX, 1};
++            for(int i = 0; i < num_supported_framerates; i++){
++                const AVRational *p = &supported_framerates[i];
++                AVRational error = av_sub_q(req, *p);
++                if(error.num <0) error.num *= -1;
++                if(av_cmp_q(error, best_error) < 0){
++                    best_error = error;
++                    best = p;
++                }
+             }
+-        }
+-        if (best == NULL)
+-        {
++            if (best == NULL)
++            {
+ #ifdef CV_FFMPEG_CODECPAR
+-            avcodec_free_context(&c);
++                avcodec_free_context(&c);
+ #endif
+-            return NULL;
++                return NULL;
++            }
++            c->time_base.den = best->num;
++            c->time_base.num = best->den;
+         }
+-        c->time_base.den= best->num;
+-        c->time_base.num= best->den;
+     }
+ #else
+     if(codec && codec->supported_framerates){
diff --git a/meta-oe/recipes-support/opencv/opencv_4.14.0.bb b/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
index 1926ee8e26..286b490870 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
+           file://29533.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 SRC_URI:append:aarch64 = " git://gitlab.arm.com/kleidi/kleidicv;branch=main;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/3rdparty/kleidicv;name=kleidicv;protocol=https"

