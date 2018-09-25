Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF4E37950E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:20:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q8-v6so14501884wmq.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fmdQT6fl+wfh37qWuUEzURISlIMAXPOcxBJTBqiYkEA=;
	b=p16slT11FUt+8FAP8lzFj3ThpR49NwQo0zjgOJxTVRqmKvC7e4Ne98+c7J2TOumapu
	yVuGYsEkz0yVSoIW6jrx9y9COOZqQmti9wUWFPngCjQNXexJGR+Sr+bE7v+NeY9VAqx0
	yHJqaAYOfkTxhMsiZ2JcL0KVHPxR8CcnrbqqqpessX2l2//m3oRHUgdqemL9x1FV3Boq
	YoQLIS/ynTAAMtKyApc6ofIa4klosPU1G53nhpIafn5bnCwiQ6z5cjHZuVk0pohaFrDM
	lJs56x0hEmfgRz1FF6t/ov4LUqUUCRNAiRRiXgopsPDekxeKkF61QDdTew9aPRobPB12
	rcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fmdQT6fl+wfh37qWuUEzURISlIMAXPOcxBJTBqiYkEA=;
	b=KkkscMOb3OTBm0jYI9JYjHZX+bK/X9FwmG/SriAb2bXFvRVy/sDeTZkKhjDbAyGj/7
	j5TSnBgQOzdqt0SwpJodNHg5yB17FM1dvWwmbet/+ikCywJ3D0BPBLgk2u/MwHRiaCm9
	ch5vatSQoHhzlhaEkR1CcEdgGvHdAG1VQqJcXORB071qF/3XFmFX9Ojz6RQxKGS4Xjul
	Cx5TEZr/gVjc7QeLdwr+3MeKzjYm5KN6czqC31iYlJxp5JD4zRs4OsVT/CgjY3SsPzBq
	uoKSpSLKJIn3WCRS4bsc1CuW9H4b+oBLdisxJ8YZOUdlMAVj5TGky7eh6g8TNXMI2hxY
	rjOw==
X-Gm-Message-State: ABuFfoicsalM3i8JDLzJ4pP4RG4DvlG+FFuFCmTGlwokyu+bA8hX22ax
	HI31/x7tQsv/Dy2OSo94rsc=
X-Google-Smtp-Source: ACcGV61t1kwMjnyzdlofuUjOosuzx3Wn41U7LqLpi4OxpYFaPIe55eCIXkvJsC7yCztapCb1jfvwHQ==
X-Received: by 2002:a1c:8bcc:: with SMTP id
	n195-v6mr1740048wmd.118.1537896006230; 
	Tue, 25 Sep 2018 10:20:06 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm1792484wrr.37.2018.09.25.10.20.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 10:20:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Sep 2018 19:20:06 +0200
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20180925172006.GC1431@jama>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
	<CA+chaQf=U8HMA1JeX5SwvXG=Ob8GSdsAyj3fj1OZcVHxDqjk3g@mail.gmail.com>
	<20180925102924.GA1431@jama>
	<CAP71Wjxn2Dezk1OB-6Ez+0PdWGiZuaanxbG+majNH74N6gq5aQ@mail.gmail.com>
	<20180925171016.GB1431@jama>
	<CAP71WjyD6rLuAuwBrPucj7coP56D9kDdnwMy=rC9xNNHiMFw4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjyD6rLuAuwBrPucj7coP56D9kDdnwMy=rC9xNNHiMFw4Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Sep 2018 17:20:06 -0000
X-Groupsio-MsgNum: 74706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline

--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 07:16:56PM +0200, Nicolas Dechesne wrote:
> On Tue, Sep 25, 2018 at 7:10 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > On Tue, Sep 25, 2018 at 03:05:19PM +0200, Nicolas Dechesne wrote:
> > > On Tue, Sep 25, 2018 at 12:29 PM Martin Jansa <martin.jansa@gmail.com=
> wrote:
> > > >
> > > > On Tue, Sep 25, 2018 at 12:24:31PM +0200, Martin Jansa wrote:
> > > > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > > >
> > > > > This causes another circular dependency which we don't want, does=
n't it?
> > >
> > > What are the issues with circular dependency? LAYERDEPENDS only lists
> > > each layers own dependencies, which is helpful for integrators to know
> > > which layer they need to pull into bblayers.conf. If all layers from
> > > LAYERDEPENDS are pulled in, then it is expected that each recipe will
> > > build fine.
> >
> > It prevents using these layers separately.
> >
> > Now people can include just meta-oe without meta-python (as long as they
> > fix or mask the python-protobuf dependency from protobuf-ptest - which
> > is a bug not a feature).
> >
> > If they have circular dependency then everybody using meta-oe will be
> > forced to use meta-python as well and then why should we keep them in
> > separate layers? It would be the same as adding all meta-python recipes
> > into meta-oe.
>=20
> It is not because there are circular dependencies that meta-oe
> requires meta-python, it is because of protobuf , it really depends on
> meta-python... I am tempted to agree with Paul, we should make the
> dependency explicitly optional using PACKAGECONFIG instead of
> requiring users to fix/mask it.

I meant circular dependency

meta-oe -> meta-python -> meta-oe

I agree with Paul as well, I was just saying that adding dependency on
meta-python to meta-oe doesn't make any sense.

> >
> > There was similar issue with meta-perl not so long time ago, before with
> > meta-multimedia and meta-networking.. so if we don't fix these issues
> > properly and just add more dependencies from meta-oe, then whole
> > meta-openembedded as a repository will became one layer soon.
>=20
> agreed. I think it's good to spot these issues and fix them as they come.
>=20
> >
> > > The only circular dependency that I am aware is with yocto-check-layer
> > > script , and I sent a patch yesterday to fix this issue. With this
> > > patch, yocto-check-layer works fine even when layers have inter
> > > dependencies.
> > >
> > > https://patchwork.openembedded.org/patch/155113/
> > >
> > > >
> > > > Especially if it's caused only by python-protobuf runtime dependenc=
y added in:
> > > >
> > > > https://patchwork.openembedded.org/patch/146867/
> > >
> > > yes. this is the culprit.
> > >
> > > >
> > > > > On Tue, Sep 25, 2018 at 11:44 AM Nicolas Dechesne <
> > > > > nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > > hi Armin,
> > > > > >
> > > > > > On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> > > > > > <nicolas.dechesne@linaro.org> wrote:
> > > > > > >
> > > > > > > On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail=
=2Ecom>
> > > > > > wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > > > > > > > > Hi Nicolas,
> > > > > > > > >
> > > > > > > > > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dec=
hesne wrote:
> > > > > > > > >> hi Armin, Paul, Richard,
> > > > > > > > >>
> > > > > > > > >> I was looking at getting the compliance report for meta-=
oe (sumo
> > > > > > > > >> branch), and I have found a few issues.
> > > > > > > > >>
> > > > > > > > >> * in meta-openembedded/sumo, grpc is in meta-oe layer, w=
hile it
> > > > > > > > >> depends on meta-networking (c-ares). It was fixes in mas=
ter, with
> > > > > > > > >> 251878e8b6b9 (grpc: move it from oe to networking layer)=
, so I think
> > > > > > > > >> this fix needs to be backported to sumo as well if we wa=
nt the YP
> > > > > > 2.0
> > > > > > > > >> compliance script to even work. If agreed, once merged, =
please let
> > > > > > me
> > > > > > > > >> know so that I can try again to generate a compliance re=
port.
> > > > > > > > > Is it appropriate to make such moves in a stable branch? =
I wouldn't
> > > > > > have
> > > > > > > > > thought so.
> > > > > > > > >
> > > > > > > >
> > > > > > > > We have to. Per my understanding and why I tried very hard =
to make
> > > > > > > > meta-openembedded clean ( appears I failed) is that if you =
want to be
> > > > > > > > Yocto Compliant and include any layer that does not pass th=
is test, you
> > > > > > > > can not become Yocto Compliant.
> > > > > > >
> > > > > > > I believe that we want meta-openembedded to be compliant, and=
 a good
> > > > > > > example in general. I will send a backport your way for this =
change.
> > > > > >
> > > > > > Running the compliance script on meta-oe turned out to be an
> > > > > > interesting exercise ;)
> > > > > >
> > > > > > I have found several issues, which I have mentioned in a few di=
fferent
> > > > > > threads, so I will summary here.
> > > > > >
> > > > > > * oe-core: fix the yocto-check-layer for dependency loop
> > > > > > * I have the following local commits in meta-oe:
> > > > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > > > > grpc: move it from oe to networking layer
> > > > > > meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
> > > > > >
> > > > > > With all changes above, the compliance script finds another iss=
ue with
> > > > > > meta-xfce:
> > > > > >
> > > > > > AssertionError: Adding layer meta-xfce changed signatures.
> > > > > > 7 signatures changed, initial differences (first hash before, s=
econd
> > > > > > after):
> > > > > >    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> > > > > > ec086472d75d663c2fe836b935517810
> > > > > >
> > > > > > This is definitely a violation of one our rule since adding met=
a-xfce
> > > > > > changed changes vim recipe.
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Or relax your rules!!!.
> > > > > > > >
> > > > > > > > - armin
> > > > > > > > >> * in order to run the compliance report, i locally added
> > > > > > > > >> networking-layer in meta-oe/conf/layer.conf, and it crea=
tes a
> > > > > > > > >> dependency loop since meta-oe <-> meta-networking. I fou=
nd out that
> > > > > > > > >> yocto-check-layer doesn't like that too much, and brutal=
ly fails.
> > > > > > The
> > > > > > > > >> following patch makes yocto-check-layer work again even =
with
> > > > > > > > >> dependency loop. I am going to do a few more tests and s=
end that
> > > > > > over
> > > > > > > > >> as a patch.
> > > > > > > > >>
> > > > > > > > >> diff --git a/scripts/lib/checklayer/__init__.py
> > > > > > > > >> b/scripts/lib/checklayer/__init__.py
> > > > > > > > >> index 2618416fab..0cc9bf3b6d 100644
> > > > > > > > >> --- a/scripts/lib/checklayer/__init__.py
> > > > > > > > >> +++ b/scripts/lib/checklayer/__init__.py
> > > > > > > > >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayer=
sconf,
> > > > > > layer,
> > > > > > > > >> layers, logger):
> > > > > > > > >>          logger.debug('Processing dependencies %s for la=
yer %s.' % \
> > > > > > > > >>                      (depends, layer['name']))
> > > > > > > > >>
> > > > > > > > >> +        # To avoid never ending recursion, we keep trac=
k of layers
> > > > > > while
> > > > > > > > >> +        # they are being processed in this 'static' att=
ribute.
> > > > > > > > >> +        if not hasattr(recurse_dependencies, "layers"):
> > > > > > > > >> +            recurse_dependencies.layers =3D []
> > > > > > > > >> +
> > > > > > > > >>          for depend in depends.split():
> > > > > > > > >>              # core (oe-core) is suppose to be provided
> > > > > > > > >>              if depend =3D=3D 'core':
> > > > > > > > >>                  continue
> > > > > > > > >>
> > > > > > > > >> +            if depend in recurse_dependencies.layers:
> > > > > > > > >> +                continue
> > > > > > > > >> +
> > > > > > > > >> +            recurse_dependencies.layers.append(depend)
> > > > > > > > >> +
> > > > > > > > >>              layer_depend =3D _find_layer_depends(depend=
, layers)
> > > > > > > > >>              if not layer_depend:
> > > > > > > > >>                  logger.error('Layer %s depends on %s an=
d isn\'t
> > > > > > found.' % \
> > > > > > > > > Patch looks reasonable to me FWIW.
> > > > > > > > >
> > > > > > > > > Cheers,
> > > > > > > > > Paul
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el
> > > > > >
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW6puRQAKCRA3VSO3ZXaA
HGccAKCNsR+yJZuF/S6TQH09dJSiJRZ/rgCfa1mQyaX+cjqEQBM7pCu2baLwyI0=
=2TbL
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
