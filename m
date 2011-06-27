Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QbI0N-0002OT-T1 for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:01:59 +0200
Received: from f053041087.adsl.alicedsl.de ([78.53.41.87]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QbHxC-0000kz-2B for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 19:58:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
	<0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
Date: Mon, 27 Jun 2011 21:58:19 +0200
Message-ID: <1309204699.21379.141.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [[meta-oe][PATCH 1/4] xf86-video-geode: add 2.11.12 version
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
X-List-Received-Date: Mon, 27 Jun 2011 20:02:00 -0000
X-Groupsio-MsgNum: 32849
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4TjnKl0Df1fqgGKNpFOY"

--=-4TjnKl0Df1fqgGKNpFOY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 27.06.2011, 19:38 +0000 schrieb Otavio Salvador:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../xorg-driver/xf86-video-geode_2.11.12.bb        |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.12.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.1=
2.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
> new file mode 100644
> index 0000000..d14d63e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
> @@ -0,0 +1,11 @@
> +require xorg-driver-video.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df8ad89d9d9a024f19d7dcc5acb044=
a42"
> +
> +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> +PE =3D "1"

please remove the `PE` line as I wrote already in the last review.

> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "a99c521db731c2f1df309057a8465e4c"
> +SRC_URI[sha256sum] =3D "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766=
089db1103b1c2d92"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"


Thanks,

Paul

--=-4TjnKl0Df1fqgGKNpFOY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4I4NsACgkQPX1aK2wOHViECwCeNoOg+jUP11d9pLSmqrdcuM1i
gfYAnip2vstnOsc7u5WVL51BXvwLqzK3
=40mj
-----END PGP SIGNATURE-----

--=-4TjnKl0Df1fqgGKNpFOY--
