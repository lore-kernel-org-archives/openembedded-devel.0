Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151C3C4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 00:00:01 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.9649.1714953595515362581
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 May 2024 16:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYymOmZ7;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e242b1df60so17349311fa.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 May 2024 16:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714953593; x=1715558393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYcsApz9rCcvK1+XZmSpI25OUw8O+bHuWZcg3h68UR0=;
        b=jYymOmZ7Jzxr31vHfV3kKsghpLztdoppHG7dSWoBqPW3eErmKlipmng1Y05TwjPChs
         A56dbWZDzz9Nv5oEUcLhywAwDC/HBaDimmAcLU97TvYdmMomKsFw+uYiy9s36UNXFDBZ
         bIHpUoXX0YPhUS22nGdR5CXRANzJ2kmLpNNBaIcF2lCswebzfcpQHK1JTTUVAoJ5amzI
         bb+rYa/g0xVM2vdVXuVzvCmx8a9cimtXs0M4EAZa2NObmYx4Aw+g0TpLekpLAn+qnQEw
         CBgc+X3ZkDXkBL1vyOWtDtbAWDiFn73OOsh5Vsng8iOojvjlm7nl6k34WQzcY4pYaydl
         iPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714953593; x=1715558393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYcsApz9rCcvK1+XZmSpI25OUw8O+bHuWZcg3h68UR0=;
        b=EOYrgMJiD8xhJVyMF+l8fgeRP+Fa+OldCnGGcz39tWFO6JTaxUi0ZMFCzRT+OwOgDS
         4j3kJxumxk9GVBTyg9sC/vHPnLIiA+gRnNGDFwiRMjvUIYvvYTtG+Crt/5GOty430Lqp
         NVKkRGjoqx9aXMgUC+a9YvzE1fbkxnAluP8ytmvFEkHGepmhVKc2zvL09gYS7S7CpCO8
         aZv1ZNz6IwHJm8Jge4E+PVW5ktd6MasS/8lVtB6enCMMNhJjewBXyMpCjsN+IEqvzAhm
         Og2ANotKmaIoWEaqEW/G0mDUfEcrN63OMrtLxS6NH4KNI+QZkbvseRU+dxtIlgX41DOK
         hjgA==
X-Gm-Message-State: AOJu0YyzkX2JqcOzgPDKoZtfDerljy3u52acEQTb4lX9pBxBE8IWw7qD
	m6Q//zx+I1oDjMteXZwUEy288OHiNnk2TxtKDZjuZBmqZzZlatETIi5gKA==
X-Google-Smtp-Source: AGHT+IFFcjQVwF8g6QhmO1DZqyvRQ27nobjkKi+PdVukNdnst9B2Ym9R0/z7MolwOHhGXNIqMss0Hg==
X-Received: by 2002:ac2:43bc:0:b0:51c:dc6:a1ce with SMTP id t28-20020ac243bc000000b0051c0dc6a1cemr6646090lfl.7.1714953593267;
        Sun, 05 May 2024 16:59:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id zo15-20020a170906ff4f00b00a59aea7f4bcsm1961828ejb.139.2024.05.05.16.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 16:59:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio: Fix build with gcc-14
Date: Mon,  6 May 2024 01:59:47 +0200
Message-ID: <20240505235947.3002660-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 00:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110258

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

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ..._Generic-only-if-defined-__cplusplus.patch | 74 +++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
new file mode 100644
index 0000000000..d830d92284
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
index 3148f63761..3cee8ab10c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -9,6 +9,7 @@ DEPENDS += "python3-protobuf"
 SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
+           file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
            "
 SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
 
-- 
2.45.0


