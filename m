Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 65A9860B0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 07:06:48 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id v2so4246478qkj.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 23:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9WXmn+uZ18257Z6oUInhwfqtr80WHmSY3ryWcW3sNws=;
	b=rXi/JttJZTHBmOrqlTJkthDZAPjMMCKt4XmHDcQjN//yu/eGhga+HaIuyE4v0P3Kz2
	VaUr7xu3bpqkfAm5GERAM+zMEgn6GLRTgL0o4d0h+yG8tCQhCXp+NkDEqVGZ3E6sqbyn
	JMDOZ5s+nI2oEawOlSLPTduB8U7ATNpn+od46n9TX/1RLiOl2Sdqagv0KgfYnHtAIJmM
	+kPliM8gYDGS1VC1XoOfNlHU2AVZ4HC/mdSaVkQLzevhAmskHe2e/pAfScD+TtWdb4hN
	7FMnFxYQttA+ne510OpbrUQqTK90hRExjBHnl2Ad5lq8wr5wr+bFu53Ka3v2dMlunTyY
	X0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9WXmn+uZ18257Z6oUInhwfqtr80WHmSY3ryWcW3sNws=;
	b=jxbgoKGJwBZyAD/dRLzS6U2/sxZx0GHEpuM7HjACSRlWa+TNULdNFS1knxQZTo3zQ0
	Cm0tRAaibf090DZvnEu2SaVBqWthv8NwASR3Ey+YrtcDTuYZ9DVaqSTnLwciyZV1NdKD
	8AoJ2AncDpxyyHeayBH2wJEP2wArPr+gPMCKgWQH9SL7DNWXv9Y8NbR5a4t//Un8b7e4
	uZMBAY7E8Nh2N8jnU31ax7D91x/m2+ks2mKYRN0SANuqaF/VAPiIkABn+XmNsuvxQu/m
	+LF00vVgt1tdsoIBn9VQBOmbIxQrRsIq1iOGCpsElu5NPKT4fKm0AXBhZ1FbvJ/JtSU9
	6QCA==
X-Gm-Message-State: APjAAAWGmHNzSYSIB34pIvqOUDly9bpiN3ow/ZjxELKvlDFj9/vgpu40
	dzZDiMV+CgNMEFm49MBp+zMxcQKM5yMoK+neNeA=
X-Google-Smtp-Source: APXvYqx719CKhw4Z29y2XtN+i+SxMimcVX1vbXJWsS7uF3nu2o0tXwU4wIVnzYgiSGB7A6s/oQx/xP6JXCvB4xxbJHg=
X-Received: by 2002:a37:de05:: with SMTP id h5mr1538965qkj.474.1581404808905; 
	Mon, 10 Feb 2020 23:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20200210174720.31886-1-okaya@kernel.org>
	<CAHtQpK4FHyyhkmayDhcNJXs+0kp9+K1fULG21q9P+C=OtFDpLw@mail.gmail.com>
	<0bf0b668-9fd5-aae9-bf7b-7b741beb84bd@kernel.org>
	<CAMKF1sougeHV8n2YDcVRYH38O_v_9n=fPhDvbHvzDpih_JvaXw@mail.gmail.com>
In-Reply-To: <CAMKF1sougeHV8n2YDcVRYH38O_v_9n=fPhDvbHvzDpih_JvaXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 23:06:22 -0800
Message-ID: <CAMKF1soEF_7Jpr76pBPdyuXkRTxaeS1uBeOsJFYAGbtXTuCpUA@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Feb 2020 07:06:48 -0000
Content-Type: text/plain; charset="UTF-8"

also fails on x86/musl

http://errors.yoctoproject.org/Errors/Details/390565/

On Mon, Feb 10, 2020 at 11:36 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 11:31 AM Sinan Kaya <okaya@kernel.org> wrote:
> >
> > On 2/10/2020 1:17 PM, Andrey Zhizhikin wrote:
> > >> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', '
> > >> -march=armv8-a+crypto', '', d)}"
> > > This cannot be enforced, as it would break those AArch64 derivatives,
> > > which does not have Crypto extension. See my comment above, where I
> > > extracted 2 sets of tune features for Cortex-A53. That means that
> > > there are SoCs there from different vendors, and some vendors decided
> > > to license Crypto extensions from ARM to include it in their RTL, but
> > > some opted out to save either space on a die or cost of the processor.
> > >
> > > If you would base your build with '+crypto' unconditionally, then the
> > > binary would segfault on those SoCs which has Crypto opted out.
> > >
> > > Moreover, enabling crypto extension in GCC automatically enables
> > > inlined NEON and VFP opcodes (see [1]), and there are more side
> > > effects to be expected on those SOCs which does not have those
> > > integrated.
> > >
> >
> > I agree. I dropped this line on v3.
> >
> > I was curious about
> >
> > TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes
> > -msse4.1', '', d)}"
> >
> > do we have a feature flag for this too?
> >
>
> perhaps look for corei7 in TUNE_FEATURES
>
> > Code doesn't compile without arch crypt support.
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

