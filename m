Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZ6ne-0002N4-U8 for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 20:35:19 +0200
Received: from f053035167.adsl.alicedsl.de ([78.53.35.167]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZ6nd-0006do-9h for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 18:35:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279130162-5731-1-git-send-email-raj.khem@gmail.com>
References: <1279130162-5731-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 14 Jul 2010 20:35:14 +0200
Message-ID: <1279132514.4939.6.camel@mattotaupa>
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
Subject: Re: [PATCH] gcc-configure-common.inc: Disable multilib generation.
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
X-List-Received-Date: Wed, 14 Jul 2010 18:35:19 -0000
X-Groupsio-MsgNum: 20970
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JUQmdMJR7w8UF2sifNbB"

--=-JUQmdMJR7w8UF2sifNbB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 14.07.2010, 10:56 -0700 schrieb Khem Raj:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/gcc/gcc-4.5.inc              |    3 +++
>  recipes/gcc/gcc-configure-common.inc |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index 19ab47b..c9b61a6 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -54,3 +54,6 @@ EXTRA_OECONF_INTERMEDIATE =3D "--disable-libmudflap --d=
isable-libgomp --disable-li
>  EXTRA_OECONF_append_linux-uclibc =3D " --disable-decimal-float "
>  EXTRA_OECONF_append_linux-uclibceabi =3D " --disable-decimal-float "
>  EXTRA_OECONF_append_linux-uclibcspe =3D " --disable-decimal-float "
> +
> +EXTRA_OECONF_append_sh4 =3D " -with-cpu=3Dsh4a --with-endian=3Dlittle --=
with-multilib-list=3Dnone "
> +TARGET_CC_ARCH_sh4 =3D ""
> diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-confi=
gure-common.inc
> index 892d684..bad70a4 100644
> --- a/recipes/gcc/gcc-configure-common.inc
> +++ b/recipes/gcc/gcc-configure-common.inc
> @@ -36,7 +36,7 @@ EXTRA_OECONF =3D "${@['--enable-clocale=3Dgeneric', '']=
[bb.data.getVar('USE_NLS', d,
>                  --enable-shared \
>                  --enable-languages=3D${LANGUAGES} \
>                  --enable-threads=3Dposix \
> -                --enable-multilib \
> +		--disable-multilib \
>                  --enable-c99 \
>                  --enable-long-long \
>                  --enable-symvers=3Dgnu \

Sorry. I do not know much about it. But what problem does this fix?


Thanks,

Paul

--=-JUQmdMJR7w8UF2sifNbB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw+A1wACgkQPX1aK2wOHVjOcACdFh3Vqs2RtZeKmpYQHg0Y5cIi
Pu4An12MnysEka65ejD9iPZDkI7+xglB
=Cqf/
-----END PGP SIGNATURE-----

--=-JUQmdMJR7w8UF2sifNbB--
