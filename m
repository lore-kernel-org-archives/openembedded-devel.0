Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3979B7E417
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:15:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J9FlIj028734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:15:47 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 19 Jul 2019 02:15:46 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 02:15:37 -0700
Message-ID: <20190719091539.100373-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190719091539.100373-1-mingli.yu@windriver.com>
References: <20190719091539.100373-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] makedumpfile: Upgrade to 1.6.6
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
X-List-Received-Date: Fri, 19 Jul 2019 09:15:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Rebase two patches.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...makedumpfile-replace-hardcode-CFLAGS.patch | 41 ++++++++++---------
 ...ort-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 23 +++++++----
 ...umpfile_1.6.5.bb => makedumpfile_1.6.6.bb} |  4 +-
 3 files changed, 38 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.5.bb => makedumpfile_1.6.6.bb} (92%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index a47806526..c0f82f321 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 8eeb1b15608ce1a9a1f0d5417938fd6da4504406 Mon Sep 17 00:00:00 2001
+From af97e2ad643334b4c7c3d66f971ce9ebb2b596af Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 21 Jul 2016 18:06:21 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -13,30 +13,28 @@ Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
 Upstream-Status: Inappropriate[oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
- Makefile | 46 +++++++++++++++++++++++-----------------------
- 1 file changed, 23 insertions(+), 23 deletions(-)
+ Makefile | 45 +++++++++++++++++++++++----------------------
+ 1 file changed, 23 insertions(+), 22 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 612b9d0..f6d6265 100644
+index 1fdb628..5dce589 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -8,13 +8,6 @@ ifeq ($(strip $CC),)
+@@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
  CC	= gcc
  endif
  
--CFLAGS = -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
--	  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE \
--	  -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(DATE)"'
--CFLAGS_ARCH	= -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
--		    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+-CFLAGS_BASE := $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
+-		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+-CFLAGS      := $(CFLAGS_BASE) -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(DATE)"'
+-CFLAGS_ARCH := $(CFLAGS_BASE)
 -# LDFLAGS = -L/usr/local/lib -I/usr/local/include
 -
  HOST_ARCH := $(shell uname -m)
  # Use TARGET as the target architecture if specified.
  # Defaults to uname -m
-@@ -22,29 +15,36 @@ ifeq ($(strip($TARGET)),)
+@@ -21,29 +15,36 @@ ifeq ($(strip($TARGET)),)
  TARGET := $(HOST_ARCH)
  endif
  
@@ -72,18 +70,18 @@ index 612b9d0..f6d6265 100644
  endif
  
 +CFLAGS_ARCH += $(CFLAGS) \
-+		-D_FILE_OFFSET_BITS=64 \
-+		-D_LARGEFILE_SOURCE \
-+		-D_LARGEFILE64_SOURCE
++              -D_FILE_OFFSET_BITS=64 \
++              -D_LARGEFILE_SOURCE \
++              -D_LARGEFILE64_SOURCE
 +
 +CFLAGS_COMMON = $(CFLAGS_ARCH) \
-+		-DVERSION='"$(VERSION)"' \
-+		-DRELEASE_DATE='"$(DATE)"'
++              -DVERSION='"$(VERSION)"' \
++              -DRELEASE_DATE='"$(DATE)"'
 +
  SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
  SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c
  OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
-@@ -53,17 +53,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+@@ -52,17 +53,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
  
  LIBS = -ldw -lbz2 -lebl -ldl -lelf -lz
  ifneq ($(LINKTYPE), dynamic)
@@ -104,7 +102,7 @@ index 612b9d0..f6d6265 100644
  endif
  
  LIBS := -lpthread $(LIBS)
-@@ -71,14 +71,14 @@ LIBS := -lpthread $(LIBS)
+@@ -82,14 +83,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -121,7 +119,7 @@ index 612b9d0..f6d6265 100644
  	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
  	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
  	mv temp.8 makedumpfile.8
-@@ -89,7 +89,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -100,7 +101,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
  
  eppic_makedumpfile.so: extension_eppic.c
@@ -130,3 +128,6 @@ index 612b9d0..f6d6265 100644
  
  clean:
  	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8.gz makedumpfile.conf.5.gz
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
index 156b4d57d..1707df3e3 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
@@ -1,4 +1,4 @@
-From 0d1cdb59da3603e0a80913617ece0164b05380d2 Mon Sep 17 00:00:00 2001
+From 9045b72bdb703bf58a6586d77461eea8f59f50f7 Mon Sep 17 00:00:00 2001
 From: Alexandru Moise <alexandru.moise@windriver.com>
 Date: Fri, 29 Apr 2016 07:40:46 +0000
 Subject: [PATCH] mem_section: Support only 46 bit for MAX_PHYSMEM_BITS on
@@ -23,18 +23,20 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
 [hqBai: adjusted patch for context, no logical change]
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- arch/ppc64.c | 33 ++-------------------------------
- 1 file changed, 2 insertions(+), 31 deletions(-)
+ arch/ppc64.c | 38 ++------------------------------------
+ 1 file changed, 2 insertions(+), 36 deletions(-)
 
 diff --git a/arch/ppc64.c b/arch/ppc64.c
-index 947a125..458f06b 100644
+index 9d8f252..6f4860f 100644
 --- a/arch/ppc64.c
 +++ b/arch/ppc64.c
-@@ -463,42 +463,13 @@ ppc64_vtop_level4(unsigned long vaddr)
+@@ -462,48 +462,14 @@ ppc64_vtop_level4(unsigned long vaddr)
+ 	return paddr;
  }
  
- int
+-int
 -set_ppc64_max_physmem_bits(void)
 -{
 -	long array_len = ARRAY_LENGTH(mem_section);
@@ -58,10 +60,15 @@ index 947a125..458f06b 100644
 -		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
 -		return TRUE;
 -
+-	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_4_20;
+-	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
+-		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
+-		return TRUE;
+-
 -	return FALSE;
 -}
 -
--int
+ int
  get_machdep_info_ppc64(void)
  {
  	unsigned long vmlist, vmap_area_list, vmalloc_start;
@@ -77,5 +84,5 @@ index 947a125..458f06b 100644
  
  	if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
 -- 
-2.7.4
+2.21.0
 
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
similarity index 92%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
index 413b413a9..9c357bf6e 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
@@ -25,8 +25,8 @@ SRC_URI = "\
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
 "
-SRC_URI[md5sum] = "1737f8e8904d565629f0c9e702f92d02"
-SRC_URI[sha256sum] = "5d4f1d6ded8dca6951eeabcf4bb1ebf6575288fee947529397103c040eb5c760"
+SRC_URI[md5sum] = "6fd632b97ad78d9a0a3b0f0989094064"
+SRC_URI[sha256sum] = "d007eec05cb14f0155f2d06a0d4dc70d321dbb2aec65fccdce953145c8230324"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/makedumpfile/files/makedumpfile/"
 UPSTREAM_CHECK_REGEX = "makedumpfile/(?P<pver>\d+(\.\d+)+)/"
-- 
2.21.0


