Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1K609r-0001kB-8a
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jun 2008 11:28:51 +0200
Received: (qmail invoked by alias); 10 Jun 2008 09:23:27 -0000
Received: from e179075021.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.179.75.21]
	by mail.gmx.net (mp031) with SMTP; 10 Jun 2008 11:23:27 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+bOjteeh6b8mzA0gr+fi3tm+qvkaK6urDOqtwzmV
	Tz/PlYeeC14htV
Message-ID: <484E480B.2000203@gmx.net>
Date: Tue, 10 Jun 2008 11:23:23 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080610003250.2784D189319@amethyst.openembedded.net>
In-Reply-To: <20080610003250.2784D189319@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Cc: "Dr. Mickey Lauer" <mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev bash <all> don't say a word... please
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 10 Jun 2008 09:28:51 -0000
X-Groupsio-MsgNum: 5340
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig80773B540D88E8B75AAB89FD"

--------------enig80773B540D88E8B75AAB89FD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mickey,
shouldn't PRs of affected recipes be increased?

Regards
Robert

mickeyl commit schrieb:
> bash <all> don't say a word... please
>=20
> Author: mickeyl@openembedded.org
> Branch: org.openembedded.dev
> Revision: e57c2aac5313ef7f2859dbe9a325d8705d5d3eef
> ViewMTN: http://monotone.openembedded.org/revision/info/e57c2aac5313ef7=
f2859dbe9a325d8705d5d3eef
> Files:
> 1
> packages/bash/bash.inc
> Diffs:
>=20
> #
> # mt diff -r6c0c420558d0944033e8e997ea6e77427fb31a24 -re57c2aac5313ef7f=
2859dbe9a325d8705d5d3eef
> #
> #
> #
> # patch "packages/bash/bash.inc"
> #  from [f80c48705dded15d54b89ec93792f02cdaa1de72]
> #    to [85c09d626fa7c301ecaee196dc6b1dcd78c764b1]
> #
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/bash/bash.inc	f80c48705dded15d54b89ec93792f02cdaa1de72
> +++ packages/bash/bash.inc	85c09d626fa7c301ecaee196dc6b1dcd78c764b1
> @@ -23,6 +23,7 @@ do_compile_prepend() {
> =20
>  do_compile_prepend() {
>  	cd builtins
> +	touch mkbuiltins.o
>  	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${S}/include -I${S} -o=
 mkbuiltins mkbuiltins.c
>  	cd ${S}
>  }
>=20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commit=
s
>=20



--------------enig80773B540D88E8B75AAB89FD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFITkgLG9cfwmwwEtoRCIZkAKCCOyYFub1SW+ZtDhQTD5HdaKY4iACeIc8p
8Zg+dekmdFjZYAyGkBfAd54=
=6YVg
-----END PGP SIGNATURE-----

--------------enig80773B540D88E8B75AAB89FD--
