Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D990E95A7E
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 00:26:14 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.29497.1696724765532747569
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Oct 2023 17:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIcpfp1u;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c5c91bece9so26104495ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 17:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696724765; x=1697329565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUnBQERKRR7fhg6+AhKosfDz6CpFZezfLAXZjCKsY/c=;
        b=HIcpfp1ul+cwYUv5Ux9UQVEGwhqRlN+j3X0u5CR2XhxEJZOGJR5XVOkW+cLLGerJVW
         U7MEZl6CG6lm+yEg4EQ9i110+Cvfp9VQMGfxn9RnbkYS81NFOHzViapmlA8XyMPxjoAZ
         MwUAA2aQDbfvABwPTO3bbcDtOeMYE1P7HYxDrvRdPxgnSG5mNQZuWkwslrGh3ua4DySv
         yAzBZvuZttOWjZUcM1CR1fiW78cXzQhIPGalCI2GtIxbpH0f4nxJnqFB/uvv7wYf5BO3
         j4gW0fN263z8MvQIoDcic2aZO9puE6x1jZq3/xHRy7d8XeZVVgXVJ66XmZspd1aFY7tu
         W+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696724765; x=1697329565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUnBQERKRR7fhg6+AhKosfDz6CpFZezfLAXZjCKsY/c=;
        b=Ow6uQusTClYP8GtUIjfW5SeCwjLgSQGwBy42H4PzVCHzRnVD5ZSLSCCa1A07ILFsRF
         W8eKxELU5R+/ymBFhTLvteTE80NCr81781lsxXELXrkgchBsW7My+o0TOcgLtyxsct4v
         jul+0V0U9FRZcPSQnXMTBXjl5tivxurf2ND56FUrMFu/j/a3tmFt+AuDbkUT76VfUSG4
         g+C5wMlT1LdJXkpCVzBVag3rpTwknXrB6DCYxr6A/f3rWH2idgvS2W0ubEvCLbs7kcM0
         g6p74DzaATxATg6EIG2Hu4t9LBxABeB/bvL7dp7mbzB6HN7zvduSliHiql12A+ZtTGbS
         pZpA==
X-Gm-Message-State: AOJu0YxZi9X1XPzkNZ+Z6OC6u3UeAwRxgKTKkuSBY/xekMHkRE9XUeVz
	Rsm5WPtJ9x26lPfgBiQo98+UPvJWBkAfEg==
X-Google-Smtp-Source: AGHT+IFCcAAUm3Hz/ZitL87lX70k0PlFl6QpFWDsOKo/h58fnE7XQFOoSEU7Y9SOPAqrEnOitonyDg==
X-Received: by 2002:a05:6a00:3a08:b0:690:cae9:714d with SMTP id fj8-20020a056a003a0800b00690cae9714dmr11942790pfb.13.1696724764259;
        Sat, 07 Oct 2023 17:26:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id r19-20020aa78453000000b00688965c5227sm3699367pfn.120.2023.10.07.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 17:26:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] stressapptest: Upgrade to 1.0.11 release
Date: Sat,  7 Oct 2023 17:26:00 -0700
Message-ID: <20231008002600.2487946-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 00:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105381

Drop patches already in this upstream version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-Add-with-cpu.patch         |  37 -------
 ...-Replace-lfs64-functions-and-defines.patch | 103 ------------------
 ...for-pthread_rwlockattr_setkind_np-be.patch |  43 --------
 .../stressapptest/libcplusplus-compat.patch   |  28 -----
 .../read_sysfs_for_cachesize.patch            |  72 ------------
 ...ptest_1.0.9.bb => stressapptest_1.0.11.bb} |  12 +-
 6 files changed, 2 insertions(+), 293 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
 delete mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
 delete mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch
 delete mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
 delete mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
 rename meta-oe/recipes-benchmark/stressapptest/{stressapptest_1.0.9.bb => stressapptest_1.0.11.bb} (66%)

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
deleted file mode 100644
index 41fb456c6c..0000000000
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0001-configure-Add-with-cpu.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 73049e5a9e3698cc6d51471d70ac5e06bed803cc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Dec 2022 10:24:48 -0800
-Subject: [PATCH] configure: Add --with-cpu
-
-Some cross build systems e.g. yocto may use architectures different from cross compiler target tuple
-arm-yoe-gnueabi but build for armv7a, AC_CANONICAL_HOST will fail in
-this case even though target will be armv7a it will detect it as arm and
-disable armv7a specific optimization paths. This option provides the
-needed knob so it can be set explicitly e.g. --with-cpu=armv7a etc. if needed.
-
-Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c839c87..403728c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -11,7 +11,14 @@ else
-   AC_MSG_NOTICE([Compiling with dynamically linked libraries.])
- fi
- 
--AC_CANONICAL_HOST
-+AC_ARG_WITH(cpu, [  --with-cpu            define host cpu])
-+
-+if test -z "$with_cpu"
-+then
-+  AC_CANONICAL_HOST
-+else
-+  host_cpu=$with_cpu
-+fi
- # Checking for target cpu and setting custom configuration
- # for the different platforms
- AS_CASE(["$host_cpu"],
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
deleted file mode 100644
index 48ff3ef93b..0000000000
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0002-Replace-lfs64-functions-and-defines.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 9ab360fd018d267fe174713d7e14454408b26043 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Dec 2022 10:33:01 -0800
-Subject: [PATCH] Replace lfs64 functions and defines
-
-AC_SYS_LARGEFILE is already in use in configure.ac which detects
-enabling lfs64 functions as needed, it will define _FILE_OFFSET_BITS=64
-which should make lseek same as lseek64 since off_t is 64bit on most of
-current 32bit linux platforms
-
-Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/os.cc     | 18 ++++++------------
- src/worker.cc |  6 +++---
- 2 files changed, 9 insertions(+), 15 deletions(-)
-
-diff --git a/src/os.cc b/src/os.cc
-index 1928e0a..faa6068 100644
---- a/src/os.cc
-+++ b/src/os.cc
-@@ -142,7 +142,7 @@ int OsLayer::AddressMode() {
- uint64 OsLayer::VirtualToPhysical(void *vaddr) {
-   uint64 frame, paddr, pfnmask, pagemask;
-   int pagesize = sysconf(_SC_PAGESIZE);
--  off64_t off = ((uintptr_t)vaddr) / pagesize * 8;
-+  off_t off = ((uintptr_t)vaddr) / pagesize * 8;
-   int fd = open(kPagemapPath, O_RDONLY);
- 
-   /*
-@@ -154,7 +154,7 @@ uint64 OsLayer::VirtualToPhysical(void *vaddr) {
-   if (fd < 0)
-     return 0;
- 
--  if (lseek64(fd, off, SEEK_SET) != off || read(fd, &frame, 8) != 8) {
-+  if (lseek(fd, off, SEEK_SET) != off || read(fd, &frame, 8) != 8) {
-     int err = errno;
-     string errtxt = ErrorString(err);
-     logprintf(0, "Process Error: failed to access %s with errno %d (%s)\n",
-@@ -607,9 +607,9 @@ bool OsLayer::AllocateTestMem(int64 length, uint64 paddr_base) {
-         dynamic_mapped_shmem_ = true;
-       } else {
-         // Do a full mapping here otherwise.
--        shmaddr = mmap64(NULL, length, PROT_READ | PROT_WRITE,
--                         MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
--                         shm_object, 0);
-+        shmaddr = mmap(NULL, length, PROT_READ | PROT_WRITE,
-+                       MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
-+                       shm_object, 0);
-         if (shmaddr == reinterpret_cast<void*>(-1)) {
-           int err = errno;
-           string errtxt = ErrorString(err);
-@@ -704,18 +704,12 @@ void *OsLayer::PrepareTestMem(uint64 offset, uint64 length) {
-   if (dynamic_mapped_shmem_) {
-     // TODO(nsanders): Check if we can support MAP_NONBLOCK,
-     // and evaluate performance hit from not using it.
--#ifdef HAVE_MMAP64
--    void * mapping = mmap64(NULL, length, PROT_READ | PROT_WRITE,
--                     MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
--                     shmid_, offset);
--#else
-     void * mapping = mmap(NULL, length, PROT_READ | PROT_WRITE,
-                      MAP_SHARED | MAP_NORESERVE | MAP_LOCKED | MAP_POPULATE,
-                      shmid_, offset);
--#endif
-     if (mapping == MAP_FAILED) {
-       string errtxt = ErrorString(errno);
--      logprintf(0, "Process Error: PrepareTestMem mmap64(%llx, %llx) failed. "
-+      logprintf(0, "Process Error: PrepareTestMem mmap(%llx, %llx) failed. "
-                    "error: %s.\n",
-                 offset, length, errtxt.c_str());
-       sat_assert(0);
-diff --git a/src/worker.cc b/src/worker.cc
-index 745a816..41e93a0 100644
---- a/src/worker.cc
-+++ b/src/worker.cc
-@@ -1705,7 +1705,7 @@ bool FileThread::WritePages(int fd) {
-   int strict = sat_->strict();
- 
-   // Start fresh at beginning of file for each batch of pages.
--  lseek64(fd, 0, SEEK_SET);
-+  lseek(fd, 0, SEEK_SET);
-   for (int i = 0; i < sat_->disk_pages(); i++) {
-     struct page_entry src;
-     if (!GetValidPage(&src))
-@@ -1943,7 +1943,7 @@ bool FileThread::ReadPages(int fd) {
-   bool result = true;
- 
-   // Read our data back out of the file, into it's new location.
--  lseek64(fd, 0, SEEK_SET);
-+  lseek(fd, 0, SEEK_SET);
-   for (int i = 0; i < sat_->disk_pages(); i++) {
-     struct page_entry dst;
-     if (!GetEmptyPage(&dst))
-@@ -3153,7 +3153,7 @@ bool DiskThread::ValidateBlockOnDisk(int fd, BlockData *block) {
- 
-   // Read block from disk and time the read.  If it takes longer than the
-   // threshold, complain.
--  if (lseek64(fd, address * kSectorSize, SEEK_SET) == -1) {
-+  if (lseek(fd, address * kSectorSize, SEEK_SET) == -1) {
-     logprintf(0, "Process Error: Unable to seek to sector %lld in "
-               "DiskThread::ValidateSectorsOnDisk on disk %s "
-               "(thread %d).\n", address, device_name_.c_str(), thread_num_);
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch
deleted file mode 100644
index b21a534d94..0000000000
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d64a282b57352dde5f5b007947c005e504dc9a6b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Dec 2022 10:46:31 -0800
-Subject: [PATCH] configure: Check for pthread_rwlockattr_setkind_np before use
-
-musl does not implement this therefore detect this non-posix API before
-using it
-
-Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac  | 1 +
- src/worker.cc | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 403728c..47968cb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -157,6 +157,7 @@ AC_FUNC_STRERROR_R
- AC_FUNC_VPRINTF
- AC_CHECK_FUNCS([ftruncate gettimeofday memset munmap select socket strtol strtoull])
- AC_CHECK_FUNCS([mmap64 posix_memalign rand_r sched_getaffinity])
-+AC_CHECK_FUNCS([pthread_rwlockattr_setkind_np])
- 
- AC_CONFIG_FILES([Makefile src/Makefile])
- AC_OUTPUT
-diff --git a/src/worker.cc b/src/worker.cc
-index 41e93a0..c4abc87 100644
---- a/src/worker.cc
-+++ b/src/worker.cc
-@@ -133,9 +133,11 @@ void WorkerStatus::Initialize() {
- 
-   pthread_rwlockattr_t attrs;
-   sat_assert(0 == pthread_rwlockattr_init(&attrs));
-+#ifdef HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP
-   // Avoid writer lock starvation.
-   sat_assert(0 == pthread_rwlockattr_setkind_np(
-                       &attrs, PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP));
-+#endif
-   sat_assert(0 == pthread_rwlock_init(&status_rwlock_, &attrs));
- 
- #ifdef HAVE_PTHREAD_BARRIERS
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
deleted file mode 100644
index 8754e40697..0000000000
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix compile on sytems using libc++ instead of libstdc++
-
-libc++ does not really implement __gnu_cxx namespace and it
-compiles fine without this namespace, therefore detect libc++
-and if it is used them exclude this namespace 
-
-See https://github.com/stressapptest/stressapptest/issues/47
-
-Fixes
-
-./sattypes.h:33:17: error: expected namespace name
-using namespace __gnu_cxx; //NOLINT
-
-Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- stressapptest-1.0.9.orig/src/sattypes.h
-+++ stressapptest-1.0.9/src/sattypes.h
-@@ -30,7 +30,9 @@
- #include "stressapptest_config_android.h"  // NOLINT
- #else
- #include "stressapptest_config.h"  // NOLINT
-+#ifndef _LIBCPP_VERSION
- using namespace __gnu_cxx;  //NOLINT
-+#endif  // _LIBCPP_VERSION
- #endif  // __ANDROID__
- using namespace std;
-
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
deleted file mode 100644
index 19261657ac..0000000000
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-sysconf params like _SC_LEVEL1_DCACHE_LINESIZE are not universally
-implemented, therefore check for them being available, if not there
-then read the sysfs directly to get the value
-
-Upstream-Status: Submitted [https://github.com/stressapptest/stressapptest/pull/100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/src/sat.cc
-+++ b/src/sat.cc
-@@ -1482,15 +1482,47 @@ int Sat::CpuCount() {
-   return sysconf(_SC_NPROCESSORS_CONF);
- }
- 
-+int Sat::ReadInt(const char *filename, int *value) {
-+  char line[64];
-+  int fd = open(filename, O_RDONLY), err = -1;
-+
-+  if (fd < 0)
-+    return -1;
-+  if (read(fd, line, sizeof(line)) > 0) {
-+    *value = atoi(line);
-+    err = 0;
-+  }
-+
-+  close(fd);
-+  return err;
-+}
-+
- // Return the worst case (largest) cache line size of the various levels of
- // cache actually prsent in the machine.
- int Sat::CacheLineSize() {
--  int max_linesize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
--  int linesize = sysconf(_SC_LEVEL2_CACHE_LINESIZE);
-+  int max_linesize, linesize;
-+#ifdef _SC_LEVEL1_DCACHE_LINESIZE
-+  max_linesize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
-+#else
-+  ReadInt("/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size", &max_linesize);
-+#endif
-+#ifdef _SC_LEVEL2_DCACHE_LINESIZE
-+  linesize = sysconf(_SC_LEVEL2_DCACHE_LINESIZE);
-+#else
-+  ReadInt("/sys/devices/system/cpu/cpu0/cache/index1/coherency_line_size", &linesize);
-+#endif
-   if (linesize > max_linesize) max_linesize = linesize;
--  linesize = sysconf(_SC_LEVEL3_CACHE_LINESIZE);
-+#ifdef _SC_LEVEL3_DCACHE_LINESIZE
-+  linesize = sysconf(_SC_LEVEL3_DCACHE_LINESIZE);
-+#else
-+  ReadInt("/sys/devices/system/cpu/cpu0/cache/index2/coherency_line_size", &linesize);
-+#endif
-   if (linesize > max_linesize) max_linesize = linesize;
--  linesize = sysconf(_SC_LEVEL4_CACHE_LINESIZE);
-+#ifdef _SC_LEVEL4_DCACHE_LINESIZE
-+  linesize = sysconf(_SC_LEVEL4_DCACHE_LINESIZE);
-+#else
-+  ReadInt("/sys/devices/system/cpu/cpu0/cache/index3/coherency_line_size", &linesize);
-+#endif
-   if (linesize > max_linesize) max_linesize = linesize;
-   return max_linesize;
- }
---- a/src/sat.h
-+++ b/src/sat.h
-@@ -136,7 +136,8 @@ class Sat {
-   int CpuCount();
-   // Return the worst-case (largest) cache line size of the system.
-   int CacheLineSize();
--
-+  // Read int values from kernel file system e.g. sysfs
-+  int ReadInt(const char *filename, int *value);
-   // Collect error counts from threads.
-   int64 GetTotalErrorCount();
- 
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
similarity index 66%
rename from meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
rename to meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
index 02144c558a..ba61ff971e 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
@@ -9,22 +9,14 @@ SECTION = "benchmark"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
 
-SRCREV = "9146a8bfe3e3daefa95f7a61b75183e5fc64af2c"
-
-PV .= "+1.0.10git${SRCPV}"
+SRCREV = "25e31a2c1fcc66f3a43e91998f0819b016322a70"
 
 EXTRA_AUTOCONF:append:armv7a = " --with-cpu=armv7a"
 EXTRA_AUTOCONF:append:armv7ve = " --with-cpu=armv7a"
 
 GI_DATA_ENABLED:libc-musl:armv7a = "False"
 GI_DATA_ENABLED:libc-musl:armv7ve = "False"
-SRC_URI = "git://github.com/stressapptest/stressapptest;branch=master;protocol=https \
-           file://libcplusplus-compat.patch \
-           file://read_sysfs_for_cachesize.patch \
-           file://0001-configure-Add-with-cpu.patch \
-           file://0002-Replace-lfs64-functions-and-defines.patch \
-           file://0003-configure-Check-for-pthread_rwlockattr_setkind_np-be.patch \
-           "
+SRC_URI = "git://github.com/stressapptest/stressapptest;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


