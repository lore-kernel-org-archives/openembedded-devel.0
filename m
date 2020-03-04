Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A74361855
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 03:25:18 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id m2so172730qvu.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 19:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OnQ7y4kDRE7c+RZeOJYO84t/bcmOm1LqwRlW8Bhi9a8=;
	b=MFJSSxulx8LI3aIHu8mG1zoUH+ydm3V5eAY1WNojbk5mWMvZ+eLgMDr1APFGSkXTa3
	g9I9VdkhiA5BvV/9PxoWYX8R4i/C4gxCaJz46TZWzz6+Mv/kKYtnpQT43ioMXnHeE0HE
	wEOnplh8bJlkv99VFCumC3j2Dsb2nlRRBu7TQlGHB4mS+iGeaLO/KZRzkMtLGaexDem9
	fryC2jqWStmLLU05zRRpLgrYZC2wHIuvu6KBBCb9b/wRehxXx4zCmlkVsbppJHoLZCJj
	6hPlRE9ojloufa+QajyRpJ/DMuDCiodD4/vTWjbJkL+8oVbiq8mwUCo+lr4Q47vrCHX9
	5VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OnQ7y4kDRE7c+RZeOJYO84t/bcmOm1LqwRlW8Bhi9a8=;
	b=ThkXKHn2ANlz9Iqn0iI+nMWwR0fvCcjDFPe4a+0f+IjW3ioHt9PNfW0elBFaZvXJ0x
	ODfdk1PuvPjihl36DlcGN6aikPEUgKJmQ3S5tDm+n2p8CvNYn+inUC/vp8tv9IvA9qkJ
	oW9/mBwFEf2qLtVGm5Swy9eUUG3qkOkp/xQ9+zIhhON/pHs2bDgkcDOjbL0pFQcK8jry
	6UUUOuXsFH5Gzs2REzTx9kQAR3zffK4Y3F60uqZ+xJO7xCpGM2aHU2E4nv/QxbuEY4mW
	my40cpFiiaqe9KO5CPFUEgkHjlTjK5fExDiuXqzfVoc31+gN2aCmmnhI6mIE4Mzgh/OV
	gOUA==
X-Gm-Message-State: ANhLgQ2qDkP6tmwngs8xgikduM4c9qEnRPQzUgc8wRzkXlPbNkXjTlWU
	boYyoXXMsgpmpLX+TgJluRFRi9wjHV3jTwcscQhCEneo
X-Google-Smtp-Source: ADFU+vsyZpZHZp8is//vsPgGVnCNx5u9wkPTRRh3phq2nzM8H5OETa5t1vK5UV6lbWEFsjPX9joD/YsxEJTwRUr4yTE=
X-Received: by 2002:a0c:e2d2:: with SMTP id t18mr537977qvl.130.1583292319345; 
	Tue, 03 Mar 2020 19:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20200226122622.33171-1-leo.yan@linaro.org>
	<CAMKF1sq3DnDjXNyyUs5g3rbQp295gEP3xrYteL3adUOOy3Nkug@mail.gmail.com>
	<20200304030048.GB8032@leoy-ThinkPad-X240s>
In-Reply-To: <20200304030048.GB8032@leoy-ThinkPad-X240s>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2020 19:25:07 -0800
Message-ID: <CAMKF1soEtOcQaWbJ7CEwJO1Ck_jHejZVHcQwmMZrH19mUyVgcQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 03:25:19 -0000
Content-Type: text/plain; charset="UTF-8"

I have pushed a fix with ~

On Tue, Mar 3, 2020 at 7:00 PM Leo Yan <leo.yan@linaro.org> wrote:

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
>

