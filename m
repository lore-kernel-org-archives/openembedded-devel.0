Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Py1Qi-0003xD-6M for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 13:26:52 +0100
Received: from f053042227.adsl.alicedsl.de ([78.53.42.227]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Py1PA-00016J-VQ for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 12:25:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103111138.38493.pgsellmann@portner-elektronik.at>
References: <201103111138.38493.pgsellmann@portner-elektronik.at>
Date: Fri, 11 Mar 2011 13:25:15 +0100
Message-ID: <1299846315.4137.48.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] gsoap_2.7.13 build errors
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
X-List-Received-Date: Fri, 11 Mar 2011 12:26:52 -0000
X-Groupsio-MsgNum: 30068
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tfJtzuTMVwaG7y3sH/6w"

--=-tfJtzuTMVwaG7y3sH/6w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Peter,


Am Freitag, den 11.03.2011, 11:38 +0100 schrieb Peter Gsellmann:
> There is a compiler error about an impossible cast from QUIRKS* to const =
QUIRKS*
> The patches are from Fedora12 which has the exact same gsoap-version
> They can be found at http://archive.fedoraproject.org/pub/archive/fedora/=
linux/releases/12/Everything/source/SRPMS/gsoap-2.7.13-2.fc12.src.rpm
>=20
> In the native package, the generated binary is installed in STAGING_BINDI=
R_NATIVE where expected by the gsoap-package
>=20
> Otherwise the gsoap-package uses a soapcpp2 delivered as 32bit-executable=
 in the source-package! This fails on x86_64 hosts.

smaller patches would it make easier to review in my opinion. (If it
were possible.)

On what did you test this patch?

> Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
> ---
>  recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch |   17 +++++
>  recipes/gsoap/gsoap-2.7.13/unused_args.patch       |   39 +++++++++++
>  .../gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch    |   72 ++++++++++++++=
++++++
>  recipes/gsoap/gsoap-native_2.7.13.bb               |    3 +-
>  recipes/gsoap/gsoap_2.7.13.inc                     |    4 +-
>  5 files changed, 133 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch
>  create mode 100644 recipes/gsoap/gsoap-2.7.13/unused_args.patch
>  create mode 100644 recipes/gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch

[=E2=80=A6]

> diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap-n=
ative_2.7.13.bb
> index 3e905e7..83c2329 100644
> --- a/recipes/gsoap/gsoap-native_2.7.13.bb
> +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
> @@ -6,8 +6,9 @@ EXTRA_OEMAKE =3D ""
> =20
>  inherit native
> =20
> +

Not needed?

>  do_install() {
> -	:
> +	install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
>  }
> =20
>=20
> diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.13.=
inc
> index 877e1d1..c3ab3c4 100644
> --- a/recipes/gsoap/gsoap_2.7.13.inc
> +++ b/recipes/gsoap/gsoap_2.7.13.inc
> @@ -3,7 +3,9 @@ for the development of SOAP Web Services and clients."
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz	\
> +	file://gsoap-2.7-openssl.patch	\

Use spaces instead of tabulators before =C2=BB\=C2=AB?

> +	file://unused_args.patch"

Maybe you can move the quote =C2=BB"=C2=AB on a new line, so that future pa=
tches
will not create a difference for that line.

>  inherit autotools


Thanks,

Paul

--=-tfJtzuTMVwaG7y3sH/6w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk16FKsACgkQPX1aK2wOHVjF5ACfeR+XoOYptRkDeGOwLc59b6IL
7OMAnRUzUXICXB9vQrRU53uiHG84JM/E
=Htcm
-----END PGP SIGNATURE-----

--=-tfJtzuTMVwaG7y3sH/6w--
