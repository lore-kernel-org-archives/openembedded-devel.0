Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6F79179616
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 05:47:45 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id k38-v6so670495qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 22:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UtF0/GJf7rTimUyNgVTa2n7525WUkJkpJGQznQtWFK8=;
	b=gsgp66u9eIW+EpI38fVJUeNfBZBF56tDjrObXj/6F7F7GtrfCzjqqYNeN8qwPbp2In
	BayBuil8T9I4Ab2wjSnT0h679/FnkyionMg8WZi9CFH2LtSBWRbYJTBhJNvOCpd67DbI
	icruiToVSsLFam/LXkpEDHIL2s9WMGrNOD6CGLJFjzu3HyniQMiVXJE8DuLy5NJ2DE8J
	/spqTkaVoYBm8UhIdSQ9J9Bf3whRCgmytRMfNQdFTOQZQDmYTbPYa2PghnA8dbtivem9
	LgPXZmtT5xpSeQQi6qhrFqBtYX7gPG2KBTeZlv9zRR5vyL8goEV9vLWbxz93jmcna7lC
	jevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UtF0/GJf7rTimUyNgVTa2n7525WUkJkpJGQznQtWFK8=;
	b=b0HOWPI0XXwABrHC1G4nhr42e4sKrbKxH+g49Z2XQM8qu83xCxEdrgiznoVZHqvJLZ
	wDaIVZX5m+/Ba7xFhB26TQpBw1cP5N6aqsRVVBvJ0np1huN/Ircwfy619+eBph880Fl2
	5hwIEvhJcx16qwveg4aTV15DTmcDGn3Af0sWDyLmiaVDwjOV3GMI1eQky209dPp/6RBr
	1EH1RkgNE3qDzL9+/1P8sSFi5sJxCbTzg9g/Bu+N77RsZdbKBzZA1ea5sOr3lHcFbJF7
	lk6QmVo8d42bxv0IePoecjyfVV0vlKfcTQywSXa9YUQs5pTWzurTzRWkCcPcfUOF9qfg
	BcbQ==
X-Gm-Message-State: APzg51C/vqJ2yGVbvsT8gzCT3sK2+2haEQDIxevCeWCFDnbciPNzMZv3
	Uszs6PfE/y5oVxBNmsViXaSxTuoRGXj4HgiHYIlo74s/
X-Google-Smtp-Source: ANB0VdYD+snoRxzyoC+Hj1QFD+4aLgWJ8n9Nszls27irYXU8rKQUO1M5DAW/df9G2+dqXoB6CWHk26ymYdy2G70Dx2k=
X-Received: by 2002:a0c:f208:: with SMTP id h8-v6mr165766qvk.55.1536731265839; 
	Tue, 11 Sep 2018 22:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180911001047.28826-1-alistair.francis@wdc.com>
In-Reply-To: <20180911001047.28826-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2018 22:47:20 -0700
Message-ID: <CAMKF1sqCHqzht_Qvaa_jhfbO1ODbz3r2RW6GvJH50Un1F1Tysg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v5] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Wed, 12 Sep 2018 05:47:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alistair

On Mon, Sep 10, 2018 at 5:11 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v5:
>  - Fix non musl build
> v4:
>  - Update to 1.4.2
>  - Fix musl build failure
> v3:
>  - Add missing patch file
>  - Use SELECTED_OPTIMIZATION
> v2:
>  - Fix fortify source compile error
>
>  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++
>  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++
>  ...03-Makefile-Don-t-build-the-examples.patch | 34 ++++++++++
>  ...y-implement-secure_getenv-if-require.patch | 30 +++++++++
>  ...ol-Remove-unused-__USE_UNIX98-define.patch | 30 +++++++++
>  ...inc-Allow-extra-libs-to-be-specified.patch | 29 +++++++++
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb   | 62 +++++++++++++++++++
>  7 files changed, 240 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
>
> diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
> new file mode 100644
> index 000000000..747538b0c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
> @@ -0,0 +1,29 @@
> +From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jul 2018 11:23:39 -0700
> +Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
> + jemalloc
> +
> +To avoid this error:
> +    configure: error: cannot run C compiled programs.
> +    If you meant to cross compile, use `--host'.
> +when cross compiling specify the host when configuring jemalloc.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Inappropriate [configuration]
> +---
> + src/jemalloc/jemalloc.cfg | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
> +index 196129de6..79ebbab1c 100644
> +--- a/src/jemalloc/jemalloc.cfg
> ++++ b/src/jemalloc/jemalloc.cfg
> +@@ -3,3 +3,4 @@
> + --with-private-namespace=je_vmem_
> + --disable-xmalloc
> + --disable-munmap
> ++--host=${HOST_SYS}
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
> new file mode 100644
> index 000000000..bd1b97c24
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
> @@ -0,0 +1,26 @@
> +From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jul 2018 11:31:17 -0700
> +Subject: [PATCH 2/2] Makefile: Don't install the docs
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Inappropriate [disable feature]
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 224a315f6..ce7f84afb 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
> +
> + install uninstall:
> +       $(MAKE) -C src $@
> +-      $(MAKE) -C doc $@
> +
> + .PHONY: all clean clobber test check cstyle check-license install uninstall\
> +       source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
> new file mode 100644
> index 000000000..f75d94197
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
> @@ -0,0 +1,34 @@
> +From a7f07dca2468ea226d2f07fc0105166e75cadaf8 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Thu, 6 Sep 2018 16:18:50 -0700
> +Subject: [PATCH] Makefile: Don't build the examples
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Inappropriate [disable feature]
> +---
> + src/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 4b50dd8b5..e00501e31 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -38,13 +38,13 @@ include $(TOP)/src/version.inc
> +
> + TARGETS = libpmem libvmem libpmemblk libpmemlog libpmemobj libpmempool\
> +                 libpmemcto libvmmalloc tools
> +-ALL_TARGETS = $(TARGETS) common librpmem examples benchmarks
> ++ALL_TARGETS = $(TARGETS) common librpmem benchmarks
> +
> + SCOPE_DIRS = $(TARGETS) common librpmem rpmem_common
> +
> + DEBUG_RELEASE_TARGETS = common libpmem libvmem libpmemblk libpmemlog libpmemobj\
> +       libpmempool libvmmalloc librpmem libpmemcto
> +-RELEASE_TARGETS = tools examples benchmarks
> ++RELEASE_TARGETS = tools benchmarks
> +
> + CLEAN_NO_JE_TARGETS = $(ALL_TARGETS) rpmem_common test
> + CLEAN_TARGETS = $(CLEAN_NO_JE_TARGETS) jemalloc
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
> new file mode 100644
> index 000000000..624f17bd4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
> @@ -0,0 +1,30 @@
> +From 33affa9ee97691efb73f439fcdba4adb8625a26a Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 10 Sep 2018 12:59:48 -0700
> +Subject: [PATCH] os_posix: Manually implement secure_getenv() if required
> +
> +Manually implement the secure_getenv() if we need to, this is required
> +if using musl.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Pending
> +---
> + src/common/os_posix.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/common/os_posix.c b/src/common/os_posix.c
> +index 2d70a0a29..fb09b6ce0 100644
> +--- a/src/common/os_posix.c
> ++++ b/src/common/os_posix.c
> +@@ -261,7 +261,7 @@ os_setenv(const char *name, const char *value, int overwrite)
> + /*
> +  * secure_getenv -- provide GNU secure_getenv for FreeBSD
> +  */
> +-#ifdef __FreeBSD__
> ++#if defined(__FreeBSD__) || !HAVE___SECURE_GETENV
> + static char *
> + secure_getenv(const char *name)
> + {
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
> new file mode 100644
> index 000000000..75c35f865
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
> @@ -0,0 +1,30 @@
> +From 92e63699ea83074298971b0251f002562be4dbd3 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 10 Sep 2018 13:23:37 -0700
> +Subject: [PATCH 2/3] pmempool: Remove unused __USE_UNIX98 define
> +
> +Remove the unused __USE_UNIX98 to fix musl build failures.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Pending
> +---
> + src/tools/pmempool/info.c | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/src/tools/pmempool/info.c b/src/tools/pmempool/info.c
> +index b4010bf35..7b890a123 100644
> +--- a/src/tools/pmempool/info.c
> ++++ b/src/tools/pmempool/info.c
> +@@ -45,9 +45,6 @@
> + #include <inttypes.h>
> + #include <assert.h>
> + #include <sys/param.h>
> +-#ifndef __FreeBSD__
> +-#define __USE_UNIX98
> +-#endif
> + #include <unistd.h>
> + #include <sys/mman.h>
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
> new file mode 100644
> index 000000000..2042fdb25
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
> @@ -0,0 +1,29 @@
> +From a88e806f9ce8cc071e81abad688643d53f393176 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 10 Sep 2018 14:18:38 -0700
> +Subject: [PATCH 3/3] Makefile.inc: Allow extra libs to be specified
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Pending
> +---
> + src/Makefile.inc       | 2 ++
> + src/common.inc         | 2 ++
> + src/tools/Makefile.inc | 1 +
> + 3 files changed, 5 insertions(+)
> +
> +diff --git a/src/common.inc b/src/common.inc
> +index 032cb83ea..2d5c4bedf 100644
> +--- a/src/common.inc
> ++++ b/src/common.inc
> +@@ -74,6 +74,8 @@ GCOV_CFLAGS=-fprofile-arcs -ftest-coverage --coverage
> + GCOV_LDFLAGS=-fprofile-arcs -ftest-coverage
> + GCOV_LIBS=-lgcov
> +
> ++LIBS += $(EXTRA_LIBS)
> ++
> + osdep = $(1)_$(shell uname -s | tr "[:upper:]" "[:lower:]")$(2)
> + get_arch = $(shell $(CC) -dumpmachine | awk -F'[/-]' '{print $$1}')
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> new file mode 100644
> index 000000000..0c5b6d8b2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> @@ -0,0 +1,62 @@
> +SUMMARY = "Persistent Memory Development Kit"
> +DESCRIPTION = "Persistent Memory Development Kit"
> +HOMEPAGE = "http://pmem.io"
> +SECTION = "libs"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
> +DEPENDS = "ndctl"

ndctl is marked as x86_64 only recipe. If this recipe is dependent on
ndctl then we should mark this same
see

http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/ndctl/ndctl_git.bb#n30


> +
> +# Required to have the fts.h header for musl
> +DEPENDS_append_libc-musl = " fts"
> +
> +SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
> +           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
> +           file://0002-Makefile-Don-t-install-the-docs.patch \
> +           file://0003-Makefile-Don-t-build-the-examples.patch \
> +           file://0005-pmempool-Remove-unused-__USE_UNIX98-define.patch \
> +           file://0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch \
> +          "
> +
> +SRC_URI_append_libc-musl = " file://0004-os_posix-Manually-implement-secure_getenv-if-require.patch"
> +
> +SRC_URI[md5sum] = "bde73bca9ef5b90911deb0fdcfb15ccf"
> +SRC_URI[sha256sum] = "df7e658e75d28cd80f6d2ff7b9fc9ae2885d52f8923fdbacecfd46215115fb4c"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +# Fix jemalloc error:
> +# | configure: error: cannot run C compiled programs.
> +# | If you meant to cross compile, use `--host'.
> +#
> +# Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
> +EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
> +
> +# Fix the missing fts libs when using musl
> +EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
> +
> +do_install() {
> +       oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +
> +       # Copy these into the standard directories
> +       install -d ${D}${bindir}/
> +       mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> +       mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> +
> +       install -d ${D}${libdir}
> +       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> +
> +       install -d ${D}${libdir}/pkgconfig
> +       mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> +
> +       install -d ${D}${includedir}
> +       mv ${D}/usr/local/include/* ${D}${includedir}/
> +
> +       # Remove uneeded files
> +       rm -rf ${D}/usr/local/
> +}
> +
> +# Include these by default otherwise the SDK is not very useful
> +FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
> +FILES_${PN} += "${libdir}/*so*"
> +FILES_${PN} += "${libdir}/pkgconfig/*.pc"
> +FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

