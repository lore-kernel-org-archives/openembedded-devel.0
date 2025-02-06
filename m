Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F76C0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:07 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.50452.1738869599739066001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VIB37Kze;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202502061920025aaacbe412ebadf4af-h1yv_r@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202502061920025aaacbe412ebadf4af
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wXy9RhmCzba4bsgTXuT6mFeewiOu9HS6tsvYVrpbfbQ=;
 b=VIB37KzeOiJCmpctZHvU6uEM6qX/fWewBj9ZFgv0nnAv5+lX8tiReWzuolHTUfylgscCB0
 EOyjhe68pfLjeqq/6VulRHNJcIXgWZJhsqRYNW8NGTKbt2JHFG162DvHFdGo7YkRmCeSC2eG
 cA9Qk60feGemXMBhO+mZp74IHgMkMkCs20DlPHAA19qBhQZKp9xrHi3vdsSBA2MQpuSd/ULR
 xmrUxR6luJiUXfN8zvzSzjl63OzVTOe4pPNOHe62XD7mQpBKjk08SQMvxz3ixh/vx0dGj2iT
 y/lGWDqpk243jhOajrPmy5SvYIj8xh3S2QV2WvtsDhreoK4Xd0vMbe2Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 3/9] python3-grpcio: use openssl instead of bundled boringssl-with-bazel
Date: Thu,  6 Feb 2025 20:18:57 +0100
Message-Id: <20250206191903.2324783-3-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115295

From: Peter Marko <peter.marko@siemens.com>

grpc recipe already uses system openssl without problem.
This also allows to remove 2 patches to maintain and corrects license,
SPDX and CVE handling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ..._Generic-only-if-defined-__cplusplus.patch | 73 -------------------
 ....h-define-proper-macro-for-ppc-ppc64.patch | 34 ---------
 .../python/python3-grpcio_1.69.0.bb           | 17 +----
 3 files changed, 2 insertions(+), 122 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
deleted file mode 100644
index 790ccccc95..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From eee5daeb5b53b0c4a013aa5887a726434ec81600 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 6 May 2024 01:36:39 +0200
-Subject: [PATCH] crypto: use _Generic only if !defined(__cplusplus)
-
-* fixes build with gcc-14 which has __builtin_addc and __builtin_subc
-  with gcc-13 it was already using the #else branch because of missing builtins
-
-* fixes
-  https://github.com/grpc/grpc/issues/35945
-
-* _Generic was introduced in boringssl with:
-  https://boringssl.googlesource.com/boringssl/+/70ca6bc24be103dabd68e448cd3af29b929b771d%5E%21/#F4
-
-* but e.g. third_party/boringssl-with-bazel/src/ssl/d1_both.cc includes
-  this internal.h and from the .cc extension gcc will process it as C++
-  where _Generic isn't available, causing:
-
-In file included from third_party/boringssl-with-bazel/src/ssl/d1_both.cc:125:
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h: In function 'uint32_t CRYPTO_addc_u32(uint32_t, uint32_t, uint32_t, uint32_t*)':
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1159:7: error: expected primary-expression before 'unsigned'
- 1159 |       unsigned: __builtin_addc,                     \
-      |       ^~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
- 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
-      |          ^~~~~~~~~~~~~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1160:7: error: expected primary-expression before 'unsigned'
- 1160 |       unsigned long: __builtin_addcl,               \
-      |       ^~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
- 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
-      |          ^~~~~~~~~~~~~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1161:7: error: expected primary-expression before 'unsigned'
- 1161 |       unsigned long long: __builtin_addcll))((x), (y), (carry), (out_carry))
-      |       ^~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
- 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
-      |          ^~~~~~~~~~~~~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1158:4: error: '_Generic' was not declared in this scope
- 1158 |   (_Generic((x),                                    \
-      |    ^~~~~~~~
-third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
- 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
-      |          ^~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://boringssl-review.googlesource.com/c/boringssl/+/68227 crypto: use _Generic only if !defined(__cplusplus)]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- crypto/internal.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/crypto/internal.h b/crypto/internal.h
-index f93c2e5..2fca2fb 100644
---- a/crypto/internal.h
-+++ b/crypto/internal.h
-@@ -1206,7 +1206,7 @@ static inline uint64_t CRYPTO_rotr_u64(uint64_t value, int shift) {
- 
- // CRYPTO_addc_* returns |x + y + carry|, and sets |*out_carry| to the carry
- // bit. |carry| must be zero or one.
--#if OPENSSL_HAS_BUILTIN(__builtin_addc)
-+#if OPENSSL_HAS_BUILTIN(__builtin_addc) && !defined(__cplusplus)
- 
- #define CRYPTO_GENERIC_ADDC(x, y, carry, out_carry) \
-   (_Generic((x),                                    \
-@@ -1258,7 +1258,7 @@ static inline uint64_t CRYPTO_addc_u64(uint64_t x, uint64_t y, uint64_t carry,
- 
- // CRYPTO_subc_* returns |x - y - borrow|, and sets |*out_borrow| to the borrow
- // bit. |borrow| must be zero or one.
--#if OPENSSL_HAS_BUILTIN(__builtin_subc)
-+#if OPENSSL_HAS_BUILTIN(__builtin_subc) && !defined(__cplusplus)
- 
- #define CRYPTO_GENERIC_SUBC(x, y, borrow, out_borrow) \
-   (_Generic((x),                                      \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
deleted file mode 100644
index 39f9fafba7..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e2c78c555ab3d9509c4ade511e2f711eb7188626 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 15 May 2024 16:55:09 +0800
-Subject: [PATCH] target.h: define proper macro for ppc/ppc64
-
-Fix error:
-third_party/boringssl-with-bazel/src/include/openssl/target.h:74:2: error: #error "Unknown target CPU"
-third_party/boringssl-with-bazel/src/include/openssl/bn.h:172:2: error: #error "Must define either OPENSSL_32_BIT or OPENSSL_64_BIT"
-third_party/boringssl-with-bazel/src/include/openssl/bn.h:230:44: error: 'BN_ULONG' has not been declared
-
-BN_ULONG will be defined after set proper OPENSSL_32_BIT or OPENSSL_64_BIT
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- third_party/boringssl-with-bazel/src/include/openssl/target.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/third_party/boringssl-with-bazel/src/include/openssl/target.h b/third_party/boringssl-with-bazel/src/include/openssl/target.h
-index 2760f52..e743402 100644
---- a/third_party/boringssl-with-bazel/src/include/openssl/target.h
-+++ b/third_party/boringssl-with-bazel/src/include/openssl/target.h
-@@ -54,6 +54,10 @@
- #define OPENSSL_32_BIT
- #elif defined(__myriad2__)
- #define OPENSSL_32_BIT
-+#elif defined(__PPC64__)
-+#define OPENSSL_64_BIT
-+#elif defined(__PPC__)
-+#define OPENSSL_32_BIT
- #else
- // The list above enumerates the platforms that BoringSSL supports. For these
- // platforms we keep a reasonable bar of not breaking them: automated test
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index 0265fc0adc..32d4fbc22a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -4,14 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS += "python3-protobuf"
+DEPENDS += "openssl python3-protobuf"
 
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
-           file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
-           file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            "
 SRC_URI[sha256sum] = "936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5"
 
@@ -22,18 +20,7 @@ inherit pypi
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
-BORING_SSL_PLATFORM:arm = "linux-arm"
-BORING_SSL_PLATFORM:x86-64 = "linux-x86_64"
-BORING_SSL_PLATFORM:aarch64 = "linux-aarch64"
-BORING_SSL_PLATFORM ?= "unsupported"
-export GRPC_BORING_SSL_PLATFORM = "${BORING_SSL_PLATFORM}"
-export GRPC_BUILD_OVERRIDE_BORING_SSL_ASM_PLATFORM = "${BORING_SSL_PLATFORM}"
-
-BORING_SSL:arm = "1"
-BORING_SSL:x86-64 = "1"
-BORING_SSL:aarch64 = "1"
-BORING_SSL ?= "0"
-export GRPC_BUILD_WITH_BORING_SSL_ASM = "${BORING_SSL}"
+export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
 
 GRPC_CFLAGS ?= ""
 GRPC_CFLAGS:append:toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"

