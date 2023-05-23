Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FCCC7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 22:06:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.16378.1684879600214472136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 15:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RC1rFDKK;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ae3f6e5d70so1803275ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684879599; x=1687471599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJjIJRJMIZSn66IwcomAuFlsIaf8b4zM78uSqnyBu4A=;
        b=RC1rFDKKa/dKvLSvZzYQNNlSEWfBeYJQskD2o/2krLWZ4lo3e2QZXx4iArd98HhZ5L
         0rZkUf/+jeITtV6pLMsUxKN+A+KtkVFuV8dPn7ZVyFpZKsdcKW0Cd4ixtNMLLpAomQKH
         Ij2La++56o3YdQKdTBhw22NdE7zVDxo8yamDmqRYqJcyzLfKEUaBq0ylGg9PRTyX2vr5
         hxUrSpRqpgccgJj7XhzjAuiOa8z3OX1h65Qm+MRV4dRPu39QSptudfI/1uou+83T/vuM
         akliFily0fzS7Xyj3R8riaioOIvzHk/JMahrZTC4s22yHpadm+3XbPZLPNoVdYbtb0NU
         Vvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684879599; x=1687471599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJjIJRJMIZSn66IwcomAuFlsIaf8b4zM78uSqnyBu4A=;
        b=hGngAz5fVkWHYUHqZTCw0php14ZKGiSVCOtpOChlb6ivRoQA974QxJdF6mElrg4M3h
         NaSVyZOtSCp2pIDnhIUeLre9Fq1s3fyc2KKxpZ5R8/sruBfwqTxndvzj8OtN5g0TRXoi
         hgIixWU2w8LV9ITEWa1HeuIR3bned64rcUaxVw+YDL7yJY5cyjXpk5Kev5x0+4HS9Ad2
         7LxcjP8xFGLftNcDUTCkE9y8V/u9jvC6Rn1aaMSmfnIpRRz7xdslqQcgxUfkQmQdnkeE
         JDb1q2IXfVoxLR3eP7w9RJpEHGoT3Xw/vj8cP8A1RPUeR30IWhddR915evkGvtdcc/qq
         bknw==
X-Gm-Message-State: AC+VfDxFbhCNO0WJG6Thcxu+A3xKcxumsShTrB/azYgJVGrZ77VSW/Os
	muPrs6HE0QgYPpEwlq20M+Vrpp3fDNU=
X-Google-Smtp-Source: ACHHUZ4i2kMePk+5633M2v98l56TpjXQc/YT0lNvghIrYfYThfhLf/NcMjDffOq3Y80KvV266BdXYQ==
X-Received: by 2002:a17:902:f815:b0:1ac:aaf6:ee3a with SMTP id ix21-20020a170902f81500b001acaaf6ee3amr14003959plb.32.1684879599208;
        Tue, 23 May 2023 15:06:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d34c00b001aaea39043dsm7238191plk.41.2023.05.23.15.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 15:06:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v2 1/3] aom: Upgrade to 3.6.1
Date: Tue, 23 May 2023 15:06:35 -0700
Message-Id: <20230523220637.946337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 22:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102746

Switch to using nasm instead of yasm on x86 builds for asm
optimizations. This is to enable reproducible builds even though yasm is
preferred but it encodes FILE directive in ELF to absolute path of asm
files and results in buildpath warnings, there is no way to remove it
without editing the final binaries. nasm provides --reproducible option
to handle it nicely

License-Update: Fixes a typo [1]

[1] https://aomedia.googlesource.com/aom/+/f97c63026174df67bc08c75fa72bf0ad01ca1a98

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...neon-Provide-prototypes-for-missing-.patch | 83 ++++++++++++++++---
 .../aom/{aom_3.4.0.bb => aom_3.6.1.bb}        | 15 ++--
 2 files changed, 79 insertions(+), 19 deletions(-)
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.4.0.bb => aom_3.6.1.bb} (75%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch b/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
index 100507cdec..8a8350ec57 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
+++ b/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
@@ -1,6 +1,6 @@
-From c33e07f78982acfb0574a84fb523f8591e55c50e Mon Sep 17 00:00:00 2001
+From 35c1ed84a158354c37e329bad0e236b156836ac7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 11 Sep 2022 19:46:28 -0700
+Date: Tue, 23 May 2023 14:59:26 -0700
 Subject: [PATCH] subpel_variance_neon: Provide prototypes for missing
  functions
 
@@ -11,18 +11,19 @@ larations [-Wimplicit-function-declaration]
 |          ^
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- aom_dsp/arm/subpel_variance_neon.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
+ aom_dsp/arm/subpel_variance_neon.c | 76 ++++++++++++++++++++++++++++++
+ 1 file changed, 76 insertions(+)
 
 diff --git a/aom_dsp/arm/subpel_variance_neon.c b/aom_dsp/arm/subpel_variance_neon.c
-index 4ecf891cbeb..859168ea0c5 100644
+index a05886066c4..ea6bada224d 100644
 --- a/aom_dsp/arm/subpel_variance_neon.c
 +++ b/aom_dsp/arm/subpel_variance_neon.c
-@@ -20,6 +20,22 @@
- #include "aom_dsp/aom_filter.h"
+@@ -20,6 +20,82 @@
  #include "aom_dsp/variance.h"
+ #include "aom_dsp/arm/mem_neon.h"
  
 +extern unsigned int aom_variance8x8_neon(const uint8_t *a, int a_stride,
 +                                         const uint8_t *b, int b_stride,
@@ -32,17 +33,77 @@ index 4ecf891cbeb..859168ea0c5 100644
 +                                         const uint8_t *b, int b_stride,
 +                                         unsigned int *sse);
 +
++extern unsigned int aom_variance16x32_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance16x64_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance32x8_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance32x16_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
 +extern unsigned int aom_variance32x32_neon(const uint8_t *a, int a_stride,
 +                                         const uint8_t *b, int b_stride,
 +                                         unsigned int *sse);
 +
++extern unsigned int aom_variance32x64_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance32x128_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance64x8_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance64x16_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance64x32_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
 +extern unsigned int aom_variance64x64_neon(const uint8_t *a, int a_stride,
 +                                         const uint8_t *b, int b_stride,
 +                                         unsigned int *sse);
 +
- // Load 2 sets of 4 bytes when alignment is not guaranteed.
- static INLINE uint8x8_t load_unaligned_u8(const uint8_t *buf, int stride) {
-   uint32_t a;
++extern unsigned int aom_variance64x128_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance128x8_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance128x16_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance128x32_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance128x64_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
++extern unsigned int aom_variance128x128_neon(const uint8_t *a, int a_stride,
++                                         const uint8_t *b, int b_stride,
++                                         unsigned int *sse);
++
+ static void var_filter_block2d_bil_w4(const uint8_t *src_ptr, uint8_t *dst_ptr,
+                                       int src_stride, int pixel_step,
+                                       int dst_height, int filter_offset) {
 -- 
-2.37.3
+2.40.1
 
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
similarity index 75%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
index 9cd6f7a9e9..ff7f0d0902 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
@@ -3,23 +3,22 @@ DESCRIPTION = "Alliance for Open Media AV1 codec library"
 
 LICENSE = "BSD-2-Clause & AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
-                    file://PATENTS;md5=e69ad12202bd20da3c76a5d3648cfa83 \
+                    file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-
+SRCREV = "7ade96172b95adc91a5d85bf80c90989cd543ee8"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main \
-           file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch \
-          "
-
-SRCREV = "fd0c9275d36930a6eea6d3c35972e7cf9c512944"
+           file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch"
 
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
-DEPENDS = " yasm-native"
+
+DEPENDS = " nasm-native"
 
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
+                  -DAOM_AS_FLAGS=--reproducible \
                   -DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl \
                 "
-
+CMAKE_VERBOSE = "VERBOSE=1"
 CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
 EXTRA_OECMAKE:append:arm = " ${@bb.utils.contains("TUNE_FEATURES","neon","-DENABLE_NEON=ON","-DENABLE_NEON=OFF",d)}"
-- 
2.40.1


