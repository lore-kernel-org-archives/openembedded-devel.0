Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHCEn-0002mf-Jp for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 12:22:05 +0200
Received: from f053040166.adsl.alicedsl.de ([78.53.40.166]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHC9I-00064c-DN for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 10:16:24 +0000
Message-ID: <1319192173.3766.16.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 12:16:13 +0200
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] 2011.03-maintenance: Bad checksums in binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 10:22:05 -0000
X-Groupsio-MsgNum: 34946
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-dbEiFWPZ6hDiwlGrD7hs"

--=-dbEiFWPZ6hDiwlGrD7hs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mats,


Am Freitag, den 21.10.2011, 06:42 +0000 schrieb Mats K=C3=A4rrman:

> My first patch, please be gentle if i did something wrong ;)

our commit policy describes how patches should be formatted [1][2]. Most
importantly you forgot your Signed-off-by line.

> The following patch is from a local branch tracking
> 2011.03-maintenance, should it be done different?

If I read [3] correctly it first has to go into for example the master
branch. I pushed a similar hopefully correct change there [4]. Please
send a pull request as described in [3] to get that included in
2011.03-maintenance.

> The binutils_2.18 tarball from GNU has changed checksums, ref. to this<ht=
tp://git.openembedded.org/openembedded/commit/recipes/binutils/binutils_2.1=
8.bb?h=3D2011.03-maintenance&id=3Dbc8ddbf7944f82383936d88379619aa46c3954a2>
> As binutils-cross-sdk_2.18.bb includes binutils_2.18.bb it does not need =
to specify its own checksums.
>=20
> diff --git a/recipes/binutils/binutils-cross-sdk_2.18.bb b/recipes/binuti=
ls/binutils-cross-sdk_2.18.bb
> index 837ebbe..2f13b26 100644
> --- a/recipes/binutils/binutils-cross-sdk_2.18.bb
> +++ b/recipes/binutils/binutils-cross-sdk_2.18.bb
> @@ -1,6 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-sdk.inc
>  PR =3D "${INC_PR}.1"
> -
> -SRC_URI[md5sum] =3D "9d22ee4dafa3a194457caf4706f9cf01"
> -SRC_URI[sha256sum] =3D "487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b656=
32b6c945e961ee9b"


Thanks and I am looking forward to further contributions,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy
[2] http://www.openembedded.org/wiki/Category:Policy
[3] http://www.openembedded.org/wiki/2011.03-maintenance
[4] http://git.openembedded.org/openembedded/commit/?id=3Df2d53aa074d765093=
84e7bb8a9c39e2e27210f4a

--=-dbEiFWPZ6hDiwlGrD7hs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6hRm0ACgkQPX1aK2wOHVhzUgCeMvzLnRpmjjvokpHSAfw0DhA9
lh0AniIJvRUkl5WGx+jKK2/i2zc76tYW
=NJUT
-----END PGP SIGNATURE-----

--=-dbEiFWPZ6hDiwlGrD7hs--
