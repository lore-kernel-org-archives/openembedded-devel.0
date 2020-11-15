Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.27005.1605481742817868252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 15:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h6mm5V8c;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 62so11078953pgg.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 15:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4E9CLH2BHY+ZEuBEEcv/8qI5kjJrxcAvK22ItGKgtz4=;
        b=h6mm5V8ceUiTjOmOUXFSTTRu/LCnzOWiu7CkOma4ffW+nwBXf2VM9ouUEbtxcgwGLA
         D31temgdR217bpdrY9ywrEyc5KN/KfqJr0OtmBc7VFoltfSJuafNwmMLw1haDpKvKLtT
         gYk7rIXtGXrSaiXJ0a2PW695Jjgo3zQag3ChmZfYC/4QacnM0HCxubFnrRbBe36aZGH2
         xcwEbPpnJLUWgGtlR8hJEHZmEeCe2MT5o8PE6yj9oY4i8ixjJx0ukpOEEb2D47XxfL6C
         xcGspJ4K24xVXYF3yZ9UTQS8zryU7IC8SI2R7k1T3SKiL5CMnSO2CqaOIOIoMmIZzrjA
         gnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4E9CLH2BHY+ZEuBEEcv/8qI5kjJrxcAvK22ItGKgtz4=;
        b=BCxquPbXPtP8GrtIZT+SzL9F+r754NNngqwqvXWRWl3VAQvoH1eKuio40tGtfN1cdU
         ITqvnNDZpEpt3C9H8y8XuxM4DgADHST6dKC+M7uVzHDz2hrMgnFymKe+6dTCPGJeHo9B
         T1n8qSGS3Oz4ltse3ZRsI5elzzQ123/6SFyzCuNosrzZ3xd9FJxwHCbhdpEGJNmypGn5
         FAjPp18QpvAtGOKhgdl+ByXwjketxvhwGOUuMViKh6Jauw5T4wrb5KN+lT1FGUSmUhFF
         oU0yxnbU8WfLWH0u4fpTGaF4A43wB6a9sPV+UxUpIkQyizqZO0ynfiQp7Zgmzg0fjS+p
         Wv3A==
X-Gm-Message-State: AOAM5308LkpCW125vZAHQI1c1J/MUQ132vr/5mwtX9ECne1N3XDFtXMG
	ZI3PzAZwApA0c8K0fk4TfuoT5h928cU3+g==
X-Google-Smtp-Source: ABdhPJxuufEw6ZvD0Vnp33bkagWkzkcDJuHWg39jbaNQWoS2praeuTvu0zJvVKfax6VR0U8+/iIcOw==
X-Received: by 2002:aa7:9786:0:b029:18b:746d:629f with SMTP id o6-20020aa797860000b029018b746d629fmr11576724pfp.68.1605481742022;
        Sun, 15 Nov 2020 15:09:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id m30sm14478694pgn.49.2020.11.15.15.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 15:09:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rocksdb: Update to 6.12.7
Date: Sun, 15 Nov 2020 15:08:59 -0800
Message-Id: <20201115230859.2906072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to fix build on riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-folly-Use-SYS_futex-for-syscall.patch | 47 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  7 +--
 2 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
new file mode 100644
index 0000000000..aa291daa3e
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
@@ -0,0 +1,47 @@
+From ddcc8a9f7e0f0bfee96f2f0a0c10f21f9fa9b05d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 15:02:28 -0800
+Subject: [PATCH] folly: Use SYS_futex for syscall
+
+glibc defines SYS_futex and on newer 32bit CPUs like RISCV-32, arc there
+is no 32bit time_t therefore define SYS_futex in terms of SYS_futex_time64
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7676]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third-party/folly/folly/detail/Futex.cpp | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/third-party/folly/folly/detail/Futex.cpp b/third-party/folly/folly/detail/Futex.cpp
+index 62d6ea2b2..a914a8c73 100644
+--- a/third-party/folly/folly/detail/Futex.cpp
++++ b/third-party/folly/folly/detail/Futex.cpp
+@@ -48,9 +48,15 @@ namespace {
+ #define FUTEX_CLOCK_REALTIME 256
+ #endif
+ 
++/// Newer 32bit CPUs eg. RISCV-32 are defaulting to 64bit time_t from get go and
++/// therefore do not define __NR_futex
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
++
+ int nativeFutexWake(const void* addr, int count, uint32_t wakeMask) {
+   long rv = syscall(
+-      __NR_futex,
++      SYS_futex,
+       addr, /* addr1 */
+       FUTEX_WAKE_BITSET | FUTEX_PRIVATE_FLAG, /* op */
+       count, /* val */
+@@ -112,7 +118,7 @@ FutexResult nativeFutexWaitImpl(
+   // Unlike FUTEX_WAIT, FUTEX_WAIT_BITSET requires an absolute timeout
+   // value - http://locklessinc.com/articles/futex_cheat_sheet/
+   long rv = syscall(
+-      __NR_futex,
++      SYS_futex,
+       addr, /* addr1 */
+       op, /* op */
+       expected, /* val */
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 7ebc5ab1da..117a16b9e8 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "48bfca38f6f175435052a59791922a1a453d9609"
-SRCBRANCH = "6.11.fb"
-PV = "6.11.4"
+SRCREV = "f3e33549c151f30ac4eb7c22356c6d0331f37652"
+SRCBRANCH = "6.12.fb"
+PV = "6.12.7"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0001-cmake-Use-exported-target-for-bz2.patch \
+           file://0001-folly-Use-SYS_futex-for-syscall.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.29.2

