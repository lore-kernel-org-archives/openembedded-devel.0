Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C95C4345F
	for <webhook@archiver.kernel.org>; Sat,  4 May 2024 20:14:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5569.1714853637256257125
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 May 2024 13:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ern3TN/2;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41bab13ca81so7545455e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 May 2024 13:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714853635; x=1715458435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRLL/vba/4MjX4n9W7taBH7Il36h5Xon52SLPD9PJBU=;
        b=ern3TN/2UcWxeuLCE8y1tALH2MaaEorjnc+gdiYMzsMOshPNoRipSnXt/MFtZPo9ls
         sOO1qRQdvab/iWnMHI2yTwPVNmSupHYDKLat1odC6h12h8EV7B8+4yDp4341U/ONpLWL
         oKpva0M/h2Y9jiPfniEnQzoonlrOhRO+hD839fb+Fzo2tLUsnijDmhy41Cw1dsiC9/cD
         LBKs4aDWlv0E1kXh0ivaL9IXv4uQinUU8NpdnE0ZN7m0v0ENueCEXUWbh9unp9Q/SgmY
         VpyFTkTqM+a5QtO1+iwL5vx6UB6kBxy5/U+NXm9Q3Fk033QQF2MN3nwTxxtaPxSOkIdS
         EDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714853635; x=1715458435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRLL/vba/4MjX4n9W7taBH7Il36h5Xon52SLPD9PJBU=;
        b=KE/rbOHx0tXJuVEaBBVZ6O/1KvQTKWd4YTsIk84IJt2LfgjI/HzYYGWaPFiEfJCUmV
         8hKIIEL5RIhC1/yV9En0e0sfesqk8902PQuWeiMrdbRoR0fFiF2kGdoiGuJUlkTHNGqW
         8iPNqcJYG3r5eZRKCm65U0tDyywNF3sTHJNUb5FYnO3nV07+/rMd+BhTEnzChntU/9pn
         maqy7vkBR0CQSr/BvoNuWDcPZiuFEqHWEM3dLTaJXIj5TIe9n1ejRKsW25SyCmClIsFG
         5NeSAllTvYy4ePzO24yrtovlVOHXStuZdA6Y4kTVpOSXp/M426B4NAxK3LzygVBFZn2G
         SupA==
X-Gm-Message-State: AOJu0YzgVIMYm/TtocNwyrTQg/YJ5xkIpQ8lOOSux9h/AoLAyhAbxUDS
	9E6+Hertx+sFTljPMGQX/Rhote/CiihJwdzNha72wfe7tP7BaUZnEvZK5g==
X-Google-Smtp-Source: AGHT+IHNDhCrsyAopS99F+tav7O2kZLoU/pwTCXw1brkXfGnAnWZ6uLLxdHyab36LTCGiVj+rSGPCA==
X-Received: by 2002:a05:600c:cc6:b0:41a:e5f5:99f8 with SMTP id fk6-20020a05600c0cc600b0041ae5f599f8mr6236224wmb.18.1714853635298;
        Sat, 04 May 2024 13:13:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c445200b0041bf21a62bcsm14039994wmn.1.2024.05.04.13.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 13:13:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libdeflate: fix build with -mcpu=cortex-a76+crypto without -march=armv8.2-a+crypto
Date: Sat,  4 May 2024 22:13:49 +0200
Message-ID: <20240504201349.549926-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 May 2024 20:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110253

* fixes:
  https://github.com/ebiggers/libdeflate/issues/369

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
2.45.0


