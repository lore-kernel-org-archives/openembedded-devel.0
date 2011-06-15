Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWmti-0000dZ-If for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 12:00:30 +0200
Received: from f053045092.adsl.alicedsl.de ([78.53.45.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWmrU-0005WZ-Ll for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 09:58:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
Date: Wed, 15 Jun 2011 11:57:04 +0200
Message-ID: <1308131824.4304.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [[meta-oe][PATCH 1/3] xf86-video-geode: add 2.11.12 version recipe
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
X-List-Received-Date: Wed, 15 Jun 2011 10:00:30 -0000
X-Groupsio-MsgNum: 32684
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9w/qiuVusSZ6oIGGrX2u"

--=-9w/qiuVusSZ6oIGGrX2u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Otavio,


Am Dienstag, den 14.06.2011, 16:49 +0000 schrieb Otavio Salvador:

1. You could leave out recipe from the commit summary.

=C2=BBAdd version 2.11.12=C2=AB should suffice.

2. Please add the necessary information to the commit message as
recommended in the commit message guidelines [1].

As far as I can see you imported this recipe from oe.dev.

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

Why is that needed? There are not colons in the version nor did the
versioning mess up [2] since it is an import.

> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "a99c521db731c2f1df309057a8465e4c"
> +SRC_URI[sha256sum] =3D "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766=
089db1103b1c2d92"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
[2] http://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Versi=
on

--=-9w/qiuVusSZ6oIGGrX2u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk34geEACgkQPX1aK2wOHVgcPgCfQy5kybxwhecyIqJxeD4vTa23
94IAn3vuhWU+WbgZScMSjtpKBbxSb5jA
=ak7c
-----END PGP SIGNATURE-----

--=-9w/qiuVusSZ6oIGGrX2u--
