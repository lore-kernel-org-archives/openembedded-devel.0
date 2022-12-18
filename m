Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF16C46467
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 21:08:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6203.1671397673284238172
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 13:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wyt0sLIU;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id 21so5000661pfw.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 13:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jleCWDp9RRHBXckGBvxOOz2owuHn+xEVd8B5VJ5/tFg=;
        b=Wyt0sLIUX5MfJX4OBTfQ05A7ZhdFp3IifXuyIPDt5jPkanmSi1zQBiXsDFYItYd0Z4
         4sAJEVXUBheCXMlffM4ozoPmQarauBj1udPukO1NZ5bqZmS+KNyi6nnmE5vfyjAS0RRe
         aa6b2XXwd83JBgUb7xJwXS43IHC6C72yilFc9xrkcRskQ0OYg9/mdpj3zvs4wdOdrM9f
         4jpVS3Y8LiFwAzanNkQZ6ssCa7VoGlljgN0o2ErzUuEfhzheJhHwQNTjYt8mKDb5+nof
         NHiA4/ZlE1+EQltC27ZmGRoI48K4kxISwUfFo8NeAq0JjHTdneZRz4SQt2nJbCJc4+Vw
         kccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jleCWDp9RRHBXckGBvxOOz2owuHn+xEVd8B5VJ5/tFg=;
        b=qHoluf0jr9l7uT9UdjKbKwXZWmwfDfcXl/Sk6x1ZNAMeSqDpzuwBCmOzcLDxZz/LfQ
         yCXWQs8WuKpWs2eOHSsXkOtL3ig94BOr6anvCfSPCgVTfTy+6mWBmKqSF6M0weN0QNum
         RX2hi+Zl7Agvh7REynohBWAanVWtDroCQHfVlWj7zw/kiFlVEtsITgdKwIJ9nFZ7Qb33
         wRMwaH6bRUFx6I1GAcnP3MTRdmISHdR34z8Cu0Rth6vjuRL9EDgVp80StzDonXlqEX8f
         Cv5M4SVUM68TOjnSiIMGPa6hmuV+qYsC4s/p5OkNDorCgk8R6nN/2WObn5Jln+/wqeuz
         Z/3Q==
X-Gm-Message-State: ANoB5pnFnzOSVrgGPwbKjf0neSSFLifZjm35kpESvt9/PsK9s682Z9+v
	gnShfQiXzkZPc62TIIi/ukFyt18f6LA=
X-Google-Smtp-Source: AA0mqf5bYMSLcgDNTt+07reht4qhZd5MrtRza0KsgdNF9H9fFL9mQgrJ8pAwMwXMsLJyBKca/irj6Q==
X-Received: by 2002:a62:524c:0:b0:576:b277:2cd with SMTP id g73-20020a62524c000000b00576b27702cdmr38098918pfb.34.1671397672294;
        Sun, 18 Dec 2022 13:07:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id e64-20020a621e43000000b005770fd365d8sm5120928pfe.97.2022.12.18.13.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 13:07:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] stressapptest: Fix build with largefile support and musl
Date: Sun, 18 Dec 2022 13:07:47 -0800
Message-Id: <20221218210748.225122-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221218210748.225122-1-raj.khem@gmail.com>
References: <20221218210748.225122-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 21:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100087

Update status of patches as they are submitted upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-Add-with-cpu.patch         |  37 +++++++
 ...-Replace-lfs64-functions-and-defines.patch | 103 ++++++++++++++++++
 ...for-pthread_rwlockattr_setkind_np-be.patch |  43 ++++++++
 .../stressapptest/libcplusplus-compat.patch   |   2 +-
 .../read_sysfs_for_cachesize.patch            |   2 +-
 .../stressapptest/stressapptest_1.0.9.bb      |  10 +-
 6 files changed, 194 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
 create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
 create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
new file mode 100644
index 0000000000..41fb456c6c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
@@ -0,0 +1,37 @@
+From 73049e5a9e3698cc6d51471d70ac5e06bed803cc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Dec 2022 10:24:48 -0800
+Subject: [PATCH] configure: Add --with-cpu
+
+Some cross build systems e.g. yocto may use architectures different from cross compiler target tuple
+arm-yoe-gnueabi but build for armv7a, AC_CANONICAL_HOST will fail in
+this case even though target will be armv7a it will detect it as arm and
+disable armv7a specific optimization paths. This option provides the
+needed knob so it can be set explicitly e.g. --with-cpu=armv7a etc. if needed.
+
+Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c839c87..403728c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,7 +11,14 @@ else
+   AC_MSG_NOTICE([Compiling with dynamically linked libraries.])
+ fi
+ 
+-AC_CANONICAL_HOST
++AC_ARG_WITH(cpu, [  --with-cpu            define host cpu])
++
++if test -z "$with_cpu"
++then
++  AC_CANONICAL_HOST
++else
++  host_cpu=$with_cpu
++fi
+ # Checking for target cpu and setting custom configuration
+ # for the different platforms
+ AS_CASE(["$host_cpu"],
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
new file mode 100644
index 0000000000..48ff3ef93b
--- /dev/null
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
@@ -0,0 +1,103 @@
+From 9ab360fd018d267fe174713d7e14454408b26043 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Dec 2022 10:33:01 -0800
+Subject: [PATCH] Replace lfs64 functions and defines
+
+AC_SYS_LARGEFILE is already in use in configure.ac which detects
+enabling lfs64 functions as needed, it will define _FILE_OFFSET_BITS=64
+which should make lseek same as lseek64 since off_t is 64bit on most of
+current 32bit linux platforms
+
+Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/os.cc     | 18 ++++++------------
+ src/worker.cc |  6 +++---
+ 2 files changed, 9 insertions(+), 15 deletions(-)
+
+diff --git a/src/os.cc b/src/os.cc
+index 1928e0a..faa6068 100644
+--- a/src/os.cc
++++ b/src/os.cc
+@@ -142,7 +142,7 @@ int OsLayer::AddressMode() {
+ uint64 OsLayer::VirtualToPhysical(void *vaddr) {
+   uint64 frame, paddr, pfnmask, pagemask;
+   int pagesize = sysconf(_SC_PAGESIZE);
+-  off64_t off = ((uintptr_t)vaddr) / pagesize * 8;
++  off_t off = ((uintptr_t)vaddr) / pagesize * 8;
+   int fd = open(kPagemapPath, O_RDONLY);
+ 
+   /*
+@@ -154,7 +154,7 @@ uint64 OsLayer::VirtualToPhysical(void *vaddr) {
+   if (fd < 0)
+     return 0;
+ 
+-  if (lseek64(fd, off, SEEK_SET) != off || read(fd, &frame, 8) != 8) {
++  if (lseek(fd, off, SEEK_SET) != off || read(fd, &frame, 8) != 8) {
+     int err = errno;
+     string errtxt = ErrorString(err);
+     logprintf(0, "Process Error: failed to access %s with errno %d (%s)\n",
+@@ -607,9 +607,9 @@ bool OsLayer::AllocateTestMem(int64 length, uint64 paddr_base) {
+         dynamic_mapped_shmem_ = true;
+       } else {
+         // Do a full mapping here otherwise.
+-        shmaddr = mmap64(NULL, length, PROT_READ | PROT_WRITE,
+-                         MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
+-                         shm_object, 0);
++        shmaddr = mmap(NULL, length, PROT_READ | PROT_WRITE,
++                       MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
++                       shm_object, 0);
+         if (shmaddr == reinterpret_cast<void*>(-1)) {
+           int err = errno;
+           string errtxt = ErrorString(err);
+@@ -704,18 +704,12 @@ void *OsLayer::PrepareTestMem(uint64 offset, uint64 length) {
+   if (dynamic_mapped_shmem_) {
+     // TODO(nsanders): Check if we can support MAP_NONBLOCK,
+     // and evaluate performance hit from not using it.
+-#ifdef HAVE_MMAP64
+-    void * mapping = mmap64(NULL, length, PROT_READ | PROT_WRITE,
+-                     MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
+-                     shmid_, offset);
+-#else
+     void * mapping = mmap(NULL, length, PROT_READ | PROT_WRITE,
+                      MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
+                      shmid_, offset);
+-#endif
+     if (mapping == MAP_FAILED) {
+       string errtxt = ErrorString(errno);
+-      logprintf(0, "Process Error: PrepareTestMem mmap64(%llx, %llx) failed. "
++      logprintf(0, "Process Error: PrepareTestMem mmap(%llx, %llx) failed. "
+                    "error: %s.\n",
+                 offset, length, errtxt.c_str());
+       sat_assert(0);
+diff --git a/src/worker.cc b/src/worker.cc
+index 745a816..41e93a0 100644
+--- a/src/worker.cc
++++ b/src/worker.cc
+@@ -1705,7 +1705,7 @@ bool FileThread::WritePages(int fd) {
+   int strict = sat_->strict();
+ 
+   // Start fresh at beginning of file for each batch of pages.
+-  lseek64(fd, 0, SEEK_SET);
++  lseek(fd, 0, SEEK_SET);
+   for (int i = 0; i < sat_->disk_pages(); i++) {
+     struct page_entry src;
+     if (!GetValidPage(&src))
+@@ -1943,7 +1943,7 @@ bool FileThread::ReadPages(int fd) {
+   bool result = true;
+ 
+   // Read our data back out of the file, into it's new location.
+-  lseek64(fd, 0, SEEK_SET);
++  lseek(fd, 0, SEEK_SET);
+   for (int i = 0; i < sat_->disk_pages(); i++) {
+     struct page_entry dst;
+     if (!GetEmptyPage(&dst))
+@@ -3153,7 +3153,7 @@ bool DiskThread::ValidateBlockOnDisk(int fd, BlockData *block) {
+ 
+   // Read block from disk and time the read.  If it takes longer than the
+   // threshold, complain.
+-  if (lseek64(fd, address * kSectorSize, SEEK_SET) == -1) {
++  if (lseek(fd, address * kSectorSize, SEEK_SET) == -1) {
+     logprintf(0, "Process Error: Unable to seek to sector %lld in "
+               "DiskThread::ValidateSectorsOnDisk on disk %s "
+               "(thread %d).\n", address, device_name_.c_str(), thread_num_);
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch
new file mode 100644
index 0000000000..b21a534d94
--- /dev/null
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch
@@ -0,0 +1,43 @@
+From d64a282b57352dde5f5b007947c005e504dc9a6b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Dec 2022 10:46:31 -0800
+Subject: [PATCH] configure: Check for pthread_rwlockattr_setkind_np before use
+
+musl does not implement this therefore detect this non-posix API before
+using it
+
+Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac  | 1 +
+ src/worker.cc | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 403728c..47968cb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -157,6 +157,7 @@ AC_FUNC_STRERROR_R
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS([ftruncate gettimeofday memset munmap select socket strtol strtoull])
+ AC_CHECK_FUNCS([mmap64 posix_memalign rand_r sched_getaffinity])
++AC_CHECK_FUNCS([pthread_rwlockattr_setkind_np])
+ 
+ AC_CONFIG_FILES([Makefile src/Makefile])
+ AC_OUTPUT
+diff --git a/src/worker.cc b/src/worker.cc
+index 41e93a0..c4abc87 100644
+--- a/src/worker.cc
++++ b/src/worker.cc
+@@ -133,9 +133,11 @@ void WorkerStatus::Initialize() {
+ 
+   pthread_rwlockattr_t attrs;
+   sat_assert(0 == pthread_rwlockattr_init(&attrs));
++#ifdef HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP
+   // Avoid writer lock starvation.
+   sat_assert(0 == pthread_rwlockattr_setkind_np(
+                       &attrs, PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP));
++#endif
+   sat_assert(0 == pthread_rwlock_init(&status_rwlock_, &attrs));
+ 
+ #ifdef HAVE_PTHREAD_BARRIERS
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
index f5e7da359d..8754e40697 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
@@ -11,7 +11,7 @@ Fixes
 ./sattypes.h:33:17: error: expected namespace name
 using namespace __gnu_cxx; //NOLINT
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- stressapptest-1.0.9.orig/src/sattypes.h
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
index 8c251aeb97..19261657ac 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
@@ -2,7 +2,7 @@ sysconf params like _SC_LEVEL1_DCACHE_LINESIZE are not universally
 implemented, therefore check for them being available, if not there
 then read the sysfs directly to get the value
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/src/sat.cc
 +++ b/src/sat.cc
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
index c8b9ca7cb9..02144c558a 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
@@ -13,10 +13,18 @@ SRCREV = "9146a8bfe3e3daefa95f7a61b75183e5fc64af2c"
 
 PV .= "+1.0.10git${SRCPV}"
 
+EXTRA_AUTOCONF:append:armv7a = " --with-cpu=armv7a"
+EXTRA_AUTOCONF:append:armv7ve = " --with-cpu=armv7a"
+
+GI_DATA_ENABLED:libc-musl:armv7a = "False"
+GI_DATA_ENABLED:libc-musl:armv7ve = "False"
 SRC_URI = "git://github.com/stressapptest/stressapptest;branch=master;protocol=https \
            file://libcplusplus-compat.patch \
            file://read_sysfs_for_cachesize.patch \
-          "
+           file://0001-configure-Add-with-cpu.patch \
+           file://0002-Replace-lfs64-functions-and-defines.patch \
+           file://0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.39.0


