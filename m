Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513B9C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 14:30:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.1258.1742567428794502707
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 07:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jA6yTmZe;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso3328364a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742567427; x=1743172227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xs2kReYfSS/1EDEkM/SWgOvBwCiSASAIoBTBzEqMNTU=;
        b=jA6yTmZelG/Gc3neplicWaMpI//yOyqPQ4h9IVAHi10XRxAYhYb5jTDF3W8W1MLxxW
         qAQItkgTqn18jJXEt/SJnMeWGIbs4VId0gpdNpwjMqQGP6mbIrS99UO2WHV5skirfxV9
         F7ZVOqgy1MFaWbhLzcBwQWAOMPJUVoT31+ty8yJrXtB36aa8w0g6OzcgkBAkLt2LsV46
         B1PqzxuNHRR8lKPgg1DXdTl3aQVLhSVj+k5xpiKdsbiYZmerYNEJ8+fSAizBlpJrm542
         4Tt86iRezojmY7VNQYMs2gaibIaVlvIw98Il/uNEzc2EsriEDpv3xItvI7Ysgv3I8xQa
         qbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567427; x=1743172227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs2kReYfSS/1EDEkM/SWgOvBwCiSASAIoBTBzEqMNTU=;
        b=jVnlt/AluQznFlSh2si4SCJQpvMRza1y4ZkPcMXifgSSPRMd2oy4zhfgm4yIx5KCVI
         BeIU0dgJKKa37yfMGH1SbqEfCoLp0ZPNIcOSDQCMkpTFw742MBQPDRa5qVBdhb0AeFqy
         6GcxVDzFeFfWJirASispEM4zMlhAvkxFshbw57LZ17tw37oziqyFrEzFXWAoFyg4FAVg
         yjRwu0PRd0LrrLUs1sidr9+iw/oJYZaueWgPcBaA4VZYlh21Mzo6vmPDhCLFnVU+PEI3
         metQXtrry9IOGC8D+p5pwaezdDtyM3K5h0N7hlRwFP3GURPNk46VCyyEe1L+vawRtUb5
         uG1Q==
X-Gm-Message-State: AOJu0Ywt3REz2qrZwHNEQuBE+WGLiRBUoo5RLQeVL9DpF/LRElih2s8V
	SLWO0ac3W8pt8rKhWf0PAwcYbedJYWnrefAZ3JgKEsyCAmZgoSIrbrGb0g==
X-Gm-Gg: ASbGnctmE/qT5b58hkY0G+PJqc7SGr6AUpsWwLi5sosTPmJi9sm3HxypY8nW44S+F7U
	iohoxbR7R4T4jLfwr3+FqerDOSvbEIpvlFcSXpg/EoB9Ay48X+nc/CZBjsO5a6A9e+X4FMQqMsf
	O6MS/kpBN8WRz0GYaD6xu8q/1MwqPdoZan4Q4L7pl0bF8+qsq165mFD+o3OpcL1Cz9x/JWVDWXC
	VlSoqRSpEpGzid5qvgouV7mHH+PKQ5HdMFOd7M8yj+bplKkCOwbIcT/316labFlNijxokmfOQTr
	fhJd1M2NQ9hho5nJU5EC1x6e+J/p6XE1uOPi7TtFbgyKv2Ow+poewNWO1nqKoVwOqJ99KYqODR1
	MAQ==
X-Google-Smtp-Source: AGHT+IFDFkRwNIhEnWn/0vFNh0frnXrvU3fGxPXr7q86l33OJz2RekkiiJ4WfwyjoFUtmpwNBPgSoA==
X-Received: by 2002:a05:6402:27d1:b0:5e4:d229:ad3d with SMTP id 4fb4d7f45d1cf-5ebcd45caf5mr3066270a12.16.1742567426984;
        Fri, 21 Mar 2025 07:30:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5ebcd0c74b9sm1426849a12.62.2025.03.21.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:30:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] googletest: fix build with gcc-15
Date: Fri, 21 Mar 2025 15:30:22 +0100
Message-ID: <20250321143022.2890415-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 14:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116187

From: Martin Jansa <martin.jansa@gmail.com>

* some recipes which use googletest fail with:
  gtest/src/gtest_main.cc:32: recipe-sysroot/usr/include/c++/15.0.1/ciso646:46:4: error: #warning "<ciso646> is deprecated in C++17, use <version> to detect implementation-specific macros" [-Werror=cpp]
   46 | #  warning "<ciso646> is deprecated in C++17, use <version> to detect implementation-specific macros"
      |    ^~~~~~~

  backport a fix for this.

* see https://github.com/google/googletest/issues/4701

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../googletest/googletest/gtest-ciso646.patch | 26 +++++++++++++++++++
 .../googletest/googletest_1.16.0.bb           |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch

diff --git a/meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch b/meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch
new file mode 100644
index 0000000000..814912650b
--- /dev/null
+++ b/meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch
@@ -0,0 +1,26 @@
+https://github.com/google/googletest/issues/4701
+
+taken from fedora:
+https://src.fedoraproject.org/rpms/gtest/c/b3fe6f803a1e554971f70e1c3f55aa5fcb377b1b?branch=rawhide
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+--- ./googletest/include/gtest/internal/gtest-port.h.orig	2025-01-27 03:39:18.963893931 +0000
++++ ./googletest/include/gtest/internal/gtest-port.h	2025-01-28 13:57:51.381081952 +0000
+@@ -288,11 +288,11 @@
+ 
+ // Detect C++ feature test macros as gracefully as possible.
+ // MSVC >= 19.15, Clang >= 3.4.1, and GCC >= 4.1.2 support feature test macros.
+-#if GTEST_INTERNAL_CPLUSPLUS_LANG >= 202002L && \
+-    (!defined(__has_include) || GTEST_INTERNAL_HAS_INCLUDE(<version>))
++#if GTEST_INTERNAL_HAS_INCLUDE(<version>) || \
++    (GTEST_INTERNAL_CPLUSPLUS_LANG >= 202002L && !defined(__has_include))
+ #include <version>  // C++20 and later
+-#elif (!defined(__has_include) || GTEST_INTERNAL_HAS_INCLUDE(<ciso646>))
+-#include <ciso646>  // Pre-C++20
++#else
++#include <cerrno>  // Pre-C++20
+ #endif
+ 
+ #include <ctype.h>   // for isspace, etc
diff --git a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
index cc2e8e3c94..fe2f732a5d 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
@@ -8,7 +8,9 @@ PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "6910c9d9165801d8827d628cb72eb7ea9dd538c5"
-SRC_URI = "git://github.com/google/googletest.git;branch=v1.16.x;protocol=https"
+SRC_URI = "git://github.com/google/googletest.git;branch=v1.16.x;protocol=https \
+    file://gtest-ciso646.patch \
+"
 
 inherit cmake pkgconfig
 

