Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FBFC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24400.1786747629317360930
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nwYMiN03;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dcbade417so1619645a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747629; x=1787352429; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zxtgEpnlAcTt4JXfMkYcZPSHJpgTjrJzFdcH8sdNuPI=;
        b=nwYMiN03VFpYAmc1PxHsRDTa9NH1Jp5NKtK0AbRXNJxHlkVPmEIp1WmZebxMFxaI6T
         2MdzxWpp89KSAlwo5BMOqvMg5KHqoCLXc4NF5v/sMuUPQ8kG0ogstmIH9Sk444P6GA2o
         +KkSOvSQESUiwONT8OQrf0uyV4eQcMBTMeLLdj9vkLOWNfCo9eCk/0oEJib9HmRgvtaP
         vY2kPsOFlr+8umNPxi3ahZ5/P6ZwSRcAed4SN9k3nSlPKAbhr0dYn6lCrPH70EJgnYFw
         OSrVbXuxKRTR+5gcnN2Q15+geIpQG+q7n5uJvJFT0Ie1a7mXV89SSlUyaBmYMun4LSAz
         5tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747629; x=1787352429;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zxtgEpnlAcTt4JXfMkYcZPSHJpgTjrJzFdcH8sdNuPI=;
        b=Lxklgqh0l1YB18imvDEYfhqjKvm2tr5WSzLV0U8aH1mGWRcP+3Fx+LQP5sMrV18ujP
         w4z3Int3PqgW77GaN+9wWKmOvjl9IqbxYSkyuNRm1SXndHEgGgihhhq2tRmEyyirobq0
         CkQ0POqgJmxai2zzS3rG0shTJpEwKbtSFJEE0o9/2DCuB4K9+SflSncc/cZ7xgPoxjx3
         AEiQsYZ1JuNGO6iGuFUurF24SEI2s+a9ugkXH9tjXl+E38v1bCjvOk+SajQYyryBvO68
         rLHYW5gKIlCVQv7mxbu7IQ4RNWDIerNvRXvKaYa9L1rB5XtOOpdasnLGEVy/pYxwQaN3
         xYig==
X-Gm-Message-State: AOJu0Yw0wrolXb4KsHJhF3Kczj8dZmNyuK07QMzgWDrYQA6SucBx/zI7
	TA5vvwNLVRPBKVa7QLZdtbzQOQwqOUBZzsAWm+XgUaLbSwJKn54Jul+rX4fjH07U
X-Gm-Gg: AR+sD10nbfBgz5pKqYObDyqnH+zUb9iQyRcn6UVuPPpzQt3BxDrxDsjtAshaBnXBVlc
	n7L0uqht1GKI4b4ibvoovmUp6b5nX9GL3mmZirWIhLBnXot62QtRtiqJY9mI5J+LYuXFN2iyoeD
	779u5+VsbhDZan5WT8YKCli4uQLzJm2HKssHqvN2iW8lxrOLU7Ba9mlk3rk2kYvabaxezPtoscg
	K4F7T/EeUih64IthUBZaG7Ld0SCwOi/LOZZI0RUOW3Jg7SdNl+eF79Sx/K8ddZK4jhAFF9U1SBu
	alWisr7adjqiX4snwUF3sFG0sn++tuE1mrfZJ1jPg4Dijkrllui+6c+MtIFeIUE+3mvh3GTQP5N
	06BItQGkkcvDBNgsCNnIaJH18U25w9x/NEKEnNqT6jvaDj4E39+mOXJPT54XLxDi3EQdXSWW9XM
	b7+qtqIJ5jKb+Zv0wW3Xp3YGyvRXppbxP2pYDnL6Ztya3QPEZKiKTPBMNXCkClHpeN++ZgyeslU
	kBHYY1WVNn8A51qCc11AIsyh0kwp+75upWB2zaqIfdDPSnRshIekmyNEKHrrrsxBU/k/ZyZXLAt
	YaYnKnIb/eqHaBCDEfOuTtRCrdamfkOkvi5uyY7aAvOGrnTLBoAg1qxmCBV7ZESwFCeN9Nn3pfu
	JlQqWNcG3M0TBcvd+LpkGft9MBFGUZ0LsAd8PD48Vj9s0ig==
X-Received: by 2002:a17:90b:1806:b0:38d:ec31:4840 with SMTP id 98e67ed59e1d1-3933b907356mr9134568a91.13.1786747628567;
        Fri, 14 Aug 2026 15:47:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 076/109] libjxl: upgrade 0.11.2 -> 0.12.0
Date: Fri, 14 Aug 2026 15:45:02 -0700
Message-ID: <20260814224539.1523174-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129140

Point release. Dropped 0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch:
its actual fix (the CMAKE_SYSTEM_PROCESSOR MATCHES "riscv" guard around
-mrelax-all) is already present upstream in 0.12.0's CMakeLists.txt; only the
CONTRIBUTORS name-credit hunk was left, not worth carrying as a patch on its own.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...use-mrelax-all-with-clang-on-RISCV64.patch | 56 -------------------
 .../{libjxl_0.11.2.bb => libjxl_0.12.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.11.2.bb => libjxl_0.12.0.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch b/meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch
deleted file mode 100644
index 287dfc8ca8..0000000000
--- a/meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0cf439c243dfdb6eee6133ee87172235a42e59c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Sep 2024 22:04:06 +0000
-Subject: [PATCH] cmake: Do not use -mrelax-all with clang on RISCV64
-
-This option causes clang 19+ to crash on riscv64
-
-For RISC-V -mrelax-all causes the assembler stage to convert
-all conditional branches into
-
-  bcc reg, reg, tmplabel
-  jmp target
-tmplabel:
-
-Unconditional jmp can reach targets a lot further than a conditional branch.
-Unfortunately, jmp also has a limited range so sometimes needs to be
-converted to an indirect jump which requires a scratch register.
-We do all branch relaxation early for RISC-V during the compilation
-stage so we can allocate the scratch register.
-
-If the assembler also does branch relaxation it will increase the size
-of the function and may cause unconditional jmps to go out of range.
-If this happens, linking will fail.
-
-Upstream-Status: Submitted [https://github.com/libjxl/libjxl/pull/3826]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- CONTRIBUTORS   | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8b2ccb57..39bee096 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -335,7 +335,7 @@ else ()
- 
-   # Machine flags.
-   add_compile_options(-funwind-tables)
--  if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
-+  if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND NOT CMAKE_SYSTEM_PROCESSOR MATCHES "riscv")
-     add_compile_options("SHELL:-Xclang -mrelax-all")
-   endif()
-   if (CXX_CONSTRUCTOR_ALIASES_SUPPORTED)
-diff --git a/CONTRIBUTORS b/CONTRIBUTORS
-index 848096f9..a88c6157 100644
---- a/CONTRIBUTORS
-+++ b/CONTRIBUTORS
-@@ -10,6 +10,7 @@ Iulia-Maria Comșa
- Jan Wassenberg
- Jon Sneyers
- Jyrki Alakuijala
-+Khem Raj
- Krzysztof Potempa
- Lode Vandevenne
- Luca Versari
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
index f73fd314c2..7422282e4c 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
@@ -9,10 +9,9 @@ inherit cmake pkgconfig mime
 DEPENDS = "highway brotli"
 
 SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1;tag=v${PV} \
-           file://0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch \
            "
 
-SRCREV = "332feb17d17311c748445f7ee75c4fb55cc38530"
+SRCREV = "a7a9c787341cf703dede03c2009fa460cae5e5df"
 
 EXTRA_OECMAKE = " \
 	-DCMAKE_BUILD_TYPE=Release \

