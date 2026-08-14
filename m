Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584A4C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24497.1786747577256851379
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a7dq3Pbk;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1390620a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747577; x=1787352377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAjrRRO06uZmLopK9KG1jEB7Kxt9jFMu4hrGd9dSfLw=;
        b=a7dq3PbkKgLRXWOs7PrFwk/Mr2QDsRm+SGUboPAthDyMKRVCw23ecILSzPucNBpgqL
         JJIKMLa+Z8n09JMUUuwpcpXtzkJa20468xsepD/BZkDhSGwEwc6B/aMh00ETw6ixqhx9
         aGlGuJgMWw4T52uvG6HjDsK+ra7tY7EMrq5iU+Hf+wjpuED4MMwrqhksOLymvVxwDXGQ
         sXc6Kd2fYEHhlzisGYJ/9YDVrPoyTOlERiFtkQnkscx+Ck041rLYgu1NCI87ALudvZt2
         QO8ulFeylbCuTT/2+tTl9Q7gkwAmbH3S5nyiROIRJscMWAm8YwoD/W67BVI7pVljDIYY
         ZZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747577; x=1787352377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAjrRRO06uZmLopK9KG1jEB7Kxt9jFMu4hrGd9dSfLw=;
        b=ckfRAAgJn8sSJABIVxcy7NMjKGstXrupJxRv+kwRb8IBYnjjj39umuuIcN1GHwZ60A
         owupvn9PY7BvgFV2MSrpGtVQplK3YMfBhYIhIweALx0bc6DtZODopIOwhJmt9voyItHb
         uxEzce900W4QIdaaX58sFNbWfLRp9DPYdZgm46CabjP/+lJMUzOxzvLDhhWg57e9gq1r
         yPaUetvbiyOnEa5wXSCFp2Tcflpn0PGrzaJ3cH9O5WvsrXmiDzCo1H1m4Aiq/x07xSb4
         vKPr2JfxEPtRUhXLYTSgI7f5Z5GvwsFRYIY/EmH/+vY5JiJRL9PipNtVh7RZO9MqHW6Y
         nsfg==
X-Gm-Message-State: AOJu0Yz+o09lUeBhQzKMDGqxusiNvBkL4Zqxjcns6Uba5+v3tnuUEh5q
	nkTameh8Hhekf0FxBsLM6WnqwyfIP55gx1rDwa9gkvk/vXCAM7jrpDi1TlMcYBoQ
X-Gm-Gg: AR+sD108IWihRjxXRgk9oaN3dJRGGyAu1zCk2FX48Di1uyAeOi0YAtEi+yaB4EGRwO9
	/2hUpT+/SDwExSXkmoFMqVXC2IrEBMg6VI5KEpa/HZinV/hjvq4qDkX+91KM/yEC6XwJnnhkQoT
	MmoRHfF45tiq/FdV4EZ9ntXDdlpPo/GqmpJYrJEQtHSzpuQf2gRsQ56ZQNtm2tvmCtJ4ymQPXJ9
	qHoY2rrjxsV1UGJm8bC44FM1zAc7/gVpryPW/iIY0/hLiicyHR/VNCjVMpSbYk7ecllvR7Vaz3i
	yhH568azWQDDrtBZhpOj+RxGCRY6k7LQon9xTwYa3VupHoUYSU9k2waXjPF0bKbIPojWoX7aN0x
	06t0hnDU2a02Dmltm4vLmboaeLniCahLDyrGaNQuDsESGZVJPu3uWA9ObW6VOmF4o5kpbUXDZRi
	vbJUbWMS5NIObOZhU/YBMNpXm5XV3yq2kJkfTj8rCleRW+5k85Yvzneti1R+ZyeNYVig5dUvpHP
	4YajY/35gtQEvahiqztmG4XIgJLPZug/TE2dC8V19KCEElNsDxaPubptL9tiVLICFF/jcM4PVNl
	QJfJRUG+5tCOMrrFHgITxmGJGnjetvctSMNLDtfr1fsqIeTeTgnniMLRKaROmhIUKRqat2f2SdU
	uPErhGWd6XSl1385O1NwWQXs9Iw6MRm53/bPMY20RUq50DHXBdxTflGp2
X-Received: by 2002:a05:6a20:7290:b0:3cc:54a6:8a44 with SMTP id adf61e73a8af0-3cc71cd9e2amr10262293637.29.1786747576510;
        Fri, 14 Aug 2026 15:46:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 031/109] libdeflate: upgrade 1.20 -> 1.25
Date: Fri, 14 Aug 2026 15:44:17 -0700
Message-ID: <20260814224539.1523174-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129095

Minor release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-explicit-armv8.2-a-on-gcc-13.2-and.patch | 57 -------------------
 ...{libdeflate_1.20.bb => libdeflate_1.25.bb} |  8 +--
 2 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
 rename meta-oe/recipes-extended/libdeflate/{libdeflate_1.20.bb => libdeflate_1.25.bb} (56%)

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch b/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
deleted file mode 100644
index e87972af27..0000000000
--- a/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 684ebc7f8eb44558219d4b5be52add1250b3c0ca Mon Sep 17 00:00:00 2001
-From: Eric Biggers <ebiggers@google.com>
-Date: Tue, 30 Apr 2024 11:27:55 -0700
-Subject: [PATCH] lib/arm: don't use explicit armv8.2-a on gcc 13.2 and later
-
-Resolves https://github.com/ebiggers/libdeflate/issues/369
----
-Upstream-Status: Backport [https://github.com/ebiggers/libdeflate/pull/370]
-
- lib/arm/adler32_impl.h | 10 ++++++----
- lib/arm/crc32_impl.h   | 10 ++++++----
- 2 files changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/lib/arm/adler32_impl.h b/lib/arm/adler32_impl.h
-index 6453b8e..6144afb 100644
---- a/lib/arm/adler32_impl.h
-+++ b/lib/arm/adler32_impl.h
-@@ -214,11 +214,13 @@ adler32_arm_neon(u32 adler, const u8 *p, size_t len)
- #  ifdef __clang__
- #    define ATTRIBUTES	_target_attribute("dotprod")
-    /*
--    * With gcc, arch=armv8.2-a is needed for dotprod intrinsics, unless the
--    * default target is armv8.3-a or later in which case it must be omitted.
--    * armv8.3-a or later can be detected by checking for __ARM_FEATURE_JCVT.
-+    * With gcc 13.1 and earlier (before gcc commit 73d3bc348190 or 9aac37ab8a7b,
-+    * "aarch64: Remove architecture dependencies from intrinsics"),
-+    * arch=armv8.2-a is needed for the dotprod intrinsics, unless the default
-+    * target is armv8.3-a or later in which case it must be omitted.  armv8.3-a
-+    * or later can be detected by checking for __ARM_FEATURE_JCVT.
-     */
--#  elif defined(__ARM_FEATURE_JCVT)
-+#  elif GCC_PREREQ(13, 2) || defined(__ARM_FEATURE_JCVT)
- #    define ATTRIBUTES	_target_attribute("+dotprod")
- #  else
- #    define ATTRIBUTES	_target_attribute("arch=armv8.2-a+dotprod")
-diff --git a/lib/arm/crc32_impl.h b/lib/arm/crc32_impl.h
-index 3c4bec7..5363041 100644
---- a/lib/arm/crc32_impl.h
-+++ b/lib/arm/crc32_impl.h
-@@ -551,11 +551,13 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
- #  ifdef __clang__
- #    define ATTRIBUTES	_target_attribute("aes,crc,sha3")
-    /*
--    * With gcc, arch=armv8.2-a is needed for the sha3 intrinsics, unless the
--    * default target is armv8.3-a or later in which case it must be omitted.
--    * armv8.3-a or later can be detected by checking for __ARM_FEATURE_JCVT.
-+    * With gcc 13.1 and earlier (before gcc commit 73d3bc348190 or 9aac37ab8a7b,
-+    * "aarch64: Remove architecture dependencies from intrinsics"),
-+    * arch=armv8.2-a is needed for the sha3 intrinsics, unless the default
-+    * target is armv8.3-a or later in which case it must be omitted.  armv8.3-a
-+    * or later can be detected by checking for __ARM_FEATURE_JCVT.
-     */
--#  elif defined(__ARM_FEATURE_JCVT)
-+#  elif GCC_PREREQ(13, 2) || defined(__ARM_FEATURE_JCVT)
- #    define ATTRIBUTES	_target_attribute("+crypto,+crc,+sha3")
- #  else
- #    define ATTRIBUTES	_target_attribute("arch=armv8.2-a+crypto+crc+sha3")
diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.25.bb
similarity index 56%
rename from meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
rename to meta-oe/recipes-extended/libdeflate/libdeflate_1.25.bb
index 6683c396e2..f4b1eff83f 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.25.bb
@@ -2,14 +2,12 @@ SUMMARY = "libdeflate is a library for fast, whole-buffer DEFLATE-based compress
 HOMEPAGE = "https://github.com/ebiggers/libdeflate"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=7b6977026437092191e9da699ed9f780"
+LIC_FILES_CHKSUM = "file://COPYING;md5=89f8c510215440fe2f208fba4afe07e0"
 
 DEPENDS += "gzip zlib"
 
-SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master \
-    file://0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch \
-"
+SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
 
-SRCREV = "275aa5141db6eda3587214e0f1d3a134768f557d"
+SRCREV = "c8c56a20f8f621e6a966b716b31f1dedab6a41e3"
 
 inherit cmake pkgconfig

