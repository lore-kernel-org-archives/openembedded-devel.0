Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 162B579313
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:10:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id s12-v6so14274498wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=y2d7NXNplnSJwUIsR2r+n1JAqR18ci/MM4YeWfvDEG0=;
	b=hTF9cH4zqY/FFVs9nhNUttv6DfuVxjL8972uniWfBFK1O50IY7BVb9qn+UJudxYzYi
	fyaXsZLd1ILX2faRIWoV/JPtZquWxWaWp9hFSHoeB3fgOY2qM9kJoo3JeHAMk83NjLzY
	bsi1vWxguhIyLSKPvEakZAxXw2PYMUd68SQtahC5wTP9WDrXby9qqgYNZ8pDQUXA3DiK
	Tq7P9+jecrKC/35/mH0/I7aiVLh6WLCRyaulUwLcw373MtLZKhuQckNOQ64usS3AdHK5
	N3I6srekgu4qXaEgYsGZiKsNt0arUxlaLdrmeUPIA9sURi4Ff/8DA5+d0FPjPO2HqX9F
	gPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=y2d7NXNplnSJwUIsR2r+n1JAqR18ci/MM4YeWfvDEG0=;
	b=VLydoDgTKxzRJA/0cqzVbgM/IxnAWEqIesSPq7QbpGZHGhs5nv8rFv9tKDMh3BTwTH
	Yv/eCaPu9Sx53rEdd4+nf+6vMjC5kR1nz5UZDNcHaw3eQqlWrB7ETppmVbMaKrte31kn
	/TAF2P74rkEBNG6OQ1XYiVw78TFwEzrMMgWQQmcmTaNTnlL0ljmw4wmM7nahPjdnt8Z8
	rq6MwaQGjfNzCSnyc/aBmJIsaoloCFJDt8WZwA8KStPjPPqN8hgJxxV2mJWnxS+/AB+a
	/CoDOha0usivqQr+jDqWyH7DcsTC9XBwBaCLTtk02VChFZMzkIfkvZwAaJ0igccYIrNc
	BoVA==
X-Gm-Message-State: ABuFfoju51dwhJBwcSLuffOvzVcwB1kltdNlfTzyalBwWf0QL+rMY7yn
	rt4K/Xb98ZSxvBNYA6qv7Bg=
X-Google-Smtp-Source: ACcGV62IdtONujpkdh9nD8mZRJ/KgSfOVyV0eEX49kb5HYaQF+x+Cl9l1o6x/ofpKA8gn1HKhz8gRg==
X-Received: by 2002:a1c:b20b:: with SMTP id
	b11-v6mr1631980wmf.64.1537895416484; 
	Tue, 25 Sep 2018 10:10:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l12-v6sm2562809wrv.29.2018.09.25.10.10.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 10:10:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Sep 2018 19:10:16 +0200
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20180925171016.GB1431@jama>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
	<CA+chaQf=U8HMA1JeX5SwvXG=Ob8GSdsAyj3fj1OZcVHxDqjk3g@mail.gmail.com>
	<20180925102924.GA1431@jama>
	<CAP71Wjxn2Dezk1OB-6Ez+0PdWGiZuaanxbG+majNH74N6gq5aQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjxn2Dezk1OB-6Ez+0PdWGiZuaanxbG+majNH74N6gq5aQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Sep 2018 17:10:16 -0000
X-Groupsio-MsgNum: 74703
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 03:05:19PM +0200, Nicolas Dechesne wrote:
> On Tue, Sep 25, 2018 at 12:29 PM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > On Tue, Sep 25, 2018 at 12:24:31PM +0200, Martin Jansa wrote:
> > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > >
> > > This causes another circular dependency which we don't want, doesn't =
it?
>=20
> What are the issues with circular dependency? LAYERDEPENDS only lists
> each layers own dependencies, which is helpful for integrators to know
> which layer they need to pull into bblayers.conf. If all layers from
> LAYERDEPENDS are pulled in, then it is expected that each recipe will
> build fine.

It prevents using these layers separately.

Now people can include just meta-oe without meta-python (as long as they
fix or mask the python-protobuf dependency from protobuf-ptest - which
is a bug not a feature).

If they have circular dependency then everybody using meta-oe will be
forced to use meta-python as well and then why should we keep them in
separate layers? It would be the same as adding all meta-python recipes
into meta-oe.

There was similar issue with meta-perl not so long time ago, before with
meta-multimedia and meta-networking.. so if we don't fix these issues
properly and just add more dependencies from meta-oe, then whole
meta-openembedded as a repository will became one layer soon.

> The only circular dependency that I am aware is with yocto-check-layer
> script , and I sent a patch yesterday to fix this issue. With this
> patch, yocto-check-layer works fine even when layers have inter
> dependencies.
>=20
> https://patchwork.openembedded.org/patch/155113/
>=20
> >
> > Especially if it's caused only by python-protobuf runtime dependency ad=
ded in:
> >
> > https://patchwork.openembedded.org/patch/146867/
>=20
> yes. this is the culprit.
>=20
> >
> > > On Tue, Sep 25, 2018 at 11:44 AM Nicolas Dechesne <
> > > nicolas.dechesne@linaro.org> wrote:
> > >
> > > > hi Armin,
> > > >
> > > > On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> > > > <nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com>
> > > > wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > > > > > > Hi Nicolas,
> > > > > > >
> > > > > > > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesn=
e wrote:
> > > > > > >> hi Armin, Paul, Richard,
> > > > > > >>
> > > > > > >> I was looking at getting the compliance report for meta-oe (=
sumo
> > > > > > >> branch), and I have found a few issues.
> > > > > > >>
> > > > > > >> * in meta-openembedded/sumo, grpc is in meta-oe layer, while=
 it
> > > > > > >> depends on meta-networking (c-ares). It was fixes in master,=
 with
> > > > > > >> 251878e8b6b9 (grpc: move it from oe to networking layer), so=
 I think
> > > > > > >> this fix needs to be backported to sumo as well if we want t=
he YP
> > > > 2.0
> > > > > > >> compliance script to even work. If agreed, once merged, plea=
se let
> > > > me
> > > > > > >> know so that I can try again to generate a compliance report.
> > > > > > > Is it appropriate to make such moves in a stable branch? I wo=
uldn't
> > > > have
> > > > > > > thought so.
> > > > > > >
> > > > > >
> > > > > > We have to. Per my understanding and why I tried very hard to m=
ake
> > > > > > meta-openembedded clean ( appears I failed) is that if you want=
 to be
> > > > > > Yocto Compliant and include any layer that does not pass this t=
est, you
> > > > > > can not become Yocto Compliant.
> > > > >
> > > > > I believe that we want meta-openembedded to be compliant, and a g=
ood
> > > > > example in general. I will send a backport your way for this chan=
ge.
> > > >
> > > > Running the compliance script on meta-oe turned out to be an
> > > > interesting exercise ;)
> > > >
> > > > I have found several issues, which I have mentioned in a few differ=
ent
> > > > threads, so I will summary here.
> > > >
> > > > * oe-core: fix the yocto-check-layer for dependency loop
> > > > * I have the following local commits in meta-oe:
> > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > > grpc: move it from oe to networking layer
> > > > meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
> > > >
> > > > With all changes above, the compliance script finds another issue w=
ith
> > > > meta-xfce:
> > > >
> > > > AssertionError: Adding layer meta-xfce changed signatures.
> > > > 7 signatures changed, initial differences (first hash before, second
> > > > after):
> > > >    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> > > > ec086472d75d663c2fe836b935517810
> > > >
> > > > This is definitely a violation of one our rule since adding meta-xf=
ce
> > > > changed changes vim recipe.
> > > >
> > > > >
> > > > > >
> > > > > > Or relax your rules!!!.
> > > > > >
> > > > > > - armin
> > > > > > >> * in order to run the compliance report, i locally added
> > > > > > >> networking-layer in meta-oe/conf/layer.conf, and it creates a
> > > > > > >> dependency loop since meta-oe <-> meta-networking. I found o=
ut that
> > > > > > >> yocto-check-layer doesn't like that too much, and brutally f=
ails.
> > > > The
> > > > > > >> following patch makes yocto-check-layer work again even with
> > > > > > >> dependency loop. I am going to do a few more tests and send =
that
> > > > over
> > > > > > >> as a patch.
> > > > > > >>
> > > > > > >> diff --git a/scripts/lib/checklayer/__init__.py
> > > > > > >> b/scripts/lib/checklayer/__init__.py
> > > > > > >> index 2618416fab..0cc9bf3b6d 100644
> > > > > > >> --- a/scripts/lib/checklayer/__init__.py
> > > > > > >> +++ b/scripts/lib/checklayer/__init__.py
> > > > > > >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayerscon=
f,
> > > > layer,
> > > > > > >> layers, logger):
> > > > > > >>          logger.debug('Processing dependencies %s for layer =
%s.' % \
> > > > > > >>                      (depends, layer['name']))
> > > > > > >>
> > > > > > >> +        # To avoid never ending recursion, we keep track of=
 layers
> > > > while
> > > > > > >> +        # they are being processed in this 'static' attribu=
te.
> > > > > > >> +        if not hasattr(recurse_dependencies, "layers"):
> > > > > > >> +            recurse_dependencies.layers =3D []
> > > > > > >> +
> > > > > > >>          for depend in depends.split():
> > > > > > >>              # core (oe-core) is suppose to be provided
> > > > > > >>              if depend =3D=3D 'core':
> > > > > > >>                  continue
> > > > > > >>
> > > > > > >> +            if depend in recurse_dependencies.layers:
> > > > > > >> +                continue
> > > > > > >> +
> > > > > > >> +            recurse_dependencies.layers.append(depend)
> > > > > > >> +
> > > > > > >>              layer_depend =3D _find_layer_depends(depend, la=
yers)
> > > > > > >>              if not layer_depend:
> > > > > > >>                  logger.error('Layer %s depends on %s and is=
n\'t
> > > > found.' % \
> > > > > > > Patch looks reasonable to me FWIW.
> > > > > > >
> > > > > > > Cheers,
> > > > > > > Paul
> > > > > > >
> > > > > > >
> > > > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW6pr9wAKCRA3VSO3ZXaA
HFyRAJwN75a6xBqd6toXLBVq9QzoTZkJ3wCfRfUgdZ6ipGzq1jdsnCkymx56Lno=
=yVhC
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
