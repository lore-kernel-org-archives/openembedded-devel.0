Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E8FA079708
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:38:03 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g53-v6so13203178qtg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bjgWXbdk4cojDKm2EogU4Mt/sVqgcwcpzaHWYVmfr6g=;
	b=DXlF7YQ2Cs20H6G4G6S/h9/zK9iBP+v5U8V8+akoNY5fRipHbeNmXmsEee8bgEzREv
	uLcg+YpP1C/iI3lOSrXNYA3nHas5L3CZisqyTgxEJnPuPS4KwbmtYln7GbHvqXKvfDV4
	A8jELp2Roc9APzuJLz903DNpthTFedoen2MxcZz8nUoWNIEzA90xCqlpDGeqpvO3afhL
	bEVUThfkx4HN1CrhGxQlEI8F/LCF+p6hF+MF6a5JwzvqzEBHfyjymuChIwVqoB+/IDcL
	Sq7meSLpOwQCw7Xr6Hee4VeEofplZCxOKUqefVYl6jBi0xQmQcFPlPb7yiI/kYpIVrZh
	c+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bjgWXbdk4cojDKm2EogU4Mt/sVqgcwcpzaHWYVmfr6g=;
	b=Oq7c799LgV0liE+B9spn3dWx0u8xEhwuHlb94gKp9FksG4wo7tBZDt3oN4RSP+1jN+
	MRx4JJS1SoD8iZMCl3OVbhwnKVP3Ju30QwAQN6vy3wERRSFs+Gsh+FFDfVGh67hqxHqR
	TVFKTv3GsF8BN1mKFv897YM4A4PMwaiTNPBuI60iaxPhtStzSd9VfYCwRh/6Hn7Fo7kl
	K9H0EKK8t6btDpbbEg8QuEToNRJqMa91G+IEA1NBxmDXFDdQqMGxXCHzWlj43i59cHXd
	jdMyw0I7V3ijPKBy6MDmPGWejsNxMbO1d0GkJv5iKWIYXMskGESC8GWv197C4ARWyIlB
	/gBg==
X-Gm-Message-State: APzg51C+jU2+MQAWTsusltmrNtwpjv1woex6fh355BhE9VG0MQx6XIbx
	j8+CQz0cdn1bsg+kx6+t9mNX9Os1YefHDNF3TrI=
X-Google-Smtp-Source: ANB0Vdbmte4Z9RGmX2LTLEVaGHXnjBzhbtm4+hvOdC8R9tLopJ01MSxWT0DEDW449pW/QD/62zKMBOv41FErPoXBOWc=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr3001214qth.314.1536255484666;
	Thu, 06 Sep 2018 10:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180905181732.19483-1-alistair.francis@wdc.com>
In-Reply-To: <20180905181732.19483-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 10:37:38 -0700
Message-ID: <CAMKF1soxcVsMSPwCCGJVt6471n-LKXHs+HE3wHBpcRy9jPLc5Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Thu, 06 Sep 2018 17:38:04 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build with security flags on see
http://errors.yoctoproject.org/Errors/Details/191388/
On Wed, Sep 5, 2018 at 11:27 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
>  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 49 +++++++++++++++++++
>  3 files changed, 104 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
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
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> new file mode 100644
> index 000000000..90d51e3f8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> @@ -0,0 +1,49 @@
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
> +EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}'"
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

