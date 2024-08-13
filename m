Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910AEC531DD
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:40:34 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.76908.1723567231261410804
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CijBfOYR;
 spf=pass (domain: konsulko.com, ip: 209.85.210.54, mailfrom: scott.murray@konsulko.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7093d565310so4085126a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723567230; x=1724172030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOZLJTvCGIipk/HV3mTmp/RlKuDg+kmRlI4rZeDUZBo=;
        b=CijBfOYR4koyw32nUQrF2ancvG0EVSyJD6R250GNFaWRfXtVJ/GqJr5bMnmbY9qKGX
         2dNtQesSOPx76BlJBxguYWi2AtWS8HjVSK4PgNy8bxppo4mp2RqXPkIGij/n/KB/g8MK
         xjcuBX/xouj+eRGbSf7nbgQK8//NgSWouJG5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723567230; x=1724172030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOZLJTvCGIipk/HV3mTmp/RlKuDg+kmRlI4rZeDUZBo=;
        b=XxwMnViwOIhFdR2HyrzMw9gr//RJBgeaepKnwB5Tq+oUzNcQLUo/zDf4zqwe+uJuSu
         mrAHPxhMsEIiDY6fk21dqotzxcANmUPOm+8pcbjJcEO+P4LXS/QXpR/TFuWK9983d7Y4
         NL/ojs4XTF1dN2PQOytZ9oHLk+hrRKcQq+LF9BFPUiXLhnxyqBTORwLIK5Wz+hVR6VRb
         uigLRcaPKQwdypCki6nWd0EYc70ccnO4Vj5bFvJIutaTCJWWSMMZRILuzZjSTJimACvi
         J+DO9v6NRNQGGtSrx4Bx7C8spcDjcZHySdZAK9PbzflA8J6oNx8XvEKE/i2LdpwCRwF/
         zixA==
X-Gm-Message-State: AOJu0YzdK/PSsZfRoAP4d6e0+Q0c2ZfPdAExLI2sUdxdk1vUTDp4d1Ey
	pP6PxWLS27FLSmIIatv1fN7ReEzhouz1Ct2PGTdjFayzQaxp7R7GXVliIoFtnzWZdkv2Q5HcQI0
	U
X-Google-Smtp-Source: AGHT+IH4sNWIH1VInZB12M4350d7lPmKOXpKx1wftcVKE/NK30eTkdHYbNobiJGv6sYFDZntFEyuAg==
X-Received: by 2002:a05:6358:60c7:b0:1ac:62de:6c16 with SMTP id e5c5f4694b2df-1b1aab572e8mr2899355d.8.1723567229874;
        Tue, 13 Aug 2024 09:40:29 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e01fb5sm353705185a.99.2024.08.13.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:40:29 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [meta-python][scarthgap][PATCH v2 1/2] python3-grpcio: Fix build with gcc-14
Date: Tue, 13 Aug 2024 12:39:54 -0400
Message-ID: <20240813163955.1683925-2-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813163955.1683925-1-scott.murray@konsulko.com>
References: <20240813163955.1683925-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 16:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111794

From: Martin Jansa <martin.jansa@gmail.com>

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


