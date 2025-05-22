Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF9BC54756
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 06:14:57 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.17450.1747894487312116388
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 23:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KLKyAdIK;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e09e8adc9so1848417b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 23:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747894486; x=1748499286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+TX9eZTTPRx0U8Ci0wo0q327rKzN9d8olarMATQ8zg=;
        b=KLKyAdIKGVqMKOfpui5BGZuiPo2OLTG0vSwcQTBBcGyMgw3wJum60A4hu81wez2XvL
         0QxKfUcYj7fNt0xRQ6x10HjN9XLfSkvwrrsxTp79TB8vZwrs9tZbezzi4Kw/pFb73Nct
         QUGyexN7987d0wNGUWsmFp1c/N3oCemTY5VdiYu5gHwM8jFpQQoQbDtIgV9TEAx2VcKT
         ckcmYVyHwHJWfg3xrP/PpqWaQnlOdAwV3Ddvb3cNKkgv3jUPaYzXb0v+B1V4ZjSGjiWN
         J11B0P8VniAM82IwPtfxbWTbxuIgns/sqXY/11/1RhTSVZg5zV8Fb4EAirOxcrn5/hIl
         ZZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894486; x=1748499286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+TX9eZTTPRx0U8Ci0wo0q327rKzN9d8olarMATQ8zg=;
        b=JKQE4o0kod6jjroPZrBrfzpYPAUUjaCvrGfJKcTWJCtQeH9FI7/KPpQeDReeKfRlEW
         orDbVeNcqBNw3twCUay9Hxc9M/Csfy2JSHODfVC/zekCxpYsqiWwPvkEecxH6hALbgxi
         zDOybcvCPBv0fcn/31yuxASis+33ZztHZmjJNacqpeleyPeB+h57N6dIcwingPiCUIwF
         CGoWkOEwY74KYzlL8U1JRn+qGBHf7VLiAZHGWhdcyqXtxfyDi/ATuAVFG4VZ7/bamB8o
         xE6Azx7U8/11qTCI7uvcKNVfwruMtWV7LvxqbL2Sj5o/Dy3PwqLR25rA08DcwBfKw7fZ
         6M0A==
X-Gm-Message-State: AOJu0YykzU+K1vbhd/edoyFszheCFmsITUxXg21ic79zDywR5o/qhB0t
	ac6hqkyti1l24XnevsNBxY1ndvnFkbUYUWkcD47jdWNpGe+fZce4cPWVkNxaJPJF
X-Gm-Gg: ASbGncvRmUnmHSgPagGEJnQbljt3+tPo/ZJgT01h1f6GdzrD84fAMnq3alwNpemjefn
	6XN5B8IgED3Ox/wY7+mbvgsyU2jai3R3dy9kyPGYPeJsiHCA3WwF87oKZbV0ZkM/tsfjco7X0TV
	S+Fh7T3z9yLRXRU8fvNp3nn3NSErEeonxyckyyqXkkM+H6JcyB2NdotHv3TvX2Rcc4YLnsfsKKJ
	O2edf6+pSgpvEVA8ruLnPeaR7GVeBisd7G4Z96EJcFBs8vLO+pT95g/F4t0IkFF9o+L+J2scK7R
	6nFFop/Qegd6DBHNB2o+XsA32dyjSZ5tSQrZyuZOLwsxy8tQGqxe5pjJ
X-Google-Smtp-Source: AGHT+IGm3a569cyFd/xj9vIIyOQWEkGGODqIZynxSu5OfEVGxywgMsk72gQzcppHyPk0KBJ4MHv5lw==
X-Received: by 2002:a05:690c:d1c:b0:708:f0b0:811a with SMTP id 00721157ae682-70ca7a2d219mr340642527b3.12.1747894485809;
        Wed, 21 May 2025 23:14:45 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca852dee4sm29281887b3.113.2025.05.21.23.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 23:14:45 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.15.1 -> 22.16.0
Date: Thu, 22 May 2025 02:13:45 -0400
Message-ID: <20250522061349.100744-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 06:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117578

Drop the backported zlib-fix-pointer-alignment patch.  It is included in this release.
  https://github.com/nodejs/node/commit/f2159f2a44

Changelog: https://github.com/nodejs/node/releases/tag/v22.16.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                              |  0
 ....15.bb => nodejs-oe-cache-native_22.16.bb} |  0
 .../nodejs/zlib-fix-pointer-alignment.patch   | 64 -------------------
 .../{nodejs_22.15.1.bb => nodejs_22.16.0.bb}  |  3 +-
 4 files changed, 1 insertion(+), 66 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.15 => nodejs-oe-cache-22.16}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.15.bb => nodejs-oe-cache-native_22.16.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.15.1.bb => nodejs_22.16.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.15/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.16/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.15/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.16/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.15.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.15.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
deleted file mode 100644
index e372911193..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From dc035bbc9b310ff8067bc0dad22230978489c061 Mon Sep 17 00:00:00 2001
-From: jhofstee <jeroen@myspectrum.nl>
-Date: Wed, 9 Apr 2025 12:24:13 +0200
-Subject: [PATCH] zlib: fix pointer alignment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The function AllocForBrotli prefixes the allocated memory with its
-size, and returns a pointer to the region after it. This pointer can
-however no longer be suitably aligned. Correct this by allocating
-the maximum of the the size of the size_t and the max alignment.
-
-On Arm 32bits the size_t is 4 bytes long, but the alignment is 8 for
-some NEON instructions. When Brotli is compiled with optimizations
-enabled newer GCC versions will use the NEON instructions and trigger
-a bus error killing node.
-
-see https://github.com/google/brotli/issues/1159
-
-PR-URL: https://github.com/nodejs/node/pull/57727
-Reviewed-By: Shelley Vohr <shelley.vohr@gmail.com>
-Reviewed-By: Tobias Nießen <tniessen@tnie.de>
-Reviewed-By: Daniel Lemire <daniel@lemire.me>
-Reviewed-By: Gerhard Stöbich <deb2001-github@yahoo.de>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/dc035bbc9b310ff8067bc0dad22230978489c061]
----
- src/node_zlib.cc | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/node_zlib.cc b/src/node_zlib.cc
-index 0b7c47b326c7c5..7e6b38ecd1aa36 100644
---- a/src/node_zlib.cc
-+++ b/src/node_zlib.cc
-@@ -608,7 +608,8 @@ class CompressionStream : public AsyncWrap, public ThreadPoolWork {
-   }
- 
-   static void* AllocForBrotli(void* data, size_t size) {
--    size += sizeof(size_t);
-+    constexpr size_t offset = std::max(sizeof(size_t), alignof(max_align_t));
-+    size += offset;
-     CompressionStream* ctx = static_cast<CompressionStream*>(data);
-     char* memory = UncheckedMalloc(size);
-     if (memory == nullptr) [[unlikely]] {
-@@ -617,7 +618,7 @@ class CompressionStream : public AsyncWrap, public ThreadPoolWork {
-     *reinterpret_cast<size_t*>(memory) = size;
-     ctx->unreported_allocations_.fetch_add(size,
-                                            std::memory_order_relaxed);
--    return memory + sizeof(size_t);
-+    return memory + offset;
-   }
- 
-   static void FreeForZlib(void* data, void* pointer) {
-@@ -625,7 +626,8 @@ class CompressionStream : public AsyncWrap, public ThreadPoolWork {
-       return;
-     }
-     CompressionStream* ctx = static_cast<CompressionStream*>(data);
--    char* real_pointer = static_cast<char*>(pointer) - sizeof(size_t);
-+    constexpr size_t offset = std::max(sizeof(size_t), alignof(max_align_t));
-+    char* real_pointer = static_cast<char*>(pointer) - offset;
-     size_t real_size = *reinterpret_cast<size_t*>(real_pointer);
-     ctx->unreported_allocations_.fetch_sub(real_size,
-                                            std::memory_order_relaxed);
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.15.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.15.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 9798635ba2..c2bf3b6bd3 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.15.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
-           file://zlib-fix-pointer-alignment.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
@@ -38,7 +37,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e"
+SRC_URI[sha256sum] = "720894f323e5c1ac24968eb2676660c90730d715cb7f090be71a668662a17c37"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


