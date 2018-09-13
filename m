Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3AA794DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 17:19:20 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h69-v6so2976002pfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UULgBjpqb+J8PqkjrdAKv9eLKj+vgJGD1iEsrMjaJ0I=;
	b=hmx4i6wp1Ob8GR2yjepFXuYW8L5JX0HtJgXxXMlBUIeoGQj3joBizsDU3MOySTmY7X
	7cIo38hGklnMCEjUfwAatS3BWjqc7MYKJChNHGvLj0OVP9MHcSPY38F5GqSN0bCBCyeU
	kZKb9TtkpYheh/7M3YpmMVnkkSNKxKsNwuo03mszMokiR6BFh04Z1uYQxZbdy+509mYK
	GXDtGMdkF4DKKiY2VqUVxOcPv2J8cNwDjtxdvZlH2SW++AeFjrh3tZc3R6w0GVGZnYyD
	bPx+LLyGvCxWK4ZO4a7U7hY63Inawdywf8QYt90id44tuhmQGztf2bqLxXiMxhJHZQ9n
	Zw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UULgBjpqb+J8PqkjrdAKv9eLKj+vgJGD1iEsrMjaJ0I=;
	b=bSY5s+phKkSoY2xO10jQSWoMEhC7R6l/Pt9k2mvT8i41k/zGglQ22eMWi50POUaaAX
	NohQJYypn+xpfNM55PO+oIU2+ANDN53nPQAs3sUEDmueUNnVr15sQnNBEnUt+fRv4MGF
	Ccr4bC4VwKCiat1xsd0RBNrcgTTxrUtHRrsYlIufjyVS9xnfSjtB5FNMNCoBe1HaWHH+
	Uydw0fWT3Fy79rB/ktnwe3a+EuiC48GOs3RdmRmn594B4YEqV0ZuioxJfp/H4WDyhb2y
	l3ubHL7vhzcaJ669GGQrp2o4IRap1Rdmj/BHpjxvYVDNlS1OKtCv6bwEIssHhEMqVyoX
	dgzw==
X-Gm-Message-State: APzg51D6En6grEyyXTml5jzF3LcsPHCc48UzKnE4WFxe24+YmRh8qKFW
	qxp8ph4jlpVY7ByrY4Diw8Hj0nvewnR+SG4nqsQ=
X-Google-Smtp-Source: ANB0VdZ9pI67Pi8fTsH7ePFXpneF5ndZoiyQIWLUmDmaCEoGlypPECHvWxhueG8o54a78Kf6oxFuJsBiOjfCZzCKvTI=
X-Received: by 2002:a62:6711:: with SMTP id
	b17-v6mr8427375pfc.243.1536859161592; 
	Thu, 13 Sep 2018 10:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180912001851.7181-1-raj.khem@gmail.com>
	<20180912001851.7181-2-raj.khem@gmail.com>
	<CAAQYJAugbTU05smxY74U1NtCRHGYwL2FimvchhW7eDn7kvP7WQ@mail.gmail.com>
In-Reply-To: <CAAQYJAugbTU05smxY74U1NtCRHGYwL2FimvchhW7eDn7kvP7WQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 13 Sep 2018 19:19:10 +0200
Message-ID: <CAAQYJAuGK0d8NYbNGsy+fZ8EELPJr9Axj6Bp9f0jeNiv_=mTBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 13 Sep 2018 17:19:20 -0000
Content-Type: text/plain; charset="UTF-8"

Khem,

with this fix it builds (I removed the two bottom lines)
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 3d25e96..57f32ac 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -47,7 +47,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
                  V=1 \
                 "
-EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack"
EXTRA_KLIBCLDFLAGS="-z noexecstack"'
+EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack"
EXTRA_KLIBCLDFLAGS="-pie it -z noexecstack"'

 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n',
'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') ==
'thumb')]}"
@@ -73,6 +73,3 @@ KLIBC_ARCH_x86-64 = "x86_64"
 KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
-
-SECURITY_CFLAGS = "-fno-PIE -no-pie"
-SECURITY_LDFLAGS = "-no-pie"
On Thu, Sep 13, 2018 at 6:58 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> Khem,
>
> build with gcc still fails:
>
> # i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/shared/ipc
> onfig -z noexecstack -e main usr/klibc/interp.o --start-group
> usr/kinit/ipconfig/main.o usr/kinit/ipconfig/netdev.o
> usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o
> usr/kinit/ipconfig/bootp_proto.o  -R usr/klibc/libc.so
> /tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a
> --end-group
> i586-oe-linux-musl-ld.bfd: discarded output section: `.got.plt'
>
> However, adding  -pie to ld invocation seems solving the problem.
>
> root@andrea-ThinkPad-T520:/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/git#
> i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/shared/ipc
> onfig -z noexecstack -e main usr/klibc/interp.o --start-group
> usr/kinit/ipconfig/main.o usr/kinit/ipconfig/netdev.o
> usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o
> usr/kinit/ipconfig/bootp_proto.o  -R usr/klibc/libc.so
> /tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a
> --end-group -pie
> root@andrea-ThinkPad-T520:/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/git#
>
>
> Cheers
> Andrea
>
>
> On Wed, Sep 12, 2018 at 2:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Drop -Os which is also causing the relro
> > Fixes
> > | x86_64-bec-linux-musl-ld.bfd: discarded output section: `.got.plt'
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch | 28 +++++++++++++++++++
> >  .../recipes-devtools/klibc/klibc.inc          |  9 +++---
> >  2 files changed, 33 insertions(+), 4 deletions(-)
> >  create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> >
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> > new file mode 100644
> > index 0000000000..94818e3669
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> > @@ -0,0 +1,28 @@
> > +From cdc6edc2cfcd0ce88d6e66654d605dad303b1a75 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 11 Sep 2018 17:03:36 -0700
> > +Subject: [PATCH] klibc/Kbuild: Accept EXTRA_KLIBCAFLAGS
> > +
> > +For passing additional assembler flags
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + usr/klibc/Kbuild | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
> > +index 98caf2e9..b34521e0 100644
> > +--- a/usr/klibc/Kbuild
> > ++++ b/usr/klibc/Kbuild
> > +@@ -168,7 +168,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
> > + targets += interp.o
> > +
> > + quiet_cmd_interp = BUILD   $@
> > +-      cmd_interp = $(KLIBCCC) $(klibccflags) -D__ASSEMBLY__     \
> > ++      cmd_interp = $(KLIBCCC) $(klibccflags) $(EXTRA_KLIBCAFLAGS) \
> > ++                             -D__ASSEMBLY__     \
> > +                              -DLIBDIR=\"$(SHLIBDIR)\"         \
> > +                            -DSOHASH=\"$(SOLIBHASH)\" \
> > +                            -c -o $@ $<
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > index f0b20bc7fd..3d25e96cd4 100644
> > --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > @@ -21,9 +21,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
> >             file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
> >             file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
> >             file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
> > -           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch  \
> > +           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch \
> >             file://0001-klibc-add-getrandom-syscall.patch \
> > -"
> > +           file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
> > +           "
> >
> >  ARMPATCHES ?= ""
> >
> > @@ -31,7 +32,6 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
> >                    file://armv4-fix-v4bx.patch \
> >                   "
> >
> > -
> >  S = "${WORKDIR}/git"
> >
> >  PARALLEL_MAKE = ""
> > @@ -44,9 +44,10 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
> >                  'INSTALLDIR=${libdir}/klibc' \
> >                  'SHLIBDIR=${libdir}' \
> >                  '${KLIBCTHUMB}' \
> > -                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
> > +                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
> >                   V=1 \
> >                  "
> > +EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
> >
> >  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
> >  KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
> > --
> > 2.18.0
> >

