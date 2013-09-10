Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe006.messaging.microsoft.com [216.32.180.189])
	by mail.openembedded.org (Postfix) with ESMTP id E4E216101A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:03:01 +0000 (UTC)
Received: from mail26-co1-R.bigfish.com (10.243.78.254) by
	CO1EHSOBE001.bigfish.com (10.243.66.64) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 02:03:03 +0000
Received: from mail26-co1 (localhost [127.0.0.1])	by mail26-co1-R.bigfish.com
	(Postfix) with ESMTP id C428EC80101	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:03:03 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zz936eI168aJc8kzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bh8275dhz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail26-co1 (localhost.localdomain [127.0.0.1]) by mail26-co1
	(MessageSwitch) id 1378778580399613_21324;
	Tue, 10 Sep 2013 02:03:00 +0000 (UTC)
Received: from CO1EHSMHS005.bigfish.com (unknown [10.243.78.233])	by
	mail26-co1.bigfish.com (Postfix) with ESMTP id 53CDCAC004A	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:03:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS005.bigfish.com
	(10.243.66.15) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 02:02:59 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 10 Sep 2013 02:02:58 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r8A22hqg004347;	Mon, 9 Sep 2013 19:02:56 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2013 10:02:39 +0800
Message-ID: <1378778559-22147-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1378778559-22147-1-git-send-email-B40290@freescale.com>
References: <1378778559-22147-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] libhugetlbfs: add recipe
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
X-List-Received-Date: Tue, 10 Sep 2013 02:03:02 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 ...fs-Remove-segment-based-alignment-restric.patch |  131 ++++++++++++++++++++
 ...-run_tests.py-fix-typo-in-test-invocation.patch |   30 +++++
 .../files/Fix-cross-compiling-on-PPC.patch         |   28 ++++
 .../libhugetlbfs/files/aarch64-support.patch       |   88 +++++++++++++
 .../files/aarch64-unit-test-fixes.patch            |   62 +++++++++
 .../files/add-PROT-NONE-to-the-mprotest-test.patch |   38 ++++++
 .../files/checks-if-mtab-is-a-symlink.patch        |   30 +++++
 .../libhugetlbfs/files/cross-compile.patch         |   83 ++++++++++++
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch |   64 ++++++++++
 .../libhugetlbfs/files/install64-fix.patch         |   20 +++
 ...s-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch |   31 +++++
 ...s-avoid-search-host-library-path-for-cros.patch |   99 +++++++++++++++
 ...ng-LIB32-and-LIB64-if-they-point-to-the-s.patch |   48 +++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |   51 ++++++++
 14 files changed, 803 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/Fix-cross-compiling-on-PPC.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/cross-compile.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch
new file mode 100644
index 0000000..31f0516
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch
@@ -0,0 +1,131 @@
+Upstream-Status: Accepted
+
+From eee53989d5b7393352d77451b66066768113072a Mon Sep 17 00:00:00 2001
+From: Becky Bruce <beckyb@kernel.crashing.org>
+Date: Tue, 19 Apr 2011 14:13:18 -0500
+Subject: [PATCH 1/2] libhugetlbfs: Remove segment-based alignment restrictions
+
+The existing library code enforces classic PPC segment restrictons on the
+alignment and allocation of hugepages.  BookE Freescale processors
+don't have this restriction and allowing it to remain in place
+is overly restrictive on 32-bit processors.  Define PPC_NO_SEGMENTS to
+turn this off.
+
+Signed-off-by: Becky Bruce <beckyb@kernel.crashing.org>
+---
+ Makefile                   |    2 +-
+ elflink.c                  |    7 ++++---
+ libhugetlbfs_internal.h    |    3 ++-
+ morecore.c                 |    2 +-
+ tests/brk_near_huge.c      |    2 +-
+ tests/truncate_above_4GB.c |    6 ++++--
+ 6 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d781871..3160f83 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,7 +29,7 @@ INSTALL = install
+ LDFLAGS += -Wl,-z,noexecstack -ldl
+ CFLAGS ?= -O2 -g
+ CFLAGS += -Wall -fPIC
+-CPPFLAGS += -D__LIBHUGETLBFS__
++CPPFLAGS += -D__LIBHUGETLBFS__ -DPPC_NO_SEGMENTS
+ 
+ ARCH = $(shell uname -m | sed -e s/i.86/i386/)
+ 
+diff --git a/elflink.c b/elflink.c
+index c24bedc..432f3d7 100644
+--- a/elflink.c
++++ b/elflink.c
+@@ -552,7 +552,8 @@ bail2:
+ 	seg->extrasz = end_orig - start;
+ }
+ 
+-#if defined(__powerpc64__) || defined (__powerpc__)
++#if defined(__powerpc64__) || \
++	(defined(__powerpc__) && !defined(PPC_NO_SEGMENTS))
+ #define SLICE_LOW_TOP		(0x100000000UL)
+ #define SLICE_LOW_SIZE		(1UL << SLICE_LOW_SHIFT)
+ #define SLICE_HIGH_SIZE		(1UL << SLICE_HIGH_SHIFT)
+@@ -574,7 +575,7 @@ static unsigned long hugetlb_slice_start(unsigned long addr)
+ 		return SLICE_LOW_TOP;
+ 	else
+ 		return ALIGN_DOWN(addr, SLICE_HIGH_SIZE);
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
+ 	return ALIGN_DOWN(addr, SLICE_LOW_SIZE);
+ #else
+ 	return ALIGN_DOWN(addr, gethugepagesize());
+@@ -588,7 +589,7 @@ static unsigned long hugetlb_slice_end(unsigned long addr)
+ 		return ALIGN_UP(addr, SLICE_LOW_SIZE) - 1;
+ 	else
+ 		return ALIGN_UP(addr, SLICE_HIGH_SIZE) - 1;
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
+ 	return ALIGN_UP(addr, SLICE_LOW_SIZE) - 1;
+ #else
+ 	return ALIGN_UP(addr, gethugepagesize()) - 1;
+diff --git a/libhugetlbfs_internal.h b/libhugetlbfs_internal.h
+index 97b19fa..ef9f668 100644
+--- a/libhugetlbfs_internal.h
++++ b/libhugetlbfs_internal.h
+@@ -49,7 +49,8 @@
+ #define ALIGN_UP(x,a)	ALIGN(x,a)
+ #define ALIGN_DOWN(x,a) ((x) & ~((a) - 1))
+ 
+-#if defined(__powerpc64__) || defined (__powerpc__)
++#if defined(__powerpc64__) || \
++	(defined(__powerpc__) && !defined(PPC_NO_SEGMENTS))
+ #define SLICE_LOW_SHIFT		28
+ #define SLICE_HIGH_SHIFT	40
+ #elif defined(__ia64__)
+diff --git a/morecore.c b/morecore.c
+index 6b4364c..01c560e 100644
+--- a/morecore.c
++++ b/morecore.c
+@@ -44,7 +44,7 @@ static long hugetlbfs_next_addr(long addr)
+ {
+ #if defined(__powerpc64__)
+ 	return ALIGN(addr, 1L << SLICE_HIGH_SHIFT);
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
+ 	return ALIGN(addr, 1L << SLICE_LOW_SHIFT);
+ #elif defined(__ia64__)
+ 	if (addr < (1UL << SLICE_HIGH_SHIFT))
+diff --git a/tests/brk_near_huge.c b/tests/brk_near_huge.c
+index 71eb803..f6d1e07 100644
+--- a/tests/brk_near_huge.c
++++ b/tests/brk_near_huge.c
+@@ -47,7 +47,7 @@ void *next_chunk(void *addr)
+ 		/* 1TB segments above */
+ 		return PALIGN(addr, 0x10000000000UL);
+ }
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
+ void *next_chunk(void *addr)
+ {
+ 	return PALIGN(addr, 0x10000000UL);
+diff --git a/tests/truncate_above_4GB.c b/tests/truncate_above_4GB.c
+index 5b8c08f..4c427fc 100644
+--- a/tests/truncate_above_4GB.c
++++ b/tests/truncate_above_4GB.c
+@@ -102,11 +102,13 @@ int main(int argc, char *argv[])
+ 	*qi = 0;
+ 
+ 	/* This part of the test makes the problem more obvious, but
+-	 * is not essential.  It can't be done on powerpc, where
++	 * is not essential.  It can't be done on segmented powerpc, where
+ 	 * segment restrictions prohibit us from performing such a
+ 	 * mapping, so skip it there. Similarly, ia64's address space
+ 	 * restrictions prevent this. */
+-#if !defined(__powerpc__) && !defined(__powerpc64__) && !defined(__ia64__)
++#if (defined(__powerpc__) && defined(PPC_NO_SEGMENTS)) \
++	|| !defined(__powerpc__) && !defined(__powerpc64__) \
++	&& !defined(__ia64__)
+ 	/* Replace middle hpage by tinypage mapping to trigger
+ 	 * nr_ptes BUG */
+ 	verbose_printf("Replacing map at %p-%p...", q + hpage_size,
+-- 
+1.5.6.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch
new file mode 100644
index 0000000..747ee93
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch
@@ -0,0 +1,30 @@
+From b3d5429449aef61cb8926c33925fd7b5cad737de Mon Sep 17 00:00:00 2001
+From: Becky Bruce <beckyb@kernel.crashing.org>
+Date: Tue, 19 Apr 2011 19:06:16 -0500
+Subject: [PATCH 2/2] tests/run_tests.py: fix typo in test invocation.
+
+One test was being invoked with HUGETLB_MORECORE=es (instead of yes).....
+
+Upstream-Status: Accepted
+
+Signed-off-by: Becky Bruce <beckyb@kernel.crashing.org>
+---
+ tests/run_tests.py |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/tests/run_tests.py b/tests/run_tests.py
+index 8055940..f0049b3 100755
+--- a/tests/run_tests.py
++++ b/tests/run_tests.py
+@@ -567,7 +567,7 @@ def functional_tests():
+     do_test("heapshrink", LD_PRELOAD="libhugetlbfs.so libheapshrink.so",
+             HUGETLB_MORECORE="yes")
+     do_test("heapshrink", LD_PRELOAD="libheapshrink.so", HUGETLB_MORECORE="yes",
+-            HUGETLB_MORECORE_SHRINK="es")
++            HUGETLB_MORECORE_SHRINK="yes")
+     do_test("heapshrink", LD_PRELOAD="libhugetlbfs.so libheapshrink.so",
+             HUGETLB_MORECORE="yes", HUGETLB_MORECORE_SHRINK="yes")
+     do_test("heap-overflow", HUGETLB_VERBOSE="1", HUGETLB_MORECORE="yes")
+-- 
+1.5.6.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/Fix-cross-compiling-on-PPC.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/Fix-cross-compiling-on-PPC.patch
new file mode 100644
index 0000000..30d421d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/Fix-cross-compiling-on-PPC.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Accepted
+
+Renamed ARCH check to use powerpc (for ppc32) and powerpc64.
+
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+Signed-off-by: Guo Chunrong <B40290@freescale.com>
+
+
+--- a/Makefileold	2013-09-05 03:19:24.261312044 -0500
++++ b/Makefile	2013-09-05 03:20:43.312456972 -0500
+@@ -36,7 +36,7 @@
+ 
+ CUSTOM_LDSCRIPTS = yes
+ 
+-ifeq ($(ARCH),ppc64)
++ifeq ($(ARCH),powerpc64)
+ CC64 = $(CC) -m64
+ ELF64 = elf64ppc
+ TMPLIB64 = lib64
+@@ -46,7 +46,7 @@
+ ELF32 = elf32ppclinux
+ endif
+ else
+-ifeq ($(ARCH),ppc)
++ifeq ($(ARCH),powerpc)
+ CC32 = $(CC) -m32
+ ELF32 = elf32ppclinux
+ TMPLIB32 = lib
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
new file mode 100644
index 0000000..ceac6b4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
@@ -0,0 +1,88 @@
+Upstream-Status: Pending
+
+From 52b8430eb4f03e35721f29862de33041fe9c9768 Mon Sep 17 00:00:00 2001
+From: Steve Capper <steve.capper@linaro.org>
+Date: Wed, 10 Apr 2013 14:51:12 +0100
+Subject: [PATCH] Aarch64 support.
+
+This patch adds support for Aarch64.
+
+As with ARMv7, We do not add the xBT/xBDT style linker scripts as
+these have been deprecated in favour of adjusting the page sizes
+via command line parameter to ld.
+
+Signed-off-by: Steve Capper <steve.capper@linaro.org>
+---
+ Makefile               |    7 +++++++
+ sys-aarch64elf_linux.S |   34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+ create mode 100644 sys-aarch64elf_linux.S
+
+diff --git a/Makefile b/Makefile
+index 48205af..28ceade 100644
+--- a/Makefile
++++ b/Makefile
+@@ -57,6 +57,12 @@ TMPLIB32 = lib
+ ELF32 += armelf_linux_eabi
+ CUSTOM_LDSCRIPTS = no
+ else
++ifeq ($(ARCH),aarch64)
++CC64 = gcc
++ELF64 = aarch64elf_linux
++TMPLIB64 = lib64
++CUSTOM_LDSCRIPTS = no
++else
+ ifeq ($(ARCH),i386)
+ CC32 = gcc
+ ELF32 = elf_i386
+@@ -100,6 +106,7 @@ endif
+ endif
+ endif
+ endif
++endif
+ 
+ ifdef CC32
+ OBJDIRS += obj32
+diff --git a/sys-aarch64elf_linux.S b/sys-aarch64elf_linux.S
+new file mode 100644
+index 0000000..699ff4c
+--- /dev/null
++++ b/sys-aarch64elf_linux.S
+@@ -0,0 +1,34 @@
++/*
++ * libhugetlbfs - Easy use of Linux hugepages
++ * Copyright (C) 2013 Linaro Ltd.
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public License
++ * version 2.1 as published by the Free Software Foundation.
++ *
++ * This library is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
++ */
++
++        .text
++
++        .globl  direct_syscall
++
++
++direct_syscall:
++	uxtw	x8, w0
++	mov	x0, x1
++	mov	x1, x2
++	mov	x2, x3
++	mov	x3, x4
++	mov	x4, x5
++	mov	x5, x6
++	mov	x6, x7
++	svc	0x0
++	RET
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
new file mode 100644
index 0000000..0b6fd8a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Pending
+
+From 9bb940bd6a86f09280bdcd48a7177a835d72a25c Mon Sep 17 00:00:00 2001
+From: Steve Capper <steve.capper@linaro.org>
+Date: Wed, 10 Apr 2013 15:52:46 +0100
+Subject: [PATCH] Aarch64 unit test fixes.
+
+On Aarch64, zero bytes are illegal instructions, this is added to
+the icache-hygiene test.
+
+In mremap-expand-slice-collision, if __LP64__ is defined then
+mappings are attempted at 1TB boundaries which are outside the
+allowable mmap region for Aarch64. For __aarch64__ we change this
+mapping back to 256MB slices.
+
+Signed-off-by: Steve Capper <steve.capper@linaro.org>
+---
+ tests/icache-hygiene.c                |    7 ++++---
+ tests/mremap-expand-slice-collision.c |    2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/tests/icache-hygiene.c b/tests/icache-hygiene.c
+index 51792b3..876ce10 100644
+--- a/tests/icache-hygiene.c
++++ b/tests/icache-hygiene.c
+@@ -54,7 +54,7 @@ static void cacheflush(void *p)
+ {
+ #if defined(__powerpc__)
+ 	asm volatile("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r"(p));
+-#elif defined(__arm__)
++#elif defined(__arm__) || defined(__aarch64__)
+ 	__clear_cache(p, p + COPY_SIZE);
+ #endif
+ }
+@@ -87,8 +87,9 @@ static void *sig_expected;
+ static void sig_handler(int signum, siginfo_t *si, void *uc)
+ {
+ #if defined(__powerpc__) || defined(__powerpc64__) || defined(__ia64__) || \
+-    defined(__s390__) || defined(__s390x__) || defined(__sparc__)
+-	/* On powerpc and ia64 and s390, 0 bytes are an illegal
++    defined(__s390__) || defined(__s390x__) || defined(__sparc__) || \
++    defined(__aarch64__)
++	/* On powerpc, ia64, s390 and Aarch64, 0 bytes are an illegal
+ 	 * instruction, so, if the icache is cleared properly, we SIGILL
+ 	 * as soon as we jump into the cleared page */
+ 	if (signum == SIGILL) {
+diff --git a/tests/mremap-expand-slice-collision.c b/tests/mremap-expand-slice-collision.c
+index c25f4c6..853f3c3 100644
+--- a/tests/mremap-expand-slice-collision.c
++++ b/tests/mremap-expand-slice-collision.c
+@@ -38,7 +38,7 @@ void init_slice_boundary(int fd)
+ 	unsigned long slice_size;
+ 	void *p1, *p2, *heap;
+ 	int slices_ok, i, rc;
+-#ifdef __LP64__
++#if defined(__LP64__) && !defined(__aarch64__)
+ 	/* powerpc: 1TB slices starting at 1 TB */
+ 	slice_boundary = 0x10000000000;
+ 	slice_size = 0x10000000000;
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
new file mode 100644
index 0000000..673f204
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Pending
+
+From c7fcb7270bb510d7271a1c0cea095a4dbea49420 Mon Sep 17 00:00:00 2001
+From: Steve Capper <steve.capper@linaro.org>
+Date: Mon, 3 Jun 2013 17:00:45 +0100
+Subject: [PATCH] Add PROT_NONE to the mprotect test.
+
+The mprotect unit test checks PROT_READ and PROT_READ | PROT_WRITE
+protections. We recently found that PROT_NONE wasn't properly
+supported in our huge page kernel code.
+
+This patch adds PROT_NONE tests to mprotect. The expected behaviour
+is that neither reads nor writes should succeed.
+
+Signed-off-by: Steve Capper <steve.capper@linaro.org>
+---
+ tests/mprotect.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/tests/mprotect.c b/tests/mprotect.c
+index aa4673e..db6a662 100644
+--- a/tests/mprotect.c
++++ b/tests/mprotect.c
+@@ -213,5 +213,11 @@ int main(int argc, char *argv[])
+ 	test_mprotect(fd, "RW->R 1/2", 2*hpage_size, PROT_READ|PROT_WRITE,
+ 		      hpage_size, PROT_READ);
+ 
++	/* PROT_NONE tests */
++	test_mprotect(fd, "NONE->R", hpage_size, PROT_NONE,
++		      hpage_size, PROT_READ);
++	test_mprotect(fd, "NONE->RW", hpage_size, PROT_NONE,
++		      hpage_size, PROT_READ|PROT_WRITE);
++
+ 	PASS();
+ }
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch
new file mode 100644
index 0000000..f555947
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Accepted
+
+If /etc/mtab is a symlink to /proc/self/mounts,
+mounting fails because addmntent returns an error.
+As a consequence, the Private directory is unusable.
+This is a patch which checks if /etc/mtab is a symlink,
+and if so, doesn't try to call addmntent.
+
+Signed-off-by: Guo Chunrong <B40290@freescale.com>
+
+
+--- a/hugeadm.c	2013-07-31 23:46:04.461258351 -0500
++++ b/hugeadm.c	2013-07-31 23:50:03.249359534 -0500
+@@ -552,6 +552,16 @@
+ 			return 1;
+ 		}
+ 
++         char dummy;
++         int useMtab;
++          /* Check if mtab is a symlink */
++          useMtab = (readlink(MOUNTED, &dummy, 1) < 0);
++        if (!useMtab) {
++         /* No need updating mtab */
++          return 0;
++        }
++  
++
+ 		mounts = setmntent(MOUNTED, "a+");
+ 		if (mounts) {
+ 			entry.mnt_fsname = FS_NAME;
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/cross-compile.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/cross-compile.patch
new file mode 100644
index 0000000..13b4fde
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/cross-compile.patch
@@ -0,0 +1,83 @@
+Upstream-Status: Accepted
+
+Fix cross compiling
+
+Signed-off-by: Guo Chunrong <B40290@freescale.com>
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -37,60 +37,60 @@ ARCH = $(shell uname -m | sed -e s/i.86/
+ CUSTOM_LDSCRIPTS = yes
+ 
+ ifeq ($(ARCH),ppc64)
+-CC64 = gcc -m64
++CC64 = $(CC) -m64
+ ELF64 = elf64ppc
+ TMPLIB64 = lib64
+ TMPLIB32 = lib
+ ifneq ($(BUILDTYPE),NATIVEONLY)
+-CC32 = gcc -m32
++CC32 = $(CC) -m32
+ ELF32 = elf32ppclinux
+ endif
+ else
+ ifeq ($(ARCH),ppc)
+-CC32 = gcc -m32
++CC32 = $(CC) -m32
+ ELF32 = elf32ppclinux
+ TMPLIB32 = lib
+ else
+ ifeq ($(ARCH),armv7l)
+-CC32 = gcc
++CC32 = $(CC)
+ TMPLIB32 = lib
+ ELF32 += armelf_linux_eabi
+ CUSTOM_LDSCRIPTS = no
+ else
+ ifeq ($(ARCH),aarch64)
+-CC64 = gcc
++CC64 = $(CC)
+ ELF64 = aarch64elf_linux
+ TMPLIB64 = lib64
+ CUSTOM_LDSCRIPTS = no
+ else
+ ifeq ($(ARCH),i386)
+-CC32 = gcc
++CC32 = $(CC)
+ ELF32 = elf_i386
+ TMPLIB32 = lib
+ else
+ ifeq ($(ARCH),x86_64)
+-CC64 = gcc -m64
++CC64 = $(CC) -m64
+ ELF64 = elf_x86_64
+ TMPLIB64 = lib64
+ TMPLIB32 = lib
+ ifneq ($(BUILDTYPE),NATIVEONLY)
+-CC32 = gcc -m32
++CC32 = $(CC) -m32
+ ELF32 = elf_i386
+ endif
+ else
+ ifeq ($(ARCH),ia64)
+-CC64 = gcc
++CC64 = $(CC)
+ TMPLIB64 = lib64
+ CFLAGS += -DNO_ELFLINK
+ else
+ ifeq ($(ARCH),sparc64)
+-CC64 = gcc -m64
++CC64 = $(CC) -m64
+ TMPLIB64 = lib64
+ CFLAGS += -DNO_ELFLINK
+ else
+ ifeq ($(ARCH),s390x)
+-CC64 = gcc -m64
+-CC32 = gcc -m31
++CC64 = $(CC) -m64
++CC32 = $(CC) -m31
+ ELF32 = elf_s390
+ ELF64 = elf64_s390
+ TMPLIB64 = lib64
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
new file mode 100644
index 0000000..fe79d95
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Inappropriate [oe-core specific]
+
+
+fix the below error:
+  ERROR: QA Issue: libhugetlbfs: Files/directories were installed but not shipped
+  /usr/lib64
+  /usr/lib64/libhugetlbfs.so
+  /usr/lib64/libhugetlbfs.a
+  /usr/lib64/libhugetlbfs_privutils.so
+  /usr/lib64/perl5
+  /usr/lib64/perl5/TLBC
+  /usr/lib64/perl5/TLBC/PerfCollect.pm
+  /usr/lib64/perl5/TLBC/Report.pm
+  /usr/lib64/perl5/TLBC/DataCollect.pm
+  /usr/lib64/perl5/TLBC/OpCollect.pm
+$<50>ERROR: QA run found fatal errors. Please consider fixing them.
+
+
+Signed-off-by: Guo Chunrong <B40290@freescale.com>
+
+--- a/Makefileold	2013-09-08 22:17:29.695428823 -0500
++++ b/Makefile	2013-09-08 22:15:50.224377019 -0500
+@@ -60,7 +60,7 @@
+ ifeq ($(ARCH),aarch64)
+ CC64 = $(CC)
+ ELF64 = aarch64elf_linux
+-TMPLIB64 = lib64
++TMPLIB64 = lib
+ CUSTOM_LDSCRIPTS = no
+ else
+ ifeq ($(ARCH),i386)
+@@ -71,7 +71,7 @@
+ ifeq ($(ARCH),x86_64)
+ CC64 = $(CC) -m64
+ ELF64 = elf_x86_64
+-TMPLIB64 = lib64
++TMPLIB64 = lib
+ TMPLIB32 = lib
+ ifneq ($(BUILDTYPE),NATIVEONLY)
+ CC32 = $(CC) -m32
+@@ -171,11 +171,23 @@
+ BINDIR = $(PREFIX)/share/libhugetlbfs
+ EXEDIR = $(PREFIX)/bin
+ DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
++
+ ifdef CC32
+ PMDIR = $(PREFIX)/lib/perl5/TLBC
++endif
++
++ifdef CC64
++ifeq ($(ARCH),x86_64)
++PMDIR = $(PREFIX)/lib/perl5/TLBC
++else
++ifeq ($(ARCH),aarch64)
++PMDIR = $(PREFIX)/lib/perl5/TLBC
+ else
+ PMDIR = $(PREFIX)/lib64/perl5/TLBC
+ endif
++endif
++endif
++
+ MANDIR1 = $(PREFIX)/share/man/man1
+ MANDIR3 = $(PREFIX)/share/man/man3
+ MANDIR7 = $(PREFIX)/share/man/man7
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
new file mode 100644
index 0000000..9652c3d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [oe-core specific]
+
+TESTS_64 is empty, install will fail due to missing file operand
+
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+Index: git/tests/Makefile
+===================================================================
+--- git.orig/tests/Makefile
++++ git/tests/Makefile
+@@ -292,7 +292,7 @@ obj64/install:
+ 	$(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
+ 	$(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
+ 	$(INSTALL) -m 755 $(HELPER_LIBS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
+-	$(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
++#	$(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
+ 	$(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
+ 
+ install: $(OBJDIRS:%=%/install)
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch
new file mode 100644
index 0000000..9fb5b77
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Accepted
+
+From f6aab55052b8ad7b9498b325c8a26cac25703b01 Mon Sep 17 00:00:00 2001
+From: Yu Zongchun <b40527@freescale.com>
+Date: Mon, 6 May 2013 18:06:02 +0800
+Subject: [PATCH] libhugetlbfs:Fix perl lib can not be shiped to sub-package
+ issue for 64bit board
+
+---
+ Makefile |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 03966b2..adbd91e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -149,7 +149,11 @@ LDSCRIPTDIR = $(PREFIX)/share/libhugetlbfs/ldscripts
+ BINDIR = $(PREFIX)/share/libhugetlbfs
+ EXEDIR = $(PREFIX)/bin
+ DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
++ifdef CC32
+ PMDIR = $(PREFIX)/lib/perl5/TLBC
++else
++PMDIR = $(PREFIX)/lib64/perl5/TLBC
++endif
+ MANDIR1 = $(PREFIX)/share/man/man1
+ MANDIR3 = $(PREFIX)/share/man/man3
+ MANDIR7 = $(PREFIX)/share/man/man7
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
new file mode 100644
index 0000000..b3fd843
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
@@ -0,0 +1,99 @@
+From 0a2877400a086e9d6ddd32a80462b7a931921dc2 Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <B40290@freescale.com>
+Date: Sun, 8 Sep 2013 23:21:49 -0500
+Subject: [PATCH] libhugetlbfs: avoid search host library path for cross 
+ compilation
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+---
+ ldscripts/elf32ppclinux.xB   |    2 +-
+ ldscripts/elf32ppclinux.xBDT |    2 +-
+ ldscripts/elf64ppc.xB        |    2 +-
+ ldscripts/elf64ppc.xBDT      |    2 +-
+ ldscripts/elf_x86_64.xB      |    2 +-
+ ldscripts/elf_x86_64.xBDT    |    2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/ldscripts/elf32ppclinux.xB b/ldscripts/elf32ppclinux.xB
+index 28ad88d..33d482d 100644
+--- a/ldscripts/elf32ppclinux.xB
++++ b/ldscripts/elf32ppclinux.xB
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
+ 	      "elf32-powerpc")
+ OUTPUT_ARCH(powerpc:common)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ PHDRS
+ {
+diff --git a/ldscripts/elf32ppclinux.xBDT b/ldscripts/elf32ppclinux.xBDT
+index 497882b..823475e 100644
+--- a/ldscripts/elf32ppclinux.xBDT
++++ b/ldscripts/elf32ppclinux.xBDT
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
+ 	      "elf32-powerpc")
+ OUTPUT_ARCH(powerpc:common)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ PHDRS
+ {
+diff --git a/ldscripts/elf64ppc.xB b/ldscripts/elf64ppc.xB
+index 1a9c1ab..8cc557d 100644
+--- a/ldscripts/elf64ppc.xB
++++ b/ldscripts/elf64ppc.xB
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
+ 	      "elf64-powerpc")
+ OUTPUT_ARCH(powerpc:common64)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ PHDRS
+ {
+diff --git a/ldscripts/elf64ppc.xBDT b/ldscripts/elf64ppc.xBDT
+index 5477294..53e0749 100644
+--- a/ldscripts/elf64ppc.xBDT
++++ b/ldscripts/elf64ppc.xBDT
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
+ 	      "elf64-powerpc")
+ OUTPUT_ARCH(powerpc:common64)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT( -lhugetlbfs );
+ PHDRS
+ {
+diff --git a/ldscripts/elf_x86_64.xB b/ldscripts/elf_x86_64.xB
+index ed21a2c..ba50e9f 100644
+--- a/ldscripts/elf_x86_64.xB
++++ b/ldscripts/elf_x86_64.xB
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64",
+ 	      "elf64-x86-64")
+ OUTPUT_ARCH(i386:x86-64)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ /* Do we need any of these for elf?
+    __DYNAMIC = 0;    */
+diff --git a/ldscripts/elf_x86_64.xBDT b/ldscripts/elf_x86_64.xBDT
+index 1855202..c62d245 100644
+--- a/ldscripts/elf_x86_64.xBDT
++++ b/ldscripts/elf_x86_64.xBDT
+@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64",
+ 	      "elf64-x86-64")
+ OUTPUT_ARCH(i386:x86-64)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
++/*SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
+ INPUT(-lhugetlbfs);
+ /* Do we need any of these for elf?
+    __DYNAMIC = 0;    */
+-- 
+1.7.9.7
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
new file mode 100644
index 0000000..3296376
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
@@ -0,0 +1,48 @@
+From 355c014573de7f95202cc7c819f81f0f230e4a1a Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Mon, 18 Jun 2012 16:37:05 +0800
+Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the same place
+
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ Makefile |   22 +++++++++++-----------
+ 1 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1017950..bac5f01 100644
+--- a/Makefile
++++ b/Makefile
+@@ -131,17 +131,17 @@ endif
+ 
+ # If TMPLIB64 is set, then sure we are not resolving LIB32 and LIB64 to the
+ # same place
+-ifdef TMPLIB64
+-
+-REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
+-REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
+-ifneq ($(realpath $(PREFIX)),)
+-ifeq ($(REALLIB32),$(REALLIB64))
+-$(error LIB32 ($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to $(REALLIB64)) are resolving to the same place. Manually specify LIB32 and LIB64. e.g. make PREFIX=$(PREFIX) LIB32=lib32 LIB64=lib64)
+-endif
+-endif
+-
+-endif
++#ifdef TMPLIB64
++#
++#REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
++#REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
++#ifneq ($(realpath $(PREFIX)),)
++#ifeq ($(REALLIB32),$(REALLIB64))
++#$(error LIB32 ($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to $(REALLIB64)) are resolving to the same place. Manually specify LIB32 and LIB64. e.g. make PREFIX=$(PREFIX) LIB32=lib32 LIB64=lib64)
++#endif
++#endif
++#
++#endif
+ 
+ HEADERDIR = $(PREFIX)/include
+ LIBDIR32 = $(PREFIX)/$(LIB32)
+-- 
+1.7.0.4
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
new file mode 100644
index 0000000..75f8969
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "A library which provides easy access to huge pages of memory"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+DEPENDS = "sysfsutils perl"
+RDEPENDS_${PN} += "python python-io python-lang python-subprocess python-resource"
+
+SRCREV = "7649454b6fed355bf53517d5106ae211b533aced"
+SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
+    file://checks-if-mtab-is-a-symlink.patch \
+    file://aarch64-support.patch \
+    file://aarch64-unit-test-fixes.patch \
+    file://add-PROT-NONE-to-the-mprotest-test.patch \
+    file://install64-fix.patch \
+    file://cross-compile.patch \
+    file://Fix-cross-compiling-on-PPC.patch \
+    file://0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch \
+    file://0004-tests-run_tests.py-fix-typo-in-test-invocation.patch \
+    file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
+    file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
+    file://libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch \
+    file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
+"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
+
+
+EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
+CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install() {
+        oe_runmake PREFIX=${prefix} DESTDIR=${D}  \
+          INST_TESTSDIR32=/opt/libhugetlbfs/tests \
+          INST_TESTSDIR64=/opt/libhugetlbfs/tests \
+          install-tests
+}
+
+PARALLEL_MAKE_pn-${PN} = ""
+
+PACKAGES =+ "${PN}-perl ${PN}-tests ${PN}-perl5"
+FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
+FILES_${PN}-perl = "${libdir}/perl"
+FILES_${PN}-perl5 = "${libdir}/perl5 "
+FILES_${PN}-tests += "/opt/libhugetlbfs/tests"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_${PN}-tests += "dev-deps"
-- 
1.7.5.4



