Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF2ACCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:20:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.48843.1760372433347534717
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JGMuIpwe;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so5071938a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760372432; x=1760977232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZZes0XnhmUj4EXbIhxFwBwlPENyP2W5U8SHDHUVQXk=;
        b=JGMuIpweNFOY0CGYc34ZLpybvWlAKg9QjIX5h/WFXUNVnBQAPBQJq8BDQCWhp1j2Iy
         cg+4ECVngQ0hO5LZhAP22EfZwQNsCwdGrN1dvY0EBycI5Brfv4YAHc/oEBaVNt9cVzRr
         OXpaLuWllj9RGB4XHsgl3nj+4Z2r7qtkJqESU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760372432; x=1760977232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZZes0XnhmUj4EXbIhxFwBwlPENyP2W5U8SHDHUVQXk=;
        b=YwMNxHu6ufM1LF7pt2z7wto1mQeEn9WtR2gw8jSaAhsYL0ofwgRL8rhbe/dxginK0c
         ksVwaav4rLQaNUL4db3+B5mYamqkN+NjNLsCv4yYWFM8HeFXeEKNshJOiou+6Ng/9i+M
         d6ab7cNxMceT89zfSOvl+fPchYfR6HJ4tA5XDdAgb5DS/zAlksliH7W7o49XX1Uh/OTy
         xRbOloPiidB5XwRkGpHwA+HFSUOrOqjJqJ6a9/Nf+dHHqP3rgqeUFdTU23bdEUOqulX5
         3+H5T7SCum4C9jeuQz4PdTykOt3rBQEe7DSqz4Z5VT7tBc2+AIvsg7BpORrdLTPIuAM7
         PMRw==
X-Gm-Message-State: AOJu0YzLjpXmpt/oj+/rzZs2O4aJmORnUz5A9HNcM1uKth9ByjELkeZ9
	JWs4fcfuY9TX5NNtQZ0iC7SHONjUyV9O6+RRr9rVTBh3Kr4WfFqXFeXoErc8hOtpqEtlhCc9To0
	3DgT4DuY=
X-Gm-Gg: ASbGncufCd+uMci3ZRNGa4syqC5w/L6AHMxL55KLCoDddH9UPrI4f+AvIKn7R0pNV0s
	W6J8EaDXXuJV7m4SZzuF71kM2wxenJosXdtphU9PL0d5KeTkQV4BV6D60U+6US0S6HfCy+KPK4C
	a4A2f8cr8d9tQc+E809TeLzvmcmNrpFuux/w0RpxhsCIPAo0TFohA4un95TksZQjrR+h9CZpj+K
	d9VNfElQiT0V9rJmBif/Roz2AlNswzzbQmVLxLYQDXN/Wa0Bgoc2GuPpzGAIEz/C8M7ilSR5pcw
	9Rn0LzRoy96ErEgN7ZlkiJJCcffnt9O+MbrAMl9YYrwYOrdYBOo9EBSQUrFPKP5irqCNRVExN9r
	cg8c9CcT/8/pjWmJf/yLfIaGJfoa8muyBHOonNrG0d3vHIJpKX/eQjAfcdQ==
X-Google-Smtp-Source: AGHT+IFzzcQuqaxRS/xa1eZyg4TDmfiG9x0RIG2g6vZ8dYEmy1gmc4dV9vYqelbaU0W6ZE93Sa+baQ==
X-Received: by 2002:a17:90b:38d1:b0:32e:8c1e:1301 with SMTP id 98e67ed59e1d1-33b513eac36mr29403171a91.34.1760372432077;
        Mon, 13 Oct 2025 09:20:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:62e3:9a37:764e:720a:4820:ff3a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5295ab65sm11524812a91.1.2025.10.13.09.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:20:31 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH] redis: upgrade 7.2.8 -> 7.2.11
Date: Mon, 13 Oct 2025 21:50:17 +0530
Message-Id: <20251013162017.26379-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 16:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120542

From: Vijay Anusuri <vanusuri@mvista.com>

ChangeLog:
https://github.com/redis/redis/releases/tag/7.2.9
https://github.com/redis/redis/releases/tag/7.2.10
https://github.com/redis/redis/releases/tag/7.2.11
https://github.com/redis/redis/compare/7.2.8...7.2.11

7.2.11

Security fixes

(CVE-2025-49844) A Lua script may lead to remote code execution
(CVE-2025-46817) A Lua script may lead to integer overflow and potential RCE
(CVE-2025-46818) A Lua script can be executed in the context of another user
(CVE-2025-46819) LUA out-of-bound read

7.2.10

Security fixes

(CVE-2025-32023) Fix out-of-bounds write in HyperLogLog commands
(CVE-2025-48367) Retry accepting other connections even if the accepted connection reports an error

7.2.9

Security fixes

(CVE-2025-27151) redis-check-aof may lead to stack overflow and potential RCE

Dropped CVE-2025-32023.patch

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...-hiredis-use-default-CC-if-it-is-set.patch |   0
 ...ile-to-use-environment-build-setting.patch |   0
 ...003-hack-to-force-use-of-libc-malloc.patch |   8 +-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   0
 ...006-Define-correct-gregs-for-RISCV32.patch |   0
 .../init-redis-server                         |   0
 .../{redis-7.2.8 => redis-7.2.11}/redis.conf  |   0
 .../redis.service                             |   0
 .../redis/redis-7.2.8/CVE-2025-32023.patch    | 218 ------------------
 .../redis/{redis_7.2.8.bb => redis_7.2.11.bb} |   3 +-
 11 files changed, 10 insertions(+), 229 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0003-hack-to-force-use-of-libc-malloc.patch (86%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0004-src-Do-not-reset-FINAL_LIBS.patch (79%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/redis.service (100%)
 delete mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
 rename meta-oe/recipes-extended/redis/{redis_7.2.8.bb => redis_7.2.11.bb} (95%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 86%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
index 1f97f9783d..8991d2d9bc 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
@@ -19,10 +19,10 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index ecbd275..39decee 100644
---- a/src/Makefile
-+++ b/src/Makefile
+Index: redis-7.2.10/src/Makefile
+===================================================================
+--- redis-7.2.10.orig/src/Makefile
++++ redis-7.2.10/src/Makefile
 @@ -13,7 +13,8 @@
  # Just use 'make dep', but this is only needed by developers.
  
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 79%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
index 974cf5169f..0513138b4e 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -15,11 +15,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index 39decee..f5efe82 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -119,7 +119,7 @@ endif
+Index: redis-7.2.10/src/Makefile
+===================================================================
+--- redis-7.2.10.orig/src/Makefile
++++ redis-7.2.10/src/Makefile
+@@ -122,7 +122,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.11/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.11/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.11/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.11/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.11/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.8/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.11/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
deleted file mode 100644
index eb7e81c0b9..0000000000
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From 50188747cbfe43528d2719399a2a3c9599169445 Mon Sep 17 00:00:00 2001
-From: "debing.sun" <debing.sun@redis.com>
-Date: Wed, 7 May 2025 18:25:06 +0800
-Subject: [PATCH] Fix out of bounds write in hyperloglog commands
- (CVE-2025-32023)
-
-Co-authored-by: oranagra <oran@redislabs.com>
-
-Upstream-Status: Backport [https://github.com/redis/redis/commit/50188747cbfe43528d2719399a2a3c9599169445]
-CVE: CVE-2025-32023
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/hyperloglog.c          | 47 +++++++++++++++++++++++++++++++----
- tests/unit/hyperloglog.tcl | 51 ++++++++++++++++++++++++++++++++++++++
- 2 files changed, 93 insertions(+), 5 deletions(-)
-
-diff --git a/src/hyperloglog.c b/src/hyperloglog.c
-index 1a74f47..ca592a0 100644
---- a/src/hyperloglog.c
-+++ b/src/hyperloglog.c
-@@ -587,6 +587,7 @@ int hllSparseToDense(robj *o) {
-     struct hllhdr *hdr, *oldhdr = (struct hllhdr*)sparse;
-     int idx = 0, runlen, regval;
-     uint8_t *p = (uint8_t*)sparse, *end = p+sdslen(sparse);
-+    int valid = 1;
- 
-     /* If the representation is already the right one return ASAP. */
-     hdr = (struct hllhdr*) sparse;
-@@ -606,16 +607,27 @@ int hllSparseToDense(robj *o) {
-     while(p < end) {
-         if (HLL_SPARSE_IS_ZERO(p)) {
-             runlen = HLL_SPARSE_ZERO_LEN(p);
-+            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
-+                valid = 0;
-+                break;
-+            }
-             idx += runlen;
-             p++;
-         } else if (HLL_SPARSE_IS_XZERO(p)) {
-             runlen = HLL_SPARSE_XZERO_LEN(p);
-+            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
-+                valid = 0;
-+                break;
-+            }
-             idx += runlen;
-             p += 2;
-         } else {
-             runlen = HLL_SPARSE_VAL_LEN(p);
-             regval = HLL_SPARSE_VAL_VALUE(p);
--            if ((runlen + idx) > HLL_REGISTERS) break; /* Overflow. */
-+            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
-+                valid = 0;
-+                break;
-+            }
-             while(runlen--) {
-                 HLL_DENSE_SET_REGISTER(hdr->registers,idx,regval);
-                 idx++;
-@@ -626,7 +638,7 @@ int hllSparseToDense(robj *o) {
- 
-     /* If the sparse representation was valid, we expect to find idx
-      * set to HLL_REGISTERS. */
--    if (idx != HLL_REGISTERS) {
-+    if (!valid || idx != HLL_REGISTERS) {
-         sdsfree(dense);
-         return C_ERR;
-     }
-@@ -923,27 +935,40 @@ int hllSparseAdd(robj *o, unsigned char *ele, size_t elesize) {
- void hllSparseRegHisto(uint8_t *sparse, int sparselen, int *invalid, int* reghisto) {
-     int idx = 0, runlen, regval;
-     uint8_t *end = sparse+sparselen, *p = sparse;
-+    int valid = 1;
- 
-     while(p < end) {
-         if (HLL_SPARSE_IS_ZERO(p)) {
-             runlen = HLL_SPARSE_ZERO_LEN(p);
-+            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
-+                valid = 0;
-+                break;
-+            }
-             idx += runlen;
-             reghisto[0] += runlen;
-             p++;
-         } else if (HLL_SPARSE_IS_XZERO(p)) {
-             runlen = HLL_SPARSE_XZERO_LEN(p);
-+            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
-+                valid = 0;
-+                break;
-+            }
-             idx += runlen;
-             reghisto[0] += runlen;
-             p += 2;
-         } else {
-             runlen = HLL_SPARSE_VAL_LEN(p);
-             regval = HLL_SPARSE_VAL_VALUE(p);
-+            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
-+                valid = 0;
-+                break;
-+            }
-             idx += runlen;
-             reghisto[regval] += runlen;
-             p++;
-         }
-     }
--    if (idx != HLL_REGISTERS && invalid) *invalid = 1;
-+    if ((!valid || idx != HLL_REGISTERS) && invalid) *invalid = 1;
- }
- 
- /* ========================= HyperLogLog Count ==============================
-@@ -1091,22 +1116,34 @@ int hllMerge(uint8_t *max, robj *hll) {
-     } else {
-         uint8_t *p = hll->ptr, *end = p + sdslen(hll->ptr);
-         long runlen, regval;
-+        int valid = 1;
- 
-         p += HLL_HDR_SIZE;
-         i = 0;
-         while(p < end) {
-             if (HLL_SPARSE_IS_ZERO(p)) {
-                 runlen = HLL_SPARSE_ZERO_LEN(p);
-+                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
-+                    valid = 0;
-+                    break;
-+                }
-                 i += runlen;
-                 p++;
-             } else if (HLL_SPARSE_IS_XZERO(p)) {
-                 runlen = HLL_SPARSE_XZERO_LEN(p);
-+                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
-+                    valid = 0;
-+                    break;
-+                }
-                 i += runlen;
-                 p += 2;
-             } else {
-                 runlen = HLL_SPARSE_VAL_LEN(p);
-                 regval = HLL_SPARSE_VAL_VALUE(p);
--                if ((runlen + i) > HLL_REGISTERS) break; /* Overflow. */
-+                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
-+                    valid = 0;
-+                    break;
-+                }
-                 while(runlen--) {
-                     if (regval > max[i]) max[i] = regval;
-                     i++;
-@@ -1114,7 +1151,7 @@ int hllMerge(uint8_t *max, robj *hll) {
-                 p++;
-             }
-         }
--        if (i != HLL_REGISTERS) return C_ERR;
-+        if (!valid || i != HLL_REGISTERS) return C_ERR;
-     }
-     return C_OK;
- }
-diff --git a/tests/unit/hyperloglog.tcl b/tests/unit/hyperloglog.tcl
-index ee43718..bc90eb2 100644
---- a/tests/unit/hyperloglog.tcl
-+++ b/tests/unit/hyperloglog.tcl
-@@ -137,6 +137,57 @@ start_server {tags {"hll"}} {
-         set e
-     } {*WRONGTYPE*}
- 
-+    test {Corrupted sparse HyperLogLogs doesn't cause overflow and out-of-bounds with XZERO opcode} {
-+        r del hll
-+        
-+        # Create a sparse-encoded HyperLogLog header
-+        set pl [string cat "HYLL" [binary format c12 {1 0 0 0 0 0 0 0 0 0 0 0}]]
-+
-+        # Create an XZERO opcode with the maximum run length of 16384(2^14)
-+        set runlen [expr 16384 - 1]
-+        set chunk [binary format cc [expr {0b01000000 | ($runlen >> 8)}] [expr {$runlen & 0xff}]]
-+        # Fill the HLL with more than 131072(2^17) XZERO opcodes to make the total
-+        # run length exceed 4GB, will cause an integer overflow.
-+        set repeat [expr 131072 + 1000]
-+        for {set i 0} {$i < $repeat} {incr i} {
-+            append pl $chunk
-+        }
-+
-+        # Create a VAL opcode with a value that will cause out-of-bounds.
-+        append pl [binary format c 0b11111111]
-+        r set hll $pl
-+
-+        # This should not overflow and out-of-bounds.
-+        assert_error {*INVALIDOBJ*} {r pfcount hll hll}
-+        assert_error {*INVALIDOBJ*} {r pfdebug getreg hll}
-+        r ping
-+    }
-+
-+    test {Corrupted sparse HyperLogLogs doesn't cause overflow and out-of-bounds with ZERO opcode} {
-+        r del hll
-+        
-+        # Create a sparse-encoded HyperLogLog header
-+        set pl [string cat "HYLL" [binary format c12 {1 0 0 0 0 0 0 0 0 0 0 0}]]
-+
-+        # # Create an ZERO opcode with the maximum run length of 64(2^6)
-+        set chunk [binary format c [expr {0b00000000 | 0x3f}]]
-+        # Fill the HLL with more than 33554432(2^17) ZERO opcodes to make the total
-+        # run length exceed 4GB, will cause an integer overflow.
-+        set repeat [expr 33554432 + 1000]
-+        for {set i 0} {$i < $repeat} {incr i} {
-+            append pl $chunk
-+        }
-+
-+        # Create a VAL opcode with a value that will cause out-of-bounds.
-+        append pl [binary format c 0b11111111]
-+        r set hll $pl
-+
-+        # This should not overflow and out-of-bounds.
-+        assert_error {*INVALIDOBJ*} {r pfcount hll hll}
-+        assert_error {*INVALIDOBJ*} {r pfdebug getreg hll}
-+        r ping
-+    }
-+
-     test {Corrupted dense HyperLogLogs are detected: Wrong length} {
-         r del hll
-         r pfadd hll a b c
--- 
-2.49.0
-
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
similarity index 95%
rename from meta-oe/recipes-extended/redis/redis_7.2.8.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.11.bb
index a1739b4f30..5ccb1ac935 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
@@ -16,10 +16,9 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           file://CVE-2025-32023.patch \
           "
 
-SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
+SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
-- 
2.25.1


