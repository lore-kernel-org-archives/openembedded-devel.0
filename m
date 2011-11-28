Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUxKb-0006KA-Q6 for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 10:16:57 +0100
Received: from f053038019.adsl.alicedsl.de ([78.53.38.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUxEE-0005RV-Mt for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 09:10:23 +0000
Message-ID: <1322471415.3637.6.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 10:10:15 +0100
In-Reply-To: <1322470152-12440-1-git-send-email-sledz@dresearch-fe.de>
References: <1322470152-12440-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] live555: add version 2011.11.20
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
X-List-Received-Date: Mon, 28 Nov 2011 09:16:57 -0000
X-Groupsio-MsgNum: 35670
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-n0AvzdNBLtwskiA0uZLd"

--=-n0AvzdNBLtwskiA0uZLd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 28.11.2011, 09:49 +0100 schrieb Steffen Sledz:

Putting in here if and how you have tested this makes acknowledging
patches much easier!

Can the old recipe then removed? Could you also try to bring
`config.linux-cross` upstream, please?

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/live555/live555_20111120.bb |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/live555/live555_20111120.bb
>=20
> diff --git a/recipes/live555/live555_20111120.bb b/recipes/live555/live55=
5_20111120.bb
> new file mode 100644
> index 0000000..7256007
> --- /dev/null
> +++ b/recipes/live555/live555_20111120.bb
> @@ -0,0 +1,7 @@
> +require live555.inc
> +
> +PR =3D "${INC_PR}.1"

Please start with 0.

> +
> +SRC_URI[md5sum] =3D "8e5ebefdf7d12ca9cfd7175ff3d7eef2"
> +SRC_URI[sha256sum] =3D "695cf22d43516f082e26ee9eb8373a0ae3b4ed472f1e224b=
51d881219f694f2e"
> +

No new line at the end please. Git complains about that as white space
error too.


Thanks,

Paul

--=-n0AvzdNBLtwskiA0uZLd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7TT/cACgkQPX1aK2wOHVgtPQCdHtTQncP3qG9p0wzjFC1qqi1i
GQ0An1JGjFbiRNm/Ia6d7D8L6uRWgC1p
=JFKQ
-----END PGP SIGNATURE-----

--=-n0AvzdNBLtwskiA0uZLd--
