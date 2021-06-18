Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.9585.1624030740505739170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 08:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DLgFIM8b;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id e1so4851927plh.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ccFy2OtMDnoE0t9WV0oQcKvAhDGY5IXVR47RC77JOwk=;
        b=DLgFIM8beaLehIWY7T+V0GZwXfOTb9qVSya7J5mKyNZoyqKHrBrSz5Hbpp8pL326bh
         wrR+uy1HNo/8/pahiRpZlVlW0QXIneTcoXD9B999VKQLSrCwn5cqLHdH20v2ATEU1iSq
         FwFsV28sFMuDaLlNMAZJDN37541pRczEf+An+O9dBhu0JNY29IEaqVv8703CQbsgZ8v/
         mQcAKP4iosgDn+TJSvSlJgfhhuGSJYukUJXHOFAzGCvuuDp4byb98lvueelA3oarwD3T
         daYFaZl/vdvAqmRBomBKfUZvcREfXqFajgCutfmbAR4khSVd3QrCBfgMfhHuiiPqjB09
         jUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ccFy2OtMDnoE0t9WV0oQcKvAhDGY5IXVR47RC77JOwk=;
        b=ER4Rfjc2gmEInrCBtYu5UOtLUkrRXRztAs+foDqLzQ5YH61T4zjwgq+5OHpOvsHRyM
         DA4EMnxG25pwIyHQYNomt6hag7DS2W70IJjUdsS2Kf34+bl2eFU0v3s+6Ev6Ry9wKo9r
         LOK7vagplpWxlze0Dl/BWaAkdgFDeSIPWRE8lnLjnK25mrIgxgguLIVRtr2qBdtu0wPi
         8ziup5BufA287B/5wRvvRbuyVlTgfVSD9MAXTtUVMXzBR1C9Jt8Qd8xSyXVvp01ZktQS
         D2UfhC+6vLkbgYFlFa+UTot6P+BIQFkF1WZTBBn9OfOxT6d5L3snJ0H3xLlqkak4fyrf
         3kFQ==
X-Gm-Message-State: AOAM5327p2YAt+y3fUBuPVESUKyAdRsrQ0bAob/GhEovF4hcm73wQiZ5
	t63nnhAu3twHFJt7ybE8xWzIYasIGFrnlg==
X-Google-Smtp-Source: ABdhPJwJndkt8gBUo4QXlZve64Uhi8Hiit/kFCbiTo+UEBwSFr/3eC+ZVFCHbFs1j6o5/m0frMw+KQ==
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr22853050pjh.215.1624030739856;
        Fri, 18 Jun 2021 08:38:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2591476pja.8.2021.06.18.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 08:38:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] rocksdb: Implement timer for mips
Date: Fri, 18 Jun 2021 08:38:56 -0700
Message-Id: <20210618153857.775544-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/files/mips.patch  | 19 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/mips.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/mips.patch b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
new file mode 100644
index 0000000000..db2305d296
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
@@ -0,0 +1,19 @@
+implement timer implementation for mips platform
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
++++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+@@ -155,7 +155,12 @@ static inline tokutime_t toku_time_now(v
+   __asm __volatile__("rdcycle %0" : "=r"(result));
+   return result;
+ #endif
+-
++#elif defined(__mips__)
++  // mips apparently only allows rdtsc for superusers, so we fall
++  // back to gettimeofday.  It's possible clock_gettime would be better.
++  struct timeval tv;
++  gettimeofday(&tv, nullptr);
++  return (uint64_t)tv.tv_sec * 1000000 + tv.tv_usec;
+ #else
+ #error No timer implementation for this platform
+ #endif
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index d03d0c9529..6516edade6 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch \
            file://0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch \
            file://ppc64.patch \
+           file://mips.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

