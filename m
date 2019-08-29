Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAA17F27E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 18:44:41 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id i78so2441029qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fxFfPxHjEtEZgn5WmMhDPAD4NuIY5ovx6VBOTtQyDmg=;
	b=lEZIwIH6Vqfq0wipd8KQMhasUVfIMMZ6z/3mzhrn4prFFB+IU9gkLp//cVMGALJ90h
	Dup5QuokdI3nTsoQWxzRn3j4W1wwG3JCfXrrO59zpt8S2BOVCbKJVUsGBau0neshotcz
	SqXlYCwMcYEEWHog3ge4N184eedzSRveafGf/CH9wlcnFpcwe9i03u629aHax8y5wZLD
	c4HgTOtY+M7r027gyBawWa5sgOBmOPSnWEkzMRqa31n5PS9+u2thEYXgS7ND6yM8hADb
	8hVr6n+GyvZuBz/M1T0s0BFq0QqiAl1HSMzfdkcBJzYPRZNk2N3H+Etu7y7lVFbp/vbk
	+WZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fxFfPxHjEtEZgn5WmMhDPAD4NuIY5ovx6VBOTtQyDmg=;
	b=EDrnKVPSz7MLx4/Bw/Sm9nZVQ8/+KQYVrcj797KydSDlymg2dXgMhx+em2cwMX9/XH
	gF0pQ44cE/1Du1r0il3M0rX3/BuFExS5yckf3rWes2DRWKVgXvzgu8AiwsYd1A8oXSiS
	4Jl9O2o24HQ1KByqnRj3IzfTwU+vldueWzUvxwkZgTIEgXpPn09s0w6Ldnz63Hd+PjAd
	l7G/Kksar4raG6/lSCA44VnDyMNjO9pMDC5FpzAfD3EwSXREbpcCcbBkSjB7iJwZxcCu
	A66GgZO6APH08OZoVb5PAV+ms9GTQjGj7M5cVY9H38B2hZcFWQF14BmADVdrr6qmb3n2
	sBJA==
X-Gm-Message-State: APjAAAV9gZ44C4NjcMNfxHSu5bcwCv0eqsDjNghfGeIUEULoD70NyzOB
	HXcxvK+/VY5cOD1uEJOVMvqHuYm2+Ayqpje6MPk=
X-Google-Smtp-Source: APXvYqxU6NSospCV0+rBA7WgYxfMVrWV/0eilgCkVprmWQQMG0/Ss7o1pVQHu5OzPzKpLuSKJsbowkHFFQH2B8HoyKI=
X-Received: by 2002:a37:b245:: with SMTP id b66mr11322876qkf.337.1567104281863;
	Thu, 29 Aug 2019 11:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190829143506.19291-1-christophe.priouzeau@st.com>
	<20190829155122.GA17820@localhost>
In-Reply-To: <20190829155122.GA17820@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 11:44:16 -0700
Message-ID: <CAMKF1so-8_SBFQHtwx_8DVaDsGgMSBTF35muc-adweze8hOr7g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-script: update license md5sum
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
X-List-Received-Date: Thu, 29 Aug 2019 18:44:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 8:51 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Aug 29, 2019 at 02:35:07PM +0000, Christophe PRIOUZEAU wrote:
> > Update md5sum of license file.
> >...
> > --- a/meta-python/recipes-devtools/python/python-scrypt.inc
> > +++ b/meta-python/recipes-devtools/python/python-scrypt.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Bindings for the scrypt key derivation function library"
> >  LICENSE = "BSD-2-Clause"
> > -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f"
> >...
>
> The actual problem is that this does not do what LIC_FILES_CHKSUM is
> supposed to do.
>
> LIC_FILES_CHKSUM should verify that the license information in the
> software hasn't changed when upgrading it.
>

thats right and in most cases thats what it does too.

> These recipes check the copy of the license text in OE instead,
> which wouldn't change if the license of python-scrypt would change.
>

some packages just use license and do not include a license file in
which case the recipe
stubs it in. Not ideal but it is a band aid for such recipes.

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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

