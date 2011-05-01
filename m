Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGTeR-0008P5-Ng for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 12:13:19 +0200
Received: from f053032032.adsl.alicedsl.de ([78.53.32.32]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGTct-0001Ll-Dn for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 10:11:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304243449-12028-2-git-send-email-heroor@ti.com>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<1304243449-12028-2-git-send-email-heroor@ti.com>
Date: Sun, 01 May 2011 12:10:45 +0200
Message-ID: <1304244645.23614.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 2/2] zeromq: Add version 2.1.6
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
X-List-Received-Date: Sun, 01 May 2011 10:13:19 -0000
X-Groupsio-MsgNum: 31538
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XmCkUvVp7P3vY6BrfN0k"

--=-XmCkUvVp7P3vY6BrfN0k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 01.05.2011, 15:20 +0530 schrieb Siddharth Heroor:

What distribution and machine did you use for testing?

> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/zeromq/zeromq_2.1.6.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/zeromq/zeromq_2.1.6.bb
>=20
> diff --git a/recipes/zeromq/zeromq_2.1.6.bb b/recipes/zeromq/zeromq_2.1.6=
.bb
> new file mode 100644
> index 0000000..f88f512
> --- /dev/null
> +++ b/recipes/zeromq/zeromq_2.1.6.bb
> @@ -0,0 +1,4 @@
> +require zeromq.inc

Please add `PR =3D ${INC_PR}.0`.

> +
> +SRC_URI[md5sum] =3D "77b9ca20e8f2426874022080f41d7b0b"
> +SRC_URI[sha256sum] =3D "a1bbb352a9dbf34b18a3999b22a8db2d51e4a52508d09852=
8d771811533f9fd0"

You can also squash your two patches (`git rebase -i HEAD~2`) since the
include file by itself cannot not be used.


Thanks,

Paul

--=-XmCkUvVp7P3vY6BrfN0k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk29MaUACgkQPX1aK2wOHVi5ggCff4WpvNzKOrptPHiz1pFrIHzx
D8AAmwXncR08UM7zq8zlymiDhaoBw7T/
=FRj2
-----END PGP SIGNATURE-----

--=-XmCkUvVp7P3vY6BrfN0k--
