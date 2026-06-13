Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E13ACD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:32:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87020.1781335918007952717
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lrwUI5mY;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b613a17bso14400375e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781335916; x=1781940716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXAJ6nTnN95hL8nCChd3JZASB/qikaWg1W84sbNGYJE=;
        b=lrwUI5mYwYzfbOyM+oCmhSHqA+wpDUcoAAll/VTDsKvN8ao/V6/QZybyHvaoIuBzqz
         gmSiEpY5yiTL+CvSRswsntyHbJovZPK24Ez9ULWF4X9PiSH1h3u9tobe2ohzDLZ0BADX
         gugo9XftA1Dp+It5RJIyqbyk0pzWg+/bmaPEDN0w02TEpcZTHR1ojekMowQtybF1Ut2T
         01r/i8SqJD5fsb+iMdlnt13Dp6vI6Fv1DAPhynPWT7Dz6jV5fawKLXDSQMa/yxp4CWr5
         tgwnTzsIHvbN7K60YFBHsIZJbYb46bXroXM0ZwNo+fu1U38MQLhxF7x9M6lKey2dkiAf
         FyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781335916; x=1781940716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXAJ6nTnN95hL8nCChd3JZASB/qikaWg1W84sbNGYJE=;
        b=ZcXYkrUD+nSQi2nBW7aD/MYcxQ+4f6aJfPQekUt8RNNqk7tEZJLRnV4nanVPqK9qjT
         T5Acl8G7jvk7J0n0LWEk/4Y3X3IkiEM2wraVVPJ6mI35s+8OrvRz6WjXXIVuJ09zNX3z
         EZnpDrevRT0zstaKkkJ8QitCwubs/jV+O0JtVFxMHjzMtUlN6ylU07teOau/3GLnRt6C
         Pr7AtxHEvl+fs/KtRwKVx6ald9e3FmutMttIZp17OpBHXvlth3ftq60d5cLzvVBwCJRI
         luvpsDu1/hH72tXEONmFU1eK1HcqxtgM+d9Utycpyl/rkgjSB8byk2JXpYvJ76S2RBdF
         3I5Q==
X-Gm-Message-State: AOJu0Yzmabs86nCOqwwVVj22UZ1sd9YtW79QWAIiZepCNqUfhIaO479l
	Jm9+n3mOout6kN4rRGeIBNdHvutBZ9U759d0jmfY77fy/QEqmCgqAeHwDmAMEA==
X-Gm-Gg: Acq92OHVcIBp9Co/cKtT4T9ulSwEf+n77KvxXEUzIhkiPInB1hjiSItXUOEMFcQFLoO
	N91WhZeDK+8soA+G/I6EP6ijhtQoQdkG7tHf4Q+CKJlkiDe7pL4mp/rqTr6lX4/0iH7Yq+qXC/x
	69naPqSWOhXMyAhJ0Gu1qv2FDzBhaz/M1bLx+Nfy2G1JKE7043iPcyyb7Q06ak+E3wEs5XEVFi9
	WyWe7T6ywpzz9ToZTNdwyPWfbJ9FbcCdtpgrbLS6vuIoQir5WAa/cTrhvpwI6aWG6q41lRqjNHQ
	3mC7QauXU1bfinD1RNOokTOs21srI0asiRkgSFxYNIJxFL16HsM+QEodnYB07e3j0gtFA4LVsmK
	cMd3Bvb/G0HiyHMJcTpYiqfcVdsUG9UjTl1Bss0lTYeZKu5rg+LwerpRHuA9EIJxaCnsz6HR8gh
	BjFM1Sh1Amprovv9LepTd8LCBq64MEcCWiIsPkRIvV6JaHLkD7Qo3fjb5u2jbh4hYGEBq2iJPul
	rGJllaOH80=
X-Received: by 2002:a05:600c:8b09:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-490ec4d9298mr70165685e9.11.1781335916045;
        Sat, 13 Jun 2026 00:31:56 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm50911785e9.8.2026.06.13.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:31:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] android-libboringssl: Fix build on glibc >= 2.41
Date: Sat, 13 Jun 2026 08:30:27 +0100
Message-ID: <20260613073026.529355-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 07:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127551

Backport fix to avoid redefining constants introduced in glibc 2.41.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...g-constants-introduced-in-glibc-2.41.patch | 172 ++++++++++++++++++
 .../android-libboringssl_14.0.0+r45.bb        |  12 +-
 2 files changed, 178 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-Avoid-redefining-constants-introduced-in-glibc-2.41.patch

diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-Avoid-redefining-constants-introduced-in-glibc-2.41.patch b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-Avoid-redefining-constants-introduced-in-glibc-2.41.patch
new file mode 100644
index 000000000000..f4133572ca37
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-Avoid-redefining-constants-introduced-in-glibc-2.41.patch
@@ -0,0 +1,172 @@
+From 950b8565e333e2ed1a515e2b342009a33ef51733 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sergio=20G=C3=B3mez?=
+ <sergio.gdr@collabora.corp-partner.google.com>
+Date: Tue, 15 Apr 2025 17:57:46 -0500
+Subject: [PATCH] Avoid redefining constants introduced in glibc 2.41.
+
+These constants are now available through <sys/auxv.h> when using
+glibc >= 2.41, so we get re-define compilation errors.
+Just rename them by prefixing them with "CRYPTO_" to avoid the
+collision.
+
+Change-Id: I61807d8dfc8b5f482ec6191cb41aebfa5676c5b6
+Reviewed-on: https://boringssl-review.googlesource.com/c/boringssl/+/78527
+Commit-Queue: David Benjamin <davidben@google.com>
+Reviewed-by: David Benjamin <davidben@google.com>
+Reviewed-by: Adam Langley <agl@google.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Backport [https://github.com/google/boringssl/commit/ff9475331e72936bc1c00fcda6d4820ba67d4dae]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/crypto/cpu_arm_linux.c       | 33 +++++++++++++++++++++++++++-----
+ src/crypto/cpu_arm_linux.h       | 20 ++++++++++---------
+ src/crypto/cpu_arm_linux_test.cc | 12 +++++++-----
+ 3 files changed, 46 insertions(+), 19 deletions(-)
+
+diff --git a/src/crypto/cpu_arm_linux.c b/src/crypto/cpu_arm_linux.c
+index d13ac215c4df..7c7cd9dd93f4 100644
+--- a/src/crypto/cpu_arm_linux.c
++++ b/src/crypto/cpu_arm_linux.c
+@@ -112,7 +112,11 @@ void OPENSSL_cpuid_setup(void) {
+ 
+   // Matching OpenSSL, only report other features if NEON is present.
+   unsigned long hwcap = getauxval(AT_HWCAP);
+-  if (hwcap & HWCAP_NEON) {
++  if (hwcap & CRYPTO_HWCAP_NEON) {
++#if defined(HWCAP_ARM_NEON)
++      static_assert(HWCAP_ARM_NEON == CRYPTO_HWCAP_NEON,
++                    "CRYPTO_HWCAP values must match Linux");
++#endif
+     OPENSSL_armcap_P |= ARMV7_NEON;
+ 
+     // Some ARMv8 Android devices don't expose AT_HWCAP2. Fall back to
+@@ -126,16 +130,35 @@ void OPENSSL_cpuid_setup(void) {
+       g_needs_hwcap2_workaround = hwcap2 != 0;
+     }
+ 
+-    if (hwcap2 & HWCAP2_AES) {
++    // HWCAP2_* values, without the "CRYPTO_" prefix, are exposed through
++    // <sys/auxv.h> in some versions of glibc(>= 2.41). Assert that we don't
++    // diverge from those values.
++    if (hwcap2 & CRYPTO_HWCAP2_AES) {
++#if defined(HWCAP2_AES)
++      static_assert(HWCAP2_AES == CRYPTO_HWCAP2_AES,
++                    "CRYPTO_HWCAP2 values must match Linux");
++#endif
+       OPENSSL_armcap_P |= ARMV8_AES;
+     }
+-    if (hwcap2 & HWCAP2_PMULL) {
++    if (hwcap2 & CRYPTO_HWCAP2_PMULL) {
++#if defined(HWCAP2_PMULL)
++      static_assert(HWCAP2_PMULL == CRYPTO_HWCAP2_PMULL,
++                    "CRYPTO_HWCAP2 values must match Linux");
++#endif
+       OPENSSL_armcap_P |= ARMV8_PMULL;
+     }
+-    if (hwcap2 & HWCAP2_SHA1) {
++    if (hwcap2 & CRYPTO_HWCAP2_SHA1) {
++#if defined(HWCAP2_SHA1)
++      static_assert(HWCAP2_SHA1 == CRYPTO_HWCAP2_SHA1,
++                    "CRYPTO_HWCAP2 values must match Linux");
++#endif
+       OPENSSL_armcap_P |= ARMV8_SHA1;
+     }
+-    if (hwcap2 & HWCAP2_SHA2) {
++    if (hwcap2 & CRYPTO_HWCAP2_SHA2) {
++#if defined(HWCAP2_SHA2)
++      static_assert(HWCAP2_SHA2 == CRYPTO_HWCAP2_SHA2,
++                    "CRYPTO_HWCAP2 values must match Linux");
++#endif
+       OPENSSL_armcap_P |= ARMV8_SHA256;
+     }
+   }
+diff --git a/src/crypto/cpu_arm_linux.h b/src/crypto/cpu_arm_linux.h
+index 895099787439..4b0ecfc77b49 100644
+--- a/src/crypto/cpu_arm_linux.h
++++ b/src/crypto/cpu_arm_linux.h
+@@ -29,14 +29,16 @@ extern "C" {
+ // The cpuinfo parser lives in a header file so it may be accessible from
+ // cross-platform fuzzers without adding code to those platforms normally.
+ 
+-#define HWCAP_NEON (1 << 12)
++#define CRYPTO_HWCAP_NEON (1 << 12)
+ 
+ // See /usr/include/asm/hwcap.h on an ARM installation for the source of
+ // these values.
+-#define HWCAP2_AES (1 << 0)
+-#define HWCAP2_PMULL (1 << 1)
+-#define HWCAP2_SHA1 (1 << 2)
+-#define HWCAP2_SHA2 (1 << 3)
++// We add the prefix "CRYPTO_" to the definitions so as not to collide with
++// some versions of glibc (>= 2.41) that expose them through <sys/auxv.h>.
++#define CRYPTO_HWCAP2_AES (1 << 0)
++#define CRYPTO_HWCAP2_PMULL (1 << 1)
++#define CRYPTO_HWCAP2_SHA1 (1 << 2)
++#define CRYPTO_HWCAP2_SHA2 (1 << 3)
+ 
+ typedef struct {
+   const char *data;
+@@ -141,16 +143,16 @@ static unsigned long crypto_get_arm_hwcap2_from_cpuinfo(
+ 
+   unsigned long ret = 0;
+   if (has_list_item(&features, "aes")) {
+-    ret |= HWCAP2_AES;
++    ret |= CRYPTO_HWCAP2_AES;
+   }
+   if (has_list_item(&features, "pmull")) {
+-    ret |= HWCAP2_PMULL;
++    ret |= CRYPTO_HWCAP2_PMULL;
+   }
+   if (has_list_item(&features, "sha1")) {
+-    ret |= HWCAP2_SHA1;
++    ret |= CRYPTO_HWCAP2_SHA1;
+   }
+   if (has_list_item(&features, "sha2")) {
+-    ret |= HWCAP2_SHA2;
++    ret |= CRYPTO_HWCAP2_SHA2;
+   }
+   return ret;
+ }
+diff --git a/src/crypto/cpu_arm_linux_test.cc b/src/crypto/cpu_arm_linux_test.cc
+index 0b6b02fbe4d1..cd626a90512e 100644
+--- a/src/crypto/cpu_arm_linux_test.cc
++++ b/src/crypto/cpu_arm_linux_test.cc
+@@ -93,7 +93,8 @@ TEST(ARMLinuxTest, CPUInfo) {
+           // (Extra processors omitted.)
+           "\n"
+           "Hardware        : Qualcomm Technologies, Inc MSM8998\n",
+-          HWCAP2_AES | HWCAP2_PMULL | HWCAP2_SHA1 | HWCAP2_SHA2,
++          CRYPTO_HWCAP2_AES | CRYPTO_HWCAP2_PMULL | CRYPTO_HWCAP2_SHA1 |
++              CRYPTO_HWCAP2_SHA2,
+       },
+       // Garbage should be tolerated.
+       {
+@@ -105,23 +106,24 @@ TEST(ARMLinuxTest, CPUInfo) {
+       {
+           "Features        : aes pmull sha1 sha2\n"
+           "CPU architecture: 8\n",
+-          HWCAP2_AES | HWCAP2_PMULL | HWCAP2_SHA1 | HWCAP2_SHA2,
++          CRYPTO_HWCAP2_AES | CRYPTO_HWCAP2_PMULL | CRYPTO_HWCAP2_SHA1 |
++              CRYPTO_HWCAP2_SHA2,
+       },
+       // Various combinations of ARMv8 flags.
+       {
+           "Features        : aes sha1 sha2\n"
+           "CPU architecture: 8\n",
+-          HWCAP2_AES | HWCAP2_SHA1 | HWCAP2_SHA2,
++          CRYPTO_HWCAP2_AES | CRYPTO_HWCAP2_SHA1 | CRYPTO_HWCAP2_SHA2,
+       },
+       {
+           "Features        : pmull sha2\n"
+           "CPU architecture: 8\n",
+-          HWCAP2_PMULL | HWCAP2_SHA2,
++          CRYPTO_HWCAP2_PMULL | CRYPTO_HWCAP2_SHA2,
+       },
+       {
+           "Features        : aes aes   aes not_aes aes aes \n"
+           "CPU architecture: 8\n",
+-          HWCAP2_AES,
++          CRYPTO_HWCAP2_AES,
+       },
+       {
+           "Features        : \n"
diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
index fccf6e0dff8b..ebf125c73549 100644
--- a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
@@ -8,12 +8,12 @@ SECTION = "libs"
 LICENSE = "OpenSSL & ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ca501bc96ce9ed0814e2c592c3f9593"
 
-SRC_URI = " \
-    https://deb.debian.org/debian/pool/main/a/android-platform-external-boringssl/android-platform-external-boringssl_${PV}.orig.tar.xz \
-    file://boringssl-go-stub \
-    file://boringssl-gtest-stub.cc \
-    file://0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch \
-"
+SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-external-boringssl/android-platform-external-boringssl_${PV}.orig.tar.xz \
+           file://boringssl-go-stub \
+           file://boringssl-gtest-stub.cc \
+           file://0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch \
+           file://0001-Avoid-redefining-constants-introduced-in-glibc-2.41.patch;patchdir=.. \
+           "
 SRC_URI[md5sum] = "83d24d2f3136ba6a486b5464369b91b4"
 SRC_URI[sha256sum] = "f9223e8c15ad5d9e3f1cd50861f4c272658864661e2332bea5d60952aa0930cd"
 

