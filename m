Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROdle-0005qm-I1 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 00:10:46 +0100
Received: from g225081174.adsl.alicedsl.de ([92.225.81.174]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROdfk-0003xt-9d for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 23:04:40 +0000
Message-ID: <1320966270.21414.8.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:04:30 +0100
In-Reply-To: <CALJpqJx6SVr8TRPDaZFSvEWfs-uyjN_OMsrLxVfYo+RrLtCQcg@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1389840.j5gWQFZ9u1@helios>
	<D1FB05D7-71E3-4B22-8A8B-594B38FE09D1@microbee-systems.com>
	<CALJpqJx6SVr8TRPDaZFSvEWfs-uyjN_OMsrLxVfYo+RrLtCQcg@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Thu, 10 Nov 2011 23:10:46 -0000
X-Groupsio-MsgNum: 35320
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-MiP3ZOU+0tG68DnO4RUt"

--=-MiP3ZOU+0tG68DnO4RUt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.11.2011, 16:11 -0600 schrieb David Thomas:
> I have tried every possible way, 8 hours so far, to get this file to
> process these patches. I got the patches, I have set up local
> repositories, ad nasium and same response, unable to fetch from any
> source.
>=20
> I have tired every combination, I have tried every possible link, url,
>=20
> SRC_URI =3D "git:///home/twoods/local;protocol=3Dfile;branch=3Dmaster"
>=20
> git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit;file://smalls=
creen-fontsize.patch;patch=3D1
>=20
> and on and on. Every single project I have seen references the same
>=20
>=20
> SRC_URI =3D "svn://svn.o-hand.com/repos/matchbox/trunk;module=3D${PN};pro=
to=3Dhttp \
>=20
> I am at the point of hurling this machine out a window. How could this
> be so cryptic and difficult?
>=20
> Does anyone have a idea?
>=20
> DESCRIPTION =3D "Matchbox virtual keyboard for X11"
> LICENSE =3D "GPL"
> DEPENDS =3D "libfakekey expat libxft"
> RCONFLICTS =3D matchbox-keyboard-inputmethod
> RPROVIDES_${PN} =3D matchbox-keyboard-inputmethod
> SECTION =3D "x11"
> PV =3D "0.0+svnr${SRCPV}"
> PR =3D"r7"
>=20
> SRC_URI =3D "https://git.gitorious.org/cm-t3530/cm-t3530.git;protocol=3Dg=
it \
>            file://smallscreen-fontsize.patch;patch=3D1 \
>            file://2-Add-new-modifier--layout--Used-to-cycle-thru-all-avai=
lable-layouts.patch;patch=3D1
> \

Please turn off line wrapping.

>            file://3-Changes-to-improve-layout-rendering--especially-after=
-adding-support-for.patch;patch=3D1
> \
>            file://4-Add-rendering-debug-logging.patch;patch=3D1 \
>            file://5-Add-support-for-loading-multiple-independent-layouts.=
patch;patch=3D1
> \
>            file://6-Add-layout-switch-key-to-all-layouts.patch;patch=3D1 =
\
>           "

Where do you have these files stored?

> S =3D "${WORKDIR}/${PN}"
>=20
> inherit autotools pkgconfig gettext
>=20
> EXTRA_OECONF =3D "--disable-cairo"
>=20
> FILES_${PN} =3D "${bindir}/* \
> 	       ${datadir}/applications \
> 	       ${datadir}/pixmaps \
> 	       ${datadir}/matchbox-keyboard"


Thanks,

Paul

--=-MiP3ZOU+0tG68DnO4RUt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk68WH4ACgkQPX1aK2wOHViFSQCfWIt3B80umF4I2grDRf5Kl5nL
PJQAn2tHPLlJgH7C9iYLl57eJuBftITR
=tUtR
-----END PGP SIGNATURE-----

--=-MiP3ZOU+0tG68DnO4RUt--
