Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RqS2b-0002TM-US
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 17:19:15 +0100
Received: by eekd41 with SMTP id d41so199759eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IArvSDELKlxA8UUlw7stLV8B6KuCgVnCSBSCpADaAHc=;
	b=M1T9Twr8MwKwjvIcwiKG7xS8aDWZlUj5mBpxp/Pi84LHJM5yTjHnrJ49nmGbUS05V6
	jyGtLyplgNHqll0mpCXhn7xboas+F6yKwDp/ECVH07GJt0POY6oCafUJFq9dCKGRHnxd
	P3bPyOvZzkc71GGNNHYR91wVgi9zeLE3I3R0k=
Received: by 10.14.101.78 with SMTP id a54mr932490eeg.86.1327594285753;
	Thu, 26 Jan 2012 08:11:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm16941661eeh.6.2012.01.26.08.11.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 08:11:24 -0800 (PST)
Date: Thu, 26 Jan 2012 17:11:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120126161123.GD3747@jama.jama.net>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
	<CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
	<20120126090245.GB3747@jama.jama.net>
	<CACW_hTaYzG9zF+SSWpBFWxQyNMciQqk2zSQ9KJpo+4xc8_H5KQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTaYzG9zF+SSWpBFWxQyNMciQqk2zSQ9KJpo+4xc8_H5KQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Jan 2012 16:19:15 -0000
X-Groupsio-MsgNum: 36713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2012 at 03:45:52PM +0100, Frans Meulenbroeks wrote:
> 2012/1/26 Martin Jansa <martin.jansa@gmail.com>
>=20
> > On Wed, Jan 25, 2012 at 06:33:13PM +0100, Frans Meulenbroeks wrote:
> > > I like the idea of putting toolchains in a layer.
> > >
> > > Wrt DP =3D -1:
> > > I feel if a recipe needs DP =3D -1 it is not good enough to be added =
to
> > > meta-oe. Probably it is more something for an unstable layer.
> > > (and DP =3D -1 encourages the growth of deadwood; I still recall in O=
E that
> > > there were some recipes that had the last 3 or 4 versions all with DP=
 =3D
> > -1;
> > > let's try to avoid this in oe-core/meta-oe)
> >
> > I'm not proposing to stash multiple versions of same recipe with D_P in
> > same layer.
> >
> > What I'm missing is use-case when for example with libsoup-2.4 I'm
> > adding unstable version, because actually webkit-efl has random runtime
> > crashes with stable version, but works better with unstable one.
> >
> > So I want to be able to add recipe with D_P =3D -1 which would say, that
> > this recipe is not used unless someone really wants and adds P_V to his
> > layer to get it (I guess people using browsers based on webkit-efl).
> >
> > But right now it will pick this unstable version from meta-oe by default
> > and you have to add P_V for that stable version in oe-core (and keep it
> > up2date as long as stable version in oe-core is updated).
> >
> > And I guess the same use-case D_P should be used for all "not so well
> > tested" or "deprecated" recipes in meta-oe or any other layer.
> >
> > Even if there is meta-deprecated layer.. I guess nobody would prefer all
> > deprecated recipes, but just some of them (ideally by pinning them with
> > P_V).
> >
> >
> > HI Martin,
>=20
> I understand your reasoning.
> My main concerns are:
> - you might end up with lots of versions and no one knows that is actually
> used (so it is difficult to clean it). We saw this in oe classic

I don't see this happening in oe-core or meta-oe, your grep proves it.

> - generally the reasons why a recipe has DP -1 are unclear. How would Joe
> Average know that if he is using webkit-efl he is better off using this n=
ew
> libsoup recipe?

Reading it about DP setting or in commit where I've added it?

> - and if a recipe is not well enough tested it should probably not end up
> in meta-oe anyway (but better e.g. in meta-oe-next or meta-oe-new or
> whatever you want to call the super bleeding edge version)

How will Joe Average know that because of webkit-efl he should enable
meta-efl-next (or
oe-core-next-libsoup-development-version-alpha-centauri-edition layer)=20
 if he doesn't even know what's happening in layers he is
using already (meta-efl for webkit-efl)?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8heysACgkQN1Ujt2V2gBwOzwCeOkfAwoQyjtkeD9vsXzHzP1yT
bY0An3XVNkqBn/ibgB94OD0Dap298aCZ
=vQeI
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
