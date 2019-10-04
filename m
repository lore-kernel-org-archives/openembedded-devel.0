Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 72B2E7DE74
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 16:31:39 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id h126so6331015qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3UuA+f7Ab7AvifmrHqzeLleV94nkpIpiRDCGOEa45YU=;
	b=IxDWMe0SaG32CHdQLYQPkNlSvvrG/wvC+pMRnHGzpr0DQnoTBjxLNsoQm87Y3H4XTI
	Go9R0SKtRIOfpf+MWJla1RXm0NAb7Zp8TVw3Q1x56dYFz7KyaFtvHDl0s5VGtfrmH81E
	2P2Ebsp3wBpoInW7nqbLGhiDIOzOzWMvnnYrZTL9KZdNN4OdAkhwk2TlrWDi+veh/n1+
	lf9RWVW7umyyc2lvMC2/YdHbUSS/DsfYh13e+OIU2jwmy3Xnuabxzu2G4d1IZD4K+1Eb
	JPZa6jAmHI7QYU0tWHKV79LMo5D5NEiTbxpJYdSx5MMVgaFSuUqFkA2rXc9P5w8d/j0v
	/XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3UuA+f7Ab7AvifmrHqzeLleV94nkpIpiRDCGOEa45YU=;
	b=btmaoi+VP4IIL+Ph+IctitaY2HgRjxNsomlbpUhmUWx/mLI1ZaP6xlrRUnntoUb48o
	IDbRIfvE/1KBDfQQgJV7+o9aBAnTZNn/57juAsuC9dYtevfRErl8SW2FVGrzGojnKi4R
	xne8O/EKAyzez/gl3LrG2lBmuUCGfd7IHey0RmwkLCfSUg7CuLl1UcXKxgIbieym37AH
	cwuSEWnCpFl1OsrzuwIm3B3HLvEfMUHBTgpQHgIt1GdaqrgNpW8aLisOKAtSoeziMKHV
	TNDELElDnbZszRVfMcAxPNk1TZENNvJvmEc7/OZyMEYwjJC7zYA/JJ1hv0tkEH8a9/Cc
	F/EQ==
X-Gm-Message-State: APjAAAXfNALrtD8xO1W5SuWEaVVnqtMgt+kWp2hU6rDUtIfXPPa9wTlV
	nbvhC81RGSZxr/EegklP5ZgGHcPi5fFdglxlRG4=
X-Google-Smtp-Source: APXvYqywkE0oiaPBPZ/mnuOhgZ2IkEJMDsktLZzEaeMN0StUIbmHxSkdWpHgQVF/8LmIXHfWuc5yYKxyM+LhaT3hAwo=
X-Received: by 2002:a37:6651:: with SMTP id a78mr11137599qkc.474.1570206699774;
	Fri, 04 Oct 2019 09:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190927165605.1900768-1-adrian.ratiu@collabora.com>
	<CAMKF1sqTmvwNDbXnvHvUfPVjq-hPLAQ6Yne=sph3Q-gqLGU3UA@mail.gmail.com>
	<20190929124049.GB30130@localhost> <87ftkf9ery.fsf@collabora.com>
	<CA+chaQeeZFnAAUbGFGHgypBF-O53pv1Gv7q8ZmjiOH95D5Wksw@mail.gmail.com>
	<87ftk8kfb6.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <87ftk8kfb6.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Oct 2019 09:31:29 -0700
Message-ID: <CAMKF1spptPUotLZSY2BLOL3u_z9NEVBUWL-tM7M2fxEcgpFuwA@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] renderdoc: add new recipe
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
X-List-Received-Date: Fri, 04 Oct 2019 16:31:39 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Adrian

On Fri, Oct 4, 2019 at 2:52 AM Adrian Ratiu <adrian.ratiu@collabora.com>
wrote:

> Hi
>
> On Fri, 04 Oct 2019, Martin Jansa <martin.jansa@gmail.com> wrote:
> > This should have x11 in REQUIRED_DISTRO_FEATURES to fix:
> >
> > ERROR: Nothing PROVIDES 'libxcb' (but
> > meta-oe/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb DEPENDS on
> or
> > otherwise requires it)
> > libxcb was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> > 'renderdoc', 'libxcb']
>
> v4 of this patch was merged into master. I will send a new patch to add
> the change you suggest. Thank you!
>
> >
> > On Sun, Sep 29, 2019 at 7:46 PM Adrian Ratiu <adrian.ratiu@collabora.com
> >
> > wrote:
> >
> >> On Sun, 29 Sep 2019, Adrian Bunk <bunk@stusta.de> wrote:
> >> > On Sat, Sep 28, 2019 at 12:48:10PM -0700, Khem Raj wrote:
> >> >> On Fri, Sep 27, 2019 at 9:56 AM Adrian Ratiu <
> >> adrian.ratiu@collabora.com> wrote:
> >> >>...
> >> >> > --- /dev/null
> >> >> > +++
> >>
> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> >> >> > @@ -0,0 +1,48 @@
> >> >> > +From 40511a6f4dc6311c8cf7f2954d1202ede55881ff Mon Sep 17 00:00:00
> >> 2001
> >> >> > +From: Adrian Ratiu <adrian.ratiu@collabora.com>
> >> >> > +Date: Wed, 25 Sep 2019 19:31:14 +0300
> >> >> > +Subject: [PATCH] (q)renderdoc/CMakeLists.txt: remove flag
> >> unsupported by GCC
> >> >> > +
> >> >> > +-Wno-unknown-warning is not supported by GCC, only by Clang so we
> >> >> > +remove it because newer GCC versions like 9.2.0 will complain,
> older
> >> >> > +versions would just ignore it.
> >> >> > +
> >> >> > +Upstream-Status: Pending [
> >> https://github.com/baldurk/renderdoc/pull/1530]
> >> >> > +
> >> >>
> >> >> gcc9 does support -Wno-unknown-warning perhaps you want
> >> >> -Wno-error=unknown-warning
> >> >>...
> >> >> > +TARGET_CFLAGS += "-Wno-error=deprecated-copy"
> >> >> > +
> >> >>
> >> >> this option is GCC specific mark it
> >> >> TARGET_CFLAGS_append_toolchain-gcc
> >> >>...
> >> >
> >> > Using -Wno-error always could solve both problems,
> >> > and would also avoid similar problems in the future.
> >>
> >> That's a good idea, however I can't pass directly -Wno-error in the
> >> recipe because of how the top-level CMakelists.txt is written: it always
> >> *appends* -Werror to the flags, so it overwrites our -Wno-error.
> >>
> >> A better solution which has the same effect is to use
> >> -DCMAKE_BUILD_TYPE=Release which prevents -Werror being appended at all
> >> in the top-level CMakelists.txt (there is no other effect than this!)
> >>
> >> Thanks! Will send an updatet v4 soon.
> >>
> >> >
> >> > cu
> >> > Adrian
> >> >
> >> > --
> >> >
> >> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >> >         of the darkness. There had been need of rain for many days.
> >> >        "Only a promise," Lao Er said.
> >> >                                        Pearl S. Buck - Dragon Seed
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>

