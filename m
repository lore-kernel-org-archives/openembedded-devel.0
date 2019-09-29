Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 42D3D7DAD9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 12:40:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46h4rf67XVz65;
	Sun, 29 Sep 2019 14:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569760851;
	bh=qLzB0M4JgpcNmXCzM2l1ZrROuJWBvir72z0pCbu6DUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHEczGZzaidaSgbV3MKERwSVl6lxi09t4Bnxbygp9503cZqy+J7vykhM9/iaHJb8L
	MvAAfNYol34i4azc2MKuFdVAZzet4xiHKFCruTwsgAoyIsxEshb4jADqdI4ILO0BP0
	OUruR4iff/w7ek6jGptdQivcUBmySK/7SB4DYGMk3CwiP17KK/XRt+gf2BTwP9CT14
	wfp/NeoKAxVMjyq9hXVlOml2QofW1BHTuLOjZhVdpnnMpy4qujsvd4cyykwz2DSUhq
	B0nFyly9WW/SmnOB3+lbPLHAkePGfP8SNNRXRKJfKG+g6jAn7gi/JaCZWiSBgnM9Q2
	eGh/6sklC5cMCDXtFJgidhDlnrKsQ5oKTTE5zTWKoA4edSBsEgKbBcTWeCKtRkCKuZ
	x90aJBu8Sbvt2MNCy3rxo4kbjZczB45Pv52ND4db2e84mXq6c/6hxFPOcv6T3vR6XC
	h4wDnb+WYHsuzB04A5zf8QwRr4etY1rzpsmyHQuK5WE2pXxU+aZZpNc+cwCll6KPsC
	v06tm3O60nO9iZoWdducyy3mRrsbP0zjiYiuxZG+0IN9wBeTsDGSjv4yjLFM2sZHa3
	26RwabZV6pxlX8Nlvoxv9RGQUxtuvFjHxIaKgxi3+kNySCfFdqxyTI1azBvG5DB5jM
	RVQXGGA8UrmqO+LI4MAajGgU=
Date: Sun, 29 Sep 2019 15:40:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190929124049.GB30130@localhost>
References: <20190927165605.1900768-1-adrian.ratiu@collabora.com>
	<CAMKF1sqTmvwNDbXnvHvUfPVjq-hPLAQ6Yne=sph3Q-gqLGU3UA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqTmvwNDbXnvHvUfPVjq-hPLAQ6Yne=sph3Q-gqLGU3UA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Adrian Ratiu <adrian.ratiu@collabora.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 29 Sep 2019 12:40:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Sep 28, 2019 at 12:48:10PM -0700, Khem Raj wrote:
> On Fri, Sep 27, 2019 at 9:56 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>...
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> > @@ -0,0 +1,48 @@
> > +From 40511a6f4dc6311c8cf7f2954d1202ede55881ff Mon Sep 17 00:00:00 2001
> > +From: Adrian Ratiu <adrian.ratiu@collabora.com>
> > +Date: Wed, 25 Sep 2019 19:31:14 +0300
> > +Subject: [PATCH] (q)renderdoc/CMakeLists.txt: remove flag unsupported by GCC
> > +
> > +-Wno-unknown-warning is not supported by GCC, only by Clang so we
> > +remove it because newer GCC versions like 9.2.0 will complain, older
> > +versions would just ignore it.
> > +
> > +Upstream-Status: Pending [https://github.com/baldurk/renderdoc/pull/1530]
> > +
> 
> gcc9 does support -Wno-unknown-warning perhaps you want
> -Wno-error=unknown-warning
>...
> > +TARGET_CFLAGS += "-Wno-error=deprecated-copy"
> > +
> 
> this option is GCC specific mark it
> TARGET_CFLAGS_append_toolchain-gcc
>...

Using -Wno-error always could solve both problems,
and would also avoid similar problems in the future.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


