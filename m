Return-Path: <B19537@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe002.messaging.microsoft.com [216.32.180.185])
	by mail.openembedded.org (Postfix) with ESMTP id D82DB6BA7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:56:45 +0000 (UTC)
Received: from mail36-co1-R.bigfish.com (10.243.78.254) by
	CO1EHSOBE001.bigfish.com (10.243.66.64) with Microsoft SMTP Server id
	14.1.225.22; Wed, 28 Aug 2013 02:56:45 +0000
Received: from mail36-co1 (localhost [127.0.0.1])	by mail36-co1-R.bigfish.com
	(Postfix) with ESMTP id 907F0A00188	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:56:45 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah186068h8275bh8275dh1de097hz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail36-co1 (localhost.localdomain [127.0.0.1]) by mail36-co1
	(MessageSwitch) id 137765860373113_31675;
	Wed, 28 Aug 2013 02:56:43 +0000 (UTC)
Received: from CO1EHSMHS029.bigfish.com (unknown [10.243.78.244])	by
	mail36-co1.bigfish.com (Postfix) with ESMTP id 0E4AEC40053	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:56:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS029.bigfish.com
	(10.243.66.39) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 28 Aug 2013 02:56:42 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.40]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.03.0146.002; Wed, 28 Aug 2013 02:56:41 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH ] libhugetlbfs: add recipe
Thread-Index: AQHOovnWqhmtF+sp3Eu4ooAnXC5dupmosOaAgAE9FwA=
Date: Wed, 28 Aug 2013 02:56:41 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A016BC265@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1377589711-14948-1-git-send-email-b40290@freescale.com>
	<CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
In-Reply-To: <CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.84]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
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
X-List-Received-Date: Wed, 28 Aug 2013 02:56:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

libhugetlbfs should be moved to a common layer, since it can be used by oth=
er BSPs except linaro.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Fathi Boudra
> Sent: Tuesday, August 27, 2013 4:00 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH ] libhugetlbfs: add recipe
>=20
> Hi,
>=20
> please, check http://layers.openembedded.org/layerindex/recipe/5471/
> Could you integrate it into your work?
>=20
> On 27 August 2013 10:48,  <b40290@freescale.com> wrote:
> > From: Chunrong Guo <B40290@freescale.com>
> >
> >   *libhugetlbfs is a library which provides easy access to huge pages
> > of memory
> >
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  ...ler-to-be-override-regardless-of-32-or-64.patch |   94
> ++++++++++++++
> >  ...rl-lib-to-directory-perl-instead-of-perl5.patch |   41 ++++++
> >  ...s-avoid-search-host-library-path-for-cros.patch |   70 +++++++++++
> >  .../files/0002-Fix-cross-compiling-on-PPC.patch    |   39 ++++++
> >  ...fs-Remove-segment-based-alignment-restric.patch |  130
> ++++++++++++++++++++
> >  ...-run_tests.py-fix-typo-in-test-invocation.patch |   29 +++++
> >  .../files/checks-if-mtab-is-a-symlink.patch        |   30 +++++
> >  ...s-Fix-perl-lib-can-not-be-shiped-to-sub-p.patch |   34 +++++
> >  ...ng-LIB32-and-LIB64-if-they-point-to-the-s.patch |   47 +++++++
> >  ...Makefile-install-static-4G-edge-testcases.patch |   29 +++++
> >  .../libhugetlbfs/libhugetlbfs_git.bb               |   49 ++++++++
> >  11 files changed, 592 insertions(+), 0 deletions(-)  create mode
> > 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-be
> > -override-regardless-of-32-or-64.patch
> >  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-
> > directory-perl-instead-of-perl5.patch
> >  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid-s
> > earch-host-library-path-for-cros.patch
> >  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compiling-
> > on-PPC.patch  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remove-
> > segment-based-alignment-restric.patch
> >  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py-f
> > ix-typo-in-test-invocation.patch  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-symli
> > nk.patch  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-lib
> > -can-not-be-shiped-to-sub-p.patch  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-L
> > IB64-if-they-point-to-the-s.patch  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-st
> > atic-4G-edge-testcases.patch  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> >
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-
> > be-override-regardless-of-32-or-64.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler-to-
> > be-override-regardless-of-32-or-64.patch
> > new file mode 100644
> > index 0000000..ee9138b
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Allow-compiler
> > +++ -to-be-override-regardless-of-32-or-64.patch
> > @@ -0,0 +1,94 @@
> > +From efba2e8dae0d2140289acd7a7fcc0e30ff00d676 Mon Sep 17 00:00:00
> > +2001
> > +From: Chunrong Guo <B40290@freescale.com>
> > +Date: Mon, 5 Aug 2013 21:36:57 -0500
> > +Subject: [PATCH] Allow compiler to be override regardless of 32 or
> > +64-bit build
> > +
> > +Provide an easy means for cross compiling to override the compiler
> > +without having to know if we intend a 32-bit or 64-bit build.
> > +
> > +
> > +Upstream-Status: Accepted
> > +Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > +Signed-off-by: Chunrong <B40290@freescale.com>
> > +---
> > + Makefile |   23 ++++++++++++-----------
> > + 1 file changed, 12 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 48205af..878c71b 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -33,58 +33,59 @@ CFLAGS +=3D -Wall -fPIC  CPPFLAGS +=3D
> > +-D__LIBHUGETLBFS__
> > +
> > + ARCH =3D $(shell uname -m | sed -e s/i.86/i386/)
> > ++CC =3D gcc
> > +
> > + CUSTOM_LDSCRIPTS =3D yes
> > +
> > + ifeq ($(ARCH),ppc64)
> > +-CC64 =3D gcc -m64
> > ++CC64 =3D $(CC) -m64
> > + ELF64 =3D elf64ppc
> > + TMPLIB64 =3D lib64
> > + TMPLIB32 =3D lib
> > + ifneq ($(BUILDTYPE),NATIVEONLY)
> > +-CC32 =3D gcc -m32
> > ++CC32 =3D $(CC) -m32
> > + ELF32 =3D elf32ppclinux
> > + endif
> > + else
> > + ifeq ($(ARCH),ppc)
> > +-CC32 =3D gcc -m32
> > ++CC32 =3D $(CC) -m32
> > + ELF32 =3D elf32ppclinux
> > + TMPLIB32 =3D lib
> > + else
> > + ifeq ($(ARCH),armv7l)
> > +-CC32 =3D gcc
> > ++CC32 =3D $(CC)
> > + TMPLIB32 =3D lib
> > + ELF32 +=3D armelf_linux_eabi
> > + CUSTOM_LDSCRIPTS =3D no
> > + else
> > + ifeq ($(ARCH),i386)
> > +-CC32 =3D gcc
> > ++CC32 =3D $(CC)
> > + ELF32 =3D elf_i386
> > + TMPLIB32 =3D lib
> > + else
> > + ifeq ($(ARCH),x86_64)
> > +-CC64 =3D gcc -m64
> > ++CC64 =3D $(CC) -m64
> > + ELF64 =3D elf_x86_64
> > + TMPLIB64 =3D lib64
> > + TMPLIB32 =3D lib
> > + ifneq ($(BUILDTYPE),NATIVEONLY)
> > +-CC32 =3D gcc -m32
> > ++CC32 =3D $(CC) -m32
> > + ELF32 =3D elf_i386
> > + endif
> > + else
> > + ifeq ($(ARCH),ia64)
> > +-CC64 =3D gcc
> > ++CC64 =3D $(CC)
> > + TMPLIB64 =3D lib64
> > + CFLAGS +=3D -DNO_ELFLINK
> > + else
> > + ifeq ($(ARCH),sparc64)
> > +-CC64 =3D gcc -m64
> > ++CC64 =3D $(CC) -m64
> > + TMPLIB64 =3D lib64
> > + CFLAGS +=3D -DNO_ELFLINK
> > + else
> > + ifeq ($(ARCH),s390x)
> > +-CC64 =3D gcc -m64
> > +-CC32 =3D gcc -m31
> > ++CC64 =3D $(CC) -m64
> > ++CC32 =3D $(CC) -m31
> > + ELF32 =3D elf_s390
> > + ELF64 =3D elf64_s390
> > + TMPLIB64 =3D lib64
> > +--
> > +1.7.9.7
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-t
> > o-directory-perl-instead-of-perl5.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-t
> > o-directory-perl-instead-of-perl5.patch
> > new file mode 100644
> > index 0000000..09fe341
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-l
> > +++ ib-to-directory-perl-instead-of-perl5.patch
> > @@ -0,0 +1,41 @@
> > +From 689100b259e96ccb9540e5b0b3c283c9dee342a8 Mon Sep 17 00:00:00
> > +2001
> > +From: Ting Liu <b28495@freescale.com>
> > +Date: Tue, 21 May 2013 11:15:26 +0800
> > +Subject: [PATCH] install perl lib to directory perl instead of perl5
> > +
> > +libhugetlbfs depends on perl, and perl installs a directory 'perl'
> > +and make a symlink 'perl5' to it. So just install perl libs in
> > +libhugetlbfs to directory 'perl' instead of 'perl5'. This can avoid
> > +the following error:
> > +| CalledProcessError: Command 'tar -cf - -C
> > +| .../perl/5.14.3-r1/sysroot-destdir
> > +| -ps . | tar -xf - -C .../tmp/sysroots/t4240qds'
> > +| returned non-zero exit status 2 with output
> > +| tar: ./usr/lib/perl5: Cannot create symlink to `perl': File exists
> > +| tar: Exiting with failure status due to previous errors
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +
> > +Signed-off-by: Ting Liu <b28495@freescale.com>
> > +---
> > + Makefile |    4 ++--
> > + 1 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index a7c7551..8de2a8f 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -151,9 +151,9 @@ BINDIR =3D $(PREFIX)/share/libhugetlbfs  EXEDIR =
=3D
> > +$(PREFIX)/bin  DOCDIR =3D $(PREFIX)/share/doc/libhugetlbfs  ifdef CC32
> > +-PMDIR =3D $(PREFIX)/lib/perl5/TLBC
> > ++PMDIR =3D $(PREFIX)/lib/perl/TLBC
> > + else
> > +-PMDIR =3D $(PREFIX)/lib64/perl5/TLBC
> > ++PMDIR =3D $(PREFIX)/lib64/perl/TLBC
> > + endif
> > + MANDIR1 =3D $(PREFIX)/share/man/man1
> > + MANDIR3 =3D $(PREFIX)/share/man/man3
> > +--
> > +1.7.5.4
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid
> > -search-host-library-path-for-cros.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-avoid
> > -search-host-library-path-for-cros.patch
> > new file mode 100644
> > index 0000000..ccbbf80
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-a
> > +++ void-search-host-library-path-for-cros.patch
> > @@ -0,0 +1,70 @@
> > +From 94abfe6cf483cd4e8c6bc6233d5c92054aab9096 Mon Sep 17 00:00:00
> > +2001
> > +From: Zongchun Yu <Zongchun.Yu@freescale.com>
> > +Date: Tue, 2 Jul 2013 21:10:18 -0500
> > +Subject: [PATCH] libhugetlbfs: avoid search host library path for
> > +cross  compilation
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> > +---
> > + ldscripts/elf32ppclinux.xB   |    2 +-
> > + ldscripts/elf32ppclinux.xBDT |    2 +-
> > + ldscripts/elf64ppc.xB        |    2 +-
> > + ldscripts/elf64ppc.xBDT      |    2 +-
> > + 4 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/ldscripts/elf32ppclinux.xB b/ldscripts/elf32ppclinux.xB
> > +index 28ad88d..0497392 100644
> > +--- a/ldscripts/elf32ppclinux.xB
> > ++++ b/ldscripts/elf32ppclinux.xB
> > +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> > +             "elf32-powerpc")
> > + OUTPUT_ARCH(powerpc:common)
> > + ENTRY(_start)
> > +-SEARCH_DIR("/usr/powerpc-linux-gnu/lib");
> > +SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > +SEARCH_DIR("/usr/lib");
> > ++/* SEARCH_DIR("/usr/powerpc-linux-gnu/lib");
> > ++SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > ++SEARCH_DIR("/usr/lib"); */
> > + INPUT(-lhugetlbfs);
> > + PHDRS
> > + {
> > +diff --git a/ldscripts/elf32ppclinux.xBDT
> > +b/ldscripts/elf32ppclinux.xBDT index 497882b..e5d8865 100644
> > +--- a/ldscripts/elf32ppclinux.xBDT
> > ++++ b/ldscripts/elf32ppclinux.xBDT
> > +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> > +             "elf32-powerpc")
> > + OUTPUT_ARCH(powerpc:common)
> > + ENTRY(_start)
> > +-SEARCH_DIR("/usr/powerpc-linux-gnu/lib");
> > +SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > +SEARCH_DIR("/usr/lib");
> > ++/* SEARCH_DIR("/usr/powerpc-linux-gnu/lib");
> > ++SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > ++SEARCH_DIR("/usr/lib"); */
> > + INPUT(-lhugetlbfs);
> > + PHDRS
> > + {
> > +diff --git a/ldscripts/elf64ppc.xB b/ldscripts/elf64ppc.xB index
> > +1a9c1ab..9a14e70 100644
> > +--- a/ldscripts/elf64ppc.xB
> > ++++ b/ldscripts/elf64ppc.xB
> > +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
> > +             "elf64-powerpc")
> > + OUTPUT_ARCH(powerpc:common64)
> > + ENTRY(_start)
> > +-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64");
> > +SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64");
> > +SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib");
> > +SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > +SEARCH_DIR("/usr/lib");
> > ++/* SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64");
> > ++SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64");
> > ++SEARCH_DIR("/usr/lib64");
> > ++SEARCH_DIR("/usr/powerpc64-linux-gnu/lib");
> > ++SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > ++SEARCH_DIR("/usr/lib"); */
> > + INPUT(-lhugetlbfs);
> > + PHDRS
> > + {
> > +diff --git a/ldscripts/elf64ppc.xBDT b/ldscripts/elf64ppc.xBDT index
> > +5477294..3b33153 100644
> > +--- a/ldscripts/elf64ppc.xBDT
> > ++++ b/ldscripts/elf64ppc.xBDT
> > +@@ -3,7 +3,7 @@ OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc",
> > +             "elf64-powerpc")
> > + OUTPUT_ARCH(powerpc:common64)
> > + ENTRY(_start)
> > +-SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64");
> > +SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64");
> > +SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/powerpc64-linux-gnu/lib");
> > +SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > +SEARCH_DIR("/usr/lib");
> > ++/* SEARCH_DIR("/usr/powerpc64-linux-gnu/lib64");
> > ++SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64");
> > ++SEARCH_DIR("/usr/lib64");
> > ++SEARCH_DIR("/usr/powerpc64-linux-gnu/lib");
> > ++SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> > ++SEARCH_DIR("/usr/lib"); */
> > + INPUT( -lhugetlbfs );
> > + PHDRS
> > + {
> > +--
> > +1.7.9.7
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compilin
> > g-on-PPC.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-compilin
> > g-on-PPC.patch
> > new file mode 100644
> > index 0000000..55ac77a
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Fix-cross-comp
> > +++ iling-on-PPC.patch
> > @@ -0,0 +1,39 @@
> > +From 211c654ff89d9a2c5a1f6b50640bb52f9641a256 Mon Sep 17 00:00:00
> > +2001
> > +From: Kumar Gala <galak@kernel.crashing.org>
> > +Date: Sat, 16 Apr 2011 12:34:34 -0500
> > +Subject: [PATCH 2/2] Fix cross compiling on PPC
> > +
> > +Renamed ARCH check to use powerpc (for ppc32) and powerpc64.
> > +
> > +
> > +Upstream-Status: Accepted
> > +Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > +---
> > + Makefile |    4 ++--
> > + 1 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 77cd122..fb3ab61 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -34,7 +34,7 @@ CPPFLAGS +=3D -D__LIBHUGETLBFS__  ARCH =3D $(shell
> > +uname -m | sed -e s/i.86/i386/)  CC =3D gcc
> > +
> > +-ifeq ($(ARCH),ppc64)
> > ++ifeq ($(ARCH),powerpc64)
> > + CC64 =3D $(CC) -m64
> > + ELF64 =3D elf64ppc
> > + TMPLIB64 =3D lib64
> > +@@ -44,7 +44,7 @@ CC32 =3D $(CC) -m32
> > + ELF32 =3D elf32ppclinux
> > + endif
> > + else
> > +-ifeq ($(ARCH),ppc)
> > ++ifeq ($(ARCH),powerpc)
> > + CC32 =3D $(CC) -m32
> > + ELF32 =3D elf32ppclinux
> > + TMPLIB32 =3D lib
> > +--
> > +1.7.0.2
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remov
> > e-segment-based-alignment-restric.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-Remov
> > e-segment-based-alignment-restric.patch
> > new file mode 100644
> > index 0000000..be84c9a
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-libhugetlbfs-R
> > +++ emove-segment-based-alignment-restric.patch
> > @@ -0,0 +1,130 @@
> > +From eee53989d5b7393352d77451b66066768113072a Mon Sep 17 00:00:00
> > +2001
> > +From: Becky Bruce <beckyb@kernel.crashing.org>
> > +Date: Tue, 19 Apr 2011 14:13:18 -0500
> > +Subject: [PATCH 1/2] libhugetlbfs: Remove segment-based alignment
> > +restrictions
> > +
> > +The existing library code enforces classic PPC segment restrictons on
> > +the alignment and allocation of hugepages.  BookE Freescale
> > +processors don't have this restriction and allowing it to remain in
> > +place is overly restrictive on 32-bit processors.  Define
> > +PPC_NO_SEGMENTS to turn this off.
> > +
> > +Upstream-Status: Accepted
> > +Signed-off-by: Becky Bruce <beckyb@kernel.crashing.org>
> > +---
> > + Makefile                   |    2 +-
> > + elflink.c                  |    7 ++++---
> > + libhugetlbfs_internal.h    |    3 ++-
> > + morecore.c                 |    2 +-
> > + tests/brk_near_huge.c      |    2 +-
> > + tests/truncate_above_4GB.c |    6 ++++--
> > + 6 files changed, 13 insertions(+), 9 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index d781871..3160f83 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -29,7 +29,7 @@ INSTALL =3D install
> > + LDFLAGS +=3D -Wl,-z,noexecstack -ldl
> > + CFLAGS ?=3D -O2 -g
> > + CFLAGS +=3D -Wall -fPIC
> > +-CPPFLAGS +=3D -D__LIBHUGETLBFS__
> > ++CPPFLAGS +=3D -D__LIBHUGETLBFS__ -DPPC_NO_SEGMENTS
> > +
> > + ARCH =3D $(shell uname -m | sed -e s/i.86/i386/)
> > +
> > +diff --git a/elflink.c b/elflink.c
> > +index c24bedc..432f3d7 100644
> > +--- a/elflink.c
> > ++++ b/elflink.c
> > +@@ -552,7 +552,8 @@ bail2:
> > +       seg->extrasz =3D end_orig - start;  }
> > +
> > +-#if defined(__powerpc64__) || defined (__powerpc__)
> > ++#if defined(__powerpc64__) || \
> > ++      (defined(__powerpc__) && !defined(PPC_NO_SEGMENTS))
> > + #define SLICE_LOW_TOP         (0x100000000UL)
> > + #define SLICE_LOW_SIZE                (1UL << SLICE_LOW_SHIFT)
> > + #define SLICE_HIGH_SIZE               (1UL << SLICE_HIGH_SHIFT)
> > +@@ -574,7 +575,7 @@ static unsigned long hugetlb_slice_start(unsigned
> long addr)
> > +               return SLICE_LOW_TOP;
> > +       else
> > +               return ALIGN_DOWN(addr, SLICE_HIGH_SIZE); -#elif
> > +defined(__powerpc__)
> > ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> > +       return ALIGN_DOWN(addr, SLICE_LOW_SIZE);  #else
> > +       return ALIGN_DOWN(addr, gethugepagesize()); @@ -588,7 +589,7
> > +@@ static unsigned long hugetlb_slice_end(unsigned long addr)
> > +               return ALIGN_UP(addr, SLICE_LOW_SIZE) - 1;
> > +       else
> > +               return ALIGN_UP(addr, SLICE_HIGH_SIZE) - 1; -#elif
> > +defined(__powerpc__)
> > ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> > +       return ALIGN_UP(addr, SLICE_LOW_SIZE) - 1;  #else
> > +       return ALIGN_UP(addr, gethugepagesize()) - 1; diff --git
> > +a/libhugetlbfs_internal.h b/libhugetlbfs_internal.h index
> > +97b19fa..ef9f668 100644
> > +--- a/libhugetlbfs_internal.h
> > ++++ b/libhugetlbfs_internal.h
> > +@@ -49,7 +49,8 @@
> > + #define ALIGN_UP(x,a) ALIGN(x,a)
> > + #define ALIGN_DOWN(x,a) ((x) & ~((a) - 1))
> > +
> > +-#if defined(__powerpc64__) || defined (__powerpc__)
> > ++#if defined(__powerpc64__) || \
> > ++      (defined(__powerpc__) && !defined(PPC_NO_SEGMENTS))
> > + #define SLICE_LOW_SHIFT               28
> > + #define SLICE_HIGH_SHIFT      40
> > + #elif defined(__ia64__)
> > +diff --git a/morecore.c b/morecore.c
> > +index 6b4364c..01c560e 100644
> > +--- a/morecore.c
> > ++++ b/morecore.c
> > +@@ -44,7 +44,7 @@ static long hugetlbfs_next_addr(long addr)  {  #if
> > +defined(__powerpc64__)
> > +       return ALIGN(addr, 1L << SLICE_HIGH_SHIFT); -#elif
> > +defined(__powerpc__)
> > ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> > +       return ALIGN(addr, 1L << SLICE_LOW_SHIFT);  #elif
> > +defined(__ia64__)
> > +       if (addr < (1UL << SLICE_HIGH_SHIFT)) diff --git
> > +a/tests/brk_near_huge.c b/tests/brk_near_huge.c index
> > +71eb803..f6d1e07 100644
> > +--- a/tests/brk_near_huge.c
> > ++++ b/tests/brk_near_huge.c
> > +@@ -47,7 +47,7 @@ void *next_chunk(void *addr)
> > +               /* 1TB segments above */
> > +               return PALIGN(addr, 0x10000000000UL);  } -#elif
> > +defined(__powerpc__)
> > ++#elif defined(__powerpc__) && !defined(PPC_NO_SEGMENTS)
> > + void *next_chunk(void *addr)
> > + {
> > +       return PALIGN(addr, 0x10000000UL); diff --git
> > +a/tests/truncate_above_4GB.c b/tests/truncate_above_4GB.c index
> > +5b8c08f..4c427fc 100644
> > +--- a/tests/truncate_above_4GB.c
> > ++++ b/tests/truncate_above_4GB.c
> > +@@ -102,11 +102,13 @@ int main(int argc, char *argv[])
> > +       *qi =3D 0;
> > +
> > +       /* This part of the test makes the problem more obvious, but
> > +-       * is not essential.  It can't be done on powerpc, where
> > ++       * is not essential.  It can't be done on segmented powerpc,
> > ++ where
> > +        * segment restrictions prohibit us from performing such a
> > +        * mapping, so skip it there. Similarly, ia64's address space
> > +        * restrictions prevent this. */ -#if !defined(__powerpc__) &&
> > +!defined(__powerpc64__) && !defined(__ia64__)
> > ++#if (defined(__powerpc__) && defined(PPC_NO_SEGMENTS)) \
> > ++      || !defined(__powerpc__) && !defined(__powerpc64__) \
> > ++      && !defined(__ia64__)
> > +       /* Replace middle hpage by tinypage mapping to trigger
> > +        * nr_ptes BUG */
> > +       verbose_printf("Replacing map at %p-%p...", q + hpage_size,
> > +--
> > +1.5.6.5
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py
> > -fix-typo-in-test-invocation.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_tests.py
> > -fix-typo-in-test-invocation.patch
> > new file mode 100644
> > index 0000000..d83db08
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-tests-run_test
> > +++ s.py-fix-typo-in-test-invocation.patch
> > @@ -0,0 +1,29 @@
> > +From b3d5429449aef61cb8926c33925fd7b5cad737de Mon Sep 17 00:00:00
> > +2001
> > +From: Becky Bruce <beckyb@kernel.crashing.org>
> > +Date: Tue, 19 Apr 2011 19:06:16 -0500
> > +Subject: [PATCH 2/2] tests/run_tests.py: fix typo in test invocation.
> > +
> > +One test was being invoked with HUGETLB_MORECORE=3Des (instead of
> yes).....
> > +
> > +Upstream-Status: Accepted
> > +Signed-off-by: Becky Bruce <beckyb@kernel.crashing.org>
> > +---
> > + tests/run_tests.py |    2 +-
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/tests/run_tests.py b/tests/run_tests.py index
> > +8055940..f0049b3 100755
> > +--- a/tests/run_tests.py
> > ++++ b/tests/run_tests.py
> > +@@ -567,7 +567,7 @@ def functional_tests():
> > +     do_test("heapshrink", LD_PRELOAD=3D"libhugetlbfs.so
> libheapshrink.so",
> > +             HUGETLB_MORECORE=3D"yes")
> > +     do_test("heapshrink", LD_PRELOAD=3D"libheapshrink.so",
> HUGETLB_MORECORE=3D"yes",
> > +-            HUGETLB_MORECORE_SHRINK=3D"es")
> > ++            HUGETLB_MORECORE_SHRINK=3D"yes")
> > +     do_test("heapshrink", LD_PRELOAD=3D"libhugetlbfs.so
> libheapshrink.so",
> > +             HUGETLB_MORECORE=3D"yes", HUGETLB_MORECORE_SHRINK=3D"yes"=
)
> > +     do_test("heap-overflow", HUGETLB_VERBOSE=3D"1",
> > +HUGETLB_MORECORE=3D"yes")
> > +--
> > +1.5.6.5
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-sym
> > link.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a-sym
> > link.patch
> > new file mode 100644
> > index 0000000..f555947
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/checks-if-mtab-is-a
> > +++ -symlink.patch
> > @@ -0,0 +1,30 @@
> > +Upstream-Status: Accepted
> > +
> > +If /etc/mtab is a symlink to /proc/self/mounts, mounting fails
> > +because addmntent returns an error.
> > +As a consequence, the Private directory is unusable.
> > +This is a patch which checks if /etc/mtab is a symlink, and if so,
> > +doesn't try to call addmntent.
> > +
> > +Signed-off-by: Guo Chunrong <B40290@freescale.com>
> > +
> > +
> > +--- a/hugeadm.c        2013-07-31 23:46:04.461258351 -0500
> > ++++ b/hugeadm.c        2013-07-31 23:50:03.249359534 -0500
> > +@@ -552,6 +552,16 @@
> > +                       return 1;
> > +               }
> > +
> > ++         char dummy;
> > ++         int useMtab;
> > ++          /* Check if mtab is a symlink */
> > ++          useMtab =3D (readlink(MOUNTED, &dummy, 1) < 0);
> > ++        if (!useMtab) {
> > ++         /* No need updating mtab */
> > ++          return 0;
> > ++        }
> > ++
> > ++
> > +               mounts =3D setmntent(MOUNTED, "a+");
> > +               if (mounts) {
> > +                       entry.mnt_fsname =3D FS_NAME;
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-l
> > ib-can-not-be-shiped-to-sub-p.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-perl-l
> > ib-can-not-be-shiped-to-sub-p.patch
> > new file mode 100644
> > index 0000000..42860de
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-Fix-pe
> > +++ rl-lib-can-not-be-shiped-to-sub-p.patch
> > @@ -0,0 +1,34 @@
> > +From f6aab55052b8ad7b9498b325c8a26cac25703b01 Mon Sep 17 00:00:00
> > +2001
> > +From: Yu Zongchun <b40527@freescale.com>
> > +Date: Mon, 6 May 2013 18:06:02 +0800
> > +Subject: [PATCH] libhugetlbfs:Fix perl lib can not be shiped to
> > +sub-package  issue for 64bit board
> > +
> > +
> > +Upstream-Status: Accepted
> > +Signed-off-by: Yu Zongchun <b40527@freescale.com>
> > +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > +
> > +---
> > + Makefile |    4 ++++
> > + 1 files changed, 4 insertions(+), 0 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 03966b2..adbd91e 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -149,7 +149,11 @@ LDSCRIPTDIR =3D
> > +$(PREFIX)/share/libhugetlbfs/ldscripts
> > + BINDIR =3D $(PREFIX)/share/libhugetlbfs  EXEDIR =3D $(PREFIX)/bin
> > +DOCDIR =3D $(PREFIX)/share/doc/libhugetlbfs
> > ++ifdef CC32
> > + PMDIR =3D $(PREFIX)/lib/perl5/TLBC
> > ++else
> > ++PMDIR =3D $(PREFIX)/lib64/perl5/TLBC
> > ++endif
> > + MANDIR1 =3D $(PREFIX)/share/man/man1
> > + MANDIR3 =3D $(PREFIX)/share/man/man3
> > + MANDIR7 =3D $(PREFIX)/share/man/man7
> > +--
> > +1.7.5.4
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and
> > -LIB64-if-they-point-to-the-s.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and
> > -LIB64-if-they-point-to-the-s.patch
> > new file mode 100644
> > index 0000000..201527c
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32
> > +++ -and-LIB64-if-they-point-to-the-s.patch
> > @@ -0,0 +1,47 @@
> > +From 355c014573de7f95202cc7c819f81f0f230e4a1a Mon Sep 17 00:00:00
> > +2001
> > +From: Ting Liu <b28495@freescale.com>
> > +Date: Mon, 18 Jun 2012 16:37:05 +0800
> > +Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the
> > +same place
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Ting Liu <b28495@freescale.com>
> > +---
> > + Makefile |   22 +++++++++++-----------
> > + 1 files changed, 11 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 1017950..bac5f01 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -131,17 +131,17 @@ endif
> > +
> > + # If TMPLIB64 is set, then sure we are not resolving LIB32 and LIB64
> > +to the  # same place -ifdef TMPLIB64
> > +-
> > +-REALLIB32 =3D $(realpath $(PREFIX)/$(LIB32))
> > +-REALLIB64 =3D $(realpath $(PREFIX)/$(LIB64)) -ifneq ($(realpath
> > +$(PREFIX)),) -ifeq ($(REALLIB32),$(REALLIB64)) -$(error LIB32
> > +($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64) to
> > +$(REALLIB64)) are resolving to the same place. Manually specify LIB32
> > +and LIB64. e.g. make PREFIX=3D$(PREFIX) LIB32=3Dlib32 LIB64=3Dlib64) -=
endif
> > +-endif
> > +-
> > +-endif
> > ++#ifdef TMPLIB64
> > ++#
> > ++#REALLIB32 =3D $(realpath $(PREFIX)/$(LIB32))
> > ++#REALLIB64 =3D $(realpath $(PREFIX)/$(LIB64)) #ifneq ($(realpath
> > ++$(PREFIX)),) #ifeq ($(REALLIB32),$(REALLIB64)) #$(error LIB32
> > ++($(PREFIX)/$(LIB32) to $(REALLIB32)) and LIB64 ($(PREFIX)/$(LIB64)
> > ++to $(REALLIB64)) are resolving to the same place. Manually specify
> > ++LIB32 and LIB64. e.g. make PREFIX=3D$(PREFIX) LIB32=3Dlib32 LIB64=3Dl=
ib64)
> > ++#endif #endif # #endif
> > +
> > + HEADERDIR =3D $(PREFIX)/include
> > + LIBDIR32 =3D $(PREFIX)/$(LIB32)
> > +--
> > +1.7.0.4
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-
> > static-4G-edge-testcases.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-
> > static-4G-edge-testcases.patch
> > new file mode 100644
> > index 0000000..dde9e0d
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-inst
> > +++ all-static-4G-edge-testcases.patch
> > @@ -0,0 +1,29 @@
> > +From 7f9be6fafd15c19a2a97ef19a2ece707b253b7a6 Mon Sep 17 00:00:00
> > +2001
> > +From: Ting Liu <b28495@freescale.com>
> > +Date: Wed, 7 Aug 2013 16:01:24 +0800
> > +Subject: [PATCH] tests/Makefile: install static 4G-edge testcases
> > +
> > +TESTS_64 is empty, install will fail due to missing file operand
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Ting Liu <b28495@freescale.com>
> > +---
> > + tests/Makefile |    2 +-
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/tests/Makefile b/tests/Makefile index 231e3b0..48da3ae
> > +100644
> > +--- a/tests/Makefile
> > ++++ b/tests/Makefile
> > +@@ -292,7 +292,7 @@ obj64/install:
> > +       $(INSTALL) -m 755 wrapper-utils.sh
> $(DESTDIR)$(INST_TESTSDIR64)/obj64
> > +       $(INSTALL) -m 755 $(HELPERS:%=3Dobj64/%)
> $(DESTDIR)$(INST_TESTSDIR64)/obj64
> > +       $(INSTALL) -m 755 $(HELPER_LIBS:%=3Dobj64/%)
> $(DESTDIR)$(INST_TESTSDIR64)/obj64
> > +-      $(INSTALL) -m 755 $(TESTS_64:%=3Dobj64/%)
> $(DESTDIR)$(INST_TESTSDIR64)/obj64
> > ++      $(INSTALL) -m 755 $(TESTS_64_STATIC:%=3Dobj64/%_static)
> > ++ $(DESTDIR)$(INST_TESTSDIR64)/obj64
> > +       $(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
> > +
> > + install: $(OBJDIRS:%=3D%/install)
> > +--
> > +1.7.5.4
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > new file mode 100644
> > index 0000000..d62d616
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -0,0 +1,49 @@
> > +DESCRIPTION =3D "A library which provides easy access to huge pages of
> memory"
> > +SECTION =3D "libhugetlbfs"
> > +LICENSE =3D "LGPLv2.1"
> > +
> > +DEPENDS =3D "sysfsutils perl"
> > +RDEPENDS_${PN} +=3D "python python-io python-lang python-subprocess
> python-resource"
> > +
> > +LIC_FILES_CHKSUM =3D "file://LGPL-
> 2.1;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
> > +
> > +SRCREV =3D "7649454b6fed355bf53517d5106ae211b533aced"
> > +SRC_URI =3D "
> git://libhugetlbfs.git.sourceforge.net/gitroot/libhugetlbfs/libhugetlbfs
> \
> > +               file://0001-Allow-compiler-to-be-override-regardless-
> of-32-or-64.patch \
> > +               file://0002-Fix-cross-compiling-on-PPC.patch \
> > +               file://0003-libhugetlbfs-Remove-segment-based-
> alignment-restric.patch \
> > +               file://0004-tests-run_tests.py-fix-typo-in-test-
> invocation.patch \
> > +               file://skip-checking-LIB32-and-LIB64-if-they-point-to-
> the-s.patch \
> > +               file://libhugetlbfs-Fix-perl-lib-can-not-be-shiped-to-
> sub-p.patch \
> > +               file://0001-install-perl-lib-to-directory-perl-instead-
> of-perl5.patch \
> > +               file://checks-if-mtab-is-a-symlink.patch \
> > +               file://0001-libhugetlbfs-avoid-search-host-library-
> path-for-cros.patch \
> > +
> > +file://tests-Makefile-install-static-4G-edge-testcases.patch \ "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +COMPATIBLE_HOST =3D '(powerpc|powerpc64)'
>=20
> libhugetlbfs supports a wider range of architectures (including arm).
>=20
> > +EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC=
}'
> BUILDTYPE=3DNATIVEONLY"
> > +CFLAGS +=3D "-fexpensive-optimizations -frename-registers -fomit-frame=
-
> pointer -g0"
> > +
> > +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > +
> > +do_install() {
> > +        oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} \
> > +          INST_TESTSDIR32=3D/opt/libhugetlbfs/tests \
> > +          INST_TESTSDIR64=3D/opt/libhugetlbfs/tests \
> > +          install-tests
> > +}
> > +
> > +PARALLEL_MAKE_pn-${PN} =3D ""
> > +
> > +PACKAGES =3D+ "${PN}-perl ${PN}-tests"
> > +FILES_${PN}-dbg +=3D "${libdir}/libhugetlbfs/tests/obj32/.debug
> ${libdir}/libhugetlbfs/tests/obj64/.debug"
> > +FILES_${PN}-perl =3D "${libdir}/perl"
> > +FILES_${PN}-tests +=3D "/opt/libhugetlbfs/tests"
> > +
> > +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > +INSANE_SKIP_${PN}-tests +=3D "dev-deps"
> > +
> > --
> > 1.7.5.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> Cheers,
> Fathi
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



