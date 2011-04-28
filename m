Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFX0J-00011v-98 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 21:35:59 +0200
Received: from g225080101.adsl.alicedsl.de ([92.225.80.101]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFWyh-0002Is-NT for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 19:34:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DB82F84.3090407@cioinfoindus.fr>
References: <4DB82F84.3090407@cioinfoindus.fr>
Date: Thu, 28 Apr 2011 21:33:27 +0200
Message-ID: <1304019207.3911.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 2/2] python-numpy: add missing release dependencies
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
X-List-Received-Date: Thu, 28 Apr 2011 19:35:59 -0000
X-Groupsio-MsgNum: 31512
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BACuPcYW8lN0LErvwKCi"

--=-BACuPcYW8lN0LErvwKCi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


the same comments as to `[PATCH 1/2] mypaint: new recipe for version
0.9.1` apply hear to. Just a few remarks. I am in a hurry so please
excuse the brevity.


Am Mittwoch, den 27.04.2011, 17:00 +0200 schrieb Christian Charreyre:

[=E2=80=A6]

>   From 0ba53d830cbc429082244be68de367750b2f3702 Mon Sep 17 00:00:00 2001
> From: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> Date: Thu, 21 Apr 2011 16:26:38 +0200
> Subject: [PATCH] python-numpy: add missing release dependencies
> necessaries for mypaint

I think `RDEPENDS` stands for runtime dependencies.

What error message is mypaint throwing?

> Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> ---
>    recipes/python/python-numpy_1.1.1.bb |    2 ++
>    1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/python/python-numpy_1.1.1.bb
> b/recipes/python/python-numpy_1.1.1.bb
> index f5c23e0..9dda508 100644
> --- a/recipes/python/python-numpy_1.1.1.bb
> +++ b/recipes/python/python-numpy_1.1.1.bb
> @@ -4,6 +4,8 @@ PRIORITY =3D "optional"
>    LICENSE =3D "PSF"
>    PR =3D "ml0"
>=20
> +RDEPENDS_${PN} =3D "python-compiler python-pkgutil python-pydoc
> python-mmap python-unittest"

Please sort it also.

> +
>    SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
>               file://unbreak-assumptions.diff \
>           file://trycompile.diff \

Otherwise this looks good.


Thanks,

Paul

--=-BACuPcYW8lN0LErvwKCi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk25wQcACgkQPX1aK2wOHVieBgCdHbcnsbkdryzbMI277A9uKUgp
EZUAn2xruldx0Y4BaR4kop5fq7588zn3
=k3D7
-----END PGP SIGNATURE-----

--=-BACuPcYW8lN0LErvwKCi--
