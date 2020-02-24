Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 611C761144
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 03:47:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a2so7537188qko.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=npd76jqags80U9u0L6oflvgyujAFsA176P6dC63S7VM=;
	b=q4GrEbK0wLYmP+zHvtlV1DBt6Kz4mq8NuYautImxcCbYLA+IqwfYDKipNVolJULFmf
	MyzDq0ssWQaDMaa4FiC8M9V/TxRFVfi5v8HW5GK2bYu9Jj2P28TAmIZcFPcP/F3tlKgo
	G9KafK+z/nzxAPj5R5rh+dS9xXl+/qtQH/XTjwCCSODESNtBkQoMKZyDxPLLZgMc6ivJ
	hreLc+oapT8QowpGx52WvhHZhF+zUlbHAM3mOlAtV6zF7SAzMzeXBeVpK2s5WvRwQJCv
	Oe2HWFZ5HEBe4EVrvqRjWhAqX8XXAl7GnoPH7VOm1i89P1LeuEJ+4km47bQa0gUq9GD4
	ljGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=npd76jqags80U9u0L6oflvgyujAFsA176P6dC63S7VM=;
	b=jPqA4OS4WdJFNfQauJyC3a3FeGqErPcARNI7vQvFe1rtNGYOEwSos7Dod4h8T1Ryr6
	ctbtnQ+oh2lOkLXFvVLSLIew4eQrTwaxpqOo9UccRg/maSQxNODaK8OJNp7xny7z2tsr
	7yIalQ8bBQ6ib5K6zbSsN1T3YO1vl7ChUXua9afpW4J3rQzs4WX+LNie7jCRLF5oKs9p
	DX0cEDnnLxDp6GS81totUxJpksLfYTC+vUP+bbyHNBHeccgHhVijgQli3IIW34nGCwUD
	hOxAxCMbJmB9EgeUgTIPzbiECRGOA6yjCltfyr4Plc3Tdh/5YTAU/4xei1bPnrWCZXVw
	BimQ==
X-Gm-Message-State: APjAAAVFrsRO5HZhf0vIxeTSj/HuvdQNoxpT496YDgZtYSMwwNeEjhZz
	BKHj92BSJCTykasQclcIfMamv86HHZ6GG/6S/7U=
X-Google-Smtp-Source: APXvYqwbpOjhg7wGnHza6kvLfB4PdZzBkj5pAAIdzSmAFSwYsWemr66bKGwTVA5Hx0bzoF+rnlDZTKbuqFtTRHSfu40=
X-Received: by 2002:a37:e317:: with SMTP id y23mr46591435qki.431.1582516059906;
	Sun, 23 Feb 2020 19:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20200223053549.7056-1-leo.yan@linaro.org>
	<3e126d8b-ed9e-3e5b-5fa7-61e043c10355@gmail.com>
	<20200224011017.GA5175@leoy-ThinkPad-X240s>
In-Reply-To: <20200224011017.GA5175@leoy-ThinkPad-X240s>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Feb 2020 19:47:28 -0800
Message-ID: <CAMKF1sq6aiSaL5a9BR8urL0=Yd4=CBB=kPFMBE4tY5Ub4h1veg@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Mon, 24 Feb 2020 03:47:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 23, 2020 at 5:10 PM Leo Yan <leo.yan@linaro.org> wrote:

> Hi Khem,
>
> On Sun, Feb 23, 2020 at 04:48:32PM -0800, Khem Raj wrote:
> > On 2/22/20 9:35 PM, Leo Yan wrote:
> > > Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> > > misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> > >
> > > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > > ---
> > >  .../luajit/{luajit_2.0.5.bb => luajit_git.bb}        | 12
> ++++--------
> > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > >  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb =>
> luajit_git.bb} (88%)
> > >
> > > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > > similarity index 88%
> > > rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > > rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> > > index 93128dda8..afa60dba7 100644
> > > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > > +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > > @@ -3,12 +3,9 @@ LICENSE = "MIT"
> > >  LIC_FILES_CHKSUM =
> "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> > >  HOMEPAGE = "http://luajit.org"
> > >
> > > -PV .= "+git${SRCPV}"
> > > -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> > > -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> > > -
>  file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> > > -           file://clang.patch \
> > > -"
> > > +PV = "2.1.0+${SRCPV}"
> >
> > I think we will endup in trouble when 2.1.0 releases, so perhaps we
> > should leave room for  sorting 2.1.0 higher than whatever we do now
> > perhaps PV = ""2.0.5+2.1.0-beta3" would be workable.
>
> This suggestion is fine for me.  But I have some concern for this since
> the naming might introduce confusion when later someone reads this
> recipe, which combines two different versions together.  So seems to
> me PV = "2.1.0-beta3" is more directive, and it can reflect the exact
> version for the building.  How about you think for this?
>

The version scheme has a purpose and that is to track package feeds and
they can not go backward for obvious reasons

The suggestion I had for you is commonly used in oe  while it might not
look simple and clean it serves the purpose


> In next version, I will remove the two patches from 'luajit/luajit'
> folder.  Also please let me know if you have any concern for this.
>
> Thanks for reviewing and suggestions!
> Leo
>
> > > +SRCREV = "8271c643c21d1b2f344e339f559f2de6f3663191"
> > > +SRC_URI = "git://
> luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > @@ -90,8 +87,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> > >  "
> > >  FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> > >
> > > -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> > > -COMPATIBLE_HOST_aarch64 = "null"
> > > +# mips64/ppc/ppc64/riscv64 is not supported in this release
> > >  COMPATIBLE_HOST_mipsarchn32 = "null"
> > >  COMPATIBLE_HOST_mipsarchn64 = "null"
> > >  COMPATIBLE_HOST_powerpc = "null"
> > >
>

