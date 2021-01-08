Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.442.1610086888699065513
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 22:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
X-Originating-IP: 88.162.151.131
Received: from [192.168.1.67] (unknown [88.162.151.131])
	(Authenticated sender: thomas.perrot@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 18688E0005;
	Fri,  8 Jan 2021 06:21:25 +0000 (UTC)
Message-ID: <588762a734ff5fb78471a17a4e10721f9018696a.camel@bootlin.com>
Subject: Re: [oe] [OE-core][PATCH] go.bbclass: don't stage test data with sources of dependencies
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>, tperrot <thomas.perrot@tupi.fr>, 
	openembedded-devel@lists.openembedded.org
Date: Fri, 08 Jan 2021 07:21:24 +0100
In-Reply-To: <0319ba44-3ac6-d21c-b483-4ce0dba17ff8@gmail.com>
References: <20210107180238.1866108-1-thomas.perrot@tupi.fr>
	 <0319ba44-3ac6-d21c-b483-4ce0dba17ff8@gmail.com>
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
X-Groupsio-MsgNum: 88610
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IRZh07lPE6gkufXHwQE8"

--=-IRZh07lPE6gkufXHwQE8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Thu, 2021-01-07 at 12:43 -0800, Khem Raj wrote:
> Hi Thomas
>=20
> This needs to go into openembedded-core mailing list.
>=20
Thank you and sorry for my mistake.

Best regards,
Thomas

> On 1/7/21 10:02 AM, tperrot wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > As for the sources the dependencies contain test data, ELF files
> > and other
> > binaries which aren't necessary for building and which lead to
> > unnecessary QA
> > warnings.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0 meta/classes/go.bbclass | 3 ++-
> > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index 5b26378a4e..fa147892b0 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -116,7 +116,8 @@ go_do_install() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -d ${D}${libdi=
r}/go/src/${GO_IMPORT}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tar -C ${S}/src/${GO_I=
MPORT} -cf - --exclude-vcs --exclude
> > '*.test' --exclude 'testdata' . | \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-s=
ame-
> > owner -xf -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tar -C ${B} -cf - --exclude=
-vcs pkg | tar -C
> > ${D}${libdir}/go --no-same-owner -xf -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tar -C ${B} -cf - --exclude=
-vcs --exclude '*.test' --
> > exclude 'testdata' pkg | \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0tar -C ${D}${libdir}/go --no-same-owner -xf -
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if [ -n "`ls ${B}/${GO=
_BUILD_BINDIR}/`" ]; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0install -d ${D}${bindir}
> >=20
> >=20
> >=20
> >=20
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-IRZh07lPE6gkufXHwQE8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAl/3+eQACgkQn8ALBXH+
Cu0zlQwApOQ8gm0y07hyh3z6eDFk1YB3+sSps3EDW+HLet495b4ggklVY2/nv1Ma
G2HoInjyQQN0XGiaqccwCxA/WWixjp8v0mm4+XZotrh//6H6nIXwUYEsNMXdziBN
hktUyvzyJR32QqCYV7MFyXQnRfnFkxu+R35+ZZEJ10gXUhoC/PckBckk1l0D5q2W
D8YM7PtjshZHvBvc5MeZOjK4PtjptQO0dSL9UzimlQKUyNYK1DF6FGot/qbPDu4t
sKXT45EBGaY4inItpa4oeSuJrg34bmlWcCfmlTF9CvwXN9r++nBCGO3OA5rrnRQ7
Gyh/+mPle5om0OCLZHCYoFqEnFXXSZhYQe7kFlL/DJAt5B2i8gsEKO17vMWZ8JIw
5C469Lk/57uzYsHf34vXuz5tkIowR+hsjirphiDD/cavyCFhvH0nfAqTvgJCqwmG
JHsROelDiBoFbWvrBuZdNZrt0KcWtk9+RDXUw5+UmQp5LbP7vqY4BgCLBWkXQ4oC
WCaRpMIL
=nV+C
-----END PGP SIGNATURE-----

--=-IRZh07lPE6gkufXHwQE8--
