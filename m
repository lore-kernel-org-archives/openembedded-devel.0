Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2AVp-0000JS-Tj for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 23:57:17 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2AU5-00031P-HB for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 22:55:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
Date: Tue, 22 Mar 2011 23:55:28 +0100
Message-ID: <1300834528.3825.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Tue, 22 Mar 2011 22:57:17 -0000
X-Groupsio-MsgNum: 30528
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4xNw+a715uPf1iWql4Ri"

--=-4xNw+a715uPf1iWql4Ri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 22.03.2011, 15:11 +0000 schrieb Otavio Salvador:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes/vlc/vlc_1.1.4.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
> index 6d4b877..18297c9 100644
> --- a/recipes/vlc/vlc_1.1.4.1.bb
> +++ b/recipes/vlc/vlc_1.1.4.1.bb
> @@ -5,14 +5,14 @@
> =20
>  require vlc.inc
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  SRC_URI[md5sum] =3D "ce17c335b38b322949694313173fcd49"
>  SRC_URI[sha256sum] =3D "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d36=
67c8e49696d7c2aa"
> =20
>  # ffmpeg from git (library version =3D> 52) is required
>  # libtool-native must be >=3D 2.2.4
> -DEPENDS +=3D "libdvdcss libdvdread lua5.1-native"
> +DEPENDS +=3D "libdvdcss libdvdread lua5.1-native lua5.1"
>  RDEPENDS_${PN} +=3D "lua5.1"
> =20
>  EXTRA_OECONF +=3D "\

What kind of error do you get? The recipe build fine for me using
`angstrom-2010.x` for `MACHINE =3D "beagleboard"`.


Thanks,

Paul

--=-4xNw+a715uPf1iWql4Ri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2JKNIACgkQPX1aK2wOHVimLACfTQhfCqVL1smj8Bq3aMlGCdXv
N+gAoIM85yg5L6lpybKyt0beg8Ltx4UB
=WhRg
-----END PGP SIGNATURE-----

--=-4xNw+a715uPf1iWql4Ri--
