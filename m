Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9LSQ-0007XO-Rq
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 21:40:14 +0200
Received: by weyr6 with SMTP id r6so716275wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3Tvn+vDIXAce4G/EPCgZGq35Vy7zQIRUL/hUFZX1O7c=;
	b=X0p0k2bRVp7OmdQWUMVSkDyb9BZ28WgtgGuzdYp+WfN3ZM2sbl12Mt4DKoo0IyrQJE
	dhmZ2yoqJuoAoulCkvxTkJjYaW8XccvKYgCH/0t2pR7wAh75q09d7d2KEGUugjU5C4oQ
	vKDO0r3ntKPIRt79RLGynvze8PfIV3FmiCGe7FqoJQtNBX+DYAD9o6BAe6nrMY9CAleq
	sXb2ujXG2j8IWf5J0VHwO9QcII3UvpJdudGYDsB1OTWt9ywsLulBf6folYS1gBn6bDfT
	S9NWy5gWr5uDTEifCWH7e9TcwExBco0NU1AQ+o7ZA8trWhTwOJvNL+FYX5qBAumksTR8
	qy+Q==
Received: by 10.180.109.166 with SMTP id ht6mr40262355wib.11.1346873271389;
	Wed, 05 Sep 2012 12:27:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm141510wiv.11.2012.09.05.12.27.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 12:27:48 -0700 (PDT)
Date: Wed, 5 Sep 2012 21:28:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120905192818.GR3372@jama.jama.net>
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<1346853750-503-3-git-send-email-ml@communistcode.co.uk>
	<4375690.RKMBt9Sfd5@helios>
MIME-Version: 1.0
In-Reply-To: <4375690.RKMBt9Sfd5@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Wed, 05 Sep 2012 19:40:15 -0000
X-Groupsio-MsgNum: 40498
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BZziOT8Kz25R/m/E"
Content-Disposition: inline

--BZziOT8Kz25R/m/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2012 at 03:16:10PM +0100, Paul Eggleton wrote:
> On Wednesday 05 September 2012 15:02:30 ml@communistcode.co.uk wrote:
> > From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> >=20
> > - Now depends on liblockdev
> > - Slight licence change - new md5sum
> >=20
> > Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> > ---
> >  meta-oe/recipes-extended/libcec/libcec_git.bb | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb
> > b/meta-oe/recipes-extended/libcec/libcec_git.bb index 142b2e2..f3cb39e
> > 100644
> > --- a/meta-oe/recipes-extended/libcec/libcec_git.bb
> > +++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
> > @@ -1,14 +1,14 @@
> >  DESCRIPTION =3D "USB CEC Adaptor communication Library"
> >  HOMEPAGE =3D "http://libcec.pulse-eight.com/"
> >=20
> > -LICENSE =3D "GPLv2+"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D185ead350fec5fc223da0f65f9a=
802af"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5e8e16396992369f73f3d28875f=
846da"
> >=20
> > -DEPENDS =3D "udev"
> > +DEPENDS =3D "udev liblockdev"
> >=20
> >  PR =3D "r1"
> > -PV =3D "1.4.0"
> > -SRCREV =3D "2db8981f49fbd167ddbbf19c1fbadd064abc332a"
> > +PV =3D "1.8.2"
> > +SRCREV =3D "34a9cecdd92f6b2844f9c4054da202b152ab2217"
> >  SRC_URI =3D "git://github.com/Pulse-Eight/libcec.git"
> >=20
> >  S =3D "${WORKDIR}/git"
>=20
> It's not totally clear but it doesn't look like 1.8.2 has been released y=
et=20
> judging from their website; if that's the case then PV should be set to=
=20
> "1.8.1+git${SRCPV}".

Or rather
"1.8.1+gitr${SRCPV}"
like most meta-* recipes

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BZziOT8Kz25R/m/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBHp9IACgkQN1Ujt2V2gBx68wCgjwPYV+KVd+9ygrnX6/zVKq7W
OqMAn2eAmkWBNod+2fXZ2Yw6SXj6FOTq
=arX4
-----END PGP SIGNATURE-----

--BZziOT8Kz25R/m/E--
