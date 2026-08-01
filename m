Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F79C55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13593.1785620734068620038
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eyVxOmbI;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1146514a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620733; x=1786225533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyXZNUSzJDgcDljbbW3p7QZb5PWQ8PmK8mTK9Rj8pVU=;
        b=eyVxOmbICt2grsoYGwFCjqPiZ0Sn+vlw2btODbNKbOIIL5a/EGhSxC6oiMklzsv1G5
         sYBn/S4fmj5G7DNX2/7UhLOA3WNR2S3ehwpFcfQSZ4LMhqIetDzWaQeU++OdhZgahACi
         XLvaCbWDpp6wy4Uahxyjf5Q31TBWoQDIcOkoGTD95Xzv6GRqikdszf0MNCfRXgyTFzQU
         IT7gQ4tzRV77YvqIK9A+PjVasyD1B45y3yZMYI4wuEBWCdO65IwHsQsuM7lAwS7bWt4H
         QXp+eVKcz+CQfiE58KHWDzvifF48hUSP+0A5F6Ys24OtkYQaXG6VKojnIiuFub14Y4ZJ
         yfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620733; x=1786225533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyXZNUSzJDgcDljbbW3p7QZb5PWQ8PmK8mTK9Rj8pVU=;
        b=tM+J1M3xMGnkRzpDUtSseFlXvmQVFyG8tpXhcv24QLXyPxC2afyHqrrc9y9Y144e7O
         3gVfHMbukffLFxzlxYXwEUUenFvytVroL0DzFFZulZirBy97jYt57kSwVrUDcK4mjWJu
         AeQ2mSEnGyU6CRbKCDFphX6MoWHwYziQFKQExWjFGiyE+clPat/S3rt/STpM0g13NFWz
         yKfK453YaQYFsltpzJM5kJTIjJw48k7EKZUOGgokzrLZLCa/P5KSU03WbZI9uNnpEJw7
         NZt2GWHkvnjyMIyRaF0s0SRd/+gXhZXmW9ypWT/yX3GhO7IRwqYLh0F1YjhjGzawWKVu
         fzzw==
X-Gm-Message-State: AOJu0YxujVziEojjCOAGFGfXK1FpYbdFh6KbvuTzDqnVe0SAJCZtKXQr
	zFHo/Imaaeqatigu/Cnk5wMsO1NCpLbFjXR9AhlWtXqZ2JQqa+UKrLfD+hHf+qZB
X-Gm-Gg: AR+sD13S82apl3EFXRw7Eem/PycInn5ZHL0F1SWBTIiyzXdTS92YOEvhSXueZXU1l/3
	Sjbz9HXigiFR9PYe8+ghBxL2PQs3KJYtjYxZjiMnee9qEXubTlOgW9Vnl+YA9OBE28EQu9ZhhXr
	dc4tLcUDAHkETEGQ9wQhYSm9T4f3tTZJ9QCcQOi87tjn8LHlEC1qjv7vjc5IiYA3XuUSsyr1vAi
	+dMxbXxjSCPIIRdOK6ijWzx7HPDEktgjxblOCUmx9Q6S61sy8P3wrHVHjUg/ng+3DJUrYVx0ZWu
	c9WRtDiLPZLJ9YW3voI03qQLG32FbMhRe0zyw4cHpdKOg3qJpaOSdVXPLTSM4yirDOusuN0k19Q
	/q5P1Iniim35b7pHqV6JgUkT5qD+Y4OLYZE6Zkv/uS0MbCjBz5tGPF/QDEsphr5JTuH6LcPRscz
	HTxhyHa0wAUcUQqGxZeNLXRjxcxIP6drqdrv2B6pEh5BKmMeHrXAuX+61j/KwtHHlZQspSbv7VP
	Cq7xS0I0QW8J6/ZB9BnCn4gfqy5o8MatGM/+bf+uX2/HUoEtAV07uGkVdlWf2Rb+d7t1z6ennCc
	GfKH1aK/+vzVCkWP5bez1ttQVyVMlMbBngEuWvciKxtUBPUuUpAbVLagTaGlhw1zZ70eu+LXpsd
	JnQ==
X-Received: by 2002:a05:6a21:60c8:b0:3bf:c126:baf2 with SMTP id adf61e73a8af0-3c92a89f491mr4872474637.47.1785620733280;
        Sat, 01 Aug 2026 14:45:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 05/31] aom: upgrade 3.13.1 -> 3.14.1
Date: Sat,  1 Aug 2026 14:45:00 -0700
Message-ID: <20260801214526.788343-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128622

Upstream changes (CHANGELOG):
 * 3.14.0: significant compression-efficiency and perceptual-quality
   improvements for layered image encoding; AOM_TUNE_IQ and
   AOM_TUNE_SSIMULACRA2 now work with inter-frame (good-quality and
   realtime) modes; Variance Boost (deltaq-mode 6) extended. New
   experimental controls AV1E_SET_EXTERNAL_RATE_CONTROL and
   AV1E_GET_GOP_INFO. The in-tree "build" directory was removed and
   build/cmake moved up one level to cmake/; AOMYV12/AOMI420 img fmts
   deprecated. ABI compatible.
 * 3.14.1: bug fixes - NULL deref in validate_img() with 10-bit
   monochrome input; enlarge cx_data buffer to 2.5x uncompressed frame
   size (oss-fuzz). ABI compatible.

Drop both local patches, now upstream in 3.14.1:
 * 0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch -
   3.14.1's subpel_variance_neon.c includes subpel_variance_neon.h which
   declares the previously-implicit prototypes.
 * 0001-cmake-fix-nasm-detection-w-3.0.patch - the "-hO" nasm-3.0
   detection fix is present in cmake/aom_optimization.cmake (the cmake
   dir also moved out of build/ this cycle).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-cmake-fix-nasm-detection-w-3.0.patch |  40 -------
 ...neon-Provide-prototypes-for-missing-.patch | 109 ------------------
 .../aom/{aom_3.13.1.bb => aom_3.14.1.bb}      |   7 +-
 3 files changed, 2 insertions(+), 154 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.13.1.bb => aom_3.14.1.bb} (81%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch b/meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
deleted file mode 100644
index 105e4d9d70..0000000000
--- a/meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 83c37c8bc1f4cd7e604c34df7888c425a8cb6b26 Mon Sep 17 00:00:00 2001
-From: James Zern <jzern@google.com>
-Date: Tue, 7 Oct 2025 14:08:44 -0700
-Subject: [PATCH] cmake: fix nasm detection w/3.0
-
-nasm 3.0 separated Oflags (-Ox) output to `-hO` which is used to
-validate the nasm binary. This change is compatible with older versions
-(tested with NASM version 2.16.03 & 2.13.02).
-
-Upstream-Status: Backport [https://aomedia-review.googlesource.com/c/aom/+/203481]
-Bug: aomedia:448994065
-Fixed: aomedia:448994065
-Change-Id: I704dcfe39ac6e68bc4d5b9e409fb59a0d277170e
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- build/cmake/aom_optimization.cmake | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/build/cmake/aom_optimization.cmake b/build/cmake/aom_optimization.cmake
-index 9cc34de..2750a0b 100644
---- a/build/cmake/aom_optimization.cmake
-+++ b/build/cmake/aom_optimization.cmake
-@@ -212,7 +212,7 @@ endfunction()
- # Currently checks only for presence of required object formats and support for
- # the -Ox argument (multipass optimization).
- function(test_nasm)
--  execute_process(COMMAND ${CMAKE_ASM_NASM_COMPILER} -hf
-+  execute_process(COMMAND ${CMAKE_ASM_NASM_COMPILER} -hO
-                   OUTPUT_VARIABLE nasm_helptext)
- 
-   if(NOT "${nasm_helptext}" MATCHES "-Ox")
-@@ -220,6 +220,8 @@ function(test_nasm)
-       FATAL_ERROR "Unsupported nasm: multipass optimization not supported.")
-   endif()
- 
-+  execute_process(COMMAND ${CMAKE_ASM_NASM_COMPILER} -hf
-+                  OUTPUT_VARIABLE nasm_helptext)
-   if("${AOM_TARGET_CPU}" STREQUAL "x86")
-     if("${AOM_TARGET_SYSTEM}" STREQUAL "Darwin")
-       if(NOT "${nasm_helptext}" MATCHES "macho32")
diff --git a/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch b/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
deleted file mode 100644
index 8a8350ec57..0000000000
--- a/meta-multimedia/recipes-multimedia/aom/aom/0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 35c1ed84a158354c37e329bad0e236b156836ac7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 May 2023 14:59:26 -0700
-Subject: [PATCH] subpel_variance_neon: Provide prototypes for missing
- functions
-
-Fixes build with clang-15
-aom_dsp/arm/subpel_variance_neon.c:121:10: error: call to undeclared function 'aom_variance8x8_neon'; ISO C99 and later do not support implicit function dec
-larations [-Wimplicit-function-declaration]
-|   return aom_variance8x8_neon(temp2, 8, dst, dst_stride, sse);
-|          ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- aom_dsp/arm/subpel_variance_neon.c | 76 ++++++++++++++++++++++++++++++
- 1 file changed, 76 insertions(+)
-
-diff --git a/aom_dsp/arm/subpel_variance_neon.c b/aom_dsp/arm/subpel_variance_neon.c
-index a05886066c4..ea6bada224d 100644
---- a/aom_dsp/arm/subpel_variance_neon.c
-+++ b/aom_dsp/arm/subpel_variance_neon.c
-@@ -20,6 +20,82 @@
- #include "aom_dsp/variance.h"
- #include "aom_dsp/arm/mem_neon.h"
- 
-+extern unsigned int aom_variance8x8_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance16x16_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance16x32_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance16x64_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance32x8_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance32x16_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance32x32_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance32x64_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance32x128_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance64x8_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance64x16_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance64x32_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance64x64_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance64x128_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance128x8_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance128x16_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance128x32_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance128x64_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
-+extern unsigned int aom_variance128x128_neon(const uint8_t *a, int a_stride,
-+                                         const uint8_t *b, int b_stride,
-+                                         unsigned int *sse);
-+
- static void var_filter_block2d_bil_w4(const uint8_t *src_ptr, uint8_t *dst_ptr,
-                                       int src_stride, int pixel_step,
-                                       int dst_height, int filter_offset) {
--- 
-2.40.1
-
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.14.1.bb
similarity index 81%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.14.1.bb
index e4875d2ced..49792cfc25 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.14.1.bb
@@ -5,11 +5,8 @@ LICENSE = "BSD-2-Clause AND LicenseRef-AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-SRCREV = "d772e334cc724105040382a977ebb10dfd393293"
-SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV} \
-           file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch \
-		   file://0001-cmake-fix-nasm-detection-w-3.0.patch \
-		  "
+SRCREV = "03087864cf4bea6abb0d28f95cf7843511413d8f"
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV}"
 inherit cmake pkgconfig
 
 DEPENDS = " nasm-native"

