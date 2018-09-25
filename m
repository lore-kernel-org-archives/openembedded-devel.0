Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 31EBD744AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:29:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 206-v6so4896206wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 03:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=itXKvE5tkM+8jCGMEFuJBEiyX2ayoZkYJnlb08Utecc=;
	b=A2jwv7T0Qjbvy/EkFHiZ8SxLV+U1YQEon9IkLsXXoTf3nlhFOsDlz+uGLlbGSp+bIo
	JWgQIh2iosxj0+2M7CB8A1G/7y6c6ITgY7aqvKgr6YTRNGRZS65bGu7piCG9MFAY7j+/
	yv8NV6wAbccIqXIHKCnp7JEalccdDQ63Z6omhBSr4JvPnSiKqAz+kt3KavHLqQhM2a4p
	TTuG7vwbBhpM5ETf+Hqx9g29Dl0pmU8+wvxOOjAh8KIIBpGHtYPoPAt2mR+4CbKZ9FBo
	mdg/BXxORUCqd44kobJTa7j8412RuKZGhYMACeT5T+nUE0gXJMwsuhPHILODdE/MEcZW
	dBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=itXKvE5tkM+8jCGMEFuJBEiyX2ayoZkYJnlb08Utecc=;
	b=BFqxli7FBsYKcHLfr7MNjXjszIT0Ods4lzICPC1zXF71ofZnqYkDdCQYVRMJAu/e/X
	nAuENulSI0415FHiqd1sqzI461+g2LLeIPMGxXI0dne07zszU+KHDU0S1qae1VHDCHDy
	4yxaNcbVRbCjYl2jeDQ5A3gp1t3aGwTekY+JYvhAsWp3GGnVUlzZTSuP/XuMn/1oSN+J
	iFQsioFZj01MV/jwPMaz8b/t3/7phtPjbw/zJ9MDGPx06C2l3O/Jhwop4F5vUlVypJfT
	lHuqbwKgdqStKtOqaLmeHvENxvlwYIJq5P+B+wScaC5TBjD2k/gZCMfevqIjB1jzZgZ2
	y2VQ==
X-Gm-Message-State: ABuFfohI7y0OJz9mudishNc7okHnyoKXNw8XaLUY2IS+Qe7f0f/pb3ak
	9TKJX4nlJWzBX2GA8rHqtjwRErKU
X-Google-Smtp-Source: ACcGV63I3pJbBJe47UIyPnPmCEensaRTlanzX5R4otpcd+SEvO+eW4024D1c7SPkpB3/sYmLX+ix9g==
X-Received: by 2002:a1c:ac1:: with SMTP id 184-v6mr85419wmk.119.1537871364776; 
	Tue, 25 Sep 2018 03:29:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm2346006wmd.32.2018.09.25.03.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 03:29:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Sep 2018 12:29:24 +0200
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20180925102924.GA1431@jama>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
	<CA+chaQf=U8HMA1JeX5SwvXG=Ob8GSdsAyj3fj1OZcVHxDqjk3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQf=U8HMA1JeX5SwvXG=Ob8GSdsAyj3fj1OZcVHxDqjk3g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe and yocto-check-layer
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
X-List-Received-Date: Tue, 25 Sep 2018 10:29:24 -0000
X-Groupsio-MsgNum: 74695
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 12:24:31PM +0200, Martin Jansa wrote:
> > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
>=20
> This causes another circular dependency which we don't want, doesn't it?

Especially if it's caused only by python-protobuf runtime dependency added =
in:

https://patchwork.openembedded.org/patch/146867/

> On Tue, Sep 25, 2018 at 11:44 AM Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>=20
> > hi Armin,
> >
> > On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com>
> > wrote:
> > > >
> > > >
> > > >
> > > > On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > > > > Hi Nicolas,
> > > > >
> > > > > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wr=
ote:
> > > > >> hi Armin, Paul, Richard,
> > > > >>
> > > > >> I was looking at getting the compliance report for meta-oe (sumo
> > > > >> branch), and I have found a few issues.
> > > > >>
> > > > >> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
> > > > >> depends on meta-networking (c-ares). It was fixes in master, with
> > > > >> 251878e8b6b9 (grpc: move it from oe to networking layer), so I t=
hink
> > > > >> this fix needs to be backported to sumo as well if we want the YP
> > 2.0
> > > > >> compliance script to even work. If agreed, once merged, please l=
et
> > me
> > > > >> know so that I can try again to generate a compliance report.
> > > > > Is it appropriate to make such moves in a stable branch? I wouldn=
't
> > have
> > > > > thought so.
> > > > >
> > > >
> > > > We have to. Per my understanding and why I tried very hard to make
> > > > meta-openembedded clean ( appears I failed) is that if you want to =
be
> > > > Yocto Compliant and include any layer that does not pass this test,=
 you
> > > > can not become Yocto Compliant.
> > >
> > > I believe that we want meta-openembedded to be compliant, and a good
> > > example in general. I will send a backport your way for this change.
> >
> > Running the compliance script on meta-oe turned out to be an
> > interesting exercise ;)
> >
> > I have found several issues, which I have mentioned in a few different
> > threads, so I will summary here.
> >
> > * oe-core: fix the yocto-check-layer for dependency loop
> > * I have the following local commits in meta-oe:
> > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > grpc: move it from oe to networking layer
> > meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
> >
> > With all changes above, the compliance script finds another issue with
> > meta-xfce:
> >
> > AssertionError: Adding layer meta-xfce changed signatures.
> > 7 signatures changed, initial differences (first hash before, second
> > after):
> >    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> > ec086472d75d663c2fe836b935517810
> >
> > This is definitely a violation of one our rule since adding meta-xfce
> > changed changes vim recipe.
> >
> > >
> > > >
> > > > Or relax your rules!!!.
> > > >
> > > > - armin
> > > > >> * in order to run the compliance report, i locally added
> > > > >> networking-layer in meta-oe/conf/layer.conf, and it creates a
> > > > >> dependency loop since meta-oe <-> meta-networking. I found out t=
hat
> > > > >> yocto-check-layer doesn't like that too much, and brutally fails.
> > The
> > > > >> following patch makes yocto-check-layer work again even with
> > > > >> dependency loop. I am going to do a few more tests and send that
> > over
> > > > >> as a patch.
> > > > >>
> > > > >> diff --git a/scripts/lib/checklayer/__init__.py
> > > > >> b/scripts/lib/checklayer/__init__.py
> > > > >> index 2618416fab..0cc9bf3b6d 100644
> > > > >> --- a/scripts/lib/checklayer/__init__.py
> > > > >> +++ b/scripts/lib/checklayer/__init__.py
> > > > >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf,
> > layer,
> > > > >> layers, logger):
> > > > >>          logger.debug('Processing dependencies %s for layer %s.'=
 % \
> > > > >>                      (depends, layer['name']))
> > > > >>
> > > > >> +        # To avoid never ending recursion, we keep track of lay=
ers
> > while
> > > > >> +        # they are being processed in this 'static' attribute.
> > > > >> +        if not hasattr(recurse_dependencies, "layers"):
> > > > >> +            recurse_dependencies.layers =3D []
> > > > >> +
> > > > >>          for depend in depends.split():
> > > > >>              # core (oe-core) is suppose to be provided
> > > > >>              if depend =3D=3D 'core':
> > > > >>                  continue
> > > > >>
> > > > >> +            if depend in recurse_dependencies.layers:
> > > > >> +                continue
> > > > >> +
> > > > >> +            recurse_dependencies.layers.append(depend)
> > > > >> +
> > > > >>              layer_depend =3D _find_layer_depends(depend, layers)
> > > > >>              if not layer_depend:
> > > > >>                  logger.error('Layer %s depends on %s and isn\'t
> > found.' % \
> > > > > Patch looks reasonable to me FWIW.
> > > > >
> > > > > Cheers,
> > > > > Paul
> > > > >
> > > > >
> > > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW6oOAwAKCRA3VSO3ZXaA
HFCDAJ9vexP4xMKm39F2IkzgSf2NxXh7zQCgjzFKzO43/zeGJizB2JjKLSAsTPU=
=gq4R
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
