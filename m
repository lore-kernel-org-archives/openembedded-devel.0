Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id C2778795D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 20:29:02 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c29-v6so10229201lfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nFHQJkT/ftL6sEW5W9KkXK22+cuz8/hO4iubA/itTuw=;
	b=Qw00OYH4XWghcc1TB9Xii/BzSvCnr08kbwwlXLPkplVQ205u2/owde3WYmiHDcc94+
	sOI3DJA+G8TjdRt9rJi6K9QCq64A3nuCNJ8qT4exumwFqUfI85veyULcN9YxnQ+DUmUX
	TJxqSRaArxxsECV1Vp2rIAWulZRN9AbSl9DYmXy0A/TqInvf94fB8XA6ErIw9duid5Qh
	yZUBreTUK3l0polZ7mSg9wYPQ99bjuF3TxS2qxfaI2TgI0YsOd4BxeqNT67g9GWF8jKN
	zlF0n22fmVCm04vBgIkeQ9IGHkIWh30nXzj5JU2BRPEnBKiy61ab/vA+bCh4GixnOI3D
	iGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nFHQJkT/ftL6sEW5W9KkXK22+cuz8/hO4iubA/itTuw=;
	b=CKoQGHhZ0T0Hwy74/2vo2C+hg8Sy1tNquACHXgln849TcMWR11sI/vgOPN0FOnf+Nn
	Ff/GdZghBNVK7gLYzM9pgAeMqvjoWMoHX9YdC3BE8Z3SIeMcCsuFdO5tjuBoxd0MMZwP
	0RiIkmhp8SbJ+H8SVuFeRyiZUsuYVcmg8CRj8QSDFOJhY1Yzfg2J5tBam0UHlkcgar66
	xF+mKhbAAeL7CTzpPi2uOZTAIt0aiPTfU02O+eOnv58xusud/pxCLT7oDsk5cUAzXeyd
	OMTEpR3EbxUjo3/AQHhlKNarmPmHoXj2sIMQHFw7YxGYKRZc1eP7r0okq1bC0J9Pdl+Y
	eWLg==
X-Gm-Message-State: APzg51C2H19zBA52lkIlP0cOsXlDPWNjDuXhRRnmxnTMdOr0npHbOtx3
	Yf9rL8ARHzLhbcZGLVm/yiKR2c6nzdb7FxsLXwA=
X-Google-Smtp-Source: ANB0VdZdpfBjUWtBgKLoEDkr5tUUStvSFC+9DduB+q3GHx+7KVo7jTOSw1ZJs9N+VCbuLstwVecCgAihn65lZ1rES24=
X-Received: by 2002:a19:6619:: with SMTP id
	a25-v6mr3179509lfc.62.1536265743214; 
	Thu, 06 Sep 2018 13:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:5649:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 13:28:32 -0700 (PDT)
In-Reply-To: <CAMKF1soxcVsMSPwCCGJVt6471n-LKXHs+HE3wHBpcRy9jPLc5Q@mail.gmail.com>
References: <20180905181732.19483-1-alistair.francis@wdc.com>
	<CAMKF1soxcVsMSPwCCGJVt6471n-LKXHs+HE3wHBpcRy9jPLc5Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Sep 2018 13:28:32 -0700
Message-ID: <CAKmqyKPbksPN0TOP-QBcNtzGGUEFZhb+hm97q3DTT8s5o-ctng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 06 Sep 2018 20:29:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 10:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> fails to build with security flags on see
> http://errors.yoctoproject.org/Errors/Details/191388/

Ah, it looks like the examples don't have -O set in the build scripts.
It looks like just setting EXTRA_CFLAGS in the recipe should fix that.
How do you do a fortified source build so I can test?

Alistair

> On Wed, Sep 5, 2018 at 11:27 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
>>  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
>>  meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 49 +++++++++++++++++++
>>  3 files changed, 104 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>>  create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>>
>> diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>> new file mode 100644
>> index 000000000..747538b0c
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
>> @@ -0,0 +1,29 @@
>> +From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
>> +From: Alistair Francis <alistair.francis@wdc.com>
>> +Date: Mon, 23 Jul 2018 11:23:39 -0700
>> +Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
>> + jemalloc
>> +
>> +To avoid this error:
>> +    configure: error: cannot run C compiled programs.
>> +    If you meant to cross compile, use `--host'.
>> +when cross compiling specify the host when configuring jemalloc.
>> +
>> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> +Upstream-Status: Inappropriate [configuration]
>> +---
>> + src/jemalloc/jemalloc.cfg | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
>> +index 196129de6..79ebbab1c 100644
>> +--- a/src/jemalloc/jemalloc.cfg
>> ++++ b/src/jemalloc/jemalloc.cfg
>> +@@ -3,3 +3,4 @@
>> + --with-private-namespace=je_vmem_
>> + --disable-xmalloc
>> + --disable-munmap
>> ++--host=${HOST_SYS}
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>> new file mode 100644
>> index 000000000..bd1b97c24
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
>> @@ -0,0 +1,26 @@
>> +From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
>> +From: Alistair Francis <alistair.francis@wdc.com>
>> +Date: Mon, 23 Jul 2018 11:31:17 -0700
>> +Subject: [PATCH 2/2] Makefile: Don't install the docs
>> +
>> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> +Upstream-Status: Inappropriate [disable feature]
>> +---
>> + Makefile | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 224a315f6..ce7f84afb 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
>> +
>> + install uninstall:
>> +       $(MAKE) -C src $@
>> +-      $(MAKE) -C doc $@
>> +
>> + .PHONY: all clean clobber test check cstyle check-license install uninstall\
>> +       source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>> new file mode 100644
>> index 000000000..90d51e3f8
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>> @@ -0,0 +1,49 @@
>> +SUMMARY = "Persistent Memory Development Kit"
>> +DESCRIPTION = "Persistent Memory Development Kit"
>> +HOMEPAGE = "http://pmem.io"
>> +SECTION = "libs"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
>> +DEPENDS = "ndctl"
>> +
>> +SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
>> +           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
>> +           file://0002-Makefile-Don-t-install-the-docs.patch \
>> +          "
>> +
>> +SRC_URI[md5sum] = "d9a7b3f1059ffd54b4c92e38329fe69e"
>> +SRC_URI[sha256sum] = "e11cfbbdf0773fb5965211e18044531f442ad1e6d6726f1bac8a6dcc0e092622"
>> +
>> +inherit autotools-brokensep pkgconfig
>> +
>> +# Fix jemalloc error:
>> +# | configure: error: cannot run C compiled programs.
>> +# | If you meant to cross compile, use `--host'.
>> +EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}'"
>> +
>> +do_install() {
>> +       oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>> +
>> +       # Copy these into the standard directories
>> +       install -d ${D}${bindir}/
>> +       mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
>> +       mv ${D}/usr/local/bin/daxio ${D}${bindir}/
>> +
>> +       install -d ${D}${libdir}
>> +       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
>> +
>> +       install -d ${D}${libdir}/pkgconfig
>> +       mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
>> +
>> +       install -d ${D}${includedir}
>> +       mv ${D}/usr/local/include/* ${D}${includedir}/
>> +
>> +       # Remove uneeded files
>> +       rm -rf ${D}/usr/local/
>> +}
>> +
>> +# Include these by default otherwise the SDK is not very useful
>> +FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
>> +FILES_${PN} += "${libdir}/*so*"
>> +FILES_${PN} += "${libdir}/pkgconfig/*.pc"
>> +FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

