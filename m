Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.3117.1623901229341885972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 20:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fuSKRQXp;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id g24so2966230pji.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6sWH9QwIfwtKZF6WOPA2+QcMUGcq2YAEDEd8lisNP8I=;
        b=fuSKRQXpVCTI/jLa1+renhWtqspAxCXdLgIb8Be88n19r269ze96jmbgFNMxIsBz6I
         AC7mVdRDTcIZo1CnhvQqSloLc570+2f78J2bPu+NntdIoJ3H/93TQlcZMfybWJWj6Dew
         Z/LuPz7/BfvRGj0IYngt5LDMgs5PuGcUAhL3rO6pKg2MebhkbUQD51v96As9Vay2ZCTX
         J2LFXQDpx7To9f9ytvSw9IuFURGwJMHYmWFwGMenUzAeUiuT3b1yrDdSVhX0Jw+2+ZQO
         yvkNEMjAMBwtyx3KHnSCd5rdbh6kTx47zydi3IJ9LOEz7uZR7D7QGa5US980OAItab0V
         tI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6sWH9QwIfwtKZF6WOPA2+QcMUGcq2YAEDEd8lisNP8I=;
        b=CcXLXw2ug8lHDSsYZ4PxyRBc+8dE/ax8NNAi0pO/s2t35heO7xM6rcm4b3aJE4Tqrf
         z+9/uxb2ErmhCnKTJcxXbuxL/pSvwfAS5IxlELNF5+d4nWBIbxmRJuMnycH1qA0wtPnR
         D2JhSUC9US8gY2mVR9JmTUOTOIXNsoddHRWxbZ0Z1huxi3EL/737UEFbhtDw/ythSsZh
         5xweoc91y+IX4jWvmwyZwoeSfszF6EvYj3AwUMxxCvVUFnW7tvkzj/5XBG2GevufJx4h
         fvJDDtp9QviQ2XfBHmtPV7xY5/odGuiKQj/Glvkx1JsrXtj8tnrN8BhEpt9S1gNE/9+a
         TzhA==
X-Gm-Message-State: AOAM531ED6pXapDHo1GJAzRPGa30TIgvTYZrgGwMLuiGGAlT2kSozv6a
	NlupibDs9ELpRjVHsxiZfHc/SI64ypalZQ==
X-Google-Smtp-Source: ABdhPJwbJT8Bn3Ar6nfoUxoFIrgS1ThOcYsFtSPOLuoFdJ84mxM5+MbbBRtTpLU4b4qkM8PKuyMPkA==
X-Received: by 2002:a17:90a:5907:: with SMTP id k7mr3242379pji.46.1623901228517;
        Wed, 16 Jun 2021 20:40:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id j13sm3704699pgp.29.2021.06.16.20.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 20:40:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] rocksdb: Implement toku_time_now function for rv32/rv64
Date: Wed, 16 Jun 2021 20:40:25 -0700
Message-Id: <20210617034025.1906539-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build
utilities/transactions/lock/range/range_tree/lib/locktree/../portability/toku_time.h:137:2: error: #error No timer implementation for this platform
  137 | #error No timer implementation for this platform
      |  ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Implement toku_time_now for rv32/rv64 instead of disabling the build

 ...ment-toku_time_now-for-rv32-rv64-in-.patch | 44 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch
new file mode 100644
index 0000000000..86c1bffea6
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch
@@ -0,0 +1,44 @@
+From 89c032a9b4011385c0b504ea61e5df0db71f0ff5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Jun 2021 19:06:02 -0700
+Subject: [PATCH] range_tree: Implement toku_time_now for rv32/rv64 in asm
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../range_tree/lib/portability/toku_time.h    | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+index 4425a4a2e..4ac964f85 100644
+--- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
++++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+@@ -133,6 +133,25 @@ static inline tokutime_t toku_time_now(void) {
+   return result;
+ #elif defined(__powerpc__)
+   return __ppc_get_timebase();
++#elif defined(__riscv) // RISC-V
++#if __riscv_xlen == 32
++  uint32_t lo, hi0, hi1;
++  __asm __volatile__(
++      "rdcycleh %0\n"
++      "rdcycle %1\n"
++      "rdcycleh %2\n"
++      "sub %0, %0, %2\n"
++      "seqz %0, %0\n"
++      "sub %0, zero, %0\n"
++      "and %1, %1, %0\n"
++      : "=r"(hi0), "=r"(lo), "=r"(hi1));
++  return ((uint64_t)hi1 << 32) | lo;
++#else
++  uint64_t result;
++  __asm __volatile__("rdcycle %0" : "=r"(result));
++  return result;
++#endif
++
+ #else
+ #error No timer implementation for this platform
+ #endif
+--
+2.32.0
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index ded454e167..98930c6e6d 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-cmake-Use-exported-target-for-bz2.patch \
            file://0001-folly-Use-SYS_futex-for-syscall.patch \
            file://0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch \
+           file://0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch \
           "

 S = "${WORKDIR}/git"
--
2.32.0
