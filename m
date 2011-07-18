Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qiu7e-00050n-MS for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 22:08:58 +0200
Received: from f053040145.adsl.alicedsl.de ([78.53.40.145]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qiu4U-0001UI-L8 for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 20:05:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311018697.20601.2.camel@mattotaupa>
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
	<1311018697.20601.2.camel@mattotaupa>
Date: Mon, 18 Jul 2011 22:04:55 +0200
Message-ID: <1311019495.20601.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/3] calibrator: Move to latest SVN rev 138
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
X-List-Received-Date: Mon, 18 Jul 2011 20:08:58 -0000
X-Groupsio-MsgNum: 33213
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-u+koKDmkiIWfNgPPK6TZ"

--=-u+koKDmkiIWfNgPPK6TZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Raymond,


Am Montag, den 18.07.2011, 21:51 +0200 schrieb Paul Menzel:

> great to have you back!
>=20
> Am Montag, den 18.07.2011, 13:25 -0600 schrieb Raymond Danks:
> > * The SVN repository for this project has changed URI.
> > * Upgrade to and patch the latest version for use with current tools.

actually thinking about this, two patches would have been better. I will
split this patch up.

> >=20
> > Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> > ---
> >  recipes/calibrator/calibrator_svn.bb               |    6 +-
> >  .../calibrator/files/round_conflicting_types.patch |   91 ++++++++++++=
++++++++
> >  2 files changed, 95 insertions(+), 2 deletions(-)
> >  create mode 100644 recipes/calibrator/files/round_conflicting_types.pa=
tch
> >=20
> > diff --git a/recipes/calibrator/calibrator_svn.bb b/recipes/calibrator/=
calibrator_svn.bb
> > index bd7bb1f..60eeaf9 100644
> > --- a/recipes/calibrator/calibrator_svn.bb
> > +++ b/recipes/calibrator/calibrator_svn.bb
> > @@ -2,11 +2,13 @@ DESCRIPTION =3D "The Calibrator, a Cache-Memory and T=
LB Calibration Tool"
> >  HOMEPAGE =3D "http://monetdb.cwi.nl/Calibrator/"
> >  LICENSE =3D "AS IS"
> > =20
> > -SRCREV =3D "21"
> > +SRCREV =3D "138"
> >  PV =3D "0.9e+svnr${SRCPV}"
> >  PR =3D "r0"
> > =20
> > -SRC_URI =3D "svn://dev.bec-systems.com/svn/pub;module=3Dcalibrator;pro=
to=3Dhttp"
> > +SRC_URI =3D "\
> > +	svn://svn.bec-systems.com/pub;module=3Dcalibrator;proto=3Dhttp \
> > +	file://round_conflicting_types.patch"
>=20
> Maybe also put the last " on a new line to make future diffs smaller?
>=20
> >  inherit autotools
> > =20
> > diff --git a/recipes/calibrator/files/round_conflicting_types.patch b/r=
ecipes/calibrator/files/round_conflicting_types.patch
> > new file mode 100644
> > index 0000000..520c945
> > --- /dev/null
> > +++ b/recipes/calibrator/files/round_conflicting_types.patch
> > @@ -0,0 +1,91 @@
> > +round is a conflicting type ; rename to custom_round instead.
>=20
> Did you send that patch upstream?
>=20
> > +
> > +diff -urN calibrator.orig/calibrator.c calibrator/calibrator.c
> > +--- calibrator.orig/calibrator.c	2011-07-11 16:40:32.000000000 -0600
> > ++++ calibrator/calibrator.c	2011-07-11 16:44:22.333626120 -0600
> > +@@ -128,7 +128,7 @@
>=20
> [=E2=80=A6]
>=20
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I forgot to ask, do you have write/commit access to the Git repository?


Thanks,

Paul

--=-u+koKDmkiIWfNgPPK6TZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4kkecACgkQPX1aK2wOHVixMgCghVlCXjBMKv1XoVIM5egALF9i
3ksAmwSL5RbwsG1XXTubcAKbZTcU/syW
=/Z1l
-----END PGP SIGNATURE-----

--=-u+koKDmkiIWfNgPPK6TZ--
