Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E88C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 13:17:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.13891.1716988631912397935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 06:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NhDTh8mE;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35507a3a038so1288992f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988630; x=1717593430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xkj+JIwMNGctjbifiz7Ty/NxZRGh4FacouGvdVS+mBg=;
        b=NhDTh8mE1nBr30gth3y0RLYrKekgaWmHrA+/gLo6dOQX05/PB1Bh8O2uVYXYPEhxJN
         w5XBbDVLdV8yLXh88g3jIkb3xAIpVwdlrPD4pwTpJ64vLUpAbewbDCvkfPlO5EKSFNc+
         jKuOhuSBEMaP98pqfZ097VkcKreLUFhg3TRw85rBLrV1TD6ZMiynsXehM5KdFOVt25d7
         WZYQ1F+8g+kpLpt9EUvBpaoeGe9vy3K5ZrJW2jQmz6v5lpWBzEo7J68SIG1/bJUHfGtt
         l2BlicBLosjTgIzebwiboGxb/25bifPIhqnRQ1CKjUFV9EEWkVG7vj9BUKk87Xa/rYeM
         eUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988630; x=1717593430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xkj+JIwMNGctjbifiz7Ty/NxZRGh4FacouGvdVS+mBg=;
        b=o6dQFT4yxM2u+VZZWac/uIihjKcCXGF8AK0UWtTAFsih+CA6O/QaWXMDq8koBLzJ1Y
         b9+mDf2duKnVpo0vFLHJjtYpG3TCAz1tektVr16i6DxN5s+i0ayjQ83f/iFjZKEWlZjR
         2EmHhz38E1TBMpBQhzKoNPfEljaV1X+W/eHvN58zRQ3shInqLmaVr2lmXWeCaBK5vxoO
         mX9cnLauzzbaxUd4N3rsdwOIQbMEdyNLqFYQSjIOdflaizdJBoLvj+td4a/h06HVR7RM
         uBZ+HiCCdNGh4V81cYBlMhCpxQCtVrPG4eTrJ3F65l5qtQm/tlZOgbP6VRYK19j9thQ8
         FRzw==
X-Gm-Message-State: AOJu0YzKDX/sJcvML+ambXOh47JMwfBYZ8tmPieU5hYY9QozG3bSfbiy
	ZqyYdSqIajmp6OzEVp7m1mINylXV+EASD7/uYNYnZHPtyKng0ZX/rowIyQ==
X-Google-Smtp-Source: AGHT+IHPJ70p8tBqj5HyuV3BPTtJ9gc6z7zuO2JvkuI4eeTcNigOYe8sMQcbftMltwMES854pzLO1w==
X-Received: by 2002:a5d:6342:0:b0:354:c329:90d1 with SMTP id ffacd0b85a97d-3552fdefa90mr12627479f8f.63.1716988630009;
        Wed, 29 May 2024 06:17:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08abd8sm14761039f8f.32.2024.05.29.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:17:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [scarthgap][PATCH] libdeflate: fix build with -mcpu=cortex-a76+crypto without -march=armv8.2-a+crypto
Date: Wed, 29 May 2024 15:16:55 +0200
Message-ID: <20240529131655.3187405-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 13:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110614

* fixes:
  https://github.com/ebiggers/libdeflate/issues/369

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-explicit-armv8.2-a-on-gcc-13.2-and.patch | 57 +++++++++++++++++++
 .../libdeflate/libdeflate_1.20.bb             |  5 +-
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch b/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
new file mode 100644
index 0000000000..e87972af27
--- /dev/null
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
@@ -0,0 +1,57 @@
+From 684ebc7f8eb44558219d4b5be52add1250b3c0ca Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers@google.com>
+Date: Tue, 30 Apr 2024 11:27:55 -0700
+Subject: [PATCH] lib/arm: don't use explicit armv8.2-a on gcc 13.2 and later
+
+Resolves https://github.com/ebiggers/libdeflate/issues/369
+---
+Upstream-Status: Backport [https://github.com/ebiggers/libdeflate/pull/370]
+
+ lib/arm/adler32_impl.h | 10 ++++++----
+ lib/arm/crc32_impl.h   | 10 ++++++----
+ 2 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/lib/arm/adler32_impl.h b/lib/arm/adler32_impl.h
+index 6453b8e..6144afb 100644
+--- a/lib/arm/adler32_impl.h
++++ b/lib/arm/adler32_impl.h
+@@ -214,11 +214,13 @@ adler32_arm_neon(u32 adler, const u8 *p, size_t len)
+ #  ifdef __clang__
+ #    define ATTRIBUTES	_target_attribute("dotprod")
+    /*
+-    * With gcc, arch=armv8.2-a is needed for dotprod intrinsics, unless the
+-    * default target is armv8.3-a or later in which case it must be omitted.
+-    * armv8.3-a or later can be detected by checking for __ARM_FEATURE_JCVT.
++    * With gcc 13.1 and earlier (before gcc commit 73d3bc348190 or 9aac37ab8a7b,
++    * "aarch64: Remove architecture dependencies from intrinsics"),
++    * arch=armv8.2-a is needed for the dotprod intrinsics, unless the default
++    * target is armv8.3-a or later in which case it must be omitted.  armv8.3-a
++    * or later can be detected by checking for __ARM_FEATURE_JCVT.
+     */
+-#  elif defined(__ARM_FEATURE_JCVT)
++#  elif GCC_PREREQ(13, 2) || defined(__ARM_FEATURE_JCVT)
+ #    define ATTRIBUTES	_target_attribute("+dotprod")
+ #  else
+ #    define ATTRIBUTES	_target_attribute("arch=armv8.2-a+dotprod")
+diff --git a/lib/arm/crc32_impl.h b/lib/arm/crc32_impl.h
+index 3c4bec7..5363041 100644
+--- a/lib/arm/crc32_impl.h
++++ b/lib/arm/crc32_impl.h
+@@ -551,11 +551,13 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
+ #  ifdef __clang__
+ #    define ATTRIBUTES	_target_attribute("aes,crc,sha3")
+    /*
+-    * With gcc, arch=armv8.2-a is needed for the sha3 intrinsics, unless the
+-    * default target is armv8.3-a or later in which case it must be omitted.
+-    * armv8.3-a or later can be detected by checking for __ARM_FEATURE_JCVT.
++    * With gcc 13.1 and earlier (before gcc commit 73d3bc348190 or 9aac37ab8a7b,
++    * "aarch64: Remove architecture dependencies from intrinsics"),
++    * arch=armv8.2-a is needed for the sha3 intrinsics, unless the default
++    * target is armv8.3-a or later in which case it must be omitted.  armv8.3-a
++    * or later can be detected by checking for __ARM_FEATURE_JCVT.
+     */
+-#  elif defined(__ARM_FEATURE_JCVT)
++#  elif GCC_PREREQ(13, 2) || defined(__ARM_FEATURE_JCVT)
+ #    define ATTRIBUTES	_target_attribute("+crypto,+crc,+sha3")
+ #  else
+ #    define ATTRIBUTES	_target_attribute("arch=armv8.2-a+crypto+crc+sha3")
diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
index f0a966f2b4..e3de8aca62 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7b6977026437092191e9da699ed9f780"
 
 DEPENDS += "gzip zlib"
 
-SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master \
+    file://0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch \
+"
 
 S = "${WORKDIR}/git"
 SRCREV = "275aa5141db6eda3587214e0f1d3a134768f557d"
 
 inherit cmake pkgconfig
-
-- 
2.45.1


