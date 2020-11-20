Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.18340.1605831247979358909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 16:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qPaNT7Xh;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: alexander.kamensky42@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id i13so5734357pgm.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2020 16:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=77tiL19V6R7xwAGaSu1SszYVpgWxDVFx+8jPXmVS65w=;
        b=qPaNT7Xh+mw+y3CjSr9GleWb4VHmAlmPeqH1xsRpS4r9Yrxb3/wrd9TFiD+WyH5uO/
         QP3geeasMXdrdiCNlQt2DcOST6IIF94w+Au4Czaa0Y1Zy5bPhg6FVGpHItETfWwBw2lp
         3qit5iYM2BeYRFVivdAwB0hMTwe8iCNx3GD+Z0Hra1WC804sIBYSbqZHykqv/uho0Q89
         sXNBjP2sG4IsdcvMbUiP2HT9dw16iUJfKspviyLDR+A9zTTahnWY4ihWhG4LHqjbmaQS
         IwqZf+WTBDVlGxO30sfRM97r9POgEbCbGjk05/Af5lAcCvyq/ov2GD7PLcVxmRMEYapZ
         UQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=77tiL19V6R7xwAGaSu1SszYVpgWxDVFx+8jPXmVS65w=;
        b=pAVmmR3n/D/1oDSesd+CjhdYxK7E+algn3zbn6EfiGULf88PMWCP7Pj6SpsBTYu4d2
         Lq+lWh8/OctgqTUOaJi1Sez6a5Bj+EN6V0ENcNU/3ollwo/t9iCG8AHe9y3X9rX4nasd
         LveEApzwFxvMdRO+DZ+Aiy9tZkNUSBDdd825sIMW4sf/oNPG5H2WW1arkOqBv5xnb+XF
         +I/t/eE4hHAuW3dE4AP7hTOZ0LGT5SSKYIxecSLaIh79zMJM2tZtNXGkX9BCp22C5r21
         1sQTLAQIT+SVxi138ZhunA9OFH+B8ELQuxfo9FlrInrYipzdSLanxEw10sVQmXaMCrQj
         PfCQ==
X-Gm-Message-State: AOAM531Fx1wd981PsZZQWDYknfuoTIm1fGvfNLuBREujmT++1yu7FF+c
	IewOWDJqEiYJR5VsljNSrP4IIJ46pxk=
X-Google-Smtp-Source: ABdhPJxjQ6dlgdpzXF+yrCa4zHKD5YWsSFBKDT1bDmotGuaOzWdKMKn4CZzMUj2JbStu+2QYnSX32Q==
X-Received: by 2002:a17:90b:707:: with SMTP id s7mr5559493pjz.60.1605831246833;
        Thu, 19 Nov 2020 16:14:06 -0800 (PST)
Return-Path: <alexander.kamensky42@gmail.com>
Received: from localhost.net ([2601:641:8080:1a70::93c8])
        by smtp.gmail.com with ESMTPSA id x61sm1027914pjj.4.2020.11.19.16.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 16:14:06 -0800 (PST)
From: "Alexander Kamensky" <alexander.kamensky42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>,
	Mingli Yu <mingli.yu@windriver.com>,
	Haiqing Bai <Haiqing.Bai@windriver.com>,
	Alexander Kamensky <alexander.kamensky42@gmail.com>
Subject: [meta-oe][PATCH] makedumpfile: upgrade 1.6.7 -> 1.6.8
Date: Thu, 19 Nov 2020 16:13:57 -0800
Message-Id: <20201120001357.227701-1-alexander.kamensky42@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Starting with 1.6.8 makedumpfile project migrated from sourceforge to github;
properly updated SRC_URI, HOMEPAGE, UPSTREAM_CHECK_XX

* Refreshed patch 0001-makedumpfile-replace-hardcode-CFLAGS.patch

* Refreshed patch 0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch;
had conflict in patch removed function, is this patch still required?

* Removed 0001-PATCH-Remove-duplicated-variable-definitions.patch backported
patch

* Added dependency to xz required by new version

Signed-off-by: Alexander Kamensky <alexander.kamensky42@gmail.com>
---
 ...move-duplicated-variable-definitions.patch | 104 ------------------
 ...makedumpfile-replace-hardcode-CFLAGS.patch |  26 ++---
 ...ort-only-46-bit-for-MAX_PHYSMEM_BITS.patch |  24 ++--
 ...umpfile_1.6.7.bb => makedumpfile_1.6.8.bb} |  17 +--
 4 files changed, 36 insertions(+), 135 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.7.bb => makedumpfile_1.6.8.bb} (76%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
deleted file mode 100644
index 49777bcee..000000000
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 399f2c9a3acd5bd913e50a4dde52dee6527b297e Mon Sep 17 00:00:00 2001
-From: Kairui Song <kasong@redhat.com>
-Date: Wed, 29 Jan 2020 13:37:13 +0800
-Subject: [PATCH] [PATCH] Remove duplicated variable definitions
-
-When building on Fedora 32 (with GCC 10), following error is observed:
-
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2010: multiple definition of
- `crash_reserved_mem_nr'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2010: first defined here
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2009: multiple definition of
- `crash_reserved_mem'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2009: first defined here
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1278: multiple definition of
- `parallel_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1278: first defined here
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1265: multiple definition of
- `splitting_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1265: first defined here
-...
-collect2: error: ld returned 1 exit status
-make: *** [Makefile:97: makedumpfile] Error 1
-
-These variables are wrongly defined multiple times. So remove the
-duplicated definitions.
-
-Upstream-Status: Backport [https://github.com/kraj/makedumpfile/commit/399f2c9a3acd5bd913e50a4dde52dee6527b297e]
-Signed-off-by: Kairui Song <kasong@redhat.com>
-Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>
----
- makedumpfile.c | 8 ++++----
- makedumpfile.h | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/makedumpfile.c b/makedumpfile.c
-index e290fbd..ae7336a 100644
---- a/makedumpfile.c
-+++ b/makedumpfile.c
-@@ -10954,7 +10954,7 @@ check_param_for_reassembling_dumpfile(int argc, char *argv[])
- 		return FALSE;
- 
- 	if ((info->splitting_info
--	    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
-+	    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
- 	    == NULL) {
- 		MSG("Can't allocate memory for splitting_info.\n");
- 		return FALSE;
-@@ -11042,7 +11042,7 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
- 			return FALSE;
- 		}
- 		if ((info->splitting_info
--		    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
-+		    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
- 		    == NULL) {
- 			MSG("Can't allocate memory for splitting_info.\n");
- 			return FALSE;
-@@ -11077,13 +11077,13 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
- 
- 	if (info->num_threads) {
- 		if ((info->parallel_info =
--		     malloc(sizeof(parallel_info_t) * info->num_threads))
-+		     malloc(sizeof(struct parallel_info) * info->num_threads))
- 		    == NULL) {
- 			MSG("Can't allocate memory for parallel_info.\n");
- 			return FALSE;
- 		}
- 
--		memset(info->parallel_info, 0, sizeof(parallel_info_t)
-+		memset(info->parallel_info, 0, sizeof(struct parallel_info)
- 							* info->num_threads);
- 	}
- 
-diff --git a/makedumpfile.h b/makedumpfile.h
-index 68d9691..7217407 100644
---- a/makedumpfile.h
-+++ b/makedumpfile.h
-@@ -1262,7 +1262,7 @@ struct splitting_info {
- 	mdf_pfn_t		end_pfn;
- 	off_t			offset_eraseinfo;
- 	unsigned long		size_eraseinfo;
--} splitting_info_t;
-+};
- 
- struct parallel_info {
- 	int			fd_memory;
-@@ -1275,7 +1275,7 @@ struct parallel_info {
- #ifdef USELZO
- 	lzo_bytep		wrkmem;
- #endif
--} parallel_info_t;
-+};
- 
- struct ppc64_vmemmap {
- 	unsigned long		phys;
-@@ -2006,8 +2006,8 @@ struct memory_range {
- };
- 
- #define CRASH_RESERVED_MEM_NR   8
--struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
--int crash_reserved_mem_nr;
-+extern struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
-+extern int crash_reserved_mem_nr;
- 
- unsigned long read_vmcoreinfo_symbol(char *str_symbol);
- int readmem(int type_addr, unsigned long long addr, void *bufptr, size_t size);
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index ff093a72b..270cc3562 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  Makefile | 45 +++++++++++++++++++++++----------------------
  1 file changed, 23 insertions(+), 22 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 1fdb628..5dce589 100644
---- a/Makefile
-+++ b/Makefile
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
  CC	= gcc
  endif
@@ -81,12 +81,12 @@ index 1fdb628..5dce589 100644
  SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
  SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c
  OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
-@@ -52,17 +53,17 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+@@ -52,12 +53,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
  
  LIBS = -ldw -lbz2 -ldl -lelf -lz
  ifneq ($(LINKTYPE), dynamic)
--LIBS := -static $(LIBS)
-+LIBS := $(LIBS)
+-LIBS := -static $(LIBS) -llzma
++LIBS := $(LIBS) -llzma
  endif
  
  ifeq ($(USELZO), on)
@@ -96,13 +96,16 @@ index 1fdb628..5dce589 100644
  endif
  
  ifeq ($(USESNAPPY), on)
- LIBS := -lsnappy $(LIBS)
+@@ -65,7 +66,7 @@ LIBS := -lsnappy $(LIBS)
+ ifneq ($(LINKTYPE), dynamic)
+ LIBS := $(LIBS) -lstdc++
+ endif
 -CFLAGS += -DUSESNAPPY
 +CFLAGS_COMMON += -DUSESNAPPY
  endif
  
  LIBS := -lpthread $(LIBS)
-@@ -87,14 +88,14 @@ LIBS := $(LIBS) $(call try-run,\
+@@ -90,14 +91,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -119,7 +122,7 @@ index 1fdb628..5dce589 100644
  	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
  	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
  	mv temp.8 makedumpfile.8
-@@ -105,7 +106,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
  	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
  
  eppic_makedumpfile.so: extension_eppic.c
@@ -128,6 +131,3 @@ index 1fdb628..5dce589 100644
  
  clean:
  	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8.gz makedumpfile.conf.5.gz
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
index 1707df3e3..85d883365 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
@@ -28,11 +28,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  arch/ppc64.c | 38 ++------------------------------------
  1 file changed, 2 insertions(+), 36 deletions(-)
 
-diff --git a/arch/ppc64.c b/arch/ppc64.c
-index 9d8f252..6f4860f 100644
---- a/arch/ppc64.c
-+++ b/arch/ppc64.c
-@@ -462,48 +462,14 @@ ppc64_vtop_level4(unsigned long vaddr)
+Index: git/arch/ppc64.c
+===================================================================
+--- git.orig/arch/ppc64.c
++++ git/arch/ppc64.c
+@@ -462,44 +462,6 @@ ppc64_vtop_level4(unsigned long vaddr)
  	return paddr;
  }
  
@@ -40,6 +40,13 @@ index 9d8f252..6f4860f 100644
 -set_ppc64_max_physmem_bits(void)
 -{
 -	long array_len = ARRAY_LENGTH(mem_section);
+-
+-	/* Check if we can get MAX_PHYSMEM_BITS from vmcoreinfo */
+-	if (NUMBER(MAX_PHYSMEM_BITS) != NOT_FOUND_NUMBER) {
+-		info->max_physmem_bits = NUMBER(MAX_PHYSMEM_BITS);
+-		return TRUE;
+-	}
+-
 -	/*
 -	 * The older ppc64 kernels uses _MAX_PHYSMEM_BITS as 42 and the
 -	 * newer kernels 3.7 onwards uses 46 bits.
@@ -67,10 +74,10 @@ index 9d8f252..6f4860f 100644
 -
 -	return FALSE;
 -}
--
+ 
  int
  get_machdep_info_ppc64(void)
- {
+@@ -507,10 +469,8 @@ get_machdep_info_ppc64(void)
  	unsigned long vmlist, vmap_area_list, vmalloc_start;
  
  	info->section_size_bits = _SECTION_SIZE_BITS;
@@ -83,6 +90,3 @@ index 9d8f252..6f4860f 100644
  	info->page_offset = __PAGE_OFFSET;
  
  	if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
similarity index 76%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
index ad1e09c35..475465124 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
@@ -5,12 +5,15 @@ DESCRIPTION = "\
     images without extra uneeded information (zero pages, userspace programs, \
     etc). \
 "
-HOMEPAGE = "http://makedumpfile.sourceforge.net"
+HOMEPAGE = "https://github.com/makedumpfile/makedumpfile"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
-DEPENDS = "bzip2 zlib elfutils"
+SRCBRANCH ?= "master"
+SRCREV = "18e0cdba48feeccea2429b3b0b2691f4314d1062"
+
+DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS_${PN}-tools = "perl ${PN}"
 
 # arm and aarch64 would compile but has never been tested upstream.  mips would not compile.
@@ -21,16 +24,14 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/*.pl"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
+    git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH} \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
-    file://0001-PATCH-Remove-duplicated-variable-definitions.patch \
 "
-SRC_URI[md5sum] = "808ef840ca49ca6bfde77c097cf429f5"
-SRC_URI[sha256sum] = "e702fbdf62b4cd829a76e46f3e24eb3fc7501918b85ebdcd8baef4f53d6ee2c8"
 
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/makedumpfile/files/makedumpfile/"
-UPSTREAM_CHECK_REGEX = "makedumpfile/(?P<pver>\d+(\.\d+)+)/"
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SECTION = "base"
 
-- 
2.26.2

