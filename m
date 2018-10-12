Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D33B0745FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 19:36:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y18-v6so6307459pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s+o+B62XpvR+nisYpQ60qwJPTufUQcYi4I9SdNjTduE=;
	b=UburCSxXeaVPtk5p4vVUengJfA6VbaUkdpq8wQHc30WVLREHtQ/MBkfzulEOHU8lH7
	kDOsCya7w1fpb+iUN/QYoPnWXIaUtoSufBITrrQzvZNHYmBlRz3W24RdatAmAFO5rUGX
	/YfnO6oGVPcdYp7VQO549SDeOksxZ+G0nBJoPe3BVGaAnrsO3+o6ZhzHdzFri7vGv2nS
	f+X+Z+xFL9gehWW2Ossv7G4qC5DwzmDFhCa4BVEzj68l7YNCOuUVInrsRiqLKbVKs4L6
	JGcPMahZ0GqWw+/APMylEgGMhjGM8zysz4XquEQaCwB+b8iNM1kmeDWEksLZLhLbJZU3
	kYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s+o+B62XpvR+nisYpQ60qwJPTufUQcYi4I9SdNjTduE=;
	b=QDuoGKt8jO3Sp4BKFhF1sRPcnykX4hMrlZ0l9rMDHaVmAxdEIpGBgl5RDiTCnI9U+l
	N/DTL1Z68sOzHuIpTSFvFBMkonKid0Tr5Kt2eUdyf9Nvvi1L4CNXaEg5QwLrhBppfByL
	gYSiXsjDuUd7+yukkkH9EhOkuLju03BDYQdGa8aSgZ/2MypGKTl986AyNq9pIcD7IE/i
	Vppi6z2QGWn5iJQO1/r2EGRmxyVhivoWTkuqg2LtNFEKEttwIx6713fA5Fcx4lBpVWma
	HnD42GWIHyCjU4STPUjXt9mTJZQZTt0QOWUOyP/J0s24XPwbCP7uJLlfqRZHW8wNaWVE
	lPGw==
X-Gm-Message-State: ABuFfojU6C7154C8/MOv2MipAjydW8oJRGvwcHixYLJAlFGLcia0t1+X
	l6BJSQKJ6APodCzzeeOdk2Q3N1uQ
X-Google-Smtp-Source: ACcGV62O/nllTWhiFa1wJ4Bi/DaAoRqWsb8oAobqdQTHMVRWvdGNr9Mko9H0n787BTBGpIsOr/SwXg==
X-Received: by 2002:aa7:8715:: with SMTP id
	b21-v6mr7301896pfo.250.1539372965108; 
	Fri, 12 Oct 2018 12:36:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	e64-v6sm3089777pfe.55.2018.10.12.12.36.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 12:36:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 12:35:55 -0700
Message-Id: <20181012193555.10580-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libhugetlbfs: Refresh patches with devtool
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
X-List-Received-Date: Fri, 12 Oct 2018 19:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes devtool happy as per
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Daniel Díaz <daniel.diaz@linaro.org>
---
 .../0001-include-stddef.h-for-ptrdiff_t.patch | 10 ++++------
 ...ot-use-hard-coded-path-.-obj-hugeadm.patch | 14 ++++++-------
 .../0002-Mark-glibc-specific-code-so.patch    | 18 ++++++++---------
 ...sconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch |  9 +++------
 ...shm.c-Mark-glibc-specific-changes-so.patch |  8 +++-----
 .../0005-Include-dirent.h-for-ino_t.patch     |  8 +++-----
 .../0006-include-limits.h-for-PATH_MAX.patch  |  8 +++-----
 ...id-search-host-library-path-for-cros.patch | 20 +++++++++----------
 ..._i386-avoid-search-host-library-path.patch | 13 ++++++------
 ...B32-and-LIB64-if-they-point-to-the-s.patch | 11 +++++-----
 ...ile-install-static-4G-edge-testcases.patch | 17 +++++++++++++---
 11 files changed, 65 insertions(+), 71 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
index bae90b4edc..a84414c024 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
@@ -1,15 +1,16 @@
-From d3c2187716a0a1f9359a869ca383c129603554d9 Mon Sep 17 00:00:00 2001
+From 351d1de09dd80049b7a2cb02c5750635d0389873 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:25:57 -0700
-Subject: [PATCH 1/6] include stddef.h for ptrdiff_t
+Subject: [PATCH] include stddef.h for ptrdiff_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  morecore.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/morecore.c b/morecore.c
-index 62ad252..c5981d2 100644
+index 6563bbd..0eef782 100644
 --- a/morecore.c
 +++ b/morecore.c
 @@ -19,6 +19,7 @@
@@ -20,6 +21,3 @@ index 62ad252..c5981d2 100644
  #include <stdio.h>
  #include <stdlib.h>
  #include <malloc.h>
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
index 3082d7ef5f..53f35abb7b 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
@@ -1,4 +1,4 @@
-From a85fc43243f8bfad12d306a4a0e230fb8b3e828a Mon Sep 17 00:00:00 2001
+From 0077532b07e268347cb8557be6d70148d5f0e840 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 21 Aug 2013 15:44:57 +0800
 Subject: [PATCH] run_test.py: not use hard coded path ../obj/hugeadm
@@ -9,15 +9,16 @@ After 'make install', we can use hugeadm utility under DESTDIR.
 Upstream-Status: Submitted
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
+
 ---
- tests/run_tests.py |   12 +++++++++++-
- 1 files changed, 11 insertions(+), 1 deletions(-)
+ tests/run_tests.py | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/tests/run_tests.py b/tests/run_tests.py
-index d9a6b35..a9bab8f 100755
+index 3c95a03..560df6b 100755
 --- a/tests/run_tests.py
 +++ b/tests/run_tests.py
-@@ -232,9 +232,19 @@ def get_pagesizes():
+@@ -234,9 +234,19 @@ def get_pagesizes():
      Use libhugetlbfs' hugeadm utility to get a list of page sizes that have
      active mount points and at least one huge page allocated to the pool.
      """
@@ -38,6 +39,3 @@ index d9a6b35..a9bab8f 100755
      if rc != 0 or out == "": return sizes
  
      for size in out.split("\n"): sizes.add(int(size))
--- 
-1.7.3.4
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
index 4354d78615..8cb184a651 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
@@ -1,18 +1,19 @@
-From b72bf6a81fa879f32a074fe53776fc8291c83b6f Mon Sep 17 00:00:00 2001
+From 0f548286848c70aa325c6748d80e8651389b4938 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:32:59 -0700
-Subject: [PATCH 2/6] Mark glibc specific code so
+Subject: [PATCH] Mark glibc specific code so
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  morecore.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/morecore.c b/morecore.c
-index c5981d2..ec9fafa 100644
+index 0eef782..d48509c 100644
 --- a/morecore.c
 +++ b/morecore.c
-@@ -347,6 +347,7 @@ void hugetlbfs_setup_morecore(void)
+@@ -364,6 +364,7 @@ void hugetlbfs_setup_morecore(void)
  
  	INFO("setup_morecore(): heapaddr = 0x%lx\n", heapaddr);
  
@@ -20,20 +21,17 @@ index c5981d2..ec9fafa 100644
  	heaptop = heapbase = (void *)heapaddr;
  	if (__hugetlb_opts.thp_morecore)
  		__morecore = &thp_morecore;
-@@ -354,7 +355,6 @@ void hugetlbfs_setup_morecore(void)
+@@ -371,7 +372,6 @@ void hugetlbfs_setup_morecore(void)
  		__morecore = &hugetlbfs_morecore;
  
  	/* Set some allocator options more appropriate for hugepages */
 -
  	if (__hugetlb_opts.shrink_ok)
- 		mallopt(M_TRIM_THRESHOLD, hpage_size / 2);
+ 		mallopt(M_TRIM_THRESHOLD, hpage_size + hpage_size / 2);
  	else
-@@ -364,4 +364,5 @@ void hugetlbfs_setup_morecore(void)
+@@ -381,4 +381,5 @@ void hugetlbfs_setup_morecore(void)
  	 * This doesn't appear to prohibit malloc() from falling back
  	 * to mmap() if we run out of hugepages. */
  	mallopt(M_MMAP_MAX, 0);
 +#endif
  }
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
index f6d8a10a9a..aca7e803d0 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
@@ -1,12 +1,12 @@
-From 3d6ab5ea8e23f96ee6fdd915e05acd9a751dd876 Mon Sep 17 00:00:00 2001
+From 9ff04d7acc700387e3837f8ab11a41efea5ee8b0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:44:26 -0700
-Subject: [PATCH 3/6] alloc.c: Avoid sysconf(_SC_LEVEL2_CACHE_LINESIZE) on
- linux
+Subject: [PATCH] alloc.c: Avoid sysconf(_SC_LEVEL2_CACHE_LINESIZE) on linux
 
 musl does not have it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  alloc.c | 15 ++++++++++++++-
  1 file changed, 14 insertions(+), 1 deletion(-)
@@ -44,6 +44,3 @@ index bce9464..cf7eb40 100644
  		linemod = time(NULL);
  	}
  
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
index 960e152939..58776e8710 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
@@ -1,9 +1,10 @@
-From 7002dec46dae375e8aa1aa8577a5b274c02fc697 Mon Sep 17 00:00:00 2001
+From 9ce323432a7f4d99f617970c7e35b607b9bbf843 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:48:04 -0700
-Subject: [PATCH 4/6] shm.c: Mark glibc specific changes so
+Subject: [PATCH] shm.c: Mark glibc specific changes so
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  shm.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -25,6 +26,3 @@ index 1f82cab..9447b63 100644
  
  /* call syscall shmget through the generic syscall mechanism */
  static int syscall_shmget(key_t key, size_t size, int shmflg)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
index 543302b135..08174200d8 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
@@ -1,12 +1,13 @@
-From 87ed1706f426ed27fc4eeca7c3b09a4086c9a2a9 Mon Sep 17 00:00:00 2001
+From bb8c370aaaf25b1fe1fbf984e73177018026cb91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:51:02 -0700
-Subject: [PATCH 5/6] Include dirent.h for ino_t
+Subject: [PATCH] Include dirent.h for ino_t
 
 Fixes
 error: unknown type name 'ino_t'; did you mean 'int'?
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  tests/hugetests.h | 1 +
  1 file changed, 1 insertion(+)
@@ -23,6 +24,3 @@ index 8b1d8d9..056042c 100644
  
  #include "libhugetlbfs_privutils.h"
  #include "libhugetlbfs_testprobes.h"
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
index 35dd6e11cc..2ead21fb46 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
@@ -1,13 +1,14 @@
-From 96c012ea31a2d124528f3b6f3b9857b71b059db3 Mon Sep 17 00:00:00 2001
+From 5f64aa8c47c2d3a155a97e262f89cc47394a69eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:58:53 -0700
-Subject: [PATCH 6/6] include limits.h for PATH_MAX
+Subject: [PATCH] include limits.h for PATH_MAX
 
 Fixes
 
 error: 'PATH_MAX' undeclared
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  hugeadm.c                | 1 +
  tests/gethugepagesizes.c | 1 +
@@ -37,6 +38,3 @@ index 9551b38..2645e3f 100644
  
  #include "hugetests.h"
  
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
index b3fd843128..f95e9e85a4 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
@@ -1,19 +1,20 @@
-From 0a2877400a086e9d6ddd32a80462b7a931921dc2 Mon Sep 17 00:00:00 2001
+From 82a4f60ab24dff121f5f9d3bbcd9a8a28bb7caef Mon Sep 17 00:00:00 2001
 From: Chunrong Guo <B40290@freescale.com>
 Date: Sun, 8 Sep 2013 23:21:49 -0500
-Subject: [PATCH] libhugetlbfs: avoid search host library path for cross 
+Subject: [PATCH] libhugetlbfs: avoid search host library path for cross
  compilation
 
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
 ---
- ldscripts/elf32ppclinux.xB   |    2 +-
- ldscripts/elf32ppclinux.xBDT |    2 +-
- ldscripts/elf64ppc.xB        |    2 +-
- ldscripts/elf64ppc.xBDT      |    2 +-
- ldscripts/elf_x86_64.xB      |    2 +-
- ldscripts/elf_x86_64.xBDT    |    2 +-
+ ldscripts/elf32ppclinux.xB   | 2 +-
+ ldscripts/elf32ppclinux.xBDT | 2 +-
+ ldscripts/elf64ppc.xB        | 2 +-
+ ldscripts/elf64ppc.xBDT      | 2 +-
+ ldscripts/elf_x86_64.xB      | 2 +-
+ ldscripts/elf_x86_64.xBDT    | 2 +-
  6 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/ldscripts/elf32ppclinux.xB b/ldscripts/elf32ppclinux.xB
@@ -94,6 +95,3 @@ index 1855202..c62d245 100644
  INPUT(-lhugetlbfs);
  /* Do we need any of these for elf?
     __DYNAMIC = 0;    */
--- 
-1.7.9.7
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
index 15664884bf..7cc180a4b7 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
@@ -1,14 +1,16 @@
-From 889e52753d30179ba4ac940023cb4ed561436ab8 Mon Sep 17 00:00:00 2001
+From b5887693d90c430291b644c2f5713b5fdd1777ce Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 4 Nov 2014 00:49:11 -0800
-Subject: [PATCH] libhugetlbfs/elf_i386: avoid search host library path for cross compilation
+Subject: [PATCH] libhugetlbfs/elf_i386: avoid search host library path for
+ cross compilation
 
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
- ldscripts/elf_i386.xB   |    1 -
- ldscripts/elf_i386.xBDT |    1 -
+ ldscripts/elf_i386.xB   | 1 -
+ ldscripts/elf_i386.xBDT | 1 -
  2 files changed, 2 deletions(-)
 
 diff --git a/ldscripts/elf_i386.xB b/ldscripts/elf_i386.xB
@@ -35,6 +37,3 @@ index d72aebe..3bac1b1 100644
  INPUT(-lhugetlbfs);
  /* Do we need any of these for elf?
     __DYNAMIC = 0;    */
---
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
index 07a99719b0..a13c5389fb 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
@@ -1,17 +1,20 @@
-From 355c014573de7f95202cc7c819f81f0f230e4a1a Mon Sep 17 00:00:00 2001
+From 183a4dafe141197de5840f2e48c266ef209307aa Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Mon, 18 Jun 2012 16:37:05 +0800
 Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the same place
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Ting Liu <b28495@freescale.com>
+
 ---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 91502e1..bfb3414 100644
+index 51e41f0..373df3c 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -167,7 +167,6 @@ REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
+@@ -177,7 +177,6 @@ REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
  REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
  ifneq ($(realpath $(PREFIX)),)
  ifeq ($(REALLIB32),$(REALLIB64))
@@ -19,5 +22,3 @@ index 91502e1..bfb3414 100644
  endif
  endif
  
--- 
-1.9.2
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
index 249f6e1e23..b8b2f8e6fb 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
@@ -1,12 +1,23 @@
+From f1ad8ff887f16daee8d06eca3df0f2541bfdaac0 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Mon, 23 Sep 2013 08:00:55 +0000
+Subject: [PATCH] libhugetlbfs: add recipe
+
 Upstream-Status: Submitted
 
 TESTS_64 is empty, install will fail due to missing file operand
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 
---- a/tests/Makefileold	2013-10-12 02:32:55.262391998 -0500
-+++ b/tests/Makefile	2013-10-12 02:33:45.929394722 -0500
-@@ -292,7 +292,7 @@
+---
+ tests/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 073df96..0ca3716 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -295,7 +295,7 @@ obj64/install:
  	$(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
  	$(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
  	$(INSTALL) -m 755 $(HELPER_LIBS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
-- 
2.19.1


