Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE0B260686
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:59:59 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so2240534lbh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 01:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=8zgm4vEbc6WC9tpuIOgWgBoPMsLAPAfvV75lBTq5jGI=;
	b=W6Erc5g/k7BBuePCX3IDcF0i0ReNeFMUnsBLUpT/+Vr47brQwSw4gGSuxzccpk+mw0
	1LEWEdfS7X9TdshSABkeNc3Nxj8SWgRzQzEBNcc2205Ccxs4XXbP89wjKWiEHk74NYAQ
	aWzOhI6vVEwzmkrm0vFxomMYvOqsHftq0XaPFMOjpPRKymcq/81HsVANLKZgpYOFwTUL
	Ehdll6aA+T2VLB+29wymnmsPLvI5S7rTMInTYIWOFFbzETqflPa/SP9qhB6IPRK3a/Ol
	FPaUQyWtbVIcqNM+4AtjIFz1pw2SyRwip00x2ODUTK1AizwsZaY6MkFNABIsxYoEX2km
	8tFw==
X-Gm-Message-State: ALoCoQk4ixbV96Gg9VC22GdeM5tmZIepGLQcCyI/9X4eSw7gKrer9IpoW+hYlhHyKMGJgs0HTn3h
MIME-Version: 1.0
X-Received: by 10.112.60.104 with SMTP id g8mr947530lbr.32.1377590399681; Tue,
	27 Aug 2013 00:59:59 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Tue, 27 Aug 2013 00:59:59 -0700 (PDT)
In-Reply-To: <1377589711-14948-1-git-send-email-b40290@freescale.com>
References: <1377589711-14948-1-git-send-email-b40290@freescale.com>
Date: Tue, 27 Aug 2013 10:59:59 +0300
Message-ID: <CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH ] libhugetlbfs: add recipe
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
X-List-Received-Date: Tue, 27 Aug 2013 08:00:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

please, check http://layers.openembedded.org/layerindex/recipe/5471/
Could you integrate it into your work?

On 27 August 2013 10:48,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>   *libhugetlbfs is a library which provides easy access to huge pages of memory
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  ...ler-to-be-override-regardless-of-32-or-64.patch |   94 ++++++++++++++
>  ...rl-lib-to-directory-perl-instead-of-perl5.patch |   41 ++++++
>  ...s-avoid-search-host-library-path-for-cros.patch |   70 +++++++++++
>  .../files/0002-Fix-cross-compiling-on-PPC.patch    |   39 ++++++
>  ...fs-Remove-segment-based-alignment-restric.patch |  130 ++++++++++++++++++++
>  ...-run_tests.py-fix-typo-in-test-invocation.patch |   29 +++++
>  .../files/checks-if-mtab-is-a-symlink.patch        |   30 +++++
>  ...s-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch |   34 +++++
>  ...ng-LIB32-and-LIB64-if-they-point-to-the-s.patch |   47 +++++++
>  ...Makefile-install-static-4G-edge-testcases.patch |   29 +++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |   49 ++++++++
>  11 files changed, 592 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-be-override-regardless-of-32-or-64.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid-search-host-library-path-for-cros.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compiling-on-PPC.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
>  create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-be-override-regardless-of-32-or-64.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-be-override-regardless-of-32-or-64.patch
> new file mode 100644
> index 0000000..ee9138b
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-be-override-regardless-of-32-or-64.patch
> @@ -0,0 +1,94 @@
> +From efba2e8dae0d2140289acd7a7fcc0e30ff00d676 Mon Sep 17 00:00:00 2001
> +From: Chunrong Guo <B40290@freescale.com>
> +Date: Mon, 5 Aug 2013 21:36:57 -0500
> +Subject: [PATCH] Allow compiler to be override regardless of 32 or 64-bit build
> +
> +Provide an easy means for cross compiling to override the compiler
> +without having to know if we intend a 32-bit or 64-bit build.
> +
> +
> +Upstream-Status: Accepted
> +Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> +Signed-off-by: Chunrong <B40290@freescale.com>
> +---
> + Makefile |   23 ++++++++++++-----------
> + 1 file changed, 12 insertions(+), 11 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 48205af..878c71b 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -33,58 +33,59 @@ CFLAGS += -Wall -fPIC
> + CPPFLAGS += -D__LIBHUGETLBFS__
> +
> + ARCH = $(shell uname -m | sed -e s/i.86/i386/)
> ++CC = gcc
> +
> + CUSTOM_LDSCRIPTS = yes
> +
> + ifeq ($(ARCH),ppc64)
> +-CC64 = gcc -m64
> ++CC64 = $(CC) -m64
> + ELF64 = elf64ppc
> + TMPLIB64 = lib64
> + TMPLIB32 = lib
> + ifneq ($(BUILDTYPE),NATIVEONLY)
> +-CC32 = gcc -m32
> ++CC32 = $(CC) -m32
> + ELF32 = elf32ppclinux
> + endif
> + else
> + ifeq ($(ARCH),ppc)
> +-CC32 = gcc -m32
> ++CC32 = $(CC) -m32
> + ELF32 = elf32ppclinux
> + TMPLIB32 = lib
> + else
> + ifeq ($(ARCH),armv7l)
> +-CC32 = gcc
> ++CC32 = $(CC)
> + TMPLIB32 = lib
> + ELF32 += armelf_linux_eabi
> + CUSTOM_LDSCRIPTS = no
> + else
> + ifeq ($(ARCH),i386)
> +-CC32 = gcc
> ++CC32 = $(CC)
> + ELF32 = elf_i386
> + TMPLIB32 = lib
> + else
> + ifeq ($(ARCH),x86_64)
> +-CC64 = gcc -m64
> ++CC64 = $(CC) -m64
> + ELF64 = elf_x86_64
> + TMPLIB64 = lib64
> + TMPLIB32 = lib
> + ifneq ($(BUILDTYPE),NATIVEONLY)
> +-CC32 = gcc -m32
> ++CC32 = $(CC) -m32
> + ELF32 = elf_i386
> + endif
> + else
> + ifeq ($(ARCH),ia64)
> +-CC64 = gcc
> ++CC64 = $(CC)
> + TMPLIB64 = lib64
> + CFLAGS += -DNO_ELFLINK
> + else
> + ifeq ($(ARCH),sparc64)
> +-CC64 = gcc -m64
> ++CC64 = $(CC) -m64
> + TMPLIB64 = lib64
> + CFLAGS += -DNO_ELFLINK
> + else
> + ifeq ($(ARCH),s390x)
> +-CC64 = gcc -m64
> +-CC32 = gcc -m31
> ++CC64 = $(CC) -m64
> ++CC32 = $(CC) -m31
> + ELF32 = elf_s390
> + ELF64 = elf64_s390
> + TMPLIB64 = lib64
> +--
> +1.7.9.7
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
> new file mode 100644
> index 0000000..09fe341
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
> @@ -0,0 +1,41 @@
> +From 689100b259e96ccb9540e5b0b3c283c9dee342a8 Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Tue, 21 May 2013 11:15:26 +0800
> +Subject: [PATCH] install perl lib to directory perl instead of perl5
> +
> +libhugetlbfs depends on perl, and perl installs a directory 'perl'
> +and make a symlink 'perl5' to it. So just install perl libs in
> +libhugetlbfs to directory 'perl' instead of 'perl5'. This can avoid
> +the following error:
> +| CalledProcessError: Command 'tar -cf - -C .../perl/5.14.3-r1/sysroot-destdir
> +| -ps . | tar -xf - -C .../tmp/sysroots/t4240qds'
> +| returned non-zero exit status 2 with output
> +| tar: ./usr/lib/perl5: Cannot create symlink to `perl': File exists
> +| tar: Exiting with failure status due to previous errors
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + Makefile |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index a7c7551..8de2a8f 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -151,9 +151,9 @@ BINDIR = $(PREFIX)/share/libhugetlbfs
> + EXEDIR = $(PREFIX)/bin
> + DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
> + ifdef CC32
> +-PMDIR = $(PREFIX)/lib/perl5/TLBC
> ++PMDIR = $(PREFIX)/lib/perl/TLBC
> + else
> +-PMDIR = $(PREFIX)/lib64/perl5/TLBC
> ++PMDIR = $(PREFIX)/lib64/perl/TLBC
> + endif
> + MANDIR1 = $(PREFIX)/share/man/man1
> + MANDIR3 = $(PREFIX)/share/man/man3
> +--
> +1.7.5.4
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid-search-host-library-path-for-cros.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid-search-host-library-path-for-cros.patch
> new file mode 100644
> index 0000000..ccbbf80
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid-search-host-library-path-for-cros.patch
> @@ -0,0 +1,70 @@
> +From 94abfe6cf483cd4e8c6bc6233d5c92054aab9096 Mon Sep 17 00:00:00 2001
> +From: Zongchun Yu <Zongchun.Yu@freescale.com>
> +Date: Tue, 2 Jul 2013 21:10:18 -0500
> +Subject: [PATCH] libhugetlbfs: avoid search host library path for cross
> + compilation
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> +---
> + ldscripts/elf32ppclinux.xB   |    2 +-
> + ldscripts/elf32ppclinux.xBDT |    2 +-
> + ldscripts/elf64ppc.xB        |    2 +-
> + ldscripts/elf64ppc.xBDT      |    2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/ldscripts/elf32ppclinux.xB b/ldscripts/elf32ppclinux.xB
> +index 28ad88d..0497392 100644
> +--- a/ldscripts/elf32ppclinux.xB
> ++++ b/ldscripts/elf32ppclinux.xB
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> +             "elf32-powerpc")
> + OUTPUT_ARCH(powerpc:common)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/* SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib"); */
> + INPUT(-lhugetlbfs);
> + PHDRS
> + {
> +diff --git a/ldscripts/elf32ppclinux.xBDT b/ldscripts/elf32ppclinux.xBDT
> +index 497882b..e5d8865 100644
> +--- a/ldscripts/elf32ppclinux.xBDT
> ++++ b/ldscripts/elf32ppclinux.xBDT
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> +             "elf32-powerpc")
> + OUTPUT_ARCH(powerpc:common)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/* SEARCH_DIR("/usr/powerpc-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib"); */
> + INPUT(-lhugetlbfs);
> + PHDRS
> + {
> +diff --git a/ldscripts/elf64ppc.xB b/ldscripts/elf64ppc.xB
> +index 1a9c1ab..9a14e70 100644
> +--- a/ldscripts/elf64ppc.xB
> ++++ b/ldscripts/elf64ppc.xB
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
> +             "elf64-powerpc")
> + OUTPUT_ARCH(powerpc:common64)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/* SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib"); */
> + INPUT(-lhugetlbfs);
> + PHDRS
> + {
> +diff --git a/ldscripts/elf64ppc.xBDT b/ldscripts/elf64ppc.xBDT
> +index 5477294..3b33153 100644
> +--- a/ldscripts/elf64ppc.xBDT
> ++++ b/ldscripts/elf64ppc.xBDT
> +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
> +             "elf64-powerpc")
> + OUTPUT_ARCH(powerpc:common64)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> ++/* SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib"); */
> + INPUT( -lhugetlbfs );
> + PHDRS
> + {
> +--
> +1.7.9.7
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compiling-on-PPC.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compiling-on-PPC.patch
> new file mode 100644
> index 0000000..55ac77a
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compiling-on-PPC.patch
> @@ -0,0 +1,39 @@
> +From 211c654ff89d9a2c5a1f6b50640bb52f9641a256 Mon Sep 17 00:00:00 2001
> +From: Kumar Gala <galak@kernel.crashing.org>
> +Date: Sat, 16 Apr 2011 12:34:34 -0500
> +Subject: [PATCH 2/2] Fix cross compiling on PPC
> +
> +Renamed ARCH check to use powerpc (for ppc32) and powerpc64.
> +
> +
> +Upstream-Status: Accepted
> +Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> +---
> + Makefile |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 77cd122..fb3ab61 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -34,7 +34,7 @@ CPPFLAGS += -D__LIBHUGETLBFS__
> + ARCH = $(shell uname -m | sed -e s/i.86/i386/)
> + CC = gcc
> +
> +-ifeq ($(ARCH),ppc64)
> ++ifeq ($(ARCH),powerpc64)
> + CC64 = $(CC) -m64
> + ELF64 = elf64ppc
> + TMPLIB64 = lib64
> +@@ -44,7 +44,7 @@ CC32 = $(CC) -m32
> + ELF32 = elf32ppclinux
> + endif
> + else
> +-ifeq ($(ARCH),ppc)
> ++ifeq ($(ARCH),powerpc)
> + CC32 = $(CC) -m32
> + ELF32 = elf32ppclinux
> + TMPLIB32 = lib
> +--
> +1.7.0.2
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch
> new file mode 100644
> index 0000000..be84c9a
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch
> @@ -0,0 +1,130 @@
> +From eee53989d5b7393352d77451b66066768113072a Mon Sep 17 00:00:00 2001
> +From: Becky Bruce <beckyb@kernel.crashing.org>
> +Date: Tue, 19 Apr 2011 14:13:18 -0500
> +Subject: [PATCH 1/2] libhugetlbfs: Remove segment-based alignment restrictions
> +
> +The existing library code enforces classic PPC segment restrictons on the
> +alignment and allocation of hugepages.  BookE Freescale processors
> +don't have this restriction and allowing it to remain in place
> +is overly restrictive on 32-bit processors.  Define PPC_NO_SEGMENTS to
> +turn this off.
> +
> +Upstream-Status: Accepted
> +Signed-off-by: Becky Bruce <beckyb@kernel.crashing.org>
> +---
> + Makefile                   |    2 +-
> + elflink.c                  |    7 ++++---
> + libhugetlbfs_internal.h    |    3 ++-
> + morecore.c                 |    2 +-
> + tests/brk_near_huge.c      |    2 +-
> + tests/truncate_above_4GB.c |    6 ++++--
> + 6 files changed, 13 insertions(+), 9 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d781871..3160f83 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -29,7 +29,7 @@ INSTALL = install
> + LDFLAGS += -Wl,-z,noexecstack -ldl
> + CFLAGS ?= -O2 -g
> + CFLAGS += -Wall -fPIC
> +-CPPFLAGS += -D__LIBHUGETLBFS__
> ++CPPFLAGS += -D__LIBHUGETLBFS__ -DPPC_NO_SEGMENTS
> +
> + ARCH = $(shell uname -m | sed -e s/i.86/i386/)
> +
> +diff --git a/elflink.c b/elflink.c
> +index c24bedc..432f3d7 100644
> +--- a/elflink.c
> ++++ b/elflink.c
> +@@ -552,7 +552,8 @@ bail2:
> +       seg->extrasz = end_orig - start;
> + }
> +
> +-#if defined(__powerpc64__) || defined (__powerpc__)
> ++#if defined(__powerpc64__) || \
> ++      (defined(__powerpc__) && !defined(PPC_NO_SEGMENTS))
> + #define SLICE_LOW_TOP         (0x100000000UL)
> + #define SLICE_LOW_SIZE                (1UL << SLICE_LOW_SHIFT)
> + #define SLICE_HIGH_SIZE               (1UL << SLICE_HIGH_SHIFT)
> +@@ -574,7 +575,7 @@ static unsigned long hugetlb_slice_start(unsigned long addr)
> +               return SLICE_LOW_TOP;
> +       else
> +               return ALIGN_DOWN(addr, SLICE_HIGH_SIZE);
> +-#elif defined(__powerpc__)
> ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> +       return ALIGN_DOWN(addr, SLICE_LOW_SIZE);
> + #else
> +       return ALIGN_DOWN(addr, gethugepagesize());
> +@@ -588,7 +589,7 @@ static unsigned long hugetlb_slice_end(unsigned long addr)
> +               return ALIGN_UP(addr, SLICE_LOW_SIZE) - 1;
> +       else
> +               return ALIGN_UP(addr, SLICE_HIGH_SIZE) - 1;
> +-#elif defined(__powerpc__)
> ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> +       return ALIGN_UP(addr, SLICE_LOW_SIZE) - 1;
> + #else
> +       return ALIGN_UP(addr, gethugepagesize()) - 1;
> +diff --git a/libhugetlbfs_internal.h b/libhugetlbfs_internal.h
> +index 97b19fa..ef9f668 100644
> +--- a/libhugetlbfs_internal.h
> ++++ b/libhugetlbfs_internal.h
> +@@ -49,7 +49,8 @@
> + #define ALIGN_UP(x,a) ALIGN(x,a)
> + #define ALIGN_DOWN(x,a) ((x) & ~((a) - 1))
> +
> +-#if defined(__powerpc64__) || defined (__powerpc__)
> ++#if defined(__powerpc64__) || \
> ++      (defined(__powerpc__) && !defined(PPC_NO_SEGMENTS))
> + #define SLICE_LOW_SHIFT               28
> + #define SLICE_HIGH_SHIFT      40
> + #elif defined(__ia64__)
> +diff --git a/morecore.c b/morecore.c
> +index 6b4364c..01c560e 100644
> +--- a/morecore.c
> ++++ b/morecore.c
> +@@ -44,7 +44,7 @@ static long hugetlbfs_next_addr(long addr)
> + {
> + #if defined(__powerpc64__)
> +       return ALIGN(addr, 1L << SLICE_HIGH_SHIFT);
> +-#elif defined(__powerpc__)
> ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> +       return ALIGN(addr, 1L << SLICE_LOW_SHIFT);
> + #elif defined(__ia64__)
> +       if (addr < (1UL << SLICE_HIGH_SHIFT))
> +diff --git a/tests/brk_near_huge.c b/tests/brk_near_huge.c
> +index 71eb803..f6d1e07 100644
> +--- a/tests/brk_near_huge.c
> ++++ b/tests/brk_near_huge.c
> +@@ -47,7 +47,7 @@ void *next_chunk(void *addr)
> +               /* 1TB segments above */
> +               return PALIGN(addr, 0x10000000000UL);
> + }
> +-#elif defined(__powerpc__)
> ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> + void *next_chunk(void *addr)
> + {
> +       return PALIGN(addr, 0x10000000UL);
> +diff --git a/tests/truncate_above_4GB.c b/tests/truncate_above_4GB.c
> +index 5b8c08f..4c427fc 100644
> +--- a/tests/truncate_above_4GB.c
> ++++ b/tests/truncate_above_4GB.c
> +@@ -102,11 +102,13 @@ int main(int argc, char *argv[])
> +       *qi = 0;
> +
> +       /* This part of the test makes the problem more obvious, but
> +-       * is not essential.  It can't be done on powerpc, where
> ++       * is not essential.  It can't be done on segmented powerpc, where
> +        * segment restrictions prohibit us from performing such a
> +        * mapping, so skip it there. Similarly, ia64's address space
> +        * restrictions prevent this. */
> +-#if !defined(__powerpc__) && !defined(__powerpc64__) && !defined(__ia64__)
> ++#if (defined(__powerpc__) && defined(PPC_NO_SEGMENTS)) \
> ++      || !defined(__powerpc__) && !defined(__powerpc64__) \
> ++      && !defined(__ia64__)
> +       /* Replace middle hpage by tinypage mapping to trigger
> +        * nr_ptes BUG */
> +       verbose_printf("Replacing map at %p-%p...", q + hpage_size,
> +--
> +1.5.6.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch
> new file mode 100644
> index 0000000..d83db08
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-fix-typo-in-test-invocation.patch
> @@ -0,0 +1,29 @@
> +From b3d5429449aef61cb8926c33925fd7b5cad737de Mon Sep 17 00:00:00 2001
> +From: Becky Bruce <beckyb@kernel.crashing.org>
> +Date: Tue, 19 Apr 2011 19:06:16 -0500
> +Subject: [PATCH 2/2] tests/run_tests.py: fix typo in test invocation.
> +
> +One test was being invoked with HUGETLB_MORECORE=es (instead of yes).....
> +
> +Upstream-Status: Accepted
> +Signed-off-by: Becky Bruce <beckyb@kernel.crashing.org>
> +---
> + tests/run_tests.py |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/tests/run_tests.py b/tests/run_tests.py
> +index 8055940..f0049b3 100755
> +--- a/tests/run_tests.py
> ++++ b/tests/run_tests.py
> +@@ -567,7 +567,7 @@ def functional_tests():
> +     do_test("heapshrink", LD_PRELOAD="libhugetlbfs.so libheapshrink.so",
> +             HUGETLB_MORECORE="yes")
> +     do_test("heapshrink", LD_PRELOAD="libheapshrink.so", HUGETLB_MORECORE="yes",
> +-            HUGETLB_MORECORE_SHRINK="es")
> ++            HUGETLB_MORECORE_SHRINK="yes")
> +     do_test("heapshrink", LD_PRELOAD="libhugetlbfs.so libheapshrink.so",
> +             HUGETLB_MORECORE="yes", HUGETLB_MORECORE_SHRINK="yes")
> +     do_test("heap-overflow", HUGETLB_VERBOSE="1", HUGETLB_MORECORE="yes")
> +--
> +1.5.6.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch
> new file mode 100644
> index 0000000..f555947
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symlink.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Accepted
> +
> +If /etc/mtab is a symlink to /proc/self/mounts,
> +mounting fails because addmntent returns an error.
> +As a consequence, the Private directory is unusable.
> +This is a patch which checks if /etc/mtab is a symlink,
> +and if so, doesn't try to call addmntent.
> +
> +Signed-off-by: Guo Chunrong <B40290@freescale.com>
> +
> +
> +--- a/hugeadm.c        2013-07-31 23:46:04.461258351 -0500
> ++++ b/hugeadm.c        2013-07-31 23:50:03.249359534 -0500
> +@@ -552,6 +552,16 @@
> +                       return 1;
> +               }
> +
> ++         char dummy;
> ++         int useMtab;
> ++          /* Check if mtab is a symlink */
> ++          useMtab = (readlink(MOUNTED, &dummy, 1) < 0);
> ++        if (!useMtab) {
> ++         /* No need updating mtab */
> ++          return 0;
> ++        }
> ++
> ++
> +               mounts = setmntent(MOUNTED, "a+");
> +               if (mounts) {
> +                       entry.mnt_fsname = FS_NAME;
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch
> new file mode 100644
> index 0000000..42860de
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch
> @@ -0,0 +1,34 @@
> +From f6aab55052b8ad7b9498b325c8a26cac25703b01 Mon Sep 17 00:00:00 2001
> +From: Yu Zongchun <b40527@freescale.com>
> +Date: Mon, 6 May 2013 18:06:02 +0800
> +Subject: [PATCH] libhugetlbfs:Fix perl lib can not be shiped to sub-package
> + issue for 64bit board
> +
> +
> +Upstream-Status: Accepted
> +Signed-off-by: Yu Zongchun <b40527@freescale.com>
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +---
> + Makefile |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 03966b2..adbd91e 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -149,7 +149,11 @@ LDSCRIPTDIR = $(PREFIX)/share/libhugetlbfs/ldscripts
> + BINDIR = $(PREFIX)/share/libhugetlbfs
> + EXEDIR = $(PREFIX)/bin
> + DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
> ++ifdef CC32
> + PMDIR = $(PREFIX)/lib/perl5/TLBC
> ++else
> ++PMDIR = $(PREFIX)/lib64/perl5/TLBC
> ++endif
> + MANDIR1 = $(PREFIX)/share/man/man1
> + MANDIR3 = $(PREFIX)/share/man/man3
> + MANDIR7 = $(PREFIX)/share/man/man7
> +--
> +1.7.5.4
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
> new file mode 100644
> index 0000000..201527c
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
> @@ -0,0 +1,47 @@
> +From 355c014573de7f95202cc7c819f81f0f230e4a1a Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Mon, 18 Jun 2012 16:37:05 +0800
> +Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the same place
> +
> +Upstream-Status: Inappropriate
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
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
> new file mode 100644
> index 0000000..dde9e0d
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
> @@ -0,0 +1,29 @@
> +From 7f9be6fafd15c19a2a97ef19a2ece707b253b7a6 Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Wed, 7 Aug 2013 16:01:24 +0800
> +Subject: [PATCH] tests/Makefile: install static 4G-edge testcases
> +
> +TESTS_64 is empty, install will fail due to missing file operand
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + tests/Makefile |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/tests/Makefile b/tests/Makefile
> +index 231e3b0..48da3ae 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -292,7 +292,7 @@ obj64/install:
> +       $(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +       $(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +       $(INSTALL) -m 755 $(HELPER_LIBS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +-      $(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> ++      $(INSTALL) -m 755 $(TESTS_64_STATIC:%=obj64/%_static) $(DESTDIR)$(INST_TESTSDIR64)/obj64
> +       $(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
> +
> + install: $(OBJDIRS:%=%/install)
> +--
> +1.7.5.4
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> new file mode 100644
> index 0000000..d62d616
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION = "A library which provides easy access to huge pages of memory"
> +SECTION = "libhugetlbfs"
> +LICENSE = "LGPLv2.1"
> +
> +DEPENDS = "sysfsutils perl"
> +RDEPENDS_${PN} += "python python-io python-lang python-subprocess python-resource"
> +
> +LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +SRCREV = "7649454b6fed355bf53517d5106ae211b533aced"
> +SRC_URI = " git://libhugetlbfs.git.sourceforge.net/gitroot/libhugetlbfs/libhugetlbfs \
> +               file://0001-Allow-compiler-to-be-override-regardless-of-32-or-64.patch \
> +               file://0002-Fix-cross-compiling-on-PPC.patch \
> +               file://0003-libhugetlbfs-Remove-segment-based-alignment-restric.patch \
> +               file://0004-tests-run_tests.py-fix-typo-in-test-invocation.patch \
> +               file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
> +               file://libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch \
> +               file://0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch \
> +               file://checks-if-mtab-is-a-symlink.patch \
> +               file://0001-libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
> +               file://tests-Makefile-install-static-4G-edge-testcases.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST = '(powerpc|powerpc64)'

libhugetlbfs supports a wider range of architectures (including arm).

> +EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY"
> +CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_install() {
> +        oe_runmake PREFIX=${prefix} DESTDIR=${D} \
> +          INST_TESTSDIR32=/opt/libhugetlbfs/tests \
> +          INST_TESTSDIR64=/opt/libhugetlbfs/tests \
> +          install-tests
> +}
> +
> +PARALLEL_MAKE_pn-${PN} = ""
> +
> +PACKAGES =+ "${PN}-perl ${PN}-tests"
> +FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
> +FILES_${PN}-perl = "${libdir}/perl"
> +FILES_${PN}-tests += "/opt/libhugetlbfs/tests"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INSANE_SKIP_${PN}-tests += "dev-deps"
> +
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

