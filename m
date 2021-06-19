Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.15845.1624061004052304331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 17:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WzMiGCj+;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so9115503pjs.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 17:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YltBl2vosaMwkcFitKu/a2u9g5+GTc+w5HRFbNUKnMA=;
        b=WzMiGCj+QcvLL3+copQ4kThNj9/1JBeKMkKRm9S0YdyRFEIIJGESkC8OtCWehYwsQv
         MgTCshOXLx2npkwUo7mZbLCBXqftNWzUq9Wg2JNJqoGbkoLobVbKTzFv9p3RfDrLY2gX
         TvfrYRtBUG8aGJIe2tpJ/evkeHzoruAlZ/+rkaFOl/jsVrW+PerHm/n4SMFN0atydRIv
         FraUD9t15DDzof0P+0pOJJZlw7a3uQGBg93W7UvcvPFCR009EcJ8HfWxfCcgh+MKQxFo
         sI5DVbMEDWsH7cI3F0e2BpLHL9XthDfp4sGmGAiD3Ox7t8cYS4onTnX8gI+2s61uLpvY
         3f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YltBl2vosaMwkcFitKu/a2u9g5+GTc+w5HRFbNUKnMA=;
        b=OhBICErKcYqih2zx/dzt0E1mYL1o8maBSGVH6m+JKGdrRFhL41zi/My7WMRVJo/xR4
         2qmeX1B4AJBZCoejRJYoBuIphu2DhfEoIOZoR+qm/ibYM0b1OZvKl7sdsk3d7pGalKBa
         yT9eC158TFa+Q/K9mwt+aslzJtfzQ0vM5u49T7EAKEiWy0BOb6y4KjMQEohgDs1u0XIk
         oTwUTVqYD6KyzBineN1p8iL/jJ3dNYXuVmkDbp68HKZ/JzxCtM4a5BWAmVDVh5GOkzrL
         LivQMhH43BW4C7yMAdCxrOciZTFi2FFbM59ew/9twvuyGfAm8Fdswfj2Y0ODTdQPyfG9
         zhOg==
X-Gm-Message-State: AOAM530wE65Nyjd9/jrBzI0aUUyLFsk8MEXSiW1QZ1UGvKbgQ0bKm+8n
	vGeCsFjbUgGO5JbF9bT89ryROo0cbbsifQ==
X-Google-Smtp-Source: ABdhPJy52qC8GkbNxv83uYTsjO2NiifYRjkvfB0QmyynKfxLJYGPqeRlRP66bd2WuzfY3u3o7eWwOw==
X-Received: by 2002:a17:90b:2306:: with SMTP id mt6mr11523587pjb.71.1624061003375;
        Fri, 18 Jun 2021 17:03:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id n33sm2714515pgm.55.2021.06.18.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 17:03:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rocksdb: Fix build with gcc on rv32 and mips
Date: Fri, 18 Jun 2021 17:03:20 -0700
Message-Id: <20210619000320.1082428-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__sync_fetch_and_add (64bit) are not impelemented in gcc and clang
smartly converts them to __atomic_fetch_add() APIs, so do that
manually when using gcc for compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-with-new-atomic-builtin-equivalents.patch | 59 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  4 ++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
new file mode 100644
index 0000000000..4aa91d9b26
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
@@ -0,0 +1,59 @@
+From 114c42fba3fc86119710e8dd1bb2b7a9e39e3064 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 17 Jun 2021 19:35:01 -0700
+Subject: [PATCH] replace old sync with new atomic builtin equivalents
+
+Helps compiling with gcc on newer arches e.g. riscv32 where these
+__sync* builtins are not implemented atleast for 64bit values
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../range/range_tree/lib/portability/toku_atomic.h   | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+--- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_atomic.h
++++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_atomic.h
+@@ -77,37 +77,37 @@ template <typename T, typename U>
+ __attribute__((always_inline)) static inline T toku_sync_fetch_and_add(T *addr,
+                                                                        U diff) {
+   paranoid_invariant(!crosses_boundary(addr, sizeof *addr));
+-  return __sync_fetch_and_add(addr, diff);
++  return __atomic_fetch_add(addr, diff, 5);
+ }
+ template <typename T, typename U>
+ __attribute__((always_inline)) static inline T toku_sync_add_and_fetch(T *addr,
+                                                                        U diff) {
+   paranoid_invariant(!crosses_boundary(addr, sizeof *addr));
+-  return __sync_add_and_fetch(addr, diff);
++  return __atomic_add_fetch(addr, diff, 5);
+ }
+ template <typename T, typename U>
+ __attribute__((always_inline)) static inline T toku_sync_fetch_and_sub(T *addr,
+                                                                        U diff) {
+   paranoid_invariant(!crosses_boundary(addr, sizeof *addr));
+-  return __sync_fetch_and_sub(addr, diff);
++  return __atomic_fetch_sub(addr, diff, 5);
+ }
+ template <typename T, typename U>
+ __attribute__((always_inline)) static inline T toku_sync_sub_and_fetch(T *addr,
+                                                                        U diff) {
+   paranoid_invariant(!crosses_boundary(addr, sizeof *addr));
+-  return __sync_sub_and_fetch(addr, diff);
++  return __atomic_sub_fetch(addr, diff, 5);
+ }
+ template <typename T, typename U, typename V>
+ __attribute__((always_inline)) static inline T toku_sync_val_compare_and_swap(
+     T *addr, U oldval, V newval) {
+   paranoid_invariant(!crosses_boundary(addr, sizeof *addr));
+-  return __sync_val_compare_and_swap(addr, oldval, newval);
++  return __atomic_compare_exchange(addr, oldval, newval);
+ }
+ template <typename T, typename U, typename V>
+ __attribute__((always_inline)) static inline bool
+ toku_sync_bool_compare_and_swap(T *addr, U oldval, V newval) {
+   paranoid_invariant(!crosses_boundary(addr, sizeof *addr));
+-  return __sync_bool_compare_and_swap(addr, oldval, newval);
++  return static_cast<bool>(__atomic_compare_exchange(addr, oldval, newval));
+ }
+ 
+ // in case you include this but not toku_portability.h
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 99bfdd4264..c89d5d4313 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -20,6 +20,10 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://arm.patch \
           "
 
+SRC_URI_append_riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
+SRC_URI_append_mips = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
+SRC_URI_remove_toolchain-clang_riscv32 = "file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.32.0

