Return-Path: <leo.yan@linaro.org>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8F960B89
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 03:00:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j7so352574plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 19:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FImLgB6Wz3xEpOP4NOX6esJ7PuuqygXd+7kA0ieTOMI=;
	b=NMC/PumhyB0/ipfVkjq727txg8XYeq5EeXZTNJw9225XUCKbGMX/2NdTxhFOXaJzZf
	CwtWEPSUNI3NpbIrjLeGFd3MWgk7/+kR3dzpR0toZxP5ZvB4o1pAGCfHlOVC54fxLaAK
	qUhPdOv83wZ0b4BUkBD/mAHtGq+AtboQxlQ8MpLh+oEdcq96AhaSGrNLj6lILsh4dh2w
	9AX7GilUi2kxgEUndeoNhLzpTULhe6zYkfLvWHnXDX8dOC7p6u37Ndw1yimkQWeXrmx1
	HY97uvt2vXjLJ9BOeeaWD+BNlFY6FXW9zPIu+/nmWjO8PFpuXfUOmGDMRf5n9K7LftGx
	bQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FImLgB6Wz3xEpOP4NOX6esJ7PuuqygXd+7kA0ieTOMI=;
	b=DhZ9a7aevK5k/dNqZnEOAHeREoiFDCbrWGdeBqdel0kWzAn7et3pcteOpL1PbZM9ZM
	fe5mQt0nJt0n68JEtKKLx6iLjnHIjkdgTNQEEC5AXKTJ+Z38slpQT8iw5CUlJu0Skruh
	Yb4ZevxhxGW5tPcr0/tqg9sv0DcqhgJEgi67mVSTAkhnY02ZNVzbLUDqAVlgsy0iIXhz
	BGy2YfIS31uj55CkbhWl2+MaYqGlA/dJjjfWxMNmkHA/Y5De856J5mq5bsXkbUzo1yCy
	HW4H7nZHPhT1pEKl9OkQIM/6s5RMrMB/H7mI+lQtjxGvvHSZVPYfEQPaYIaIwh4Gsn6a
	sVww==
X-Gm-Message-State: ANhLgQ0ugLZgu978wH2GWIdBZrghG11Qc75CuPlGgV+AcSwlDtlyALfm
	H+FYATVrgkXkq5d6Bt5ddMZZNQ==
X-Google-Smtp-Source: ADFU+vvwnPbcsJZ+WrDwixFHWG5NFBqrp+vwC5/7VJ7lt2Zt9PPbSPEkJEvkBRiv+2EmHbB3Rlm+UA==
X-Received: by 2002:a17:902:8ec1:: with SMTP id
	x1mr1001315plo.325.1583290858953; 
	Tue, 03 Mar 2020 19:00:58 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:ee42])
	by smtp.gmail.com with ESMTPSA id
	w76sm7827823pfc.154.2020.03.03.19.00.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Mar 2020 19:00:58 -0800 (PST)
Date: Wed, 4 Mar 2020 11:00:48 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200304030048.GB8032@leoy-ThinkPad-X240s>
References: <20200226122622.33171-1-leo.yan@linaro.org>
	<CAMKF1sq3DnDjXNyyUs5g3rbQp295gEP3xrYteL3adUOOy3Nkug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq3DnDjXNyyUs5g3rbQp295gEP3xrYteL3adUOOy3Nkug@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Wed, 04 Mar 2020 03:00:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Thu, Feb 27, 2020 at 07:27:21AM -0800, Khem Raj wrote:
> I am seeing version going backward errors still
> 
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-src went
> backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-dbg went
> backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-staticdev
> went backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-dev went
> backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-doc went
> backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-locale
> went backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit went
> backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]
> luajit-2.0.5+2.1.0-beta3: Package version for package luajit-common
> went backwards which would break package feeds (from
> 0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
> [version-going-backwards]

I googled for this issue, the backwards issue is likely caused by the
PV: from "2.0.5+git${SRCPV}" to "2.0.5+2.1.0-beta3".

So how about change PV to "2.1.0+beta3" and later for version 2.1.0,
we can use the format "2.1.0+git${SRCPV}"?  At the end we can get the
version sequence as:

Old:   2.0.5+git${SRCPV}
Now:   2.1.0+beta3
Later: 2.1.0+git${SRCPV}

Does this make sense for you?

Thanks,
Leo

> On Wed, Feb 26, 2020 at 4:26 AM Leo Yan <leo.yan@linaro.org> wrote:
> >
> > Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> > misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> >
> > Also updated clang.patch to dismiss patch warning: "Hunk #1 succeeded
> > at 436 with fuzz 1 (offset 123 lines)."
> >
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  meta-oe/recipes-devtools/luajit/luajit/clang.patch  |  4 ++--
> >  .../luajit/{luajit_2.0.5.bb => luajit_git.bb}       | 13 ++++++-------
> >  2 files changed, 8 insertions(+), 9 deletions(-)
> >  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (90%)
> >
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > index c39ef6fd4..807cc4417 100644
> > --- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > +++ b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > @@ -8,8 +8,8 @@ Index: LuaJIT-2.0.5/src/lj_arch.h
> >  ===================================================================
> >  --- LuaJIT-2.0.5.orig/src/lj_arch.h
> >  +++ LuaJIT-2.0.5/src/lj_arch.h
> > -@@ -313,7 +313,7 @@
> > - #error "Need at least GCC 4.2 or newer"
> > +@@ -436,7 +436,7 @@
> > + #endif
> >   #endif
> >   #elif !LJ_TARGET_PS3
> >  -#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > similarity index 90%
> > rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> > index 93128dda8..2a7243842 100644
> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > @@ -1,14 +1,14 @@
> >  SUMMARY = "Just-In-Time Compiler for Lua"
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> > +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
> >  HOMEPAGE = "http://luajit.org"
> >
> > -PV .= "+git${SRCPV}"
> > -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> > -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> > +PV = "2.0.5+2.1.0-beta3"
> > +SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
> > +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
> >             file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> >             file://clang.patch \
> > -"
> > +           "
> >
> >  S = "${WORKDIR}/git"
> >
> > @@ -90,8 +90,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> >  "
> >  FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> >
> > -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> > -COMPATIBLE_HOST_aarch64 = "null"
> > +# mips64/ppc/ppc64/riscv64 is not supported in this release
> >  COMPATIBLE_HOST_mipsarchn32 = "null"
> >  COMPATIBLE_HOST_mipsarchn64 = "null"
> >  COMPATIBLE_HOST_powerpc = "null"
> > --
> > 2.17.1
> >

