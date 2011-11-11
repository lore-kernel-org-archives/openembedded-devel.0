Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROlfH-0007Hw-CH for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 08:36:43 +0100
Received: from f053039250.adsl.alicedsl.de ([78.53.39.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROlZN-0005FT-BQ for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 07:30:37 +0000
Message-ID: <1320996619.7415.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 08:30:19 +0100
In-Reply-To: <18E8B061-C5E9-48CE-93CF-94642D94339A@microbee-systems.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1389840.j5gWQFZ9u1@helios>
	<D1FB05D7-71E3-4B22-8A8B-594B38FE09D1@microbee-systems.com>
	<CALJpqJx6SVr8TRPDaZFSvEWfs-uyjN_OMsrLxVfYo+RrLtCQcg@mail.gmail.com>
	<1320966270.21414.8.camel@mattotaupa>
	<18E8B061-C5E9-48CE-93CF-94642D94339A@microbee-systems.com>
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
X-List-Received-Date: Fri, 11 Nov 2011 07:36:43 -0000
X-Groupsio-MsgNum: 35323
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-LL/7veWnxdGNtqEI+ZuC"

--=-LL/7veWnxdGNtqEI+ZuC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.11.2011, 21:17 -0600 schrieb David Thomas:
> On Nov 10, 2011, at 5:04 PM, Paul Menzel wrote:
>=20
> > Am Donnerstag, den 10.11.2011, 16:11 -0600 schrieb David Thomas:
> >> I have tried every possible way, 8 hours so far, to get this file to
> >> process these patches. I got the patches, I have set up local
> >> repositories, ad nasium and same response, unable to fetch from any
> >> source.
> >>=20
> >> I have tired every combination, I have tried every possible link, url,
> >>=20
> >> SRC_URI =3D "git:///home/twoods/local;protocol=3Dfile;branch=3Dmaster"
> >>=20
> >> git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit;file://sma=
llscreen-fontsize.patch;patch=3D1
> >>=20
> >> and on and on. Every single project I have seen references the same
> >>=20
> >>=20
> >> SRC_URI =3D "svn://svn.o-hand.com/repos/matchbox/trunk;module=3D${PN};=
proto=3Dhttp \
> >>=20
> >> I am at the point of hurling this machine out a window. How could this
> >> be so cryptic and difficult?
> >>=20
> >> Does anyone have a idea?
> >>=20
> >> DESCRIPTION =3D "Matchbox virtual keyboard for X11"
> >> LICENSE =3D "GPL"
> >> DEPENDS =3D "libfakekey expat libxft"
> >> RCONFLICTS =3D matchbox-keyboard-inputmethod
> >> RPROVIDES_${PN} =3D matchbox-keyboard-inputmethod
> >> SECTION =3D "x11"
> >> PV =3D "0.0+svnr${SRCPV}"
> >> PR =3D"r7"
> >>=20
> >> SRC_URI =3D "https://git.gitorious.org/cm-t3530/cm-t3530.git;protocol=
=3Dgit \
> >>           file://smallscreen-fontsize.patch;patch=3D1 \
> >>           file://2-Add-new-modifier--layout--Used-to-cycle-thru-all-av=
ailable-layouts.patch;patch=3D1\
> >>           file://3-Changes-to-improve-layout-rendering--especially-aft=
er-adding-support-for.patch;patch=3D1 \
> >>           file://4-Add-rendering-debug-logging.patch;patch=3D1 \
> >>           file://5-Add-support-for-loading-multiple-independent-layout=
s.patch;patch=3D1 \
> >>           file://6-Add-layout-switch-key-to-all-layouts.patch;patch=3D=
1 \
> >>          "
> >=20
> > Where do you have these files stored?
>=20
>      $OEBASE/sources or /home/twoods/sources

You have to put them in the recipe folder under `files`, which is
deprecated, or cm-t3530-=E2=80=A6 like here.

        recipes/vdr$ ls -r
        vdr.inc
        vdr_1.7.16.bb
       =20
        vdr-1.7.16:
        0003-uclibc-Add-lintl-to-LIBS.patch  0001-Makefile-Pass-LDFLAGS.pat=
ch
        0002-tools.h-include-stdarg.h.patch

This is even in the manual I think and you have plenty of examples in
the repository already.

[=E2=80=A6]


Thanks,

Paul

--=-LL/7veWnxdGNtqEI+ZuC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk68zwwACgkQPX1aK2wOHVjvFwCfeZ6XT2UzCrKlVQeRG1euFaAK
PcUAn2cN90pY4CUfZd3dHzPBPpmaVBKi
=0FMF
-----END PGP SIGNATURE-----

--=-LL/7veWnxdGNtqEI+ZuC--
