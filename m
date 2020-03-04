Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89FB9616C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 04:43:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y3so656824edj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 20:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OlB5CxWHmvolQzXmMA1Yvc3Bn7AAYfxtC0rDv8FYzuE=;
	b=TBc4GQo5rW5I34fUxo7sPCy4iWD+yuGFlWY7EIb5oXpa0X3Px/6d0u+SH99/I/0M6A
	gbp6JvzS05irJdi9vfqWfj8EGcowrsHxvqIMpHJbsy9nlfbVo0MBW1eCygjT7RlmrLLY
	OC2bSsTEKi0fCG8acs663Y2jHyxxBft+gufNe9a7yyDxCaVfq0J2TklBsdQonbtWZc55
	+GeZgK9Dr0jDAcGYjc3b2hIrj6800JXtPY26SrVoiltEKhxvuvphQOsnUg2Fp7lTrUPd
	I/rm/ImF/G9IlRRTrbO7BYa5OrMXclRKh2PkG8ZjaN1HwVcjQ0sIiEZABsmwEVYOaoZS
	MBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OlB5CxWHmvolQzXmMA1Yvc3Bn7AAYfxtC0rDv8FYzuE=;
	b=Ic8VvAI9yBczoaX8kWikHSp/tGvfY5arpKfzeqLDC1/xYNZUg1VZB6wqpJUUJYhcsJ
	7ni1bctL76KaIbBiEz/SSwgSnBvL7Z3LFU34dHjqjVYYFMK6vl/SFwUlZKR+H1EZTW3+
	09Cqxc6/RK6dMZttGyglKCGKLoDnFl8VA/oXkdCQQoFMA3NqYysUqYbaCRnqY+SAYrir
	J7GjeEkLVVEtF0lPMtk0lndq22OGe/6Uqs2w3Y5104BGDjh02nYmfMKCiZx65XGRUntq
	mRYIT7BKGY1kylBApzJ8j8OillJQqXKNgpqiSVyz6Wgt7w0JWtmBjd/pfwaXQ+pVNHDS
	/5Pw==
X-Gm-Message-State: ANhLgQ3T1onz7fujKgAZXNxnL/ToLtGCeisJl/W/nVFSsjgq9oaCZdFD
	rghAiFW6L6+1csTTaODSjbnrFF5AVzPMb5EAipU=
X-Google-Smtp-Source: ADFU+vvG0G5ITRl7R81hEkP9yqb/9uyJebG6MXrfzNpxSYa1K3Y4s3q80Cu8FDm/80YtTi+NCb5ZD7KbR4cv1x8DTVE=
X-Received: by 2002:a17:906:7d53:: with SMTP id
	l19mr935981ejp.55.1583297030039; 
	Tue, 03 Mar 2020 20:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20200226122622.33171-1-leo.yan@linaro.org>
	<CAMKF1sq3DnDjXNyyUs5g3rbQp295gEP3xrYteL3adUOOy3Nkug@mail.gmail.com>
	<20200304030048.GB8032@leoy-ThinkPad-X240s>
In-Reply-To: <20200304030048.GB8032@leoy-ThinkPad-X240s>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Mar 2020 05:43:38 +0100
Message-ID: <CA+chaQdnHSE0bw=kA8fRek-2ig4jLjr_ibdcML0qZhXbbN=4fQ@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Wed, 04 Mar 2020 04:43:50 -0000
Content-Type: text/plain; charset="UTF-8"

You can use something like:
2.0.99+2.1.0-beta3
to make sure it doesn't go backwards.

2.1.0+beta3 seems wrong, because it would sort higher than final 2.1.0
(without the +git${SRCPV} suffix).

2.1.0~beta3 might work, but it's not used by many recipes.

On Wed, Mar 4, 2020 at 4:01 AM Leo Yan <leo.yan@linaro.org> wrote:

> Hi Khem,
>
> On Thu, Feb 27, 2020 at 07:27:21AM -0800, Khem Raj wrote:
> > I am seeing version going backward errors still
> >
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-src went
> > backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-dbg went
> > backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-staticdev
> > went backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-dev went
> > backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-doc went
> > backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-locale
> > went backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit went
> > backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
> > luajit-2.0.5+2.1.0-beta3: Package version for package luajit-common
> > went backwards which would break package feeds (from
> > 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> > [version-going-backwards]
>
> I googled for this issue, the backwards issue is likely caused by the
> PV: from "2.0.5+git${SRCPV}" to "2.0.5+2.1.0-beta3".
>
> So how about change PV to "2.1.0+beta3" and later for version 2.1.0,
> we can use the format "2.1.0+git${SRCPV}"?  At the end we can get the
> version sequence as:
>
> Old:   2.0.5+git${SRCPV}
> Now:   2.1.0+beta3
> Later: 2.1.0+git${SRCPV}
>
> Does this make sense for you?
>
> Thanks,
> Leo
>
> > On Wed, Feb 26, 2020 at 4:26 AM Leo Yan <leo.yan@linaro.org> wrote:
> > >
> > > Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> > > misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> > >
> > > Also updated clang.patch to dismiss patch warning: "Hunk #1 succeeded
> > > at 436 with fuzz 1 (offset 123 lines)."
> > >
> > > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > > ---
> > >  meta-oe/recipes-devtools/luajit/luajit/clang.patch  |  4 ++--
> > >  .../luajit/{luajit_2.0.5.bb => luajit_git.bb}       | 13
> ++++++-------
> > >  2 files changed, 8 insertions(+), 9 deletions(-)
> > >  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb =>
> luajit_git.bb} (90%)
> > >
> > > diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > > index c39ef6fd4..807cc4417 100644
> > > --- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > > +++ b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > > @@ -8,8 +8,8 @@ Index: LuaJIT-2.0.5/src/lj_arch.h
> > >  ===================================================================
> > >  --- LuaJIT-2.0.5.orig/src/lj_arch.h
> > >  +++ LuaJIT-2.0.5/src/lj_arch.h
> > > -@@ -313,7 +313,7 @@
> > > - #error "Need at least GCC 4.2 or newer"
> > > +@@ -436,7 +436,7 @@
> > > + #endif
> > >   #endif
> > >   #elif !LJ_TARGET_PS3
> > >  -#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
> > > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > > similarity index 90%
> > > rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > > rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> > > index 93128dda8..2a7243842 100644
> > > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > > +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > > @@ -1,14 +1,14 @@
> > >  SUMMARY = "Just-In-Time Compiler for Lua"
> > >  LICENSE = "MIT"
> > > -LIC_FILES_CHKSUM =
> "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> > > +LIC_FILES_CHKSUM =
> "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
> > >  HOMEPAGE = "http://luajit.org"
> > >
> > > -PV .= "+git${SRCPV}"
> > > -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> > > -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> > > +PV = "2.0.5+2.1.0-beta3"
> > > +SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
> > > +SRC_URI = "git://
> luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
> > >
>  file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> > >             file://clang.patch \
> > > -"
> > > +           "
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > @@ -90,8 +90,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> > >  "
> > >  FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> > >
> > > -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> > > -COMPATIBLE_HOST_aarch64 = "null"
> > > +# mips64/ppc/ppc64/riscv64 is not supported in this release
> > >  COMPATIBLE_HOST_mipsarchn32 = "null"
> > >  COMPATIBLE_HOST_mipsarchn64 = "null"
> > >  COMPATIBLE_HOST_powerpc = "null"
> > > --
> > > 2.17.1
> > >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

