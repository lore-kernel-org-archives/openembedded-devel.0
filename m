Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29768D2A54C
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.32578.1729107318143987011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ke+gpMFf;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so95668f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107316; x=1729712116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wSZdPz01Nu9EKHExv+05zkFhCdwb7oe6IwfixkkfXE=;
        b=ke+gpMFf0hGZXZi35H4xEExfZwtnsvU0bt4xn0e/W7KdYAi+ueaBOHiFTXxaqV4Y/V
         vDdXOxQZK1nx7c5/6YMlrLDbVegC0mnw7kYzJQqIGGDqOYQFXInrH545J6zZiMUQh0n9
         Wzap4leD1m6T7pNpk3+SwNJ1jJvaK5LPz/nzk5uQoG1wvQuQsao7sNHpt/mQZ5RAlHqN
         rCx9odZQA0iNPKqTkWBpJDqB/Z3MNPPClEwXkQZUqmkRln5ecrc/qn7sAHl9C/PutVGO
         HYoqdnqJJfGr90EAAtq0EUGzgeWXUxLVT9kP8E7h/TzWU8op86sWD1FsklplsflrluXV
         ZFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107316; x=1729712116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wSZdPz01Nu9EKHExv+05zkFhCdwb7oe6IwfixkkfXE=;
        b=kqFGxx746T2N+0p727QuehoaZcfrh5AP2AHYQe/l+WW0qsDTSUeGjejVZxSBa8db3f
         GpNa6D8Ode0jBD3pImJU94JxvC7Pyq/GahVbaBPeAxMBkSd3Mbs0LrKppwgYiYlk2dmY
         HpsWDa6tHY1pf1PUPa564IklcUxHQpU8qJ62i6fmy+GGQnULbXqfeEG+IbhNzITteEJ+
         23UNGFv0rU4U1XzkJNHdEfnwkeoQq2PnUb3wU4PxBj/UcihDqtb4CKPsE4lYxPOfnkeb
         9u4AldQBZ6+ARMR+fC2i4bV5L/T8mckPPtvj7vhyxVQyEmoposRCBrFEFIJZTWv/4wc+
         oVzw==
X-Gm-Message-State: AOJu0Yy3qBhwzv832yOXa0CYqlx2PQqhTfojACifWJq5em2rBNaZL6gp
	8yBlGlsJlN5pQUaj9EErynw0vtUhn7Y3e3w5AlsTz4MlLbtEKa2g8ZviTw==
X-Google-Smtp-Source: AGHT+IE+viKhj3X07dWs74Ug3g9989o1eqW/9NE5ZPoQ8KWWs6rTmVJZT56XsT+plEjUqvwu+5aMag==
X-Received: by 2002:a5d:618a:0:b0:37c:d225:6d33 with SMTP id ffacd0b85a97d-37d5529f9b4mr11670501f8f.55.1729107316318;
        Wed, 16 Oct 2024 12:35:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/13] python3-grpcio: update 1.66.1 -> 1.66.2
Date: Wed, 16 Oct 2024 21:34:59 +0200
Message-Id: <20241016193505.3459828-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112948

This fixes python 3.13 issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Include-missing-cstdint-header.patch         |  3 +--
 ...644-unscaledcycleclock-remove-RISC-V-support.patch |  5 +----
 ...pto-use-_Generic-only-if-defined-__cplusplus.patch | 11 +++++------
 ...1-target.h-define-proper-macro-for-ppc-ppc64.patch |  7 ++-----
 ...-zlib-Include-unistd.h-for-open-close-C-APIs.patch |  2 +-
 .../python/python3-grpcio/abseil-ppc-fixes.patch      |  2 +-
 ...hon3-grpcio_1.66.1.bb => python3-grpcio_1.66.2.bb} |  2 +-
 7 files changed, 12 insertions(+), 20 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.66.1.bb => python3-grpcio_1.66.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
index 5cd94dee9..a2bd294a0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
@@ -1,4 +1,4 @@
-From 252aa78526287fe033c5656cd166e551fa5daa88 Mon Sep 17 00:00:00 2001
+From 0760579b4890b48ea3ab36e48f1f6fb3e7ed05f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 30 Jan 2023 10:31:10 -0800
 Subject: [PATCH] Include missing <cstdint> header
@@ -11,7 +11,6 @@ int32_t.
 
 Upstream-Status: Submitted [https://code-review.googlesource.com/c/re2/+/60970]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  third_party/re2/util/pcre.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
index 82f15f88c..63ec2e23d 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
@@ -1,4 +1,4 @@
-From 7335a36d0b5c1c597566f9aa3f458a5b6817c3b4 Mon Sep 17 00:00:00 2001
+From ee0e37b02d0d28279e103653688bf7203275ec47 Mon Sep 17 00:00:00 2001
 From: aurel32 <aurelien@aurel32.net>
 Date: Fri, 22 Mar 2024 14:21:13 -0700
 Subject: [PATCH] PR #1644: unscaledcycleclock: remove RISC-V support
@@ -77,6 +77,3 @@ index 5e232c1..83552fc 100644
  #define ABSL_INTERNAL_UNSCALED_CYCLECLOCK_FREQUENCY_IS_CPU_FREQUENCY
  #endif
  #endif
--- 
-2.44.0
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
index d830d9228..ff5a8f298 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
@@ -1,4 +1,4 @@
-From 3359a87a71307336100b84e66b69bad385cd3cfc Mon Sep 17 00:00:00 2001
+From eee5daeb5b53b0c4a013aa5887a726434ec81600 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 6 May 2024 01:36:39 +0200
 Subject: [PATCH] crypto: use _Generic only if !defined(__cplusplus)
@@ -43,18 +43,17 @@ third_party/boringssl-with-bazel/src/ssl/../crypto/internal.h:1166:10: note: in
  1166 |   return CRYPTO_GENERIC_ADDC(x, y, carry, out_carry);
       |          ^~~~~~~~~~~~~~~~~~~
 
+Upstream-Status: Submitted [https://boringssl-review.googlesource.com/c/boringssl/+/68227 crypto: use _Generic only if !defined(__cplusplus)]
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 ---
-Upstream-Status: Submitted [https://boringssl-review.googlesource.com/c/boringssl/+/68227 crypto: use _Generic only if !defined(__cplusplus)]
-
  crypto/internal.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/crypto/internal.h b/crypto/internal.h
-index a77102d76..30d6826dd 100644
+index f93c2e5..2fca2fb 100644
 --- a/crypto/internal.h
 +++ b/crypto/internal.h
-@@ -1176,7 +1176,7 @@ static inline uint64_t CRYPTO_rotr_u64(uint64_t value, int shift) {
+@@ -1193,7 +1193,7 @@ static inline uint64_t CRYPTO_rotr_u64(uint64_t value, int shift) {
  
  // CRYPTO_addc_* returns |x + y + carry|, and sets |*out_carry| to the carry
  // bit. |carry| must be zero or one.
@@ -63,7 +62,7 @@ index a77102d76..30d6826dd 100644
  
  #define CRYPTO_GENERIC_ADDC(x, y, carry, out_carry) \
    (_Generic((x),                                    \
-@@ -1228,7 +1228,7 @@ static inline uint64_t CRYPTO_addc_u64(uint64_t x, uint64_t y, uint64_t carry,
+@@ -1245,7 +1245,7 @@ static inline uint64_t CRYPTO_addc_u64(uint64_t x, uint64_t y, uint64_t carry,
  
  // CRYPTO_subc_* returns |x - y - borrow|, and sets |*out_borrow| to the borrow
  // bit. |borrow| must be zero or one.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
index 0b512b1d0..39f9fafba 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
@@ -1,4 +1,4 @@
-From b3bca013007a4a66703573d243e433f22e1e6684 Mon Sep 17 00:00:00 2001
+From e2c78c555ab3d9509c4ade511e2f711eb7188626 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 15 May 2024 16:55:09 +0800
 Subject: [PATCH] target.h: define proper macro for ppc/ppc64
@@ -18,7 +18,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/third_party/boringssl-with-bazel/src/include/openssl/target.h b/third_party/boringssl-with-bazel/src/include/openssl/target.h
-index 29b1dc6..d779813 100644
+index 2760f52..e743402 100644
 --- a/third_party/boringssl-with-bazel/src/include/openssl/target.h
 +++ b/third_party/boringssl-with-bazel/src/include/openssl/target.h
 @@ -54,6 +54,10 @@
@@ -32,6 +32,3 @@ index 29b1dc6..d779813 100644
  #else
  // The list above enumerates the platforms that BoringSSL supports. For these
  // platforms we keep a reasonable bar of not breaking them: automated test
--- 
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
index 34ef7874e..584723e6d 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
@@ -1,4 +1,4 @@
-From 671618df3e48619f0c7a5a3acd8982374a5e43db Mon Sep 17 00:00:00 2001
+From f84421d8ee06890e2c98c0f7c9ec6c73f88e77c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 12 Feb 2023 21:25:04 -0800
 Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index f39a9616d..1daebfa19 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -1,4 +1,4 @@
-From 102dcce6610e6606fffd3a4986f84eb52177f8c8 Mon Sep 17 00:00:00 2001
+From a2ec96a96ff7ba016e800212a942b9f29f255415 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Mar 2021 10:26:25 -0800
 Subject: [PATCH] An all-in-one patch that fixes several issues:
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.66.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.66.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.66.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.66.2.bb
index fb91f345b..7c5176736 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.66.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.66.2.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
            "
-SRC_URI[sha256sum] = "35334f9c9745add3e357e3372756fd32d925bd52c41da97f4dfdafbde0bf0ee2"
+SRC_URI[sha256sum] = "563588c587b75c34b928bc428548e5b00ea38c46972181a4d8b75ba7e3f24231"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.39.5


