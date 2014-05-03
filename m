Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id A34C26017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 12:42:51 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so3629292lab.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 05:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wSEvmpBu582RumauyJkJ1w2yeG8FjSL8Rnf6da+2Qgo=;
	b=j5K+8YxEqeCKXeKbw93nQP5lILoDCLRcNDOPdb0Yb43HaO83C4f927M3NT0BVLnAOO
	H47iMD1AAEHTTOWVhHRvHFCK5LdqFvYWLO+lVgUHxDzPyTmuEWmxDA744p8+P4Ngw7/4
	yXomT6D4azSulSd/1rL6y6T/7YaT2doUVVaLWAq9inW9h8u30ojFiBEx9P9EXxD+T6FR
	h7FQ0RExWC70zDSPlsM4H7fahbwk2IAhlsXqAzQQU5v2LKwoV0em/Aii01h6VGkFus3p
	vK842TUF/vIT5kjzZq1aMNWoNHFegCYnawq2dAyiOy6Sp4fXTUOc2Wb2HmNbCO4FjCGH
	jtOw==
X-Gm-Message-State: ALoCoQmDZw00HbOM3AKfJujd3NGu9Z4qs+Ix/csKoTxD/IwibqTUUYauvXe38q+a/T2OlmLP7+di
X-Received: by 10.112.26.199 with SMTP id n7mr16786139lbg.27.1399120971524;
	Sat, 03 May 2014 05:42:51 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id q2sm1983498laj.9.2014.05.03.05.42.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 May 2014 05:42:50 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 May 2014 15:42:46 +0300
Message-Id: <1399120966-20615-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libhugetlbfs: update srcrev to 2.18 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 May 2014 12:42:57 -0000

* Update recipe:
  - update SRCREV to latest release, 2.18
  - switch back to master branch
  - increase verbosity (pass V=1 to EXTRA_OEMAKE) to make debugging easier
* Drop patches:
  - fix-lib64-can-not-be-shiped-in-64bit-target.patch
    replaced by LIBARGS definition. the build system allows to override libdir
    using LIB32 and LIB64 variables
  - 0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
    replaced by a one-liner to fixup perl module directory hardcoded to perl5
* Refresh skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
  - only disable the error to skip the check
* Add patches:
  - 0001-aarch64-fix-cross-compilation.patch - submitted upstream
    allow to override CC and use it for aarch64 case like the other arch
  - 0001-aarch64-fix-page-size-not-properly-computed.patch - submitted upstream
    fix typo on MB variable (MB -> $MB) and add the missing linker variants
    (aarch64elfb, aarch64linux, aarch64linuxb)
  - 0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch
    submitted upstream. replace lib/lib64 hardcoded values by LIBDIR32 and
    LIBDIR64 variables
* Remove patches that aren't applied in the recipe (they're all merged
  upstream and available in 2.18 release):
  - libhugetlbfs/files/aarch64-support.patch
  - aarch64-unit-test-fixes.patch
  - add-PROT-NONE-to-the-mprotest-test.patch

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../files/0001-aarch64-fix-cross-compilation.patch | 34 +++++++++
 ...rch64-fix-page-size-not-properly-computed.patch | 32 ++++++++
 ...-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch | 29 +++++++
 .../libhugetlbfs/files/aarch64-support.patch       | 88 ----------------------
 .../files/aarch64-unit-test-fixes.patch            | 62 ---------------
 .../files/add-PROT-NONE-to-the-mprotest-test.patch | 38 ----------
 ...ng-LIB32-and-LIB64-if-they-point-to-the-s.patch | 41 ++--------
 .../libhugetlbfs/libhugetlbfs_git.bb               | 17 +++--
 8 files changed, 113 insertions(+), 228 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch
new file mode 100644
index 0000000..215ae72
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch
@@ -0,0 +1,34 @@
+Subject: [PATCH] aarch64: fix cross compilation
+
+This patch allow to override CC and use it for aarch64 case like
+the other architectures.
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream-Status: Submitted
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 91502e1..5aa1e12 100644
+--- a/Makefile
++++ b/Makefile
+@@ -33,7 +33,7 @@ CFLAGS += -Wall -fPIC
+ CPPFLAGS += -D__LIBHUGETLBFS__
+ 
+ ARCH = $(shell uname -m | sed -e s/i.86/i386/)
+-CC = gcc
++CC ?= gcc
+ 
+ CUSTOM_LDSCRIPTS = yes
+ 
+@@ -66,7 +66,7 @@ ELF32 += armelf_linux_eabi
+ CUSTOM_LDSCRIPTS = no
+ else
+ ifneq (,$(findstring aarch64,$(ARCH)))
+-CC64 = gcc
++CC64 = $(CC)
+ ELF64 = aarch64elf
+ TMPLIB64 = lib64
+ CUSTOM_LDSCRIPTS = no
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
new file mode 100644
index 0000000..da60ba0
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] aarch64: fix page size not properly computed
+
+There's 2 issues fixed:
+* typo on MB variable (MB -> $MB)
+* some linker variants are missing (linux and big endian)
+  - aarch64elfb
+  - aarch64linux
+  - aarch64linuxb
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream-Status: Submitted
+---
+ ld.hugetlbfs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ld.hugetlbfs b/ld.hugetlbfs
+index df446dd..6553547 100755
+--- a/ld.hugetlbfs
++++ b/ld.hugetlbfs
+@@ -87,7 +87,7 @@ elf32ppclinux|elf64ppc)	HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
+ elf64lppc)		HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
+ elf_i386|elf_x86_64)	HPAGE_SIZE=$((4*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
+ elf_s390|elf64_s390)	HPAGE_SIZE=$((1*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
+-armelf_linux_eabi|aarch64elf)	HPAGE_SIZE=$((2*MB)) SLICE_SIZE=$HPAGE_SIZE ;;
++armelf_linux_eabi|aarch64elf*|aarch64linux*)	HPAGE_SIZE=$((2*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
+ esac
+ 
+ if [ "$HTLB_ALIGN" == "slice" ]; then
+-- 
+1.9.2
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch
new file mode 100644
index 0000000..9e2a5e5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH 1/1] Replace lib/lib64 hardcoded values by LIBDIR32/LIBDIR64
+ variables
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream-Status: Submitted
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 91502e1..682c0db 100644
+--- a/Makefile
++++ b/Makefile
+@@ -181,9 +181,9 @@ BINDIR = $(PREFIX)/share/libhugetlbfs
+ EXEDIR = $(PREFIX)/bin
+ DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
+ ifdef CC32
+-PMDIR = $(PREFIX)/lib/perl5/TLBC
++PMDIR = $(LIBDIR32)/perl5/TLBC
+ else
+-PMDIR = $(PREFIX)/lib64/perl5/TLBC
++PMDIR = $(LIBDIR64)/perl5/TLBC
+ endif
+ MANDIR1 = $(PREFIX)/share/man/man1
+ MANDIR3 = $(PREFIX)/share/man/man3
+-- 
+1.9.2
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
deleted file mode 100644
index ceac6b4..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-Upstream-Status: Pending
-
-From 52b8430eb4f03e35721f29862de33041fe9c9768 Mon Sep 17 00:00:00 2001
-From: Steve Capper <steve.capper@linaro.org>
-Date: Wed, 10 Apr 2013 14:51:12 +0100
-Subject: [PATCH] Aarch64 support.
-
-This patch adds support for Aarch64.
-
-As with ARMv7, We do not add the xBT/xBDT style linker scripts as
-these have been deprecated in favour of adjusting the page sizes
-via command line parameter to ld.
-
-Signed-off-by: Steve Capper <steve.capper@linaro.org>
----
- Makefile               |    7 +++++++
- sys-aarch64elf_linux.S |   34 ++++++++++++++++++++++++++++++++++
- 2 files changed, 41 insertions(+)
- create mode 100644 sys-aarch64elf_linux.S
-
-diff --git a/Makefile b/Makefile
-index 48205af..28ceade 100644
---- a/Makefile
-+++ b/Makefile
-@@ -57,6 +57,12 @@ TMPLIB32 = lib
- ELF32 += armelf_linux_eabi
- CUSTOM_LDSCRIPTS = no
- else
-+ifeq ($(ARCH),aarch64)
-+CC64 = gcc
-+ELF64 = aarch64elf_linux
-+TMPLIB64 = lib64
-+CUSTOM_LDSCRIPTS = no
-+else
- ifeq ($(ARCH),i386)
- CC32 = gcc
- ELF32 = elf_i386
-@@ -100,6 +106,7 @@ endif
- endif
- endif
- endif
-+endif
- 
- ifdef CC32
- OBJDIRS += obj32
-diff --git a/sys-aarch64elf_linux.S b/sys-aarch64elf_linux.S
-new file mode 100644
-index 0000000..699ff4c
---- /dev/null
-+++ b/sys-aarch64elf_linux.S
-@@ -0,0 +1,34 @@
-+/*
-+ * libhugetlbfs - Easy use of Linux hugepages
-+ * Copyright (C) 2013 Linaro Ltd.
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public License
-+ * version 2.1 as published by the Free Software Foundation.
-+ *
-+ * This library is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
-+ */
-+
-+        .text
-+
-+        .globl  direct_syscall
-+
-+
-+direct_syscall:
-+	uxtw	x8, w0
-+	mov	x0, x1
-+	mov	x1, x2
-+	mov	x2, x3
-+	mov	x3, x4
-+	mov	x4, x5
-+	mov	x5, x6
-+	mov	x6, x7
-+	svc	0x0
-+	RET
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
deleted file mode 100644
index 0b6fd8a..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Pending
-
-From 9bb940bd6a86f09280bdcd48a7177a835d72a25c Mon Sep 17 00:00:00 2001
-From: Steve Capper <steve.capper@linaro.org>
-Date: Wed, 10 Apr 2013 15:52:46 +0100
-Subject: [PATCH] Aarch64 unit test fixes.
-
-On Aarch64, zero bytes are illegal instructions, this is added to
-the icache-hygiene test.
-
-In mremap-expand-slice-collision, if __LP64__ is defined then
-mappings are attempted at 1TB boundaries which are outside the
-allowable mmap region for Aarch64. For __aarch64__ we change this
-mapping back to 256MB slices.
-
-Signed-off-by: Steve Capper <steve.capper@linaro.org>
----
- tests/icache-hygiene.c                |    7 ++++---
- tests/mremap-expand-slice-collision.c |    2 +-
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/tests/icache-hygiene.c b/tests/icache-hygiene.c
-index 51792b3..876ce10 100644
---- a/tests/icache-hygiene.c
-+++ b/tests/icache-hygiene.c
-@@ -54,7 +54,7 @@ static void cacheflush(void *p)
- {
- #if defined(__powerpc__)
- 	asm volatile("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r"(p));
--#elif defined(__arm__)
-+#elif defined(__arm__) || defined(__aarch64__)
- 	__clear_cache(p, p + COPY_SIZE);
- #endif
- }
-@@ -87,8 +87,9 @@ static void *sig_expected;
- static void sig_handler(int signum, siginfo_t *si, void *uc)
- {
- #if defined(__powerpc__) || defined(__powerpc64__) || defined(__ia64__) || \
--    defined(__s390__) || defined(__s390x__) || defined(__sparc__)
--	/* On powerpc and ia64 and s390, 0 bytes are an illegal
-+    defined(__s390__) || defined(__s390x__) || defined(__sparc__) || \
-+    defined(__aarch64__)
-+	/* On powerpc, ia64, s390 and Aarch64, 0 bytes are an illegal
- 	 * instruction, so, if the icache is cleared properly, we SIGILL
- 	 * as soon as we jump into the cleared page */
- 	if (signum == SIGILL) {
-diff --git a/tests/mremap-expand-slice-collision.c b/tests/mremap-expand-slice-collision.c
-index c25f4c6..853f3c3 100644
---- a/tests/mremap-expand-slice-collision.c
-+++ b/tests/mremap-expand-slice-collision.c
-@@ -38,7 +38,7 @@ void init_slice_boundary(int fd)
- 	unsigned long slice_size;
- 	void *p1, *p2, *heap;
- 	int slices_ok, i, rc;
--#ifdef __LP64__
-+#if defined(__LP64__) && !defined(__aarch64__)
- 	/* powerpc: 1TB slices starting at 1 TB */
- 	slice_boundary = 0x10000000000;
- 	slice_size = 0x10000000000;
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
deleted file mode 100644
index 673f204..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Pending
-
-From c7fcb7270bb510d7271a1c0cea095a4dbea49420 Mon Sep 17 00:00:00 2001
-From: Steve Capper <steve.capper@linaro.org>
-Date: Mon, 3 Jun 2013 17:00:45 +0100
-Subject: [PATCH] Add PROT_NONE to the mprotect test.
-
-The mprotect unit test checks PROT_READ and PROT_READ | PROT_WRITE
-protections. We recently found that PROT_NONE wasn't properly
-supported in our huge page kernel code.
-
-This patch adds PROT_NONE tests to mprotect. The expected behaviour
-is that neither reads nor writes should succeed.
-
-Signed-off-by: Steve Capper <steve.capper@linaro.org>
----
- tests/mprotect.c |    6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/tests/mprotect.c b/tests/mprotect.c
-index aa4673e..db6a662 100644
---- a/tests/mprotect.c
-+++ b/tests/mprotect.c
-@@ -213,5 +213,11 @@ int main(int argc, char *argv[])
- 	test_mprotect(fd, "RW->R 1/2", 2*hpage_size, PROT_READ|PROT_WRITE,
- 		      hpage_size, PROT_READ);
- 
-+	/* PROT_NONE tests */
-+	test_mprotect(fd, "NONE->R", hpage_size, PROT_NONE,
-+		      hpage_size, PROT_READ);
-+	test_mprotect(fd, "NONE->RW", hpage_size, PROT_NONE,
-+		      hpage_size, PROT_READ|PROT_WRITE);
-+
- 	PASS();
- }
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
index 3296376..07a9971 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
@@ -3,46 +3,21 @@ From: Ting Liu <b28495@freescale.com>
 Date: Mon, 18 Jun 2012 16:37:05 +0800
 Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the same place
 
-
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
- Makefile |   22 +++++++++++-----------
- 1 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 1017950..bac5f01 100644
+index 91502e1..bfb3414 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -131,17 +131,17 @@ endif
- 
- # If TMPLIB64 is set, then sure we are not resolving LIB32 and LIB64 to the
- # same place
--ifdef TMPLIB64
--
--REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
--REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
--ifneq ($(realpath $(PREFIX)),)
--ifeq ($(REALLIB32),$(REALLIB64))
+@@ -167,7 +167,6 @@ REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
+ REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
+ ifneq ($(realpath $(PREFIX)),)
+ ifeq ($(REALLIB32),$(REALLIB64))
 -$(error LIB32 ($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to $(REALLIB64)) are resolving to the same place. Manually specify LIB32 and LIB64. e.g. make PREFIX=$(PREFIX) LIB32=lib32 LIB64=lib64)
--endif
--endif
--
--endif
-+#ifdef TMPLIB64
-+#
-+#REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
-+#REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
-+#ifneq ($(realpath $(PREFIX)),)
-+#ifeq ($(REALLIB32),$(REALLIB64))
-+#$(error LIB32 ($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to $(REALLIB64)) are resolving to the same place. Manually specify LIB32 and LIB64. e.g. make PREFIX=$(PREFIX) LIB32=lib32 LIB64=lib64)
-+#endif
-+#endif
-+#
-+#endif
+ endif
+ endif
  
- HEADERDIR = $(PREFIX)/include
- LIBDIR32 = $(PREFIX)/$(LIB32)
 -- 
-1.7.0.4
-
+1.9.2
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5ee6e8e..5645add 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -5,23 +5,23 @@ LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "sysfsutils perl"
 RDEPENDS_${PN} += "python python-io python-lang python-subprocess python-resource"
 
-SRCBRANCH = "next"
-SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code;branch=${SRCBRANCH} \
+SRCREV = "ea3f6b273f535aab38cefae30030774457bbbfe6"
+SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
-    file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
-    file://0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch \
+    file://0001-aarch64-fix-cross-compilation.patch \
+    file://0001-aarch64-fix-page-size-not-properly-computed.patch \
+    file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
 "
-SRCREV = "6824d18d5f33fdab445a8eff147fcdb6361f5791"
 
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
 
-
-EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
+LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
+EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=1"
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -31,6 +31,9 @@ do_configure() {
     if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
       sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
     fi
+
+    # fixup perl module directory hardcoded to perl5
+    sed -i 's/perl5/perl/g'  Makefile
 }
 
 do_install() {
-- 
1.9.2


