Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2A70A7981D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:23:55 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id g6-v6so12744380lfb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+fOP0e5WKassXbN7l/7TXW5Sku/2U3D2AED1XUMFNcU=;
	b=Tk4+dsrKSvpq8Aqh0thds4WRNHsumNcHTkp28Hf9rx+ZWbjF3sC1zGA0/PBZbZl8M9
	KaMU6QCCp7IUFYR6eBFK1PmCDW3iZFluRCW0n+mbf2qKGHlVqMCYiAvCxu01982TpKhA
	7Nk/uNlf5iiYM9kYoqRy2I78gCGDGZ5T+nT+Imy2r2PqvEF+jRZRCa3xG5Y+1a07THY7
	vZATVAHlq31VK/2D3NV383aSGOiVZoZgQOdPJJfD1DAEfabBEvUjtQ1SoERgr47csfhQ
	GAHyJcj2Mr7tQSNftCkRcBpiSkerj518j3eg1BC/oEmn3wCPD+2oM859bDqywz267O4l
	LBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+fOP0e5WKassXbN7l/7TXW5Sku/2U3D2AED1XUMFNcU=;
	b=bijV8MXD/0IjCPPJkxbeXUqWKl6XxSQjko3POZDO/hfX/D3TYkJl3pRkb90evRpuFI
	cx16Rxc0gPsZl4mxuD5c34oM3nglXTaV0MpAmnImtjoQaNQi7xzWbLAvnjCa5CBQn3cj
	N4wrzj0bhcHVfdkNCxBlfKYcnT8J3mPtSXmGamvtl8WD/FCmAmpAcJ6udcXAlX84FZyt
	x8tbfF5yHCyCOf2r7Q8Fobhg62Vdr6tDvcfsf3Vtrt2CNvxeIQeyFUx4wBlFrznC582n
	AWODjnAXzTbk/pRfLYavhJsdmhqEvPtpelCuzDRBeXgGZKd5KrrFWnYiVuxogxv5oImu
	aELQ==
X-Gm-Message-State: APzg51Agf0didgUro6aPXiN0s22ag2fgycGoCBya6+FP315ZmhrGR2V+
	ZNrkNQcnNk2cCooEWLYyiBQ9JpGjAC2VoScwBSQ=
X-Google-Smtp-Source: ANB0VdZH/p1hfAOV+JptdXrkhY56ez7ueogi2H+CBToTOteMowFUl8cqBFp6vrUztlZzEolhcs/vwZggmetOhbS9vVw=
X-Received: by 2002:a19:5353:: with SMTP id h80-v6mr6141350lfb.9.1536344635721;
	Fri, 07 Sep 2018 11:23:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:5649:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 11:23:25 -0700 (PDT)
In-Reply-To: <CAMKF1sqj8=mT23Epor16aKE4i_4Jm_CVQk6z=8vxUFLy01Ga-A@mail.gmail.com>
References: <20180907003059.4041-1-alistair.francis@wdc.com>
	<deae9220-8aef-6b98-99fd-732f7f8e502a@gmail.com>
	<CAMKF1sqj8=mT23Epor16aKE4i_4Jm_CVQk6z=8vxUFLy01Ga-A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Sep 2018 11:23:25 -0700
Message-ID: <CAKmqyKOu4ca3d4+M6qsFaUBZoJYT+3NtmKv-egzh5hT0Z=-wvA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 07 Sep 2018 18:23:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 7, 2018 at 6:51 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Unable to find file file://0003-Makefile-Don-t-build-the-examples.patch anywhere

Argh! I forgot to include it. Added in v3.

Alistair

> On Thu, Sep 6, 2018 at 5:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Hi Alistair
>>
>> On 9/6/18 5:30 PM, Alistair Francis wrote:
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> > v2:
>> >  - Fix fortify source compile error
>> >
>> >  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
>> >  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
>> >  meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 52 +++++++++++++++++++
>> >  3 files changed, 107 insertions(+)
>> >  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>> >  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>> >  create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>> >
>> > diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>> > new file mode 100644
>> > index 000000000..747538b0c
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>> > @@ -0,0 +1,29 @@
>> > +From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
>> > +From: Alistair Francis <alistair.francis@wdc.com>
>> > +Date: Mon, 23 Jul 2018 11:23:39 -0700
>> > +Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
>> > + jemalloc
>> > +
>> > +To avoid this error:
>> > +    configure: error: cannot run C compiled programs.
>> > +    If you meant to cross compile, use `--host'.
>> > +when cross compiling specify the host when configuring jemalloc.
>> > +
>> > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > +Upstream-Status: Inappropriate [configuration]
>> > +---
>> > + src/jemalloc/jemalloc.cfg | 1 +
>> > + 1 file changed, 1 insertion(+)
>> > +
>> > +diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
>> > +index 196129de6..79ebbab1c 100644
>> > +--- a/src/jemalloc/jemalloc.cfg
>> > ++++ b/src/jemalloc/jemalloc.cfg
>> > +@@ -3,3 +3,4 @@
>> > + --with-private-namespace=je_vmem_
>> > + --disable-xmalloc
>> > + --disable-munmap
>> > ++--host=${HOST_SYS}
>> > +--
>> > +2.17.1
>> > +
>> > diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>> > new file mode 100644
>> > index 000000000..bd1b97c24
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>> > @@ -0,0 +1,26 @@
>> > +From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
>> > +From: Alistair Francis <alistair.francis@wdc.com>
>> > +Date: Mon, 23 Jul 2018 11:31:17 -0700
>> > +Subject: [PATCH 2/2] Makefile: Don't install the docs
>> > +
>> > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > +Upstream-Status: Inappropriate [disable feature]
>> > +---
>> > + Makefile | 1 -
>> > + 1 file changed, 1 deletion(-)
>> > +
>> > +diff --git a/Makefile b/Makefile
>> > +index 224a315f6..ce7f84afb 100644
>> > +--- a/Makefile
>> > ++++ b/Makefile
>> > +@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
>> > +
>> > + install uninstall:
>> > +     $(MAKE) -C src $@
>> > +-    $(MAKE) -C doc $@
>> > +
>> > + .PHONY: all clean clobber test check cstyle check-license install uninstall\
>> > +     source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
>> > +--
>> > +2.17.1
>> > +
>> > diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>> > new file mode 100644
>> > index 000000000..e4d4fcb4f
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>> > @@ -0,0 +1,52 @@
>> > +SUMMARY = "Persistent Memory Development Kit"
>> > +DESCRIPTION = "Persistent Memory Development Kit"
>> > +HOMEPAGE = "http://pmem.io"
>> > +SECTION = "libs"
>> > +LICENSE = "BSD"
>> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
>> > +DEPENDS = "ndctl"
>> > +
>> > +SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
>> > +           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
>> > +           file://0002-Makefile-Don-t-install-the-docs.patch \
>> > +           file://0003-Makefile-Don-t-build-the-examples.patch \
>> > +          "
>> > +
>> > +SRC_URI[md5sum] = "d9a7b3f1059ffd54b4c92e38329fe69e"
>> > +SRC_URI[sha256sum] = "e11cfbbdf0773fb5965211e18044531f442ad1e6d6726f1bac8a6dcc0e092622"
>> > +
>> > +inherit autotools-brokensep pkgconfig
>> > +
>> > +# Fix jemalloc error:
>> > +# | configure: error: cannot run C compiled programs.
>> > +# | If you meant to cross compile, use `--host'.
>> > +#
>> > +# Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
>> > +EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='-O'"
>>
>> Perhaps its better to pass SELECTED_OPTIMIZATION variable instead of
>> hardcoding -O here since this might override the optlevel we expect
>>
>> > +
>> > +do_install() {
>> > +     oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>> > +
>> > +     # Copy these into the standard directories
>> > +     install -d ${D}${bindir}/
>> > +     mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
>> > +     mv ${D}/usr/local/bin/daxio ${D}${bindir}/
>> > +
>> > +     install -d ${D}${libdir}
>> > +     mv ${D}/usr/local/lib/*so* ${D}${libdir}/
>> > +
>> > +     install -d ${D}${libdir}/pkgconfig
>> > +     mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
>> > +
>> > +     install -d ${D}${includedir}
>> > +     mv ${D}/usr/local/include/* ${D}${includedir}/
>> > +
>> > +     # Remove uneeded files
>> > +     rm -rf ${D}/usr/local/
>> > +}
>> > +
>> > +# Include these by default otherwise the SDK is not very useful
>> > +FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
>> > +FILES_${PN} += "${libdir}/*so*"
>> > +FILES_${PN} += "${libdir}/pkgconfig/*.pc"
>> > +FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
>> >
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

