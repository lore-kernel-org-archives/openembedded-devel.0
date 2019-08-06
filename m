Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCF747F2A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 17:53:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 65so67846242oid.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QdPLSLoROUPATrwWcF1wxc3hh3iK7U2v7zBBqq3guvc=;
	b=VtAFAvxveznfZB7mI4uC+xv4AaIobCHMDWhzwpykdJckqhJTrbcCVRgtSr/2HGorR8
	B/w9uEod9hAYQjvE4epp/7ysnJ+0fqytGFLguELdtzBzWoV6GnPJ1hKIxLbZkCAjMgzY
	Utc16iueBe9/G4pv2Vb3iOwghwzANtb8E1F3Zo+teCQCEyHq+u6XgXYK+2xZWLDILhtw
	eAPb50EVktdQGbio0M2wi1hbjAT3SP89fo+aPAQKi0blkn69ckoDcVgGRx7CmEiIY8Jm
	/NfAuCo5J9tXXpBmU4TiNwenLXjt360o6wbeQdxPySEyO0nNO7Um6AsITgUyrFpxFY18
	oFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QdPLSLoROUPATrwWcF1wxc3hh3iK7U2v7zBBqq3guvc=;
	b=ET86GB+Ks+rtJ0J2XJIkCqYeiUvHyFxWJN1tVSUf8V/o4T4fZVCd49eFOWMMmVoFL3
	4HaVeBxXZnRe04qRjUwaUe6CCz9kou77eW+E2acuaVpnL77CgwMe8RO5kFb519n3CQLr
	32H5+m72ZiPhaFvl1vkuLCl4nSqG8RzTwFIEYx8mcUj1NNprrARsZTe4DELVKvvAEWiM
	IlAtP7Um+Mmeaq7s03GrukVsaO86zqMQLmG9II8u9qdHA8cKrk9E9bJ34wfGrudG09Vu
	+Z1tPzug1JckwVf8YaFrqrf52h/IWkWYx6FkJkNjQOuRP3sr3sZQ78/ApzKsp4CFkBpq
	2ZwQ==
X-Gm-Message-State: APjAAAXDIWerGAegOCGcPo0tc8vVtuAZzc5h1qepH3K4/ZXcSYJhtwQL
	UB+Mk/Jq6apVHimiqyAW5nvvxv8RiKlCTTX5+ILcBroD
X-Google-Smtp-Source: APXvYqzmbaU/Dhf+OoLKxZzeq+GrAh4Lg6/chA27C4OaRL7F2oUz0EtaO6JXU72XxhA9Y4BB5Xzu9WGHYsZoy3gLwm8=
X-Received: by 2002:a02:a509:: with SMTP id e9mr431515jam.134.1565114013349;
	Tue, 06 Aug 2019 10:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190805182453.30420-1-bunk@stusta.de>
	<CAMKF1sqH_1E-2KpyMBYs3r3iSdmjKBv9dM=yT9PP+t0DOqos1Q@mail.gmail.com>
	<20190806064312.GA12298@localhost>
In-Reply-To: <20190806064312.GA12298@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2019 10:53:06 -0700
Message-ID: <CAMKF1so2N_mJmXrOhNV3TYO97DtD0hHdNnYvxNowUXKydLgKWw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Tue, 06 Aug 2019 17:53:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 5, 2019 at 11:43 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Aug 05, 2019 at 12:13:14PM -0700, Khem Raj wrote:
> > On Mon, Aug 5, 2019 at 11:25 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > > index d442925ee..efcd5e42e 100644
> > > --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > > +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > > @@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
> > >
> > >  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
> > >
> > > -SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
> > > +SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
> >
> > perhaps use BP instead of wireshark-${PV}. Can you make that change as
> > well while you are here.
>
> I was aiming at a minimal change, since backporting to warrior is
> where it is urgently needed (can't build wireshark there right now).
>

sure, it could be a followup no issues.

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

