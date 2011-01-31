Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pjova-0006tW-EW for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 09:16:02 +0100
Received: from f053033079.adsl.alicedsl.de ([78.53.33.79]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pjouk-0006BU-OL for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 08:15:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201101310012.51498.schnitzeltony@gmx.de>
References: <201101310012.51498.schnitzeltony@gmx.de>
Date: Mon, 31 Jan 2011 09:15:09 +0100
Message-ID: <1296461709.3922.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: libgles-omap3 fails
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
X-List-Received-Date: Mon, 31 Jan 2011 08:16:02 -0000
X-Groupsio-MsgNum: 28637
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-sqzgyjlQvG8qW3HGa8W6"

--=-sqzgyjlQvG8qW3HGa8W6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Montag, den 31.01.2011, 00:12 +0100 schrieb Andreas Mueller:
> I don't understand what's going on. When building libgles-omap3 I get
>=20
> [Superandi@localhost gumstix-oe]$ bitbake libgles-omap3

[=E2=80=A6]

> Parsing of 7118 .bb files complete (0 cached, 7118 parsed). 7430 targets,=
 320 skipped, 2 masked, 0 errors.
> ERROR: '['/home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/powervr-dr=
ivers/omap3-sgx-modules_1.4.14.2616.bb']' RDEPENDS/RRECOMMENDS or otherwise=
 requires the runtime entity 'kernel-2.6.32' but it wasn't found in any PAC=
KAGE or RPROVIDES variables
> ERROR: Required build target 'libgles-omap3' has no buildable providers.
> Missing or unbuildable dependency chain was: ['libgles-omap3', 'omap3-sgx=
-modules', 'kernel-2.6.32']
>=20
> Build Configuration:
> BB_VERSION        =3D "1.10.2"
> METADATA_BRANCH   =3D "oe.org.openembedded.dev"
> METADATA_REVISION =3D "aa479cd"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "overo"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2010.7-test-20110130"
> TARGET_FPU        =3D "hard"

[=E2=80=A6]

> I don't find affecting changes which could have broken this. Any good ide=
as?

It looks like the same problem as in [1] and should be fixed by commit
09d0669e [2].


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/02=
9355.html
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D09d0669=
ed914e810bb8bd6ce9275b7a4125bc8a0

--=-sqzgyjlQvG8qW3HGa8W6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1Gb4AACgkQPX1aK2wOHVjSJACfXNh2pok2uCZ+SzDXoX0bOEml
cmIAnjT72X60DD+olX8Yyugdu9a2b0Qj
=8XaZ
-----END PGP SIGNATURE-----

--=-sqzgyjlQvG8qW3HGa8W6--
