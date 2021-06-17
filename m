Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.4158.1623910689003032429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 23:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H8BoqQBL;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id x22so825894pll.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xt/F7hqfucR8Td9NNko5JoqBIlDHXEfmqCECEs0ViP0=;
        b=H8BoqQBLQJQl1BKCL9V+sOT2bRbSnTO7ojzIuoJS1WYduTri7cE4akdPIpdrQt7n39
         tX/38GB3pQm1Kq9FLFIJwXyDFe7P4GfkqAT3jwrVeIk7EPn+mkWT1ts81aJhT8fn9DQH
         tfQa5g/ZtVg1MsX58bekUAhkrQDp9xGCSQlcmoOyGNQ/v8yVU472xwlOeLwU9fwe5uSk
         LSFgIBcYdHxZ61zTtD28P0TlxNQHs0rCCd3JtWljHZTzWCVzHMm+UEQLibHUq0APOLOU
         h77QQLJoLDIF+h/9ovxdys+EV/HTdS4RkB22wwGGC1CtKjsUVGP2YdhYQKXPNA9bEOvo
         18EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xt/F7hqfucR8Td9NNko5JoqBIlDHXEfmqCECEs0ViP0=;
        b=M8mwtouZviOzUZCV7D6WfFOSNONu2M91nn8ZF+EhfFelTL+t6mkeTxbPWQtL+21Oo2
         eXqCHziBBPzCUwaCW/D9kOE8iK1XHvfVqED7IY1yYJZXyfhYNUbEjXzTQE4gnmFK7Qu4
         DDdG/NBjHrCZEqaNfyfffaWsqwdlS8Qly8i3Iy2wmmsl0GzteuHNLPvOfysC6EXr7EgT
         Fl6htV+VjVCl6/+gEKs7OBn+nYXED/A0wTpjB0sYXNY9ludRIYgdk6QlzFxsWIVo/D8b
         lbhOjJJ1WVBUefjvNuyztR1qe70GxKYQEZ8mtytj+OCimrzY7aIqZQ8zPaTLRJ3G6ZC0
         2axg==
X-Gm-Message-State: AOAM532ruRKcsFMuZ1HpbSAX2L6WAAQYpT/mdXzPpDL0ycu9oCCZO/wN
	8wj4LBm+vHRDlZiSe6344NIy0900zjBYNA==
X-Google-Smtp-Source: ABdhPJxohQSoA+xVf+UR/ltUUSLyhXyOay1ehh8c/mC1Jzfwzse2SWWleT4yxNr/DJepY5xsLEv61Q==
X-Received: by 2002:a17:903:4a:b029:11e:7c15:a597 with SMTP id l10-20020a170903004ab029011e7c15a597mr3155647pla.6.1623910688148;
        Wed, 16 Jun 2021 23:18:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id n23sm4131651pgv.76.2021.06.16.23.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 23:18:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rocksdb: Fix build with ppc64/musl
Date: Wed, 16 Jun 2021 23:18:05 -0700
Message-Id: <20210617061805.2077289-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/files/ppc64.patch | 28 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/ppc64.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
new file mode 100644
index 0000000000..bc40f1b1e7
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
@@ -0,0 +1,28 @@
+implement support for musl/ppc64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
++++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+@@ -58,7 +58,7 @@ Copyright (c) 2006, 2015, Percona and/or
+ #include <stdint.h>
+ #include <sys/time.h>
+ #include <time.h>
+-#if defined(__powerpc__)
++#if defined(__powerpc__) && defined(__GLIBC__)
+ #include <sys/platform/ppc.h>
+ #endif
+ 
+@@ -131,8 +131,12 @@ static inline tokutime_t toku_time_now(v
+   uint64_t result;
+   __asm __volatile__("mrs %[rt], cntvct_el0" : [ rt ] "=r"(result));
+   return result;
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && defined(__GLIBC__)
+   return __ppc_get_timebase();
++#elif defined(__powerpc64__) || defined(__ppc64__)
++  uint64_t result;
++  asm volatile("mfspr %0, 268" : "=r"(result));
++  return result;
+ #elif defined(__riscv) // RISC-V
+ #if __riscv_xlen == 32
+   uint32_t lo, hi0, hi1;
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 98930c6e6d..d03d0c9529 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-folly-Use-SYS_futex-for-syscall.patch \
            file://0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch \
            file://0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch \
+           file://ppc64.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

