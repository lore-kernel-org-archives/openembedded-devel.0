Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA89E71993
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:33:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m72so18815907wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SPUA5MlVlpT3NRuNWG5X50jgXvKQt8T4DWjJM/prEJE=;
	b=OkUZGSRdz86qIMXi3xk/JpncoSP5riuVShz6a4qaLs1SguKffq5YREpJZboFGzjUvI
	kawpqarC1IQ1KzsSXSsAO35q5SZw4oh9L/hivdJojqs0yMVuoCvuepCRGCMyO48oJrjM
	1HDk1CUD4FZVqxqRcQin3LwZgW389LOsVs7zM+iCoRgUg1hbf14wuCFXl6o8K6SPrYKh
	2ZMA0GQjRMUd/39MuamTPfU5VSJfvsxeQP39Hz/e03IQoo70V9+heAuqYIvmkYxXAKod
	FY9g87qF3b6r0YUgsu/aEHIf+2AZnRaRXfcBu0vpVPvNinaVp6CG6SHg7fDL5/XwOcXE
	WsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SPUA5MlVlpT3NRuNWG5X50jgXvKQt8T4DWjJM/prEJE=;
	b=jR6Xj/NwvU+s51FbNmeFnIibe4gesQ9TLLdqej1sznZUd8z7t21mvTOCOgIAyyeEux
	6g2WqeYfxJmdXnYITjvaa6wi1Tl0pt7D1Qbw+NvvJvBF4gVDKGQztlQ4srxs98oHEloo
	OqCnjSCfPRdJR7jSN78yn0TwrqSZCNe2dNuiJZ6RBo2fx6i9ggeM/MXmt+Uf8rTy7INw
	tZfA4XO+Bf92DzTLidmCUBsG189WaEFIIwz8tKzWJLgwHaEPRdto9xipwcMgPp7JrGy5
	rKOzbkfmFKezQrzPO2qlRcgdXto+trVVMcUEkGTgaj215e9rTBVK3ec5i4WMgjWhUJXJ
	gZ5A==
X-Gm-Message-State: AHPjjUhJ/jc6k0wTnjovz9v9mkvezKZ8E7oKFc9sdWs0gSMxiFj87oJk
	7+9aP37olbAPr+FvbJJ/kyRQBqTQVeS9zmcret4=
X-Google-Smtp-Source: AOwi7QD9yTkqwhOPLwIHyPEJKinML/GAkmZcI56mlC/LuhwWSNjlwW14VCebllwJFC4bFJRwUb9BP13RB5gYaSuhA9U=
X-Received: by 10.28.58.66 with SMTP id h63mr14938160wma.10.1507059216758;
	Tue, 03 Oct 2017 12:33:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 12:33:36 -0700 (PDT)
In-Reply-To: <CAMKF1srzEnWyL54RvOQT5rQ8B=rYa_43E4Exvg8Ct3wxLx6Z7Q@mail.gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
	<CAMKF1srzEnWyL54RvOQT5rQ8B=rYa_43E4Exvg8Ct3wxLx6Z7Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 21:33:36 +0200
Message-ID: <CA+chaQcMH=sAZFu+B8VZeHF78ZsdA55yU7XfbJUhhN-Zf6xTkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 1/5] klibc: Pass Optimization with KLIBCOPTFLAGS
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
X-List-Received-Date: Tue, 03 Oct 2017 19:33:36 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, I've moved it back to New state in patchwork, hopefully tomorrow I
won't forget to pick it.

On Tue, Oct 3, 2017 at 9:28 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Martin
>
> This is missing in master-next
>
> On Mon, Oct 2, 2017 at 9:06 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > Overriding KLIBCOPTFLAGS also meant that -Ox flags
> > were taken off. Which results in errors like
> >
> > | usr/dash/shell.h: In function 'max_int_length':
> > | usr/dash/shell.h:103:25: error: '-mgeneral-regs-only' is incompatible
> with floating-point code
> > |   return (bytes * 8 - 1) * 0.30102999566398119521 + 14;
> > |          ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> > | usr/dash/shell.h:103:25: error: '-mgeneral-regs-only' is incompatible
> with floating-point argument
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...arm-Do-not-set-a-fallback-march-and-mtune.patch | 33
> ++++++++++++++++++++++
> >  meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 ++-
> >  2 files changed, 36 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/
> 0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
> >
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/
> 0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-
> fallback-march-and-mtune.patch
> > new file mode 100644
> > index 000000000..9c0ea6397
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/
> 0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
> > @@ -0,0 +1,33 @@
> > +From a46a144ac883898d9cedf7a0b13aec6d10116125 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Sep 2017 23:11:53 -0700
> > +Subject: [PATCH] arm: Do not set a fallback march and mtune
> > +
> > +In OE we pass the options explicitly, there is
> > +no need to set it inside the makefiles, we will
> > +need to compute values for CPU_ARCH and CPU_TUNE
> > +which is a bit harder in OE
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + usr/klibc/arch/arm/MCONFIG | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
> > +index 53bc1dc3..857e2f2d 100644
> > +--- a/usr/klibc/arch/arm/MCONFIG
> > ++++ b/usr/klibc/arch/arm/MCONFIG
> > +@@ -10,7 +10,7 @@
> > + CPU_ARCH ?= armv4
> > + CPU_TUNE ?= strongarm
> > +
> > +-KLIBCOPTFLAGS += -Os -march=$(CPU_ARCH) -mtune=$(CPU_TUNE)
> > ++KLIBCOPTFLAGS += -Os
> > + KLIBCBITSIZE  = 32
> > + KLIBCREQFLAGS += -fno-exceptions
> > + KLIBCSTRIPFLAGS += -R .ARM.exidx
> > +--
> > +2.14.2
> > +
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > index dec3d3704..30294b19a 100644
> > --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > @@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/
> libs/klibc/klibc.git \
> >             file://0001-always-use-bfd-linker.patch \
> >             file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
> \
> >             file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
> \
> > +           file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
> \
> >  "
> >
> >  ARMPATCHES ?= ""
> > @@ -40,7 +41,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
> >                  'INSTALLDIR=${libdir}/klibc' \
> >                  'SHLIBDIR=${libdir}' \
> >                  '${KLIBCTHUMB}' \
> > -                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
> > +                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
> > +                 V=1 \
> >                  "
> >
> >  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
> > --
> > 2.14.2
> >
>

