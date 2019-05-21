Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1C807E26A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 17:43:21 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h1so21556015qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Kg81xtp088USB+xQUhJmp+Hcz13jHwZH61xjGZihVc=;
	b=K81m5AMRV0U/tfTUVu03jB8OI0MxgDTo85T32Mu2zEuk8ma48UxlV0rwlsBQCbzu0I
	ZKxQq40rpPuGa2c2hjePCGsqfQ8Y5FhphkYwwR9GJB4adMt9m20ANy2za0BYiL1H6umk
	gihvTLeY+81bv58o0wK5hboTc4ej2QDsZonweH+Xa/9kLh0FflpSCn3WDBhnVH7YOjzp
	aSQlGogSuH64IhFzmE2QweK78rhLGUi8MsQNuA5DmOFqsLChH0PqAFEBipC2fdUUsTcg
	AsxO+zRrrehmD11zrjss1ay9sMRuycbOPQ329ga6NHwoLDiaiKbVuh9dkzNAThuVt/05
	5B/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Kg81xtp088USB+xQUhJmp+Hcz13jHwZH61xjGZihVc=;
	b=dizVheOJhpMjOYjxVCbMmS9QlY6qHq2fjC4a82FLHtiXEGP6fWCaZ2KxdUm/G9aW3v
	90PhyfQJDHG10JIOi/kfg9aMkrGexdvD7GzvvDSzoiA0MlisUkmk16f4BcbD6cDJX7XY
	2i4tGJGNpbyiXmkN6H2qbAzd/uI3lnUQu8NyZXDstzKIVaNMLFuyOHIBVqs7Ybn8vgF9
	FApv2lItKbQUcGHMufO+KngyloY9V19il2zRtNnWeohxhQVyPdJMYN944eBsEs2MdHqw
	Cvf4tKwPMjTxrReeT5DeQ2Or7wtvKLoQa75goN5ZsTlb5Gq5XPPDSO0xFqCPLRkZvw0E
	mdPA==
X-Gm-Message-State: APjAAAWpL4yeVzaBVxxg2OQeXtDTvhI8JWU/hVuhChWCdy9i6Kc9DDSs
	6FNGmnwMWvP5PNBtSN+ublbaEYjK/veL4jWUR65DkG/3
X-Google-Smtp-Source: APXvYqyY9xs+Dim/Y70f/RDSe3EPbolzvbEE6GUtbH5gfemMdORaM6sp3F1DhvyaDNoxU9ocrPmAHrMwiYjJX4o1SzA=
X-Received: by 2002:aed:3b0a:: with SMTP id p10mr47643063qte.194.1558460602260;
	Tue, 21 May 2019 10:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190521065529.41647-1-raj.khem@gmail.com>
	<20190521065529.41647-2-raj.khem@gmail.com>
	<20190521071928.GA15108@localhost>
In-Reply-To: <20190521071928.GA15108@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 10:42:56 -0700
Message-ID: <CAMKF1sp8bpg_kYq=fTASAYy9isUGAUuF0A9FXdQ3pEJJ=w-m0w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] openocd: Fix build on x86_64
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
X-List-Received-Date: Tue, 21 May 2019 17:43:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 12:19 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, May 20, 2019 at 11:55:29PM -0700, Khem Raj wrote:
> >...
> > +Fixes
> > +| src/flash/nor/esirisc_flash.c:95:9: error: 'PAGE_SIZE' macro redefined [-Werror,-Wmacro-redefined]
> > +| #define PAGE_SIZE                       4096
> > +|         ^
> > +| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux-musl/openocd/0.10+gitrAUTOINC+7ee618692f-r0/recipe-sysroot/usr/inclu
> > +de/limits.h:89:9: note: previous definition is here
> > +| #define PAGE_SIZE PAGESIZE
> >...
> > +--- a/src/flash/nor/esirisc_flash.c
> > ++++ b/src/flash/nor/esirisc_flash.c
> > +@@ -92,7 +92,9 @@
> > + #endif
> > +
> > + #define CONTROL_TIMEOUT             5000            /* 5s    */
> > ++#ifndef PAGE_SIZE
> > + #define PAGE_SIZE                   4096
> > ++#endif
> > + #define PB_MAX                              32
> >...
>
> Are you sure this is correct?
> This looks like two completely unrelated defines that just happen to
> have the same name.
> And it worked by chance since they have the same value on x86_64.
>
> Renaming to something like ESIRISC_PAGE_SIZE would be a proper fix.
>

yes, upstream clarified that too. v2 is on cards.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

