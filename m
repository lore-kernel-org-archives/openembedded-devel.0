Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2157E79859
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:58:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k21-v6so2938049pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aR2nkKIt6ojLOJrsmdjqONlv2ZhlZId3D/IqO3gC1Tk=;
	b=TQQl9h82pyg5l3BBgJoPnL3PI87ZOXmEaSYjP0aGj4kDgSH+hUY797ngHy7XvlOW9t
	4NydW3+VKbd4+e2VYScBLvVc/cxinxs0rhpS8JN/o6zqnpS2/2rHRistPcuiL1aKezQJ
	O+ee+heoyKiywuhd5RTcMM2hvYmDn/clBvgR2a+whOw5QAbZScttjmuGT6C3hC2/4M33
	XdKXNhmdXFFraTk6/Lxo6FJFIatAumwbHrx0JwmfHuD2NthdXegntKVZRQGzduzFszIp
	BknC6Jgz8Ry92xVCqQ/U3a31//lotCKxfe/KLNrmb4s7TfWxu12nqRFqz+sgRcGu8ItC
	ZIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aR2nkKIt6ojLOJrsmdjqONlv2ZhlZId3D/IqO3gC1Tk=;
	b=btJMRGDYfKU5YhjpQrZKrZ/ZZgssL+oCT5zlZW7YF9q8b6GMN3OQLa1+CmLPmQANg4
	LoaXyuDOYIXrKXClSe1KFcsHOVI9d7Js/i6M4lgVfx1zAcj6cVzW20jYw3jwCqxoJ8gY
	kd3oj7PBDvCfeo+GBj6ZOSHl4tdTe633hDR06a9Kxu7ZzzfzmE607UC2hVtTBWjzcfy4
	hmuoWrgFP2MyglVv4wPFXEAf8FjQDMrUZCmOzhkqtHSYKfXqLrAbcGGrXeWeMZ3vpX/7
	/C8X3MvmAvn+7XGI/xNxswUhr83O2pqWETt/Df5kk0Nr/jDW4hcY/oXsjy8opFH6FnYZ
	lm7Q==
X-Gm-Message-State: APzg51DLhjM2wWjPYCuf9jFF9yT0OM6lYXNGrMjh56xYZK62rAi3khSr
	2Lr7DntNpfS8Psglgko4GZkLX7/bfJUw3NQFqhM=
X-Google-Smtp-Source: ANB0VdY27aK8EXPOIi0zNKk1IKvh4/V3CH+ze7jCPQahu/frHRhUiDVHPQl7XQeCfPlNB+/JgvmWIuWvMQ9ikFS/1mA=
X-Received: by 2002:a63:5d1f:: with SMTP id
	r31-v6mr7959093pgb.445.1536857925141; 
	Thu, 13 Sep 2018 09:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180912001851.7181-1-raj.khem@gmail.com>
	<20180912001851.7181-2-raj.khem@gmail.com>
In-Reply-To: <20180912001851.7181-2-raj.khem@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 13 Sep 2018 18:58:32 +0200
Message-ID: <CAAQYJAugbTU05smxY74U1NtCRHGYwL2FimvchhW7eDn7kvP7WQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Sep 2018 16:58:44 -0000
Content-Type: text/plain; charset="UTF-8"

Khem,

build with gcc still fails:

# i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/shared/ipc
onfig -z noexecstack -e main usr/klibc/interp.o --start-group
usr/kinit/ipconfig/main.o usr/kinit/ipconfig/netdev.o
usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o
usr/kinit/ipconfig/bootp_proto.o  -R usr/klibc/libc.so
/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a
--end-group
i586-oe-linux-musl-ld.bfd: discarded output section: `.got.plt'

However, adding  -pie to ld invocation seems solving the problem.

root@andrea-ThinkPad-T520:/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/git#
i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/shared/ipc
onfig -z noexecstack -e main usr/klibc/interp.o --start-group
usr/kinit/ipconfig/main.o usr/kinit/ipconfig/netdev.o
usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o
usr/kinit/ipconfig/bootp_proto.o  -R usr/klibc/libc.so
/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a
--end-group -pie
root@andrea-ThinkPad-T520:/tmp/build/tmp-musl/work/i586-oe-linux-musl/klibc/2.0.4-r0/git#


Cheers
Andrea


On Wed, Sep 12, 2018 at 2:19 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Drop -Os which is also causing the relro
> Fixes
> | x86_64-bec-linux-musl-ld.bfd: discarded output section: `.got.plt'
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrea Adami <andrea.adami@gmail.com>
> ---
>  ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch | 28 +++++++++++++++++++
>  .../recipes-devtools/klibc/klibc.inc          |  9 +++---
>  2 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> new file mode 100644
> index 0000000000..94818e3669
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
> @@ -0,0 +1,28 @@
> +From cdc6edc2cfcd0ce88d6e66654d605dad303b1a75 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 11 Sep 2018 17:03:36 -0700
> +Subject: [PATCH] klibc/Kbuild: Accept EXTRA_KLIBCAFLAGS
> +
> +For passing additional assembler flags
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + usr/klibc/Kbuild | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
> +index 98caf2e9..b34521e0 100644
> +--- a/usr/klibc/Kbuild
> ++++ b/usr/klibc/Kbuild
> +@@ -168,7 +168,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
> + targets += interp.o
> +
> + quiet_cmd_interp = BUILD   $@
> +-      cmd_interp = $(KLIBCCC) $(klibccflags) -D__ASSEMBLY__     \
> ++      cmd_interp = $(KLIBCCC) $(klibccflags) $(EXTRA_KLIBCAFLAGS) \
> ++                             -D__ASSEMBLY__     \
> +                              -DLIBDIR=\"$(SHLIBDIR)\"         \
> +                            -DSOHASH=\"$(SOLIBHASH)\" \
> +                            -c -o $@ $<
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index f0b20bc7fd..3d25e96cd4 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -21,9 +21,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
>             file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
>             file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
>             file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
> -           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch  \
> +           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch \
>             file://0001-klibc-add-getrandom-syscall.patch \
> -"
> +           file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
> +           "
>
>  ARMPATCHES ?= ""
>
> @@ -31,7 +32,6 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
>                    file://armv4-fix-v4bx.patch \
>                   "
>
> -
>  S = "${WORKDIR}/git"
>
>  PARALLEL_MAKE = ""
> @@ -44,9 +44,10 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>                  'INSTALLDIR=${libdir}/klibc' \
>                  'SHLIBDIR=${libdir}' \
>                  '${KLIBCTHUMB}' \
> -                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
> +                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
>                   V=1 \
>                  "
> +EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
>
>  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>  KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
> --
> 2.18.0
>

