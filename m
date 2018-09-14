Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id D7322799E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 17:48:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id j8-v6so4512553pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=W31/r6PXKrcedTHDY6sMXmsW0pKmClRQLoujRY5nr+w=;
	b=KydUrZNSj7xZRPFjruVGOEEDKEACBgEwuQOsPnzesPLuaiasPZPjc79Iz+rRTHyI0X
	mwswZBfUJ0nmtG/Qy81UUvoAMqmFRrgCHth15fF2lcsmPnCVoufeG0vUZTmCM9JVn4oO
	dKQcp4NXJB6R4X+2qNZddK6I4cq4lbPzKJfgQAJ9IJaCOIxScJvM7EFnxuhsMb0L2YP7
	k+hadAD8cuR2v3ThIDYHEf/vwprYpDYYO3CzDNOu97tbyFcRqm9pCRH7jUJ2sQ84f2eR
	TM8IAiU0PvcojkQF++UiJMby3/orjqvh+I/aM7vIDhHkGUaMPx0a3meJ+LHMNKEZtexY
	YLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=W31/r6PXKrcedTHDY6sMXmsW0pKmClRQLoujRY5nr+w=;
	b=S1Ov9GcRvvQmStqTLgaXB3u4yHURBuoxmDcZTVpn5Nnb0TvT5oULRDmrLgTl1sVD+t
	8FyjXB8/9FZ56KMM/KDoYSOcs+cmsUiM9fJsjS+5wdsKepdQtPaQ88APWQQ2QOxnu+va
	x0hJdqjSxhS1voN8UWjr8925TMTxapO3Ve2sTqP6unBrRXWH3reHlaayVqV58FPxHwOr
	yauGK1McKbMBJDDDVQ5BBR6oDQ6URB9RTBwNvVIzziBFM+klDbcCEDkg6KGcYAUeecgq
	5Erb3GKxYY1627ulr2ryKp4QHgf8/hQk+byZWuyBXzMZAf2uSs2MCWkdb+q/s2i175L0
	evWQ==
X-Gm-Message-State: APzg51AcVkQqFe2owveXapva830IShiV8O1l9s0kQ+Slk+bh5fEVOAjm
	n79RUiWMJQzUleSCDpTzD53C0nU03Oooz42XcE7RxQ==
X-Google-Smtp-Source: ANB0Vdaq98fKBBXk/W8pDMtfbKMQgv/HRhkY7YGFZu4+c7+cldlBceLnYrD56vnHnRNwcwFqGqxDyN3GmgRAV7xgl9c=
X-Received: by 2002:a17:902:1c5:: with SMTP id
	b63-v6mr13496328plb.82.1536947321770; 
	Fri, 14 Sep 2018 10:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <1536943601-20427-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1536943601-20427-1-git-send-email-andrea.adami@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 14 Sep 2018 19:48:30 +0200
Message-ID: <CAAQYJAub3rOKKEPUR_qAaB=JK1MiNTXYMZVaPcY3nQ=3jDOd4w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klibc: fix build on i386 with GCC and security flags enabled
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
X-List-Received-Date: Fri, 14 Sep 2018 17:48:41 -0000
Content-Type: text/plain; charset="UTF-8"

please hold on, v2 is coming.

I think -z relro and -z now (data relocation) should be only added if
the distro is using security flags.
BTW I do this check looking at GCCPIE variable, normally evaluated if
security flags are switched on.

Note: all this because the standard SECURITY_LDFLAGS cannot be used:
these start with -Wl but we are talking with the linker directly.

Cheers
Andrea
On Fri, Sep 14, 2018 at 6:46 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> Disable pie for powerpc as in security_flags.inc.
> Fix on i386: ld: discarded output section: `.got.plt'
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 3d25e96..b3d1568 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -47,7 +47,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>                  'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
>                   V=1 \
>                  "
> -EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
> +EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
> +                 'EXTRA_KLIBCLDFLAGS=${SECURITY_LDFLAGS}'"
>
>  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>  KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
> @@ -74,5 +75,8 @@ KLIBC_ARCH_powerpc = "ppc"
>  KLIBC_ARCH_powerpc64 = "ppc64"
>  THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
>
> -SECURITY_CFLAGS = "-fno-PIE -no-pie"
> -SECURITY_LDFLAGS = "-no-pie"
> +SECURITY_LDFLAGS = "${@ '-z relro -z now -z noexecstack -pie' if '${GCCPIE}' \
> +                       else '-z relro -z now -z noexecstack' }"
> +
> +# SECURITY_CFLAGS for powerpc are disabled in security_flags.inc
> +SECURITY_LDFLAGS_powerpc = "-z relro -z now -z noexecstack"
> --
> 2.7.4
>

