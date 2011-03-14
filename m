Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pz7Ij-0003EM-JG for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 13:55:09 +0100
Received: from f053046215.adsl.alicedsl.de ([78.53.46.215]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pz7H9-0002Uf-2x for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 12:53:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103141214.25918.pgsellmann@portner-elektronik.at>
References: <201103111138.38493.pgsellmann@portner-elektronik.at>
	<1299846315.4137.48.camel@mattotaupa>
	<201103141214.25918.pgsellmann@portner-elektronik.at>
Date: Mon, 14 Mar 2011 13:53:29 +0100
Message-ID: <1300107209.4193.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] gsoap_2.7.13 build errors, amendment
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
X-List-Received-Date: Mon, 14 Mar 2011 12:55:09 -0000
X-Groupsio-MsgNum: 30181
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0Uf2SHj+fx1jUc2LL5gK"

--=-0Uf2SHj+fx1jUc2LL5gK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 14.03.2011, 12:14 +0100 schrieb Peter Gsellmann:

The commit summary could just say =C2=BBformatting=C2=AB or =C2=BBwhitespac=
e
fixes=C2=AB [1].

[1] http://openembedded.org/index.php/Styleguide

> [amendment to d641ae6bfd4303508c86db9285c2dcba28fb5474]
> recipes reformatted, removed tab characters
>=20
> Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
> ---
>  recipes/gsoap/gsoap-native_2.7.13.bb |    3 +--
>  recipes/gsoap/gsoap_2.7.13.inc       |    8 ++++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap-n=
ative_2.7.13.bb
> index 83c2329..cc323cb 100644
> --- a/recipes/gsoap/gsoap-native_2.7.13.bb
> +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
> @@ -6,9 +6,8 @@ EXTRA_OEMAKE =3D ""
> =20
>  inherit native
> =20
> -
>  do_install() {
> -	install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
> +    install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
>  }
> =20
>=20
> diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.13.=
inc
> index c3ab3c4..3771486 100644
> --- a/recipes/gsoap/gsoap_2.7.13.inc
> +++ b/recipes/gsoap/gsoap_2.7.13.inc
> @@ -3,9 +3,10 @@ for the development of SOAP Web Services and clients."
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz	\
> -	file://gsoap-2.7-openssl.patch	\
> -	file://unused_args.patch"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
> +        file://gsoap-2.7-openssl.patch \
> +        file://unused_args.patch \
> +        "
> =20
>  inherit autotools
> =20
> @@ -14,4 +15,3 @@ S =3D "${WORKDIR}/gsoap-2.7"
>  PARALLEL_MAKE =3D ""
> =20
>  EXTRA_OEMAKE =3D "SOAP=3D${STAGING_BINDIR_NATIVE}/soapcpp2"
> -

It is just formatting, so

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

--=-0Uf2SHj+fx1jUc2LL5gK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1+D8kACgkQPX1aK2wOHVjWYgCfYcNaEcA5zA5UL1skPtirf++b
A0kAnApPz8/IU7r8w5QoREGF/BtP6ss/
=v8QO
-----END PGP SIGNATURE-----

--=-0Uf2SHj+fx1jUc2LL5gK--
