Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSDOb-0000Pr-8d for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 19:45:13 +0100
Received: from f053042178.adsl.alicedsl.de ([78.53.42.178]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSDN5-0007Wv-Sn for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 18:43:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1292246420-5969-1-git-send-email-m-watkins@ti.com>
References: <1292246420-5969-1-git-send-email-m-watkins@ti.com>
Date: Mon, 13 Dec 2010 19:43:39 +0100
Message-ID: <1292265819.4146.43.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] ti-pru-sw-examples: fix package run-time dependencies
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
X-List-Received-Date: Mon, 13 Dec 2010 18:45:14 -0000
X-Groupsio-MsgNum: 27127
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yVaVYZSwWOy27jXD1XYW"

--=-yVaVYZSwWOy27jXD1XYW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 13.12.2010, 07:20 -0600 schrieb Melissa Watkins:
> * This package depends on the ti-pru-sw-edma-driver and
>   kernel-module-uio-pru modules at run-tim.  Added these packages

tim*e*

>   to the RDEPENDS.
> * Bump PR
> * Update SRC_REV

SRCREV

> * Update COMPATIBLE_MACHINE

In all your four patches you update `SRCREV` and `COMPATIBLE_MACHINE`.
Could you please factor that out into separate patches. (At least next
time.)

I do not know anything about this program, but why is
`COMPATIBLE_MACHINE` changed? Was it incorrectly set from the beginning
or did something change upstream.

> Signed-off-by: Melissa Watkins <m-watkins@ti.com>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>
> ---
>  recipes/ti/ti-pru-sw-examples_1.00.00.bb |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
>  mode change 100755 =3D> 100644 recipes/ti/ti-pru-sw-examples_1.00.00.bb
>=20
> diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru=
-sw-examples_1.00.00.bb
> old mode 100755
> new mode 100644
> index a9239f8..02c3376
> --- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> @@ -1,14 +1,15 @@
>  DESCRIPTION =3D "PRU sw example applications"
>  HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
>  LICENSE =3D "BSD"
> -DEPENDS =3D "ti-pru-sw-app-loader ti-pru-sw-edma-library"
> -PR =3D "r0+svnr${SRCPV}"
> +DEPENDS +=3D "ti-pru-sw-app-loader ti-pru-sw-edma-library"
> +RDEPENDS +=3D "ti-pru-sw-edma-driver kernel-module-uio-pru"
> +PR =3D "r1+svnr${SRCPV}"
> =20
> -COMPATIBLE_MACHINE =3D "omapl138|am180x-evm"
> +COMPATIBLE_MACHINE =3D "omapl138"
> =20
>  SRC_URI =3D "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;proto=3Dhttp=
s;user=3Danonymous;pswd=3D''"
> =20
> -SRCREV =3D "18"
> +SRCREV =3D "20"
>  S =3D "${WORKDIR}/trunk"
> =20
>  do_compile () {


Thanks,

Paul

--=-yVaVYZSwWOy27jXD1XYW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0GaVsACgkQPX1aK2wOHVieaQCfdOgO609sY796CjPp6m/paOTI
W9YAoI0LemgDECfKG1KhjhS2qLa2iI1O
=3T0t
-----END PGP SIGNATURE-----

--=-yVaVYZSwWOy27jXD1XYW--
