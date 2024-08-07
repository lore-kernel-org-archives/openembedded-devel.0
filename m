Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6664C52D7B
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 19:08:01 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.41681.1723057678104569966
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 12:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RWczuxg0;
 spf=pass (domain: konsulko.com, ip: 209.85.219.50, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b7a4668f1fso1629906d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723057677; x=1723662477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIQI6PNAOiRfbB+mfpJ5c9mxE1TewNaZVnVK7qGTwlo=;
        b=RWczuxg0zROio7XAsUsosIdBnld/oKAyU2dGDtjuaf2eaUgzJ5onMpvkB0Jz0vMQyB
         8GQA5Y7o21HAci4+KKj3bWYaDwZ18v+o5F3x9u70jztqQiq6Oal+SD28MSU7GgPY0wy7
         jqAuS6jvJA/xzbj6CvKIHMAJXrOxIw6zfK890=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723057677; x=1723662477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIQI6PNAOiRfbB+mfpJ5c9mxE1TewNaZVnVK7qGTwlo=;
        b=YSw4BKvdITJrEWQK7sWglP1I6rdY3pNletrcjOy6r79ZhJ7joOg4mju1A3CIDjbiv9
         snnsXq6lv99teCkBhaYuCCDs3gLguhGpCvOW0cNwmBW1ujaShy8PeeHOXYWdoChw4Dg/
         75o/NclRPwmAryJEBoqiizeg/zr6VohcC4wIy/z9siK+YSk7bdmr+6jxP41yDeOf3FsG
         H8nk6kWb9fPnMsEGMpwt0g2kuxxqMylGwozPrsQ6T9gtjauXagCn4KGbjTeVW0YKhex6
         jnmAA+f3xeGEQ40cbPGTVud5d1eeeAph+vapzgSeOpOwczCTCXVmxwG9d8ZrV5EYZd2y
         xx0Q==
X-Gm-Message-State: AOJu0Yz3qcE/slH2zMPWG1f8URNXEBFhx1fV6n3cMgAXVH3Z3ep3gkS1
	n8126+rrTlS4U1AMgZ2Ed+bWj86k4Ti3RSoCQYmO+5ZZnHRUfh78DVNxdM/AhsIC58jFQs4sAha
	W
X-Google-Smtp-Source: AGHT+IFUXsn4Q67q1nlhla3zRnBMmg6UKG5zXFDK/geZjjtayhYMbGTIpZDg01xDFah+Zp5kPXKBAw==
X-Received: by 2002:a05:6214:4347:b0:6b5:a81b:b974 with SMTP id 6a1803df08f44-6bb9830f456mr240000726d6.7.1723057676739;
        Wed, 07 Aug 2024 12:07:56 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c83bcb0sm58288286d6.103.2024.08.07.12.07.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:07:56 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/2] python3-grpcio: Fix build with gcc-14
Date: Wed,  7 Aug 2024 15:07:34 -0400
Message-ID: <87e077bc84367174722979a210ec0db88845b686.1723057257.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723057257.git.scott.murray@konsulko.com>
References: <cover.1723057257.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 19:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111639

* crypto: use _Generic only if !defined(__cplusplus)

* fixes build with gcc-14 which has __builtin_addc and __builtin_subc
  with gcc-13 it was already using the #else branch because of missing builtins

* fixes
  https://github.com/grpc/grpc/issues/35945
  http://errors.yoctoproject.org/Errors/Details/766916/

* _Generic was introduced in boringssl with:
  https://boringssl.googlesource.com/boringssl/+/70ca6bc24be103dabd68e448cd3af29b929b771d%5E%21/#F4

* but e.g. third_party/boringssl-with-bazel/src/ssl/d1_both.cc includes
  this internal.h and from the .cc extension gcc will process it as C++
  where _Generic isn't available, causing:

In file included from third_party/boringssl-with-bazel/src/ssl/d1_both.cc:125:
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h: In function 'uint32_t CRYPTO_addc_u32(uint32_t, uint32_t, uint32_t, uint32_t*)':
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1159:7: error: expected primary-expression before 'unsigned'
 1159 |       unsigned: __builtin_addc,                     \
      |       ^~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
      |          ^~~~~~~~~~~~~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1160:7: error: expected primary-expression before 'unsigned'
 1160 |       unsigned long: __builtin_addcl,               \
      |       ^~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
      |          ^~~~~~~~~~~~~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1161:7: error: expected primary-expression before 'unsigned'
 1161 |       unsigned long long: __builtin_addcll))((x), (y), (carry), (out_carry))
      |       ^~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
      |          ^~~~~~~~~~~~~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1158:4: error: '_Generic' was not declared in this scope
 1158 |   (_Generic((x),                                    \
      |    ^~~~~~~~
third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
      |          ^~~~~~~~~~~~~~~~~~~

(cherry picked from commit 5778e32eae201072c5dc37c9db67dc1848ffb9de)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 ..._Generic-only-if-defined-__cplusplus.patch | 74 +++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
new file mode 100644
index 000000000..d830d9228
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
@@ -0,0 +1,74 @@
+From 3359a87a71307336100b84e66b69bad385cd3cfc Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Mon, 6 May 2024 01:36:39 +0200
+Subject: [PATCH] crypto: use _Generic only if !defined(__cplusplus)
+
+* fixes build with gcc-14 which has __builtin_addc and __builtin_subc
+  with gcc-13 it was already using the #else branch because of missing builtins
+
+* fixes
+  https://github.com/grpc/grpc/issues/35945
+
+* _Generic was introduced in boringssl with:
+  https://boringssl.googlesource.com/boringssl/+/70ca6bc24be103dabd68e448cd3af29b929b771d%5E%21/#F4
+
+* but e.g. third_party/boringssl-with-bazel/src/ssl/d1_both.cc includes
+  this internal.h and from the .cc extension gcc will process it as C++
+  where _Generic isn't available, causing:
+
+In file included from third_party/boringssl-with-bazel/src/ssl/d1_both.cc:125:
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h: In function 'uint32_t CRYPTO_addc_u32(uint32_t, uint32_t, uint32_t, uint32_t*)':
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1159:7: error: expected primary-expression before 'unsigned'
+ 1159 |       unsigned: __builtin_addc,                     \
+      |       ^~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
+ 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
+      |          ^~~~~~~~~~~~~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1160:7: error: expected primary-expression before 'unsigned'
+ 1160 |       unsigned long: __builtin_addcl,               \
+      |       ^~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
+ 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
+      |          ^~~~~~~~~~~~~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1161:7: error: expected primary-expression before 'unsigned'
+ 1161 |       unsigned long long: __builtin_addcll))((x), (y), (carry), (out_carry))
+      |       ^~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
+ 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
+      |          ^~~~~~~~~~~~~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1158:4: error: '_Generic' was not declared in this scope
+ 1158 |   (_Generic((x),                                    \
+      |    ^~~~~~~~
+third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in expansion of macro 'CRYPTO_GENERIC_ADDC'
+ 1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
+      |          ^~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://boringssl-review.googlesource.com/c/boringssl/+/68227 crypto: use _Generic only if !defined(__cplusplus)]
+
+ crypto/internal.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/internal.h b/crypto/internal.h
+index a77102d76..30d6826dd 100644
+--- a/crypto/internal.h
++++ b/crypto/internal.h
+@@ -1176,7 +1176,7 @@ static inline uint64_t CRYPTO_rotr_u64(uint64_t value, int shift) {
+ 
+ // CRYPTO_addc_* returns |x + y + carry|, and sets |*out_carry| to the carry
+ // bit. |carry| must be zero or one.
+-#if OPENSSL_HAS_BUILTIN(__builtin_addc)
++#if OPENSSL_HAS_BUILTIN(__builtin_addc) && !defined(__cplusplus)
+ 
+ #define CRYPTO_GENERIC_ADDC(x, y, carry, out_carry) \
+   (_Generic((x),                                    \
+@@ -1228,7 +1228,7 @@ static inline uint64_t CRYPTO_addc_u64(uint64_t x, uint64_t y, uint64_t carry,
+ 
+ // CRYPTO_subc_* returns |x - y - borrow|, and sets |*out_borrow| to the borrow
+ // bit. |borrow| must be zero or one.
+-#if OPENSSL_HAS_BUILTIN(__builtin_subc)
++#if OPENSSL_HAS_BUILTIN(__builtin_subc) && !defined(__cplusplus)
+ 
+ #define CRYPTO_GENERIC_SUBC(x, y, borrow, out_borrow) \
+   (_Generic((x),                                      \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 80a4d04e6..47f3b2ea2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -9,6 +9,7 @@ DEPENDS += "python3-protobuf"
 SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
+           file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            "
 SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
-- 
2.45.2


