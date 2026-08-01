Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1BDC55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5266.1785589942648469631
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=shSmR+d1;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84847482584so1243026b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589942; x=1786194742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qy5VFciKUZPSSpT7P/GnG1JxyFXVTycQDr4krkJhLrc=;
        b=shSmR+d1xV0jc2AFjV5Lku9/847xgaDF5Sfjya7m7mNGuoWLz/JUnnTSw8xKY8TF+p
         THHnB7rjItv+bFChVox2WpEOeQIXBMKytIBMFrwX9dzNAT7Fd5gwO8jKZl3JASApaneG
         G8pVCVrmj9HUaLjyV570F0rq3qBrDsyHSeBfcF0ar+WVpSRJ8itczgK0k+i05jtN0vN0
         ZtevOBxL3aIXxvL4PeRlRCq5ObCnGf8J3hMLxWwfllW8otbq5y+3tBqExJNewiZ8W5NI
         UIXBLlO+APB9DKgTsSykL2wzliUkje4XfsnWWv+zMKAdhaDH1x58BGjqtJfI6hbV5nWF
         wLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589942; x=1786194742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy5VFciKUZPSSpT7P/GnG1JxyFXVTycQDr4krkJhLrc=;
        b=huWnJjYAL8/NQlAF/5xyP0vEtY2YXW9uGyAnN/pn6MozF3YzNqKJbG2KGM0sK7UYNW
         024jCyaVLoaDmFVumOG2MD23jNurEwHzQj3eQng9Spxq5+b5p1oXYRbj+NL9sYmXPEg6
         G8OV2DQjEQdyPCd46zeJMcN+poWXQDdKL3fY6TzlZ8agbzBHcUGI5SC359HOo2vdKydm
         VSXZsAKaxmno7q5xyxxtVXttxEjClmPodkQBSy4NpGGVOABWmCThjWj3siPgTywgLfOs
         mnkcBYRRd9hZPIl/hII3eWdI7tcDiN2ngU2C9qQ4fAU4RUz+waNdAIu40n5ISxeFATwo
         oYFQ==
X-Gm-Message-State: AOJu0YwwxnLDTOl2DOeMfK0zvWxo8P0HPysOsPO33xI0HDpLN02CA5VP
	VyjaQNtV6PncU/+BofGpT+Q+3IbFWbj25kA+faxPZxDj+AmXWWfZ5J9VwoZs1+uB
X-Gm-Gg: AR+sD13dvVT4Z6Eizd92sv1ILzKVsClnTtttCCEr0WstxuV5x0ag5NhAcUAVLhJ7Wgn
	T7Z4j1fUl/GT7SdLGzyK528ROEQvitcnGyxBdOJCT+u1sH0sbRPOkPd6jNu4KySeCsWQEsiMw/r
	U1KHoD6mEe/PVYtg/0oASjjlEDuvJwdNC+DHFEIh96QvQAIQIGYCsTWidjoBJU6YLuuIsU1jtxp
	ToZ6XGY9JW/bEjqY9uUt9pfo8ZnEy5BZIoK54jKsGMPp6WaBZh9jqr6HvaFEVgADRMrSSm+FygO
	hclGst0pr7r7GQDej5OHFbdNhQvXDravcxLL/UDbAGPYrVByEJzCPdYhsLG+zHp8j2u7s8fVhU0
	iRI8xSw5ODCa5Fe3nol4lxorfzyD733oYa6lGGc5zcT8LrPbUTdRco2OXSg3RYnR3FD2B3JGFS5
	cVm0sWjWzwuhUxHZqFipoUDFp6czgm2pn51AG2ABxq/QEBP4wZrfeOsUlf9p9xQ1UEg1/v7H8yw
	A==
X-Received: by 2002:a05:6a00:428d:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84ee4862564mr2661630b3a.14.1785589941972;
        Sat, 01 Aug 2026 06:12:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 13/20] aom: upgrade 3.13.1 -> 3.13.3
Date: Sun,  2 Aug 2026 01:11:31 +1200
Message-ID: <20260801131138.3299410-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128607

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.

https://aomedia.googlesource.com/aom/+/refs/tags/v3.13.3/CHANGELOG

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-cmake-fix-nasm-detection-w-3.0.patch | 40 -------------------
 .../aom/{aom_3.13.1.bb => aom_3.13.3.bb}      |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/aom/aom/0001-cmake-fix-nasm-detection-w-3.0.patch
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.13.1.bb => aom_3.13.3.bb} (90%)

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
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.13.3.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.13.3.bb
index e4875d2ced..77193cc18c 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.13.3.bb
@@ -5,11 +5,10 @@ LICENSE = "BSD-2-Clause AND LicenseRef-AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-SRCREV = "d772e334cc724105040382a977ebb10dfd393293"
+SRCREV = "92d4c37fbdd08944a0e721bbaeb13318f10aebb0"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV} \
            file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch \
-		   file://0001-cmake-fix-nasm-detection-w-3.0.patch \
-		  "
+           "
 inherit cmake pkgconfig
 
 DEPENDS = " nasm-native"

