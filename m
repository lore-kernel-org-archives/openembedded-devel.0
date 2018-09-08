Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id E202C797B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 07:05:05 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 93-v6so11098622qks.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 00:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qWkEoTl9OH687O3ymNFCulX80m6qZPXcBeRZLjgI0l8=;
	b=OoOArrW1qnapeGDHgRqxJZHiVI5KkdwLvKP64K6KkvnrGoTQfPkXT+fGXQnUk4s/nN
	w5SoCwQuoZ73dYmm19FUFiroDCddYdMy9w5hMIfVxlFyE+0RxXeLWT8e1d5YYRLCrdkh
	3lEJGBC9P/PsIpvhVMJvAn5/QynGGBPVgM2KKryIm9fg4TcJiotig3YS/wPCgxZwuHkq
	eMx3lz6cV858dAI21D//Ey4sNiYtwm2vd4mEeJq3lKJ1fGWoxJ463MDPJgGkZOz7Oo01
	p60WTWpxiz6QgYHvvc0XYkpPoPTjg/w0GirOFVa+Sz8oM+4/16XI0dIUhqJ9ksO8enY6
	7Nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qWkEoTl9OH687O3ymNFCulX80m6qZPXcBeRZLjgI0l8=;
	b=jFxbshyyfHZto0Z0vhAZo60Qkrwow+wJDv7RTxVUseEhDSEryORJuUdUXG2yW4y2F9
	AY0bLrkExlwlbo2hhb8Jzf3IkPL/4ijXBvE7nUEMsN0fQquWaakw/oEb4obL1EkbzTuq
	PU+w/1igrmyiAbkSpXjP7kF5uaBpxJ+Pkp8n1nLwwFGFDsWKnAn+IU5ZIjKDLSBor624
	gRNs4Y+uHFPeUPn4r1fjLxyzGv3ovMYLHrMQLba8+nVEO+pJHcfm6NtVCfxulhOS9a+N
	mMsCDlmiUGLCj/VvaX5AdYAugKtNWptKMx8CaGYlKPZVL2q8XcetNimTXHoEN+2Dojow
	EKcg==
X-Gm-Message-State: APzg51BFYbOpdd2qYUCIIslD8S/CqkdRl/fBBUSiipk6jAOplhRnqZ/X
	+/YlXjCJSPXmSReOm7w/XQfKMcjgSnOstqXmPuI=
X-Google-Smtp-Source: ANB0Vdbij1zlPvDmbVUguWsiojOke/nkGqWqO6CMP7o/Zu8mPO0nAEwhkcYMUxYsZuz2Y+4n2FY6zTy3FvrbRA7o9aA=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr8581090qkm.2.1536390306415; 
	Sat, 08 Sep 2018 00:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180907182156.25995-1-alistair.francis@wdc.com>
In-Reply-To: <20180907182156.25995-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Sep 2018 00:04:40 -0700
Message-ID: <CAMKF1srCkfs7O1z0KDRqonXTwZc1GmCyjsjJmDBrVnT7Mv_irw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Sat, 08 Sep 2018 07:05:06 -0000
Content-Type: text/plain; charset="UTF-8"

now fails on musl

http://errors.yoctoproject.org/Errors/Details/192047/
On Fri, Sep 7, 2018 at 11:22 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v3:
>  - Add missing patch file
>  - Use SELECTED_OPTIMIZATION
> v2:
>  - Fix fortify source compile error
>
>  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
>  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
>  ...03-Makefile-Don-t-build-the-examples.patch | 34 ++++++++++++
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 52 +++++++++++++++++++
>  4 files changed, 141 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
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
> index 000000000..01f620057
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
> @@ -0,0 +1,34 @@
> +From a7f07dca2468ea226d2f07fc0105166e75cadaf8 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Thu, 6 Sep 2018 16:18:50 -0700
> +Subject: [PATCH] Makefile: Don't build the examples
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Inappropriate [configuration]
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
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> new file mode 100644
> index 000000000..f3edbf10a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> @@ -0,0 +1,52 @@
> +SUMMARY = "Persistent Memory Development Kit"
> +DESCRIPTION = "Persistent Memory Development Kit"
> +HOMEPAGE = "http://pmem.io"
> +SECTION = "libs"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
> +DEPENDS = "ndctl"
> +
> +SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
> +           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
> +           file://0002-Makefile-Don-t-install-the-docs.patch \
> +           file://0003-Makefile-Don-t-build-the-examples.patch \
> +          "
> +
> +SRC_URI[md5sum] = "d9a7b3f1059ffd54b4c92e38329fe69e"
> +SRC_URI[sha256sum] = "e11cfbbdf0773fb5965211e18044531f442ad1e6d6726f1bac8a6dcc0e092622"
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

