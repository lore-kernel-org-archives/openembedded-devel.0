Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2F61774DCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x23-v6so1500618pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fVoqnR2xOKUd9fMm5JXK0Tw88nGHL+lJRt+SIsWmof8=;
	b=Gu5L0XlmFzWJfXV5nPQIWO0QBTGezHHlfFOeJ8cSCVOmOR7QN5BzgJC+UD55cBHhOO
	KGUgBK+hrv0i7AfjK6XaClCLSCntpnzojZBOGXcxzc2SQuPb12VE6PcZ7vSFZwFTa7Uq
	Ff+Zn2kLgVnRKSGb/71V4ej6QpkEwqtD2YhS8bTDGbCIRCWh7XoHMKZpCTvl2S2iD63E
	FoFDzyhyXRSgJQu0Tb2kMlk3UJM1RS/bUXRg9N2KWvWaWo1YwjHNxVviVZk+XKBPJOgK
	G//EiK12GJgDcv6Tx7Hvsw8jtTx9ChngtOVZ4ZlELpOSi3lbdlTxRK6zc/V0yvbc4G8z
	CFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fVoqnR2xOKUd9fMm5JXK0Tw88nGHL+lJRt+SIsWmof8=;
	b=Orv8li0C/tRY7Hh/WzChm8VnZTymaZcXfv+DLphVdfufHdnkwv1TDms+dXJweMueQZ
	ZRKraiPuk1OVDRBbXQIWxM3MbKSl+sQJSFCvr9/A8M0EJ7TSwbvatZP3V1xt1L41g1TK
	knPniZqjdL5YTg1TRSCL9ASnNrKsY5LEqYFdCs+lcDTuqe/JUiCWwGBUmd1nx0gpOviG
	LqFLGcDkkqk2WqLVtN8RlAC5Wdv9msAiKImPhDRw8rkT1F+CFm3cupIasYGofjmTYiY6
	rDrdkR/5IfM+RjQ658MLq/LClmtkcJ2aomDLL+JJgO0bXN76/XfyT/SJNzLzU4G7EtWb
	5O0Q==
X-Gm-Message-State: APt69E03T8m7TP680XwLaYI0vLIEm8W7kugr/UPo5IhvEnfOoRs30ldj
	9BCUfW4UX0foImbXAt8fq/yugA==
X-Google-Smtp-Source: ADUXVKJXQQJ/FLa+cPjoKngbUvf7zskGuKq/4rd6sqQei8vdztrVvDWJ+xbp4F0EzcV75Z7C7VolaQ==
X-Received: by 2002:a65:5b4c:: with SMTP id
	y12-v6mr8430197pgr.442.1529867972854; 
	Sun, 24 Jun 2018 12:19:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:29 -0700
Message-Id: <20180624191845.31082-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/20] libhugetlbfs: Fix build on musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jun 2018 19:19:32 -0000

needs more runtime testing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-stddef.h-for-ptrdiff_t.patch | 25 ++++++++++
 .../0002-Mark-glibc-specific-code-so.patch    | 39 +++++++++++++++
 ...sconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch | 49 +++++++++++++++++++
 ...shm.c-Mark-glibc-specific-changes-so.patch | 30 ++++++++++++
 .../0005-Include-dirent.h-for-ino_t.patch     | 28 +++++++++++
 .../0006-include-limits.h-for-PATH_MAX.patch  | 42 ++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb          |  6 +++
 7 files changed, 219 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
new file mode 100644
index 0000000000..bae90b4edc
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
@@ -0,0 +1,25 @@
+From d3c2187716a0a1f9359a869ca383c129603554d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 19:25:57 -0700
+Subject: [PATCH 1/6] include stddef.h for ptrdiff_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ morecore.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/morecore.c b/morecore.c
+index 62ad252..c5981d2 100644
+--- a/morecore.c
++++ b/morecore.c
+@@ -19,6 +19,7 @@
+ 
+ #define _GNU_SOURCE
+ 
++#include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <malloc.h>
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
new file mode 100644
index 0000000000..4354d78615
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
@@ -0,0 +1,39 @@
+From b72bf6a81fa879f32a074fe53776fc8291c83b6f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 19:32:59 -0700
+Subject: [PATCH 2/6] Mark glibc specific code so
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ morecore.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/morecore.c b/morecore.c
+index c5981d2..ec9fafa 100644
+--- a/morecore.c
++++ b/morecore.c
+@@ -347,6 +347,7 @@ void hugetlbfs_setup_morecore(void)
+ 
+ 	INFO("setup_morecore(): heapaddr = 0x%lx\n", heapaddr);
+ 
++#ifdef __GLIBC__
+ 	heaptop = heapbase = (void *)heapaddr;
+ 	if (__hugetlb_opts.thp_morecore)
+ 		__morecore = &thp_morecore;
+@@ -354,7 +355,6 @@ void hugetlbfs_setup_morecore(void)
+ 		__morecore = &hugetlbfs_morecore;
+ 
+ 	/* Set some allocator options more appropriate for hugepages */
+-
+ 	if (__hugetlb_opts.shrink_ok)
+ 		mallopt(M_TRIM_THRESHOLD, hpage_size / 2);
+ 	else
+@@ -364,4 +364,5 @@ void hugetlbfs_setup_morecore(void)
+ 	 * This doesn't appear to prohibit malloc() from falling back
+ 	 * to mmap() if we run out of hugepages. */
+ 	mallopt(M_MMAP_MAX, 0);
++#endif
+ }
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
new file mode 100644
index 0000000000..f6d8a10a9a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
@@ -0,0 +1,49 @@
+From 3d6ab5ea8e23f96ee6fdd915e05acd9a751dd876 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 19:44:26 -0700
+Subject: [PATCH 3/6] alloc.c: Avoid sysconf(_SC_LEVEL2_CACHE_LINESIZE) on
+ linux
+
+musl does not have it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ alloc.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/alloc.c b/alloc.c
+index bce9464..cf7eb40 100644
+--- a/alloc.c
++++ b/alloc.c
+@@ -245,6 +245,19 @@ void free_huge_pages(void *ptr)
+ 	__free_huge_pages(ptr, 1);
+ }
+ 
++static size_t get_cacheline_size() {
++#if defined(__linux__)
++	FILE * fp = fopen("/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size", "r");
++	unsigned int line_size = 0;
++	if (fp) {
++		fscanf(fp, "%d", &line_size);
++		fclose(fp);
++	}
++	return line_size;
++#else
++	return sysconf(_SC_LEVEL2_CACHE_LINESIZE);
++#endif
++}
+ /*
+  * Offset the buffer using bytes wasted due to alignment to avoid using the
+  * same cache lines for the start of every buffer returned by
+@@ -261,7 +274,7 @@ void *cachecolor(void *buf, size_t len, size_t color_bytes)
+ 
+ 	/* Lookup our cacheline size once */
+ 	if (cacheline_size == 0) {
+-		cacheline_size = sysconf(_SC_LEVEL2_CACHE_LINESIZE);
++		cacheline_size = get_cacheline_size();
+ 		linemod = time(NULL);
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
new file mode 100644
index 0000000000..960e152939
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
@@ -0,0 +1,30 @@
+From 7002dec46dae375e8aa1aa8577a5b274c02fc697 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 19:48:04 -0700
+Subject: [PATCH 4/6] shm.c: Mark glibc specific changes so
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ shm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/shm.c b/shm.c
+index 1f82cab..9447b63 100644
+--- a/shm.c
++++ b/shm.c
+@@ -48,10 +48,11 @@
+  * system shmget() may be performed without worry as there is no dynamic
+  * call chain.
+  */
++#ifdef __GLIBC__
+ extern void *dlsym (void *__restrict __handle, __const char *__restrict __name)
+ 		__attribute__((weak)) __THROW __nonnull ((2));
+ extern char *dlerror (void) __attribute__((weak)) __THROW;
+-
++#endif
+ 
+ /* call syscall shmget through the generic syscall mechanism */
+ static int syscall_shmget(key_t key, size_t size, int shmflg)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
new file mode 100644
index 0000000000..543302b135
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
@@ -0,0 +1,28 @@
+From 87ed1706f426ed27fc4eeca7c3b09a4086c9a2a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 19:51:02 -0700
+Subject: [PATCH 5/6] Include dirent.h for ino_t
+
+Fixes
+error: unknown type name 'ino_t'; did you mean 'int'?
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/hugetests.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/hugetests.h b/tests/hugetests.h
+index 8b1d8d9..056042c 100644
+--- a/tests/hugetests.h
++++ b/tests/hugetests.h
+@@ -22,6 +22,7 @@
+ 
+ #include <errno.h>
+ #include <string.h>
++#include <dirent.h>
+ 
+ #include "libhugetlbfs_privutils.h"
+ #include "libhugetlbfs_testprobes.h"
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 0000000000..35dd6e11cc
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,42 @@
+From 96c012ea31a2d124528f3b6f3b9857b71b059db3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 19:58:53 -0700
+Subject: [PATCH 6/6] include limits.h for PATH_MAX
+
+Fixes
+
+error: 'PATH_MAX' undeclared
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hugeadm.c                | 1 +
+ tests/gethugepagesizes.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/hugeadm.c b/hugeadm.c
+index fe4211d..8db274c 100644
+--- a/hugeadm.c
++++ b/hugeadm.c
+@@ -33,6 +33,7 @@
+ #include <grp.h>
+ #include <pwd.h>
+ #include <fcntl.h>
++#include <limits.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
+index 9551b38..2645e3f 100644
+--- a/tests/gethugepagesizes.c
++++ b/tests/gethugepagesizes.c
+@@ -29,6 +29,7 @@
+ #include <fcntl.h>
+ #include <stdarg.h>
+ #include <hugetlbfs.h>
++#include <limits.h>
+ 
+ #include "hugetests.h"
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index ee1b9d0507..14c909e758 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -19,6 +19,12 @@ SRC_URI = " \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
     file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
+    file://0001-include-stddef.h-for-ptrdiff_t.patch \
+    file://0002-Mark-glibc-specific-code-so.patch \
+    file://0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch \
+    file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
+    file://0005-Include-dirent.h-for-ino_t.patch \
+    file://0006-include-limits.h-for-PATH_MAX.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.18.0


