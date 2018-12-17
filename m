Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19C147BF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:44:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n2so6745693pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rWQ1exZ8l9vNg5KgCMh6ydNjsT52/tAhkjJ1l/eiYIE=;
	b=XUu+kgAj5pCavN3uJfeDZH9MmzVE7Ff9iLFQQa1S5Se6PJKdzLdSpuqNL3fvG8caSV
	rLKjAjbG1PB7G2tVfhdoMK2x8RttcgLGNCdL6h0kMcsq5XFYGlqs/B1QGWXAWOu/2SmZ
	4yqvVUylwBMT4kcYfs7HIYhosLdJRYhL5hj0EQwkJ2PibutAFrts7Adp2WPMxORMbyL7
	eyloarcWtdwAJncIpk/9ClbSbbgbi6GNBjyfSEpw3z3g/cE0X3q+afTyHtGfrVzF6AUQ
	RfKTjnNxNeVtw905xgJCmw2hmP2lEc9KEanVVSFug7moDtcFUaBhxLtRdIwqouKewtrC
	to4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rWQ1exZ8l9vNg5KgCMh6ydNjsT52/tAhkjJ1l/eiYIE=;
	b=U2Pc5tRJIrKGhO07/C0nwGYD4IZQgGha0HOPDtecweGX8CMqNritUY/dmu1WgPMugb
	iAK9nzAkyh7/KTPoyE/joxMwJ/ta3hSpAF/12AIXuS4WBjDHACdXE620YLZd7ujAKYLQ
	Pfl7AYqYFZ1ltceQFopfCXts1Lb2rM7hNCeei2ifKvw4VFC9XRDr+0CGmN0DPjnq6WDA
	RN2RO4I7yO/iPpUUPxRnfZ76ACq914joXB8Q1uqnX0BOeddKl0aHaOB/6mvQrtHdpOWS
	Sago/pSa4C7llreBlvIonFrP7nmqDMvERKnPHwcS2J8M/To3+ZJv1mnuyb4Pf8Dzu9O/
	xYbg==
X-Gm-Message-State: AA+aEWbR1wCnDEwPHKD1VHo1sWLSs7zRZM4W60DBw6t5isqpROHDBpHz
	njFU72M/PZ8RJ/j87zfUUtc5POkx2+d9IB+Wwy8=
X-Google-Smtp-Source: AFSGD/XWw43YurVgIygZ47ItoTKCsJ8PG2Mac8l9OJCw24bKemj4OocQxWh+G0g/6b+40Wuv5fi0EaxGwqxO1MwP+/w=
X-Received: by 2002:a62:220d:: with SMTP id i13mr14190516pfi.162.1545083043193;
	Mon, 17 Dec 2018 13:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20181217181528.14898-1-andrea.adami@gmail.com>
	<CAMKF1srZJvQsjikQ4Euymhh4zcjHHQMtDn+W83HMZS1eYFn5Ag@mail.gmail.com>
	<CAAQYJAsRBfuHMQNFVjZkth4q-U8B1y6KPYF1VEhFPLxa_55t+g@mail.gmail.com>
	<CAAQYJAvKL2MozzPtLk8xqsLMMHigPyU-=HdgN4xSVd_QCBph2w@mail.gmail.com>
In-Reply-To: <CAAQYJAvKL2MozzPtLk8xqsLMMHigPyU-=HdgN4xSVd_QCBph2w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 17 Dec 2018 22:43:51 +0100
Message-ID: <CAAQYJAuPXVQHqNQnWBDz6uTSY0KXCxYyrBT9mZ=yRYju3+TXVw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexec-tools-klibc: fix build for mipsel
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
X-List-Received-Date: Mon, 17 Dec 2018 21:44:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 10:28 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> On Mon, Dec 17, 2018 at 10:18 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > On Mon, Dec 17, 2018 at 8:23 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, Dec 17, 2018 at 10:15 AM Andrea Adami <andrea.adami@gmail.com> wrote:
> > > >
> > > > Fix:
> > > > printf.c:2:10: fatal error: limits.h: No such file or directory
> > > > |  #include <limits.h>
> > > >
> > > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > > ---
> > > >  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > > > index e7553244d..872d79b93 100644
> > > > --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > > > +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > > > @@ -66,6 +66,7 @@ CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/i
> > > >  CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > > >  CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
> > > >  CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > > > +CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > > >  CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
> > >
> > > I wonder if we just use use "mipsarch" override here once for all
> > > mips kinds.
>
> Note that there are different bitsizes...
> Please merge this, we'll think how to refactor this later.
> Cheers
>

ehm.. sorry for the noise, my git repo exploded...
This patch is already merged in master-next: archived as
not-applicable (anymore).

Cheers
Andrea


> Andrea
> P.S. Unfortunately my poor 3.13.5 bcm-tainted drivers do not survive to kexec.
> Will retry with a recent bmips for bcm7425
>
>
> > >
> > > >  CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > > >
> > I am also wondering how to do that in another way.
> > Maybe a patch to adjust the included headers?
> >
> > Cheers
> > Andrea
> >
> > > > --
> > > > 2.17.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

