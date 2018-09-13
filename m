Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3279C7992F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 17:36:47 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r37-v6so6196570qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 10:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V5e+ZwqvwuIAzQM1VIpM+zjwaHmrs/3i6ytSjfPUzXM=;
	b=ArsCyd2nqFpAlmui2F+aDpJFVhAud5nfgTYptbWX7G+AJvLnycRhaJ5eXwge0tuugK
	oBBszsGjZqB4wEhN6WyuVXjIWrZdG1oquAOJmA6d/BNEiN0NKMWzlN2t9RbEBY7IeGUv
	gnvDAzGpYd6oqT/R3NBVg15oGrr3qGYOAGik4NmUD4b9dtd5pUBFhYqAl8Kr4SL/n2e8
	6S5ZaYX01Z8uvoIMNZxRhikndadOs46OmiUX6hUUnt+eN59JFK35RCrpBRH/gdt1J6f9
	9dhbkedM13xgtbvJoZ+XtFsUd05OXA8qCnu54PO/S5/JoysY18kFJxn1GNm5H5LCMYex
	mhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V5e+ZwqvwuIAzQM1VIpM+zjwaHmrs/3i6ytSjfPUzXM=;
	b=c1vo9uXfDie8aXgPGDJdqiU9vDYaq0CIBVgvr4O7ZEEWvLlb1QX17J1Q4yNlPEsDLx
	0MaTgkIKswxwdEgggXOU107LerwNeCYc3btQRmE0kd5nu3fpnCSlP2jOPNMDHXipM5+Q
	M+Q1dvXq7Upxf51w/VCMTZK/kZDzkGuwSK/FVKb5sGwnv6Bz3wtSpkb4x/PsCnZZ7gFv
	GSCvIfOWgttIZgAOcTTIGsNEEabSyztVcVmjGqDhAASaZbLxlMh8giw4TXukaj6tjQGb
	f+SMUdv96jabiqa3mJu7z7VNgDAJ4OZNq6YXEyRPQXFEe4BQvimzlj5JfJxSXRekZVoo
	upYg==
X-Gm-Message-State: APzg51CAIL9+Shac31bBzsfcOTGot+0g3AtKItywXOOgRhkYNQRy2+Zt
	LTzOVydz7YrDY/ynFsTKu/Z1s1wzk2BhWNGQ3Xg=
X-Google-Smtp-Source: ANB0VdYvZ/MQ9QTqeAnt6JDIjdmk5lsvsgqOf6kCJjWWBI/lYnBu9/u/NbVFYJoVJCyyQUsCZIkV/xKJ8S6jk8F34/I=
X-Received: by 2002:ac8:4649:: with SMTP id f9-v6mr6152665qto.34.1536860207659;
	Thu, 13 Sep 2018 10:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180912001851.7181-1-raj.khem@gmail.com>
	<20180912001851.7181-2-raj.khem@gmail.com>
	<CAAQYJAugbTU05smxY74U1NtCRHGYwL2FimvchhW7eDn7kvP7WQ@mail.gmail.com>
	<CAAQYJAuGK0d8NYbNGsy+fZ8EELPJr9Axj6Bp9f0jeNiv_=mTBg@mail.gmail.com>
In-Reply-To: <CAAQYJAuGK0d8NYbNGsy+fZ8EELPJr9Axj6Bp9f0jeNiv_=mTBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 10:36:21 -0700
Message-ID: <CAMKF1sqrrXYkB-JkGKFwAC33EH_95+mOOvAVAN_ZiuEvWB_yWQ@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 2/2] klibc: Fix build with security flags
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
X-List-Received-Date: Thu, 13 Sep 2018 17:36:47 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks! can you cook a patch and send
On Thu, Sep 13, 2018 at 10:19 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> Khem,
>
> with this fix it builds (I removed the two bottom lines)
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 3d25e96..57f32ac 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -47,7 +47,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>                  'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
>                   V=1 \
>                  "
> -EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack"
> EXTRA_KLIBCLDFLAGS="-z noexecstack"'
> +EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack"
> EXTRA_KLIBCLDFLAGS="-pie it -z noexecstack"'
>
>  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>  KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n',
> 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') ==
> 'thumb')]}"
> @@ -73,6 +73,3 @@ KLIBC_ARCH_x86-64 = "x86_64"
>  KLIBC_ARCH_powerpc = "ppc"
>  KLIBC_ARCH_powerpc64 = "ppc64"
>  THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
> -
> -SECURITY_CFLAGS = "-fno-PIE -no-pie"
> -SECURITY_LDFLAGS = "-no-pie"
> On Thu, Sep 13, 2018 at 6:58 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > Khem,
> >
> > build with gcc still fails:
> >
> > # i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/shared/ipc
> > onfig -z noexecstack -e main usr/klibc/interp.o --start-group
> > usr/kinit/ipconfig/main.o usr/kinit/ipconfig/netdev.o
> > usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o
> > usr/kinit/ipconfig/bootp_proto.o  -R usr/klibc/libc.so
> > /tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a
> > --end-group
> > i586-oe-linux-musl-ld.bfd: discarded output section: `.got.plt'
> >
> > However, adding  -pie to ld invocation seems solving the problem.
> >
> > root@andrea-ThinkPad-T520:/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/git#
> > i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/shared/ipc
> > onfig -z noexecstack -e main usr/klibc/interp.o --start-group
> > usr/kinit/ipconfig/main.o usr/kinit/ipconfig/netdev.o
> > usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o
> > usr/kinit/ipconfig/bootp_proto.o  -R usr/klibc/libc.so
> > /tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a
> > --end-group -pie
> > root@andrea-ThinkPad-T520:/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/git#
> >
> >
> > Cheers
> > Andrea
> >
> >
> > On Wed, Sep 12, 2018 at 2:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Drop -Os which is also causing the relro
> > > Fixes
> > > | x86_64-bec-linux-musl-ld.bfd: discarded output section: `.got.plt'
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch | 28 +++++++++++++++++++
> > >  .../recipes-devtools/klibc/klibc.inc          |  9 +++---
> > >  2 files changed, 33 insertions(+), 4 deletions(-)
> > >  create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> > >
> > > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> > > new file mode 100644
> > > index 0000000000..94818e3669
> > > --- /dev/null
> > > +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> > > @@ -0,0 +1,28 @@
> > > +From cdc6edc2cfcd0ce88d6e66654d605dad303b1a75 Mon Sep 17 00:00:00 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Tue, 11 Sep 2018 17:03:36 -0700
> > > +Subject: [PATCH] klibc/Kbuild: Accept EXTRA_KLIBCAFLAGS
> > > +
> > > +For passing additional assembler flags
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + usr/klibc/Kbuild | 3 ++-
> > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
> > > +index 98caf2e9..b34521e0 100644
> > > +--- a/usr/klibc/Kbuild
> > > ++++ b/usr/klibc/Kbuild
> > > +@@ -168,7 +168,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
> > > + targets += interp.o
> > > +
> > > + quiet_cmd_interp = BUILD   $@
> > > +-      cmd_interp = $(KLIBCCC) $(klibccflags) -D__ASSEMBLY__     \
> > > ++      cmd_interp = $(KLIBCCC) $(klibccflags) $(EXTRA_KLIBCAFLAGS) \
> > > ++                             -D__ASSEMBLY__     \
> > > +                              -DLIBDIR=\"$(SHLIBDIR)\"         \
> > > +                            -DSOHASH=\"$(SOLIBHASH)\" \
> > > +                            -c -o $@ $<
> > > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > > index f0b20bc7fd..3d25e96cd4 100644
> > > --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > > +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > > @@ -21,9 +21,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
> > >             file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
> > >             file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
> > >             file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
> > > -           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch  \
> > > +           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch \
> > >             file://0001-klibc-add-getrandom-syscall.patch \
> > > -"
> > > +           file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
> > > +           "
> > >
> > >  ARMPATCHES ?= ""
> > >
> > > @@ -31,7 +32,6 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
> > >                    file://armv4-fix-v4bx.patch \
> > >                   "
> > >
> > > -
> > >  S = "${WORKDIR}/git"
> > >
> > >  PARALLEL_MAKE = ""
> > > @@ -44,9 +44,10 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
> > >                  'INSTALLDIR=${libdir}/klibc' \
> > >                  'SHLIBDIR=${libdir}' \
> > >                  '${KLIBCTHUMB}' \
> > > -                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
> > > +                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
> > >                   V=1 \
> > >                  "
> > > +EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
> > >
> > >  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
> > >  KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
> > > --
> > > 2.18.0
> > >

