Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RqLLo-0003eG-Uy
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 10:10:36 +0100
Received: by eaal12 with SMTP id l12so81468eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vPGd+ywZydUmsB/5+WokuFGpKlRQ7+/npTK13G1x+cU=;
	b=ICUjqNRXfOhiS+T29S1KoS1EnhecxK8M8YLjEl+78xvPe83Zwtvo7/2bf/YbyWTXEb
	1P80s29AsffjJXMWCmsKWndpyEiKI5+/RoRL3GVJtU0r0gU55JMrzP4h9zNZ7ik+KwMM
	B9OVoW+V0jUSq/E0GXRT35dpuohDe1h2OJL+Q=
Received: by 10.213.29.2 with SMTP id o2mr281853ebc.54.1327568569472;
	Thu, 26 Jan 2012 01:02:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm12822249eeb.4.2012.01.26.01.02.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 01:02:47 -0800 (PST)
Date: Thu, 26 Jan 2012 10:02:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120126090245.GB3747@jama.jama.net>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
	<CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Thu, 26 Jan 2012 09:10:37 -0000
X-Groupsio-MsgNum: 36706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 06:33:13PM +0100, Frans Meulenbroeks wrote:
> I like the idea of putting toolchains in a layer.
>=20
> Wrt DP =3D -1:
> I feel if a recipe needs DP =3D -1 it is not good enough to be added to
> meta-oe. Probably it is more something for an unstable layer.
> (and DP =3D -1 encourages the growth of deadwood; I still recall in OE th=
at
> there were some recipes that had the last 3 or 4 versions all with DP =3D=
 -1;
> let's try to avoid this in oe-core/meta-oe)

I'm not proposing to stash multiple versions of same recipe with D_P in
same layer.

What I'm missing is use-case when for example with libsoup-2.4 I'm
adding unstable version, because actually webkit-efl has random runtime
crashes with stable version, but works better with unstable one.

So I want to be able to add recipe with D_P =3D -1 which would say, that
this recipe is not used unless someone really wants and adds P_V to his
layer to get it (I guess people using browsers based on webkit-efl).

But right now it will pick this unstable version from meta-oe by default
and you have to add P_V for that stable version in oe-core (and keep it
up2date as long as stable version in oe-core is updated).

And I guess the same use-case D_P should be used for all "not so well
tested" or "deprecated" recipes in meta-oe or any other layer.

Even if there is meta-deprecated layer.. I guess nobody would prefer all
deprecated recipes, but just some of them (ideally by pinning them with
P_V).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8hFrUACgkQN1Ujt2V2gByVtgCdGz7fFo+xLLOGZNdU1HyMAxeV
vDkAn1c2X+tr7TIlzfgqLqp+3Ay3Fhgs
=V0yq
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
