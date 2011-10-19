Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGJkH-0005Ks-1O
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 02:10:57 +0200
Received: by eyd9 with SMTP id 9so1135981eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 17:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cVDZTkghcYzZtLPzXOMeAujkYoyFbzz1cPBFy3hsF4U=;
	b=ViqqEO3v/Y9+yjyYT5zTGWCiwUh328ct+8Wya/3mUpZlt6/oGSIrJbVOKjGdS/uPRt
	rEWjumZE+Gd8m6OyvWBwF/A158eVKbR7Uj1fzZRcJqg7QczZw/52dFtX1tAAl8OffQLq
	lph9bgWhh3dkz/7dIjQFo5OzDqcb2M85PcPls=
Received: by 10.223.81.205 with SMTP id y13mr7179721fak.34.1318982706555;
	Tue, 18 Oct 2011 17:05:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n18sm6367129fah.2.2011.10.18.17.05.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 17:05:05 -0700 (PDT)
Date: Wed, 19 Oct 2011 02:04:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111019000459.GA3522@jama.jama.net>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
	<20111018162433.GJ20678@jama.jama.net>
	<j7ka5s$ioi$1@dough.gmane.org>
	<20111018165107.GA17242@jama.jama.net>
	<j7kb44$pmd$1@dough.gmane.org> <20111018173948.GA556@jama.jama.net>
	<j7kjjv$ud8$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j7kjjv$ud8$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Wed, 19 Oct 2011 00:10:57 -0000
X-Groupsio-MsgNum: 34889
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 09:21:35PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 18-10-11 19:39, Martin Jansa schreef:
> > On Tue, Oct 18, 2011 at 06:56:36PM +0200, Koen Kooi wrote:
> >>> because of eglibc or uclibc?
> >>=20
> >> uclibc, the 'libc-glibc' override is true for both (e)glibc.
> >=20
> > Ah OK,
> >=20
> > -RDEPENDS_${PN}-test =3D "glibc-gconv-utf-16"=20
> > +RDEPENDS_${PN}-test_append_libc-glibc =3D "glibc-gconv-utf-16"
>=20
> The branch has a space after the first quote, right?

Not yet, but I'll add it.. but now it works without fine
Depends: liblightmediascanner0 (>=3D 0.4.4), libsqlite3-0 (>=3D 3.7.7.1), g=
libc-gconv-utf-16, libc6 (>=3D 2.14)
=20
> >=20
> > tested on nokia900 and done in branch
> >=20
> > Regards,
> >=20
> >=20
> >=20
> >=20
> > _______________________________________________ Openembedded-devel
> > mailing list Openembedded-devel@lists.openembedded.org=20
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFOndG/MkyGM64RGpERAsasAKCUMgJWC9EAxDVKVJRF3P5k3cC4AQCghk7g
> 9xAqFKNdmygRhd7vSRq2Yqs=3D
> =3DALWc
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6eFCsACgkQN1Ujt2V2gBxzIQCfdHTDQfaEn2gswTR990Ak+9dI
VYgAoI8wKxCH1FMjvLuQ9OvVQUoiRsWH
=T0rM
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
