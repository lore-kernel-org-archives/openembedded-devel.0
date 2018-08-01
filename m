Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8894F78CF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 01:25:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w711PorE019615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 18:25:50 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 31 Jul 2018 18:25:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Jul 2018 18:25:40 -0700
Message-ID: <20180801012540.11856-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180801012540.11856-1-mingli.yu@windriver.com>
References: <20180801012540.11856-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] makedumpfile: Upgrade to 1.6.4
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
X-List-Received-Date: Wed, 01 Aug 2018 01:25:50 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Refresh the patches to avoid fuzz warnings

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...01-makedumpfile-replace-hardcode-CFLAGS.patch | 16 +++++++---------
 ...upport-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 15 +++++++--------
 ...kedumpfile_1.6.2.bb => makedumpfile_1.6.4.bb} |  4 ++--
 3 files changed, 16 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.2.bb => makedumpfile_1.6.4.bb} (92%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index d599a9193..a47806526 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 3c2f4ff583a156a7ed2fa0cc002a413c391d063d Mon Sep 17 00:00:00 2001
+From 8eeb1b15608ce1a9a1f0d5417938fd6da4504406 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 21 Jul 2016 18:06:21 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -13,12 +13,13 @@ Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
 Upstream-Status: Inappropriate[oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  Makefile | 46 +++++++++++++++++++++++-----------------------
  1 file changed, 23 insertions(+), 23 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 7dde3e4..c5286ac 100644
+index 612b9d0..f6d6265 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,13 +8,6 @@ ifeq ($(strip $CC),)
@@ -80,9 +81,9 @@ index 7dde3e4..c5286ac 100644
 +		-DRELEASE_DATE='"$(DATE)"'
 +
  SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
- SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c
+ SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c
  OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
-@@ -54,17 +54,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+@@ -53,17 +53,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
  
  LIBS = -ldw -lbz2 -lebl -ldl -lelf -lz
  ifneq ($(LINKTYPE), dynamic)
@@ -103,7 +104,7 @@ index 7dde3e4..c5286ac 100644
  endif
  
  LIBS := -lpthread $(LIBS)
-@@ -72,14 +72,14 @@ LIBS := -lpthread $(LIBS)
+@@ -71,14 +71,14 @@ LIBS := -lpthread $(LIBS)
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -120,7 +121,7 @@ index 7dde3e4..c5286ac 100644
  	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
  	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
  	mv temp.8 makedumpfile.8
-@@ -90,7 +90,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -89,7 +89,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
  
  eppic_makedumpfile.so: extension_eppic.c
@@ -129,6 +130,3 @@ index 7dde3e4..c5286ac 100644
  
  clean:
  	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8.gz makedumpfile.conf.5.gz
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
index e0c3d9af6..766f4fc76 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
@@ -1,4 +1,4 @@
-From 653fe8e724081d2f289c2245d1220d5f7170538d Mon Sep 17 00:00:00 2001
+From ba123fa6b2aa0ac62d1b78f327339635ae87201a Mon Sep 17 00:00:00 2001
 From: Alexandru Moise <alexandru.moise@windriver.com>
 Date: Fri, 29 Apr 2016 07:40:46 +0000
 Subject: [PATCH] mem_section: Support only 46 bit for MAX_PHYSMEM_BITS on
@@ -20,18 +20,20 @@ Upstream-Status: Pending
 
 Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  arch/ppc64.c | 28 ++--------------------------
  1 file changed, 2 insertions(+), 26 deletions(-)
 
 diff --git a/arch/ppc64.c b/arch/ppc64.c
-index 89a7f05..6c928ab 100644
+index 8b6f7d5..458f06b 100644
 --- a/arch/ppc64.c
 +++ b/arch/ppc64.c
-@@ -302,37 +302,13 @@ ppc64_vtop_level4(unsigned long vaddr)
+@@ -462,38 +462,14 @@ ppc64_vtop_level4(unsigned long vaddr)
+ 	return paddr;
  }
  
- int
+-int
 -set_ppc64_max_physmem_bits(void)
 -{
 -	long array_len = ARRAY_LENGTH(mem_section);
@@ -53,7 +55,7 @@ index 89a7f05..6c928ab 100644
 -	return FALSE;
 -}
 -
--int
+ int
  get_machdep_info_ppc64(void)
  {
  	unsigned long vmlist, vmap_area_list, vmalloc_start;
@@ -68,6 +70,3 @@ index 89a7f05..6c928ab 100644
  	info->page_offset = __PAGE_OFFSET;
  
  	if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
similarity index 92%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
index 38f9d24c9..629e2518f 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
@@ -25,8 +25,8 @@ SRC_URI = "\
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
 "
-SRC_URI[md5sum] = "72be5bf973eed898c5127e3abc466583"
-SRC_URI[sha256sum] = "ee3d21cb4032a60bd2c802d1d8b21b9f399710e1574f8de8ead5ab50cd821a6d"
+SRC_URI[md5sum] = "7dfbca19f487604c271e2892ba07f4bd"
+SRC_URI[sha256sum] = "7e06f72d5f291fcab9e92975f405a76e37d4f7fc8fa4172f199636398ae812b1"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/makedumpfile/files/makedumpfile/"
 UPSTREAM_CHECK_REGEX = "makedumpfile/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1


