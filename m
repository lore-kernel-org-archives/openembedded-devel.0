Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBECCFC6176
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 22:19:10 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.104652.1726352346877034461
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 15:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+5xwwuh;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso2967928a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 15:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726352346; x=1726957146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y05Ih/fIAG+eDVBRMkyT3O3cbNSzBFOFmxIp36z4GNE=;
        b=A+5xwwuhDFGpvK/RafILZFxXEPm2UHWgHNIWiyCrze2C9hNmwvAFLlTd1Tj9MSnTPB
         eUZOF17OCyJXenqN03xU6nwtnDRySDs0HAlp/nUCE6G7eDAy2pK33eWeHCTrS7Fdlpcr
         dA6Ms3ExONZz3AJBeFWnxK/bmnqF2/0LQJLJ+ax3dVfoqw9CYzrvc/aZiLzt5EVPXwxi
         C9ROR5Sbl3Ebh+5ufsT9XLaQYrGDQ+yM5kjRfPn2z4gsVo66vwclTo+DzLsvRy94e6xt
         5o/OqyTWaqk3YIW/52tvWc72rqvgOZLzVxUsXNehmwl4zg7iKPOejPlSslOzfTPC7p/a
         GNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726352346; x=1726957146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y05Ih/fIAG+eDVBRMkyT3O3cbNSzBFOFmxIp36z4GNE=;
        b=S2Z2Y4fUEx7ZTO2UPKFkQ+IotpWP2qkVbaNEgSCLOSS5zbBbudTLT3b97J0ms/pMkk
         p/pOL2MKglgoNHnNBCGeRrXrAwfMY40YLDZRoFaFU1LifGkx0EyOMfE+pFmdm8GrNCr9
         xuhYdHza2NqENc+z9Famya3bob4iGRsTv+y5c5PIBJTIaqsmioLmBp1Lh/hHJ88u01Iw
         NuSkY2boqZ3LCZrCXLqMIYhbZLLIlV4pOlSYVzsajpehmxvrZ/ex3oPHVgMuy+A8BMpD
         mx+UWnwynOds+btnQQG2HbAWgR5R0iLsrP5pcZmlgLvYUmGJg2WlaW6gmlDHMBsot3HB
         wFqw==
X-Gm-Message-State: AOJu0Yy4IGCVEoPfTseEPJMUmNgNKZHoch5F6EvEruTG+degCZrCRTFc
	aTXh1xtNnJuD1++dTlvvZdr7p4VTTOP0MlREYXZYpG68xKsk0vOGou6S+OLD
X-Google-Smtp-Source: AGHT+IFZLk8apl1dv5UWLHGGNcb1qP5RO5Zm1HefGBARqcunKEV9/YGiBRp5Dofu9WReMKih6Ji+aQ==
X-Received: by 2002:a05:6a21:458a:b0:1cf:4c48:5c07 with SMTP id adf61e73a8af0-1cf75f5a6c1mr18185382637.23.1726352345920;
        Sat, 14 Sep 2024 15:19:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944adfa72sm1439007b3a.93.2024.09.14.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 15:19:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libjxl: Do not use -mrelax-all on RISCV with clang
Date: Sat, 14 Sep 2024 15:18:54 -0700
Message-ID: <20240914221903.156933-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 22:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112292

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...use-mrelax-all-with-clang-on-RISCV64.patch | 56 +++++++++++++++++++
 .../libjxl/libjxl_0.10.3.bb                   |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch b/meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch
new file mode 100644
index 0000000000..287dfc8ca8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl/0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch
@@ -0,0 +1,56 @@
+From 0cf439c243dfdb6eee6133ee87172235a42e59c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Sep 2024 22:04:06 +0000
+Subject: [PATCH] cmake: Do not use -mrelax-all with clang on RISCV64
+
+This option causes clang 19+ to crash on riscv64
+
+For RISC-V -mrelax-all causes the assembler stage to convert
+all conditional branches into
+
+  bcc reg, reg, tmplabel
+  jmp target
+tmplabel:
+
+Unconditional jmp can reach targets a lot further than a conditional branch.
+Unfortunately, jmp also has a limited range so sometimes needs to be
+converted to an indirect jump which requires a scratch register.
+We do all branch relaxation early for RISC-V during the compilation
+stage so we can allocate the scratch register.
+
+If the assembler also does branch relaxation it will increase the size
+of the function and may cause unconditional jmps to go out of range.
+If this happens, linking will fail.
+
+Upstream-Status: Submitted [https://github.com/libjxl/libjxl/pull/3826]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ CONTRIBUTORS   | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8b2ccb57..39bee096 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -335,7 +335,7 @@ else ()
+ 
+   # Machine flags.
+   add_compile_options(-funwind-tables)
+-  if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
++  if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND NOT CMAKE_SYSTEM_PROCESSOR MATCHES "riscv")
+     add_compile_options("SHELL:-Xclang -mrelax-all")
+   endif()
+   if (CXX_CONSTRUCTOR_ALIASES_SUPPORTED)
+diff --git a/CONTRIBUTORS b/CONTRIBUTORS
+index 848096f9..a88c6157 100644
+--- a/CONTRIBUTORS
++++ b/CONTRIBUTORS
+@@ -10,6 +10,7 @@ Iulia-Maria Comșa
+ Jan Wassenberg
+ Jon Sneyers
+ Jyrki Alakuijala
++Khem Raj
+ Krzysztof Potempa
+ Lode Vandevenne
+ Luca Versari
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
index 3b694e0497..6e6e5edfd7 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
@@ -8,7 +8,9 @@ inherit cmake pkgconfig mime
 
 DEPENDS = "highway brotli"
 
-SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
+           file://0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch \
+           "
 
 SRCREV = "4a3b22d2600f92d8706fb72d85d52bfee2acbd54"
 S = "${WORKDIR}/git"

