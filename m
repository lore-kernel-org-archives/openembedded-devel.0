Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 58767797D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 13:51:31 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id z78-v6so9714138qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=LSRlqAzG4GAlZ3kAhNnEkPGovphcCde48i9R6e/45YM=;
	b=rnSu20J6bUFrCleOHFT0u5Dmp9IJHpGnT5/T1zKn+Z5e5HIMm2eCejzjwVS1/z6dAf
	HWUxN2Y1kGIsVUbjOcTMHLJtxk+TN6MLlc3gn4miRzKJOr8PXZdI92uCmOeZTTf5RqHx
	6cy93q0oJQGF1PFBDBdXqLS3Ymv1V6uXWpcNJehUBtE9jd0k/p8ZdLmxN61iHkeoY/EK
	18BAbYzQsBJbCtK6Mw3uh/Lg/fCHdF8MJyqQ5WAcOwFzEX1QZw8/XMHXb8jnT7aoT9sf
	X0zhnsrAM6fWNEm5mOtnVXHCBStry4U63YkUiTuy/m5HAw8vT+HXQ54fD4uZ5iAIJAwc
	adTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=LSRlqAzG4GAlZ3kAhNnEkPGovphcCde48i9R6e/45YM=;
	b=nq8JgM9/aHacGjGq9r245/9Vsh4WACAJRv0TcwzWFi+vKzDzT5HYjSqlegPydMHTGt
	qHlSVtRuCi+rEs7tUREcrkLRuq9k9oEBvCt/UeXiEpRPdrYQymp1u5u0y2MoQpCnMCIQ
	7Z0Gd1ADTsAzQ7psBBFLbOs7LnbqnPEnGqKsVP8drZISy92r5NPIPWzZOTmavNwGoNSl
	2FsOh/MEvqQxHOmM16UPKrrgdnIHt7hqTXgX1rX7r49mu5+3b7u/uLDYDlBD272v/6Aw
	oKXL+xa4CAFfqUGtvobZ8U4C2qmNg5cK4TTMQLAp60Lb73io9rZ8nGpeDinjVLnRLgwj
	x6ng==
X-Gm-Message-State: APzg51DP8NeGydP6TZu8FyzUrepbnTwRVmRfw7CBQSA6A61iqNAECAV2
	864TSoVaocfG1g5bYMAKeNu3vOWA+IHzvX8NbAJaBBRd
X-Google-Smtp-Source: ANB0VdbhhJi6Par/tjCM+XIk3jneenvx4xOooTItAONl1O3kSkxeV33S6KBmAVkvJQBO/xS1O7IlV6qRGHk20uaPv5U=
X-Received: by 2002:a37:c5d2:: with SMTP id
	k79-v6mr6001589qkl.206.1536328291828; 
	Fri, 07 Sep 2018 06:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180907003059.4041-1-alistair.francis@wdc.com>
	<deae9220-8aef-6b98-99fd-732f7f8e502a@gmail.com>
In-Reply-To: <deae9220-8aef-6b98-99fd-732f7f8e502a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2018 06:51:01 -0700
Message-ID: <CAMKF1sqj8=mT23Epor16aKE4i_4Jm_CVQk6z=8vxUFLy01Ga-A@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Fri, 07 Sep 2018 13:51:31 -0000
Content-Type: text/plain; charset="UTF-8"

Unable to find file file://0003-Makefile-Don-t-build-the-examples.patch anywhere
On Thu, Sep 6, 2018 at 5:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Alistair
>
> On 9/6/18 5:30 PM, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > v2:
> >  - Fix fortify source compile error
> >
> >  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
> >  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
> >  meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 52 +++++++++++++++++++
> >  3 files changed, 107 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
> >  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
> >  create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> >
> > diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
> > new file mode 100644
> > index 000000000..747538b0c
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
> > @@ -0,0 +1,29 @@
> > +From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
> > +From: Alistair Francis <alistair.francis@wdc.com>
> > +Date: Mon, 23 Jul 2018 11:23:39 -0700
> > +Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
> > + jemalloc
> > +
> > +To avoid this error:
> > +    configure: error: cannot run C compiled programs.
> > +    If you meant to cross compile, use `--host'.
> > +when cross compiling specify the host when configuring jemalloc.
> > +
> > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + src/jemalloc/jemalloc.cfg | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
> > +index 196129de6..79ebbab1c 100644
> > +--- a/src/jemalloc/jemalloc.cfg
> > ++++ b/src/jemalloc/jemalloc.cfg
> > +@@ -3,3 +3,4 @@
> > + --with-private-namespace=je_vmem_
> > + --disable-xmalloc
> > + --disable-munmap
> > ++--host=${HOST_SYS}
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
> > new file mode 100644
> > index 000000000..bd1b97c24
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
> > @@ -0,0 +1,26 @@
> > +From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
> > +From: Alistair Francis <alistair.francis@wdc.com>
> > +Date: Mon, 23 Jul 2018 11:31:17 -0700
> > +Subject: [PATCH 2/2] Makefile: Don't install the docs
> > +
> > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > +Upstream-Status: Inappropriate [disable feature]
> > +---
> > + Makefile | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 224a315f6..ce7f84afb 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
> > +
> > + install uninstall:
> > +     $(MAKE) -C src $@
> > +-    $(MAKE) -C doc $@
> > +
> > + .PHONY: all clean clobber test check cstyle check-license install uninstall\
> > +     source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> > new file mode 100644
> > index 000000000..e4d4fcb4f
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> > @@ -0,0 +1,52 @@
> > +SUMMARY = "Persistent Memory Development Kit"
> > +DESCRIPTION = "Persistent Memory Development Kit"
> > +HOMEPAGE = "http://pmem.io"
> > +SECTION = "libs"
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
> > +DEPENDS = "ndctl"
> > +
> > +SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
> > +           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
> > +           file://0002-Makefile-Don-t-install-the-docs.patch \
> > +           file://0003-Makefile-Don-t-build-the-examples.patch \
> > +          "
> > +
> > +SRC_URI[md5sum] = "d9a7b3f1059ffd54b4c92e38329fe69e"
> > +SRC_URI[sha256sum] = "e11cfbbdf0773fb5965211e18044531f442ad1e6d6726f1bac8a6dcc0e092622"
> > +
> > +inherit autotools-brokensep pkgconfig
> > +
> > +# Fix jemalloc error:
> > +# | configure: error: cannot run C compiled programs.
> > +# | If you meant to cross compile, use `--host'.
> > +#
> > +# Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
> > +EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='-O'"
>
> Perhaps its better to pass SELECTED_OPTIMIZATION variable instead of
> hardcoding -O here since this might override the optlevel we expect
>
> > +
> > +do_install() {
> > +     oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> > +
> > +     # Copy these into the standard directories
> > +     install -d ${D}${bindir}/
> > +     mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> > +     mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> > +
> > +     install -d ${D}${libdir}
> > +     mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> > +
> > +     install -d ${D}${libdir}/pkgconfig
> > +     mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> > +
> > +     install -d ${D}${includedir}
> > +     mv ${D}/usr/local/include/* ${D}${includedir}/
> > +
> > +     # Remove uneeded files
> > +     rm -rf ${D}/usr/local/
> > +}
> > +
> > +# Include these by default otherwise the SDK is not very useful
> > +FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
> > +FILES_${PN} += "${libdir}/*so*"
> > +FILES_${PN} += "${libdir}/pkgconfig/*.pc"
> > +FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
> >
>

