Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZszn-0005ap-AV for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 00:03:12 +0200
Received: from f053033078.adsl.alicedsl.de ([78.53.33.78]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZszj-00033g-9N for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 22:02:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
References: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
Date: Sat, 17 Jul 2010 00:02:56 +0200
Message-ID: <1279317776.7632.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][CFT 1/3] libmpc: bump version and cleanup staging
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
X-List-Received-Date: Fri, 16 Jul 2010 22:03:39 -0000
X-Groupsio-MsgNum: 21072
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DhYCXzIgWonBby9DKI25"

--=-DhYCXzIgWonBby9DKI25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bernhard,


what does CFT stand for? =C2=BBCall for tender=C2=AB [1].

[1] http://acronyms.thefreedictionary.com/CFT

Am Freitag, den 16.07.2010, 23:49 +0200 schrieb Bernhard Reutner-Fischer:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/libmpc/libmpc-native_0.8.1.bb |    6 ------
>  recipes/libmpc/libmpc_0.8.1.bb        |    9 ++++-----
>  recipes/libmpc/libmpc_0.8.2.bb        |   11 +++++++++++
>  3 files changed, 15 insertions(+), 11 deletions(-)
>  delete mode 100644 recipes/libmpc/libmpc-native_0.8.1.bb
>  create mode 100644 recipes/libmpc/libmpc_0.8.2.bb
>=20
> diff --git a/recipes/libmpc/libmpc-native_0.8.1.bb b/recipes/libmpc/libmp=
c-native_0.8.1.bb
> deleted file mode 100644
> index 8ea0a3e..0000000
> --- a/recipes/libmpc/libmpc-native_0.8.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require libmpc_${PV}.bb
> -inherit native
> -DEPENDS =3D "mpfr-native gmp-native"
> -
> -SRC_URI[md5sum] =3D "5b34aa804d514cc295414a963aedb6bf"
> -SRC_URI[sha256sum] =3D "e664603757251fd8a352848276497a4c79b7f8b21fd8aedd=
5cc0598a38fee3e4"
> diff --git a/recipes/libmpc/libmpc_0.8.1.bb b/recipes/libmpc/libmpc_0.8.1=
.bb
> index f8b12b7..f79321c 100644
> --- a/recipes/libmpc/libmpc_0.8.1.bb
> +++ b/recipes/libmpc/libmpc_0.8.1.bb
> @@ -1,13 +1,12 @@
>  require libmpc.inc
> =20
>  DEPENDS =3D "gmp mpfr"
> -
> -SRC_URI =3D "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz=
"
>  S =3D "${WORKDIR}/mpc-${PV}"
> +NATIVE_INSTALL_WORKS =3D "1"
> +BBCLASSEXTEND =3D "native"
> +PR =3D "1"
> =20
> -do_stage() {
> -	autotools_stage_all
> -}
> +SRC_URI =3D "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz=
"

Maybe you can put `SRC_URI` also in `libmpc.inc`?

>  SRC_URI[md5sum] =3D "5b34aa804d514cc295414a963aedb6bf"
>  SRC_URI[sha256sum] =3D "e664603757251fd8a352848276497a4c79b7f8b21fd8aedd=
5cc0598a38fee3e4"
> diff --git a/recipes/libmpc/libmpc_0.8.2.bb b/recipes/libmpc/libmpc_0.8.2=
.bb
> new file mode 100644
> index 0000000..1d383fa
> --- /dev/null
> +++ b/recipes/libmpc/libmpc_0.8.2.bb
> @@ -0,0 +1,11 @@
> +require libmpc.inc
> +
> +DEPENDS =3D "gmp mpfr"
> +S =3D "${WORKDIR}/mpc-${PV}"
> +NATIVE_INSTALL_WORKS =3D "1"
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI =3D "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz=
"
> +
> +SRC_URI[md5sum] =3D "e98267ebd5648a39f881d66797122fb6"
> +SRC_URI[sha256sum] =3D "ae79f8d41d8a86456b68607e9ca398d00f8b7342d1d83bcf=
4428178ac45380c7"

Otherwise it looks fine.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-DhYCXzIgWonBby9DKI25
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxA1xAACgkQPX1aK2wOHVivHgCeOSFRaFYDkz57CigAn2B42baU
NikAn32mSD0tKQRJcvWg19ov3RLjKt5g
=guWq
-----END PGP SIGNATURE-----

--=-DhYCXzIgWonBby9DKI25--
