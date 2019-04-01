Return-Path: <wak@google.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id C15476C129
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 20:39:34 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j89so9491874ljb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XtZeU9dARhnsV9dAFUj+ajuulkHDbZR4yr29vYL7cd8=;
	b=l3g8roUbAcPppCExiedS6D1IlSE/Fao4YPxDt3pIM0y7A4E/QL2RKFKPEAckZ+gCzT
	gDZbjxY5F82UE7IHwOEKT1L4Ek4IhHMW+7EOGaoy8Ag3nFIoQ5oXVTxLeC8CyI7nZO41
	d6+djyiJ/bkhRTf3FemMmF7gxxZndOCtbxaSd4+nmmgKchj7fex6813GkPsukll1K2cx
	1iGnP6+mFnsXLm5oJJmG7ebosKNBeQYEkTOB49U04JeXjfnXXdtiAKir7+bxvxL37Frd
	e5e+ApChy5Kt7AlcpjOsnonrTTBWA5V0D0CnOP/rdkHYHBEQP68Ucfj8sNWQtL/5gRz1
	wf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XtZeU9dARhnsV9dAFUj+ajuulkHDbZR4yr29vYL7cd8=;
	b=DiPP3WbKVigrJaNCdrzR83/u+xD8dZ2xaK2UrJOAEDWIx/WzCtj8/nwmYbDBUtfr3K
	Wl3RzKRsaFaZg/sZrsVCnYYzTMUMnUdlxR5Dr2Rg/MPRRG3AAuj7oOouVJz4OGczxsKO
	tWTZQ5aPWBVD6MGSuaLxrvsc5MxQiIbKe5dYta540q57ev3RS3Ca3gR0bh1dWhs4oCGu
	5yDcSsspH3cJHe5mgTiT/bWtyWtm9gAV1kM4AHyhpp1NRoah+ds7dypPcL/DinasMago
	Q1ET1Dzh8wDyQBablTHgS22hw8Ba7B+TdJ6aWC3QnEvz+nG9eypYuN7zullVYSZ8G55A
	8Hww==
X-Gm-Message-State: APjAAAXBqnZ8jv4NfH8jiiigRjan9xX/zkD9FDW3WXb7X3xTpAITEfIM
	ybOxtutlHAJZvHqoXkLXkLbBdgP99uZBbUtwZjUdhQ==
X-Google-Smtp-Source: APXvYqx9S0kj2KggwKw2c7Uw4Uw82ffXvv4fI9qc9xcnvKPCO2jwt7uPgsohnGG33r5t9n1Wp3mE2e9m6CcxXtt2awk=
X-Received: by 2002:a2e:4ca:: with SMTP id a71mr32172038ljf.39.1554151174664; 
	Mon, 01 Apr 2019 13:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190327032430.59511-1-wak@google.com>
	<CAMKF1srK4zKuwA0zzo6zNpASu_yYp1W8txE+gzgBiP6vzWuzAA@mail.gmail.com>
	<CAPnigKmZvszOumY-EEbvTGcR2+-8EP3woGEbMyNrts2=s0N8kA@mail.gmail.com>
	<CAMKF1spWk+QWS4CQ438nYs5N7esLHo-KGzKLNKcY5yJvQciTRw@mail.gmail.com>
In-Reply-To: <CAMKF1spWk+QWS4CQ438nYs5N7esLHo-KGzKLNKcY5yJvQciTRw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Mon, 1 Apr 2019 13:39:22 -0700
Message-ID: <CAPnigKm=AaA8pDAk+B3ELAownNnAo3DUPXwMxv3TwUdfNSvmJA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cli11: 1.6.2 -> 1.7.1
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
X-List-Received-Date: Mon, 01 Apr 2019 20:39:35 -0000
Content-Type: text/plain; charset="UTF-8"

I'm unsure exactly what your test setup uses to get its bitbake code,
but the fix landed in bitbake master
https://git.openembedded.org/bitbake/commit/?id=30fe86d22c239afa75168cc5eb262b880886ef8a
and poky master
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=2030e815bb1ba932c58b0c9318f97602fdd4edfb

So with this change you should be able to integrate and test this again.

On Thu, Mar 28, 2019 at 9:57 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 28, 2019 at 2:04 AM William Kennington <wak@google.com> wrote:
> >
> > Yeah, sorry about that. This is a known issue with the gitsm and I
> > sent out a patch yesterday
> > https://patchwork.openembedded.org/series/16685/#
> > this was followed up by a maintainer patch to implement similar update checking
> > https://patchwork.openembedded.org/series/16702/#
> >
> > I don't think we have consensus yet on a proper fix but hopefully we
> > get something soon. This is breaking us in openbmc.
> >
>
> Sure, send an update again when this is solved in fetcher. I will hold
> it off for now
>
> > On Wed, Mar 27, 2019 at 9:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Mar 26, 2019 at 8:24 PM William A. Kennington III via
> > > Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
> > > >
> > > > LICENSE checksum updated to reflect a new copyright date being updated
> > > > there.
> > > >
> > > fails to unpack
> > >
> > > https://errors.yoctoproject.org/Errors/Details/234626/
> > >
> > > > Signed-off-by: William A. Kennington III <wak@google.com>
> > > > ---
> > > >  .../recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb}  | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >  rename meta-oe/recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb} (79%)
> > > >
> > > > diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > > > similarity index 79%
> > > > rename from meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> > > > rename to meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > > > index e62c1d3d1..1ed97a27e 100644
> > > > --- a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> > > > +++ b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > > > @@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
> > > >  DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
> > > >  HOMEPAGE = "https://github.com/CLIUtils/CLI11"
> > > >  LICENSE = "BSD-3-Clause"
> > > > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
> > > > -SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
> > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=8489f3831fc7b75264c1d5e346251a74"
> > > > +SRCREV = "49ac989a9527ee9bb496de9ded7b4872c2e0e5ca"
> > > >  PV .= "+git${SRCPV}"
> > > >
> > > >  SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
> > > > --
> > > > 2.21.0
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

