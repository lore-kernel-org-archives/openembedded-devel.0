Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Ki4Hx-0002H1-WE
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 11:34:34 +0200
Received: (qmail invoked by alias); 23 Sep 2008 09:30:59 -0000
Received: from e178113046.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.113.46]
	by mail.gmx.net (mp025) with SMTP; 23 Sep 2008 11:30:59 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19lNj4VjrllUsnRBCqnGMrBOrCIDVkXvnNkG9mmaz
	ijchIjtVMrpyH4
Message-ID: <48D8B75D.7030302@gmx.net>
Date: Tue, 23 Sep 2008 11:31:09 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080922205525.GA23908@rhein.zuhause.netz>
In-Reply-To: <20080922205525.GA23908@rhein.zuhause.netz>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.62
Subject: Re: Finer granularity for RSUGGEST
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
X-List-Received-Date: Tue, 23 Sep 2008 09:34:34 -0000
X-Groupsio-MsgNum: 5921
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig0D64451CFFFB6924A96D4DB1"

--------------enig0D64451CFFFB6924A96D4DB1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Henning Heinold schrieb:
> Hi,
>=20
> after fiddling with a filesystem kernel modul and his tools I noticed
> in package_ipk.bbclass that if we set RSUGGESTS Variable the suggest fi=
eld
> in the ipk is set for all packages even -doc -dbg -dev and self defined=

> packages.  I personal
> think is not a good choice and way. In my example the kernel module onl=
y needs
> to suggest the tools package. And with the old method the tools package=
 suggest
> it self.
>=20
> I have prepared a patch for ipk and deb that let us set:
>=20
> ${PN}_RSUGGESTS =3D mooo
I do not think this is a good idea. You can have the same effect just
now by doing

RSUGGEST_${PN} =3D "mooo"

Currently if you set a variable that affects the binary package you know
it will end up in all of the binary packages declared in PACKAGES. E.g.
MAINTAINER, DESCRIPTION, LICENSE and so on.

You can easily prevent this by doing:

PACKAGES =3D "${PN} ${PN}-data"

LICENSE =3D "GPLv2"
LICENSE_${PN}-data =3D "CC-BY-SA"

Or am I missing an important point here?

Regards
Robert


--------------enig0D64451CFFFB6924A96D4DB1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkjYt10ACgkQG9cfwmwwEtrEJwCfYn/YsJBg1HOcRvwTf3NStaSk
lrUAnigJSpAUWSooRfLhKXu+kND1a63j
=j56C
-----END PGP SIGNATURE-----

--------------enig0D64451CFFFB6924A96D4DB1--
