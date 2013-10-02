Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCD56B605
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2013 12:07:45 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id x18so651748lbi.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Oct 2013 05:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ohmejTI+ix9hRKbEQb8JgCX8zaJ0Aql6wZ6o4CcOZ18=;
	b=P1vqezk/8fuMKYP4a6Vf91OIFFmWK8U8rrYjPtUAOuU+ckySRHyId70D3jWGO/KhOq
	cT6UdDoKR8wA2XAAYo6GDSLTDZts6YnVxU5QmNMpj1THgDG4Jqvh23jGqVZaT7tE7cJU
	9gc7QmRqSrcbpENGS3g2qFKahXVHDpsR3woFjoH5oKrLW2xpKozJYk+mLyY0/pDELfbs
	IXM7YAvazaA+VsdGc7tGw394bMdPn3oFhbnGFsA9nrk0ke3g9rnUv94u+B400iJEGkXD
	AXC6LCqdWVTmAY1bNoz1h7PIiqNdcwII0lfvIBhGaePBVnkZPGO0shZego8OY6Hl05Pp
	hyUA==
X-Gm-Message-State: ALoCoQn3yP/jRDW/hKP+VNaWb7JtljttkfClLRUAPxZ1iUnXgvt/XHHoImWlPRBKYdFPSvkvMPqp
MIME-Version: 1.0
X-Received: by 10.112.50.72 with SMTP id a8mr600638lbo.50.1380715666527; Wed,
	02 Oct 2013 05:07:46 -0700 (PDT)
Received: by 10.112.173.66 with HTTP; Wed, 2 Oct 2013 05:07:46 -0700 (PDT)
In-Reply-To: <1379923255-5300-1-git-send-email-b40290@freescale.com>
References: <1379923255-5300-1-git-send-email-b40290@freescale.com>
Date: Wed, 2 Oct 2013 15:07:46 +0300
Message-ID: <CAGNsrLCb8cw9Di8e7-JesRJq1tM654vfB3_EXFE5eJZUNAEAFw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] libhugetlbfs: add recipe
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
X-List-Received-Date: Wed, 02 Oct 2013 12:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 23 September 2013 11:00,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../libhugetlbfs/files/aarch64-support.patch       |   88 +++++++++++++++++
>  .../files/aarch64-unit-test-fixes.patch            |   62 ++++++++++++
>  .../files/add-PROT-NONE-to-the-mprotest-test.patch |   38 ++++++++
>  ...x-lib64-can-not-be-shiped-in-64bit-target.patch |   75 +++++++++++++++
>  .../libhugetlbfs/files/install64-fix.patch         |   20 ++++
>  ...s-avoid-search-host-library-path-for-cros.patch |   99 ++++++++++++++++++++
>  ...ng-LIB32-and-LIB64-if-they-point-to-the-s.patch |   48 ++++++++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |   51 ++++++++++
>  8 files changed, 481 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
> new file mode 100644
> index 0000000..ceac6b4
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-support.patch
> @@ -0,0 +1,88 @@
> +Upstream-Status: Pending
> +
> +From 52b8430eb4f03e35721f29862de33041fe9c9768 Mon Sep 17 00:00:00 2001
> +From: Steve Capper <steve.capper@linaro.org>
> +Date: Wed, 10 Apr 2013 14:51:12 +0100
> +Subject: [PATCH] Aarch64 support.
> +
> +This patch adds support for Aarch64.
> +
> +As with ARMv7, We do not add the xBT/xBDT style linker scripts as
> +these have been deprecated in favour of adjusting the page sizes
> +via command line parameter to ld.
> +
> +Signed-off-by: Steve Capper <steve.capper@linaro.org>
> +---
> + Makefile               |    7 +++++++
> + sys-aarch64elf_linux.S |   34 ++++++++++++++++++++++++++++++++++
> + 2 files changed, 41 insertions(+)
> + create mode 100644 sys-aarch64elf_linux.S
> +
> +diff --git a/Makefile b/Makefile
> +index 48205af..28ceade 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -57,6 +57,12 @@ TMPLIB32 = lib
> + ELF32 += armelf_linux_eabi
> + CUSTOM_LDSCRIPTS = no
> + else
> ++ifeq ($(ARCH),aarch64)
> ++CC64 = gcc
> ++ELF64 = aarch64elf_linux
> ++TMPLIB64 = lib64
> ++CUSTOM_LDSCRIPTS = no
> ++else
> + ifeq ($(ARCH),i386)
> + CC32 = gcc
> + ELF32 = elf_i386
> +@@ -100,6 +106,7 @@ endif
> + endif
> + endif
> + endif
> ++endif
> +
> + ifdef CC32
> + OBJDIRS += obj32
> +diff --git a/sys-aarch64elf_linux.S b/sys-aarch64elf_linux.S
> +new file mode 100644
> +index 0000000..699ff4c
> +--- /dev/null
> ++++ b/sys-aarch64elf_linux.S
> +@@ -0,0 +1,34 @@
> ++/*
> ++ * libhugetlbfs - Easy use of Linux hugepages
> ++ * Copyright (C) 2013 Linaro Ltd.
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Lesser General Public License
> ++ * version 2.1 as published by the Free Software Foundation.
> ++ *
> ++ * This library is distributed in the hope that it will be useful, but
> ++ * WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Lesser General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General Public
> ++ * License along with this library; if not, write to the Free Software
> ++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
> ++ */
> ++
> ++        .text
> ++
> ++        .globl  direct_syscall
> ++
> ++
> ++direct_syscall:
> ++      uxtw    x8, w0
> ++      mov     x0, x1
> ++      mov     x1, x2
> ++      mov     x2, x3
> ++      mov     x3, x4
> ++      mov     x4, x5
> ++      mov     x5, x6
> ++      mov     x6, x7
> ++      svc     0x0
> ++      RET
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
> new file mode 100644
> index 0000000..0b6fd8a
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/aarch64-unit-test-fixes.patch
> @@ -0,0 +1,62 @@
> +Upstream-Status: Pending
> +
> +From 9bb940bd6a86f09280bdcd48a7177a835d72a25c Mon Sep 17 00:00:00 2001
> +From: Steve Capper <steve.capper@linaro.org>
> +Date: Wed, 10 Apr 2013 15:52:46 +0100
> +Subject: [PATCH] Aarch64 unit test fixes.
> +
> +On Aarch64, zero bytes are illegal instructions, this is added to
> +the icache-hygiene test.
> +
> +In mremap-expand-slice-collision, if __LP64__ is defined then
> +mappings are attempted at 1TB boundaries which are outside the
> +allowable mmap region for Aarch64. For __aarch64__ we change this
> +mapping back to 256MB slices.
> +
> +Signed-off-by: Steve Capper <steve.capper@linaro.org>
> +---
> + tests/icache-hygiene.c                |    7 ++++---
> + tests/mremap-expand-slice-collision.c |    2 +-
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/tests/icache-hygiene.c b/tests/icache-hygiene.c
> +index 51792b3..876ce10 100644
> +--- a/tests/icache-hygiene.c
> ++++ b/tests/icache-hygiene.c
> +@@ -54,7 +54,7 @@ static void cacheflush(void *p)
> + {
> + #if defined(__powerpc__)
> +       asm volatile("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r"(p));
> +-#elif defined(__arm__)
> ++#elif defined(__arm__) || defined(__aarch64__)
> +       __clear_cache(p, p + COPY_SIZE);
> + #endif
> + }
> +@@ -87,8 +87,9 @@ static void *sig_expected;
> + static void sig_handler(int signum, siginfo_t *si, void *uc)
> + {
> + #if defined(__powerpc__) || defined(__powerpc64__) || defined(__ia64__) || \
> +-    defined(__s390__) || defined(__s390x__) || defined(__sparc__)
> +-      /* On powerpc and ia64 and s390, 0 bytes are an illegal
> ++    defined(__s390__) || defined(__s390x__) || defined(__sparc__) || \
> ++    defined(__aarch64__)
> ++      /* On powerpc, ia64, s390 and Aarch64, 0 bytes are an illegal
> +        * instruction, so, if the icache is cleared properly, we SIGILL
> +        * as soon as we jump into the cleared page */
> +       if (signum == SIGILL) {
> +diff --git a/tests/mremap-expand-slice-collision.c b/tests/mremap-expand-slice-collision.c
> +index c25f4c6..853f3c3 100644
> +--- a/tests/mremap-expand-slice-collision.c
> ++++ b/tests/mremap-expand-slice-collision.c
> +@@ -38,7 +38,7 @@ void init_slice_boundary(int fd)
> +       unsigned long slice_size;
> +       void *p1, *p2, *heap;
> +       int slices_ok, i, rc;
> +-#ifdef __LP64__
> ++#if defined(__LP64__) && !defined(__aarch64__)
> +       /* powerpc: 1TB slices starting at 1 TB */
> +       slice_boundary = 0x10000000000;
> +       slice_size = 0x10000000000;
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
> new file mode 100644
> index 0000000..673f204
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/add-PROT-NONE-to-the-mprotest-test.patch
> @@ -0,0 +1,38 @@
> +Upstream-Status: Pending
> +
> +From c7fcb7270bb510d7271a1c0cea095a4dbea49420 Mon Sep 17 00:00:00 2001
> +From: Steve Capper <steve.capper@linaro.org>
> +Date: Mon, 3 Jun 2013 17:00:45 +0100
> +Subject: [PATCH] Add PROT_NONE to the mprotect test.
> +
> +The mprotect unit test checks PROT_READ and PROT_READ | PROT_WRITE
> +protections. We recently found that PROT_NONE wasn't properly
> +supported in our huge page kernel code.
> +
> +This patch adds PROT_NONE tests to mprotect. The expected behaviour
> +is that neither reads nor writes should succeed.
> +
> +Signed-off-by: Steve Capper <steve.capper@linaro.org>
> +---
> + tests/mprotect.c |    6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/tests/mprotect.c b/tests/mprotect.c
> +index aa4673e..db6a662 100644
> +--- a/tests/mprotect.c
> ++++ b/tests/mprotect.c
> +@@ -213,5 +213,11 @@ int main(int argc, char *argv[])
> +       test_mprotect(fd, "RW->R 1/2", 2*hpage_size, PROT_READ|PROT_WRITE,
> +                     hpage_size, PROT_READ);
> +
> ++      /* PROT_NONE tests */
> ++      test_mprotect(fd, "NONE->R", hpage_size, PROT_NONE,
> ++                    hpage_size, PROT_READ);
> ++      test_mprotect(fd, "NONE->RW", hpage_size, PROT_NONE,
> ++                    hpage_size, PROT_READ|PROT_WRITE);
> ++
> +       PASS();
> + }
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
> new file mode 100644
> index 0000000..1ab461c
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
> @@ -0,0 +1,75 @@
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +
> +fix the below error:
> +  ERROR: QA Issue: libhugetlbfs: Files/directories were installed but not shipped
> +  /usr/lib64
> +  /usr/lib64/libhugetlbfs.so
> +  /usr/lib64/libhugetlbfs.a
> +  /usr/lib64/libhugetlbfs_privutils.so
> +  /usr/lib64/perl5
> +  /usr/lib64/perl5/TLBC
> +  /usr/lib64/perl5/TLBC/PerfCollect.pm
> +  /usr/lib64/perl5/TLBC/Report.pm
> +  /usr/lib64/perl5/TLBC/DataCollect.pm
> +  /usr/lib64/perl5/TLBC/OpCollect.pm
> +$<50>ERROR: QA run found fatal errors. Please consider fixing them.
> +
> +
> +Signed-off-by: Guo Chunrong <B40290@freescale.com>
> +
> +--- a/Makefile 2013-09-23 02:28:57.340566998 -0500
> ++++ b/Makefile 2013-09-23 02:31:05.344569896 -0500
> +@@ -33,7 +33,6 @@
> + CPPFLAGS += -D__LIBHUGETLBFS__ -DPPC_NO_SEGMENTS
> +
> + ARCH = $(shell uname -m | sed -e s/i.86/i386/)
> +-CC = gcc
> +
> + CUSTOM_LDSCRIPTS = yes
> +
> +@@ -59,9 +58,9 @@
> + CUSTOM_LDSCRIPTS = no
> + else
> + ifeq ($(ARCH),aarch64)
> +-CC64 = gcc
> ++CC64 = $(CC)
> + ELF64 = aarch64elf_linux
> +-TMPLIB64 = lib64
> ++TMPLIB64 = lib
> + CUSTOM_LDSCRIPTS = no
> + else
> + ifeq ($(ARCH),i386)
> +@@ -72,7 +71,7 @@
> + ifeq ($(ARCH),x86_64)
> + CC64 = $(CC) -m64
> + ELF64 = elf_x86_64
> +-TMPLIB64 = lib64
> ++TMPLIB64 = lib
> + TMPLIB32 = lib
> + ifneq ($(BUILDTYPE),NATIVEONLY)
> + CC32 = $(CC) -m32
> +@@ -172,11 +171,23 @@
> + BINDIR = $(PREFIX)/share/libhugetlbfs
> + EXEDIR = $(PREFIX)/bin
> + DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
> ++
> + ifdef CC32
> + PMDIR = $(PREFIX)/lib/perl5/TLBC
> ++endif
> ++
> ++ifdef CC64
> ++ifeq ($(ARCH),x86_64)
> ++PMDIR = $(PREFIX)/lib/perl5/TLBC
> ++else
> ++ifeq ($(ARCH),aarch64)
> ++PMDIR = $(PREFIX)/lib/perl5/TLBC
> + else
> + PMDIR = $(PREFIX)/lib64/perl5/TLBC
> + endif
> ++endif
> ++endif
> ++
> + MANDIR1 = $(PREFIX)/share/man/man1
> + MANDIR3 = $(PREFIX)/share/man/man3
> + MANDIR7 = $(PREFIX)/share/man/man7
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
> new file mode 100644
> index 0000000..9652c3d
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +TESTS_64 is empty, install will fail due to missing file operand
> +
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +Index: git/tests/Makefile
> +===================================================================
> +--- git.orig/tests/Makefile
> ++++ git/tests/Makefile
> +@@ -292,7 +292,7 @@ obj64/install:
> +       $(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +       $(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +       $(INSTALL) -m 755 $(HELPER_LIBS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +-      $(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> ++#     $(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +       $(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
> +
> + install: $(OBJDIRS:%=%/install)
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
> new file mode 100644
> index 0000000..b3fd843
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
> @@ -0,0 +1,99 @@
> +From 0a2877400a086e9d6ddd32a80462b7a931921dc2 Mon Sep 17 00:00:00 2001
> +From: Chunrong Guo <B40290@freescale.com>
> +Date: Sun, 8 Sep 2013 23:21:49 -0500
> +Subject: [PATCH] libhugetlbfs: avoid search host library path for cross
> + compilation
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +---
> + ldscripts/elf32ppclinux.xB   |    2 +-
> + ldscripts/elf32ppclinux.xBDT |    2 +-
> + ldscripts/elf64ppc.xB        |    2 +-
> + ldscripts/elf64ppc.xBDT      |    2 +-
> + ldscripts/elf_x86_64.xB      |    2 +-
> + ldscripts/elf_x86_64.xBDT    |    2 +-
> + 6 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/ldscripts/elf32ppclinux.xB b/ldscripts/elf32ppclinux.xB
> +index 28ad88d..33d482d 100644
> +--- a/ldscripts/elf32ppclinux.xB
> ++++ b/ldscripts/elf32ppclinux.xB
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> +             "elf32-powerpc")
> + OUTPUT_ARCH(powerpc:common)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/*SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
> + INPUT(-lhugetlbfs);
> + PHDRS
> + {
> +diff --git a/ldscripts/elf32ppclinux.xBDT b/ldscripts/elf32ppclinux.xBDT
> +index 497882b..823475e 100644
> +--- a/ldscripts/elf32ppclinux.xBDT
> ++++ b/ldscripts/elf32ppclinux.xBDT
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> +             "elf32-powerpc")
> + OUTPUT_ARCH(powerpc:common)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/*SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
> + INPUT(-lhugetlbfs);
> + PHDRS
> + {
> +diff --git a/ldscripts/elf64ppc.xB b/ldscripts/elf64ppc.xB
> +index 1a9c1ab..8cc557d 100644
> +--- a/ldscripts/elf64ppc.xB
> ++++ b/ldscripts/elf64ppc.xB
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
> +             "elf64-powerpc")
> + OUTPUT_ARCH(powerpc:common64)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/*SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
> + INPUT(-lhugetlbfs);
> + PHDRS
> + {
> +diff --git a/ldscripts/elf64ppc.xBDT b/ldscripts/elf64ppc.xBDT
> +index 5477294..53e0749 100644
> +--- a/ldscripts/elf64ppc.xBDT
> ++++ b/ldscripts/elf64ppc.xBDT
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
> +             "elf64-powerpc")
> + OUTPUT_ARCH(powerpc:common64)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/*SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
> + INPUT( -lhugetlbfs );
> + PHDRS
> + {
> +diff --git a/ldscripts/elf_x86_64.xB b/ldscripts/elf_x86_64.xB
> +index ed21a2c..ba50e9f 100644
> +--- a/ldscripts/elf_x86_64.xB
> ++++ b/ldscripts/elf_x86_64.xB
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64",
> +             "elf64-x86-64")
> + OUTPUT_ARCH(i386:x86-64)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/*SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
> + INPUT(-lhugetlbfs);
> + /* Do we need any of these for elf?
> +    __DYNAMIC = 0;    */
> +diff --git a/ldscripts/elf_x86_64.xBDT b/ldscripts/elf_x86_64.xBDT
> +index 1855202..c62d245 100644
> +--- a/ldscripts/elf_x86_64.xBDT
> ++++ b/ldscripts/elf_x86_64.xBDT
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64",
> +             "elf64-x86-64")
> + OUTPUT_ARCH(i386:x86-64)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/*SEARCH_DIR("/usr/x86_64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/x86_64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
> + INPUT(-lhugetlbfs);
> + /* Do we need any of these for elf?
> +    __DYNAMIC = 0;    */
> +--
> +1.7.9.7
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
> new file mode 100644
> index 0000000..3296376
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
> @@ -0,0 +1,48 @@
> +From 355c014573de7f95202cc7c819f81f0f230e4a1a Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Mon, 18 Jun 2012 16:37:05 +0800
> +Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the same place
> +
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + Makefile |   22 +++++++++++-----------
> + 1 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1017950..bac5f01 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -131,17 +131,17 @@ endif
> +
> + # If TMPLIB64 is set, then sure we are not resolving LIB32 and LIB64 to the
> + # same place
> +-ifdef TMPLIB64
> +-
> +-REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
> +-REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
> +-ifneq ($(realpath $(PREFIX)),)
> +-ifeq ($(REALLIB32),$(REALLIB64))
> +-$(error LIB32 ($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to $(REALLIB64)) are resolving to the same place. Manually specify LIB32 and LIB64. e.g. make PREFIX=$(PREFIX) LIB32=lib32 LIB64=lib64)
> +-endif
> +-endif
> +-
> +-endif
> ++#ifdef TMPLIB64
> ++#
> ++#REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
> ++#REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
> ++#ifneq ($(realpath $(PREFIX)),)
> ++#ifeq ($(REALLIB32),$(REALLIB64))
> ++#$(error LIB32 ($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to $(REALLIB64)) are resolving to the same place. Manually specify LIB32 and LIB64. e.g. make PREFIX=$(PREFIX) LIB32=lib32 LIB64=lib64)
> ++#endif
> ++#endif
> ++#
> ++#endif
> +
> + HEADERDIR = $(PREFIX)/include
> + LIBDIR32 = $(PREFIX)/$(LIB32)
> +--
> +1.7.0.4
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> new file mode 100644
> index 0000000..7835300
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION = "A library which provides easy access to huge pages of memory"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +DEPENDS = "sysfsutils perl"
> +RDEPENDS_${PN} += "python python-io python-lang python-subprocess python-resource"
> +
> +SRCREV = "49fedbe172343b3f7b39dc81bd2d81a18a34eb2f"
> +SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
> +    file://aarch64-support.patch \
> +    file://aarch64-unit-test-fixes.patch \
> +    file://add-PROT-NONE-to-the-mprotest-test.patch \
> +    file://install64-fix.patch \
> +    file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
> +    file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
> +    file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"

we'd like to enable ARMv7 as well.

> +
> +EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
> +CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +#The CUSTOM_LDSCRIPTS doesn't work with the gold linker
> +do_configure() {
> +    if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
> +      sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
> +    fi
> +}
> +
> +do_install() {
> +        oe_runmake PREFIX=${prefix} DESTDIR=${D}  \
> +          INST_TESTSDIR32=/opt/libhugetlbfs/tests \
> +          INST_TESTSDIR64=/opt/libhugetlbfs/tests \
> +          install-tests
> +}

Any reason to install under /opt?

> +PARALLEL_MAKE_pn-${PN} = ""
> +
> +PACKAGES =+ "${PN}-perl ${PN}-tests ${PN}-perl5"
> +FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
> +FILES_${PN}-perl = "${libdir}/perl"
> +FILES_${PN}-perl5 = "${libdir}/perl5 "
> +FILES_${PN}-tests += "/opt/libhugetlbfs/tests"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Cheers,
Fathi

