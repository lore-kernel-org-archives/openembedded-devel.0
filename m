Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUxZj-0006tt-TD for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 10:32:35 +0100
Received: from f053038019.adsl.alicedsl.de ([78.53.38.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUxTN-0005Zt-Cp for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 09:26:01 +0000
Message-ID: <1322472359.3637.13.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 10:25:59 +0100
In-Reply-To: <1322146025-21514-2-git-send-email-sledz@dresearch-fe.de>
References: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
	<1322146025-21514-2-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] gypsy: update to latest upstream version 0.8
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
X-List-Received-Date: Mon, 28 Nov 2011 09:32:36 -0000
X-Groupsio-MsgNum: 35674
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-tCM3p+5PIP6KGmsg5K4R"

--=-tCM3p+5PIP6KGmsg5K4R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 24.11.2011, 15:47 +0100 schrieb Steffen Sledz:
> Bug fixes, enhanced logging, a new debugging system, enhanced device
> discovery.
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/gypsy/gypsy.inc    |    2 ++
>  recipes/gypsy/gypsy_0.7.bb |    2 +-

Can this be removed after this upgrade?

>  recipes/gypsy/gypsy_0.8.bb |    6 ++++++
>  3 files changed, 9 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/gypsy/gypsy_0.8.bb
>=20
> diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
> index 964e336..6c7c942 100644
> --- a/recipes/gypsy/gypsy.inc
> +++ b/recipes/gypsy/gypsy.inc
> @@ -5,6 +5,8 @@ DEPENDS =3D "glib-2.0 dbus-glib bluez4 libxslt-native"
> =20
>  INC_PR =3D "r1"
> =20
> +SRC_URI =3D "http://gypsy.freedesktop.org/releases/${PN}-${PV}.tar.gz;na=
me=3Dgypsy"

Separate patch would have been nice.

> +
>  inherit autotools pkgconfig
> =20
>  do_configure_prepend () {
> diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
> index a10cd6e..c95f380 100644
> --- a/recipes/gypsy/gypsy_0.7.bb
> +++ b/recipes/gypsy/gypsy_0.7.bb
> @@ -2,7 +2,7 @@ require gypsy.inc
> =20
>  PR =3D "${INC_PR}.1"
> =20
> -SRC_URI =3D "http://gypsy.freedesktop.org/releases/gypsy-0.7.tar.gz;name=
=3Dgypsy \
> +SRC_URI +=3D " \
>             file://docs-reference-am.patch \
>             file://remove-werror.patch \
>  "
> diff --git a/recipes/gypsy/gypsy_0.8.bb b/recipes/gypsy/gypsy_0.8.bb
> new file mode 100644
> index 0000000..7c84ef9
> --- /dev/null
> +++ b/recipes/gypsy/gypsy_0.8.bb
> @@ -0,0 +1,6 @@
> +require gypsy.inc
> +
> +PR =3D "${INC_PR}.1"

`${INC_PR}.0` please.

> +
> +SRC_URI[gypsy.md5sum] =3D "32b8db24db86d2dac87b391dd255f4bf"
> +SRC_URI[gypsy.sha256sum] =3D "1986a58189614a950725c3bc7d05faa3b84695f35c=
b696326f340ef87fc3acaa"


Thanks,

Paul

--=-tCM3p+5PIP6KGmsg5K4R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7TU6cACgkQPX1aK2wOHVgi0wCfajogX+GpAoQJCye+JBRDvOUV
QjMAniAc3PnHJHB8Vw0QnMi48oEpOhx/
=F7EI
-----END PGP SIGNATURE-----

--=-tCM3p+5PIP6KGmsg5K4R--
