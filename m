Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UYHsk-00013f-5y
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 17:26:46 +0200
Received: by mail-ea0-f172.google.com with SMTP id r16so819699ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GVkt3T7uuIF+rwQToYCAj7pJ/Vdd1lNd7YEbh2yGKr8=;
	b=x4JSBUAFvBIcnwNTUYDhaubkGVI5wQBpUut+nNabqPEs7Y+eVr/io1IEw+znXUi/ES
	A0WKBe9MoLi1oab0ScJ2VzN0p3t5vy2AjK8dTJtug9giRY2WaXCHIfPF0o1e0GuR4PtH
	hbt3E1ZzsU2R77hZ440WyILoRnyzCKxtC8CHhY66HDzeP1MHMRcz/NR9c+MnXq5NSEtH
	pF50wdYWgum+2eSPn+fOhKfPpsFPAxBQihGbHeIoj/zDyeDP/b3FXXCbI7TZNv5viTB4
	F59h5IVrM6h47jabKBeBN0sCQ8L3SNxfD6LRbGr/QZSjRW663xcNjAaCXmcVQlWi4AuV
	KPlg==
X-Received: by 10.14.182.137 with SMTP id o9mr32334331eem.5.1367593731227;
	Fri, 03 May 2013 08:08:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj12sm16434676eeb.8.2013.05.03.08.08.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 08:08:50 -0700 (PDT)
Date: Fri, 3 May 2013 17:09:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130503150917.GB3187@jama>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
	<CAP71WjwFFivLQ1NaMtudjCZyv1D_Xtodf5utigWPACAg=OA5dw@mail.gmail.com>
	<2863767.6XU4RXlosl@helios>
MIME-Version: 1.0
In-Reply-To: <2863767.6XU4RXlosl@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 15:26:46 -0000
X-Groupsio-MsgNum: 44586
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2013 at 03:42:30PM +0100, Paul Eggleton wrote:
> On Friday 03 May 2013 16:30:17 Nicolas Dechesne wrote:
> > On Fri, May 3, 2013 at 4:10 PM, Koen Kooi <koen@dominion.thruhere.net>w=
rote:
> > > > I agree we should try to keep only one version of each recipe in
> > > > software
> > > > layers, however I figure it makes it easier for people to carry the=
ir
> > > > own
> > > > versions of recipes in distro layers (particularly older, which may=
 be
> > > > required in certain circumstances) if we do keep inc files where th=
ey
> > > > already exist.
> >
> > > Can people raise their hand if they want to have a different version =
of
> > > smartmontools in their layer?
> >=20
> > i think it would be nice to have a policy for that. i am going to send a
> > couple of recipes for new components, and it would be good to know what=
's
> > the agreed 'policy' for .inc file.=20
>=20
> We probably should have a stated policy, yes. AFAIK the current perhaps=
=20
> unstated policy is to keep the inc file if it existed in OE-Classic.

I don't have strong opinion about keeping/loosing .inc files, but
I've removed couple of .inc files when importing stuff from OE-Classic
in cases where .inc is relatively short (like in smartmontools).=20

I would keep .inc when it's reused in different recipes or really
long/complicated (like mesa.inc).

We also have policy that there is only one version per recipe if
possible.

> > in fact, it's not even clear to me why
> > have .inc file is easier to carry different version in distro layers. w=
ell
> > it's just a 'large' recipe to carry over..
>=20
> If you carry over the whole recipe rather than "require recipes-
> xyz/foo/foo.inc", then you won't get any improvements to the non-version-
> specific parts of the recipe when the base layer updates in the future.
>=20
> Alternatively if you "require recipes-xyz/foo/foo_6.5.bb" because there i=
s no=20
> .inc, then your recipe will definitely break the next time the recipe in =
the=20
> base layer is upgraded, plus you may have to override more parts of the r=
ecipe=20
> that are specific to a different version than the one you are building.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGD0x0ACgkQN1Ujt2V2gBx/zwCglcR7QS3xytmBON190thw4Vlq
Dx0An2gzE9G4xVHgI1rE9TmYqO4SQwii
=iO73
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
