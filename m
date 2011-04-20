Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCXqe-0006nl-1h for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 15:53:40 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCXot-0006nK-K8 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 13:51:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104201534.51856.pgsellmann@portner-elektronik.at>
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<201104201534.51856.pgsellmann@portner-elektronik.at>
Date: Wed, 20 Apr 2011 15:51:18 +0200
Message-ID: <1303307478.3979.60.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: orc 0.4.13 is out
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
X-List-Received-Date: Wed, 20 Apr 2011 13:53:40 -0000
X-Groupsio-MsgNum: 31370
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-sBv1LrWFYcaOD7ny6mRz"

--=-sBv1LrWFYcaOD7ny6mRz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning, dear Peter,


Am Mittwoch, den 20.04.2011, 15:34 +0200 schrieb Peter Gsellmann:
> Am Dienstag 19 April 2011, 11:33:44 schrieb Henning Heinold:

> > hm first email got to wrong mailinglist.
> >=20
> > So here its again:
> >=20
> > Hi,
> >=20
> > As of today orc 0.4.13 is out with the bugs fixed we hit.
> > So someone(maybee Paul) can make a new recipe.

I am sorry for the inconvenience. You were too fast. Thank you for
packaging it in f3dcc065 [1]. Unfortunately I did not get the
announcement from the GStreamer list. Freedesktop lists and GMX seem to
have delivery problems (since forever).

> Sorry, but this version breaks recipe schroedinger-1.0.9 for my build.
>=20
> schroorc.c: In function '_backup_orc_add2_rshift_add_s16_22_op':
> schroorc.c:93:3: error: 'int16_t' undeclared (first use in this function)
>=20
> full log on http://88.116.171.82/angstrom/files/log.do_compile.12189
>=20
> neither 0.4.12 nor 0.4.13 works, only 0.4.10
>=20
> Build Configuration:
> BB_VERSION        =3D "1.10.2"
> METADATA_BRANCH   =3D "master"
> METADATA_REVISION =3D "5fe98c8"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "pcontrol_g20"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "v20110420"
> TARGET_FPU        =3D "soft"

I am facing the same problem also for `MACHINE =3D "beagleboard"`.

> Look also into Dirac homepage http://diracvideo.org/
> There is a statement about orc 0.4.10
> I suspect schroedinger is bound to this specific version.

I tested building Schr=C3=B6dinger with Orc 0.4.11 and that seems to work. =
I
will send two patches in some minutes.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df3dcc06=
56e356104d9c5ea3abcbef0c3a2e0c1bb

--=-sBv1LrWFYcaOD7ny6mRz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2u5NYACgkQPX1aK2wOHViqBgCfTKnCIIM7bGXtSRqAWZnBgCKA
xa4Anjlq0URDMWpyaPT3/vl+qTvkdN9O
=AvOg
-----END PGP SIGNATURE-----

--=-sBv1LrWFYcaOD7ny6mRz--
