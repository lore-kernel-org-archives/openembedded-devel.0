Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4366F71B04
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 09:02:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z63so5281723wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cip1OSTyp98qdkla8jSVgkzxf+IRGSluD8roa1S5V8o=;
	b=SsGHZfakZQe87RBybd465byKmOpTYYrQmD7q1spg6q3HZgCxbQFVcvA7mTG9l/3ZKt
	SSHgwiBInrdcwZ964v7PoCJKd0no4ornA16BfK83/AAyJJtFc6BUln5UcESp16l5PHxQ
	gCbIDizykSFm12nUleBm5rKE+d+95EmCAFW4awPKb6dUXTozTc+MLYeCbfH6h0GozngM
	QTgDULJ9TMYJZ942NzkcfZdWd3EZZeE0z/MBZXc+riaGDOsctQhjyy5sc4S+amdbTmES
	euuJE7QtOVydtd0jnxaqsYDnq2ivJp43OS5v9McqfHmHdo1/dSeG088Jl/A569cm5d8t
	Ai1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cip1OSTyp98qdkla8jSVgkzxf+IRGSluD8roa1S5V8o=;
	b=Vgzc6QQPQGeQg+lqTimKhS57+wIMwwlxaBgi2f7eKyIao4FW5jr+zmcqJQdfpB4XwB
	5RSzjPL6K/X++EaYrQbJQ4gc7i7qYGjSYh3S8IheRTvX+B3NlSxLT8SpgGwRr6o9u/Fh
	EGOtLF4S7Ca5YWJIkYbuvFpA+S+QqyuON339k/SGgb98tTDpF7J5mDuqskDC7SOZ2MTX
	eiGtHYUDr5c/9ySRJPsUmfX63GMO7hfpwqO7JNmBTl7Ihu5SMINqI52g0wh0NJ2w5zDh
	sM9tM8PgOOqTRImDr2IvVHHG5Bb9znbB1fAJC9kkSBd8xoyt+LRBUB0dwoCx/HiIrSI5
	yUVw==
X-Gm-Message-State: AFeK/H1SbDrFw+BYGeqaxkHghR0Rnk1bn2zwjwGWDzshIhr8MM5WzUbbi5vv8y3LGaflSnWZQBNtDqF9l9SPOA==
X-Received: by 10.28.96.130 with SMTP id u124mr6132311wmb.81.1489309357892;
	Sun, 12 Mar 2017 01:02:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sun, 12 Mar 2017 01:02:37 -0800 (PST)
In-Reply-To: <043bc3e6-5d17-140c-7f74-7d584cfd0639@gmail.com>
References: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>
	<043bc3e6-5d17-140c-7f74-7d584cfd0639@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 12 Mar 2017 10:02:37 +0100
Message-ID: <CA+chaQcCQYK3Mbe-Ko1cpv_LWt40w17C6Xd-e3yLWoqjQV5yrg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klibc: add dependency on coreutils-native
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
X-List-Received-Date: Sun, 12 Mar 2017 09:02:38 -0000
Content-Type: text/plain; charset=UTF-8

Or we can add nl to HOSTTOOLS, there are already few items from
coreutils-native already IIRC and nl doesn't look dangerous for
incompatibility between different DISTROs (and if it is then dash people
would already notice and fix it in their code).

e.g. gcc-native seems to cause more issues than coreutils-native and we
still depend on host distro providing sane gcc

On Sun, Mar 12, 2017 at 2:02 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 3/11/17 4:58 PM, Andrea Adami wrote:
> > As seen doing world builds after the host-tools changes dash needs nl.
> >
> >   GEN     usr/dash/builtins.c
> > TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/git/usr/dash/
> > mkbuiltins: 100: TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/
> git/
> > usr/dash/mkbuiltins: nl: not found
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > index f00e31a..bd0ab61 100644
> > --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> > @@ -4,7 +4,7 @@ minimal entaglement, and portability, not speed."
> >  SECTION = "libs"
> >  LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
> >  LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=
> d75181f10e998c21eb147f6d2e43ce8b"
> > -DEPENDS = "linux-libc-headers perl-native"
> > +DEPENDS = "linux-libc-headers perl-native coreutils-native"
>
> Nothing particular against this patch but, if we are getting down to
> building own versions of coreutils, that means we are pretty much
> generating a build distro almost, I wonder if we can have sanitized
> distros where we can trust them to assume some of these provides.
>
> >  SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
> >
> >  SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
> >
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

