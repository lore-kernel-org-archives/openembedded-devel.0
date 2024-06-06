Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56783C27C75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.9752.1717664825806308397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r2HBvOHg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664825; x=1749200825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/CiqDbI7o1lkieQaorKwPl2veMo7BOqwZ8O0UJm6vZ0=;
  b=r2HBvOHgYSMltuMPp8iX9EKHo7t42waI0Vc4qQLbdNGtwu2X9CU1DYfw
   Zo/IfJ0IqHfgbGEdHXf0vfg417OpmzDDJoQDyLheLSob4XofOgkyUyIBb
   OG0thlBcInaeXAUJnyKi3zmR7wILK9I4lBrajnz2JuFktbILXdrzhNmds
   Iua2jy2xyDUIe9OmwcwAick+VGH4875fAjQk+ju3oJUKr/chWchfz9lqv
   JFs38RgT/BkpJwpEcuWukNHLdn1v4c8bK5Ra+52NPLAkTmQhZlvjhf1i8
   5FaQbdV6YdI8r5PhbhuQ7UDt0ZFp1BW3QbatACn+DrmqaiU7Q1X1x+9A0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="149566627"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="149566627"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:03 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D2B0E4289
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DEBD24E19
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EB35401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C06BE1A000A;
	Thu,  6 Jun 2024 17:06:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/36] libsodium: upgrade 1.0.19 -> 1.0.20
Date: Thu,  6 Jun 2024 17:06:23 +0800
Message-Id: <1717664795-13902-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--4.969000-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yXg2y0j5vXZGK2GKtdiFmTl4YeSlHZYFogyf
	XeYFOVFH0JBo+IVTgnESuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDSRL0vz8XgoTgS
	z1Xqg4sgi+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9PioIsi7Sa0gDqRAxBy0WU1HSe
	kfNMkhVHcV6mUFXq5mBzEnsRYJlw5ZT98H9cWYnL/HywF9D+dA31asM/gsp2lQnnYsWF8zq85vi
	ifI31LdMXjCh5n+l0elEtDJyVR88h8TzIzimOwPFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOQx1b
	KyuQ7X4U2ANkSsqYZvPjXti+jHOx4vYZFgklpSQEekoRdQGd1SesDMo7LLIkicWDkoB59ky+zog
	1TldlWVf2bKN+FyFqgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110732

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch
removed since it's included in 1.0.20

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-target-pragma-after-arm_neon.h-incl.patch | 49 -------------------
 .../libsodium/libsodium_1.0.19.bb             | 14 ------
 .../libsodium/libsodium_1.0.20.bb             | 12 +++++
 3 files changed, 12 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch
 delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch b/meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch
deleted file mode 100644
index 7a6fae799..000000000
--- a/meta-oe/recipes-crypto/libsodium/libsodium/0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d3253310f7c0fc0f1aad6864e3b57958ea1bb9c5 Mon Sep 17 00:00:00 2001
-From: tux3 <barrdetwix@gmail.com>
-Date: Mon, 16 Oct 2023 16:42:04 +0200
-Subject: [PATCH] fix(aarch64): Move target #pragma after arm_neon.h include
-
-Fix per https://github.com/android/ndk/issues/1945
-
-If the pragma is done before the header include,
-in NDK 26 the attribute may apply to the functions in arm_neon.h
-
-Upstream-Status: Backport [https://github.com/jedisct1/libsodium/pull/1321]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c   | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c b/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-index 0a5a128..aa76f5c 100644
---- a/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-+++ b/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-@@ -19,12 +19,6 @@
- #define __vectorcall
- #endif
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -34,6 +28,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define ABYTES    crypto_aead_aes256gcm_ABYTES
- #define NPUBBYTES crypto_aead_aes256gcm_NPUBBYTES
- #define KEYBYTES  crypto_aead_aes256gcm_KEYBYTES
--- 
-2.42.1
-
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
deleted file mode 100644
index 2e678f3f0..000000000
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "The Sodium crypto library"
-HOMEPAGE = "http://libsodium.org/"
-BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=49ce3b426e6a002e23a1387248e6dbe9"
-
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz \
-           file://0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch"
-SRC_URI[sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
-
-inherit autotools
-
-S = "${WORKDIR}/libsodium-stable"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
new file mode 100644
index 000000000..63d21576b
--- /dev/null
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
@@ -0,0 +1,12 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c59be7bb29f8e431b5f2d690b6734185"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


