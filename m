Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 37030606C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 19:37:15 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e21so2062608qtp.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 11:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zvHRfxZhTkXy5/NdieE9hmWrTnyklTarA2/q6MiioJ8=;
	b=Crkvql+rErORqnhJPGUMN9770XyjMaT5I43aw+CJr7ZAXNwGC1gDEF6zstkjdHbtrH
	YhIiUI0voa/c0Asy4fzxgPA+92JjYvq7oCKIWVsGHnoLw34gb7v/UnIYgPKiXcoz5wzM
	vBOsD40c5OknrOU8ythZdVsWDQarb5SCIcEbAV3dnyBeJtBpKzRZeG79rqS+mzZvy2Sg
	ob//l2pyazoPzHJsFHrN2Pi5yzUG6uYHCOrHFGYd824Z4euAM+DqPy+KQJC21Osm9R1e
	Cxt3TxKn1RC94zQO9pOPaOo4+a/sm2YsgYW/JLCNYOjAcm0+hFpGlsX1VUgvGWvl2qSi
	JcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zvHRfxZhTkXy5/NdieE9hmWrTnyklTarA2/q6MiioJ8=;
	b=k3eJoMpxq4JOgrBsW73IbCJe9DRVmaC4X2utucx2DeiDdLZ8nV7HnLAcE8NdT8ZVNU
	l5UJ/93rVzg2mW13PqokVZUlkyd7xuxg9RTdpg0B7B4uzdhwcm2f++T0fzI0mV2esBbO
	U5BzwbCLiHk0RFoDeHA4GC9Svv4F1LEP1yFbiJprzjf5/egB0Xdez+sHKQrdlpojVVMM
	yuGcuv2dItK8B9suSbyEO45uFEw/cEMdvxjZC2WBpRL3RoRzGzhM520XwF1FzRzuK4CW
	SyRc3zNdR7ESeueG0IY7un7wLPeeQ7/XSiG/Xisl2XsvWZX9t2me054zeTc35ao+Rne1
	kquA==
X-Gm-Message-State: APjAAAUTtm9nvvR3aaCeOF59wXTLpmAKEGftgWpnXGWO+IyoD/JSdaeI
	n0NCS5b+dLWPnauqI3MYJwS9rc/VVHuE2cQU5RM=
X-Google-Smtp-Source: APXvYqx4V+I1j+fbscm0+WPEG2aRZDOQ2Yhvpi+JQtZVNFE06T9bpWVS7g07/MBNILjPi4LTggANOgYkWyLqy7+LoFQ=
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr7107048qtm.53.1581363436659;
	Mon, 10 Feb 2020 11:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20200210174720.31886-1-okaya@kernel.org>
	<CAHtQpK4FHyyhkmayDhcNJXs+0kp9+K1fULG21q9P+C=OtFDpLw@mail.gmail.com>
	<0bf0b668-9fd5-aae9-bf7b-7b741beb84bd@kernel.org>
In-Reply-To: <0bf0b668-9fd5-aae9-bf7b-7b741beb84bd@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 11:36:50 -0800
Message-ID: <CAMKF1sougeHV8n2YDcVRYH38O_v_9n=fPhDvbHvzDpih_JvaXw@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyu Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH v2] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Mon, 10 Feb 2020 19:37:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 11:31 AM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 2/10/2020 1:17 PM, Andrey Zhizhikin wrote:
> >> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', '
> >> -march=armv8-a+crypto', '', d)}"
> > This cannot be enforced, as it would break those AArch64 derivatives,
> > which does not have Crypto extension. See my comment above, where I
> > extracted 2 sets of tune features for Cortex-A53. That means that
> > there are SoCs there from different vendors, and some vendors decided
> > to license Crypto extensions from ARM to include it in their RTL, but
> > some opted out to save either space on a die or cost of the processor.
> >
> > If you would base your build with '+crypto' unconditionally, then the
> > binary would segfault on those SoCs which has Crypto opted out.
> >
> > Moreover, enabling crypto extension in GCC automatically enables
> > inlined NEON and VFP opcodes (see [1]), and there are more side
> > effects to be expected on those SOCs which does not have those
> > integrated.
> >
>
> I agree. I dropped this line on v3.
>
> I was curious about
>
> TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes
> -msse4.1', '', d)}"
>
> do we have a feature flag for this too?
>

perhaps look for corei7 in TUNE_FEATURES

> Code doesn't compile without arch crypt support.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

