Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGdJT-0000Eq-B1 for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 23:04:35 +0200
Received: from f053042198.adsl.alicedsl.de ([78.53.42.198]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGdDw-0006Pl-Lx for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 20:58:52 +0000
Message-ID: <1319057924.12686.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2011 22:58:44 +0200
In-Reply-To: <1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] Update checksums for binutils-2.20.1.tar.bz2
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
X-List-Received-Date: Wed, 19 Oct 2011 21:04:35 -0000
X-Groupsio-MsgNum: 34911
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-RVCBbT/WJZf41MEMU862"

--=-RVCBbT/WJZf41MEMU862
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ulf,


Am Mittwoch, den 19.10.2011, 17:10 +0200 schrieb ulf_samuelsson@telia.com:
> From: Ulf Samuelsson <ulf_samuelsson@telia.com>

again, please comply with our commit policy [1].

binutils: Update from 2.20.1 to 2.20.1a

> Tarball is updated to 2.20.1b so checksums have changed.

I am not aware of any binutils version 2.20.1b. Do you mean 2.20.1a?

Please create a new recipe since doing it this way the already
downloaded sources would be made invalid and archives on mirrors would
cause problems too.

Please see commit f4faecdb [2] as an example and take a look at the list
discussion [3].

> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@telia.com>
>=20
> ---
>  recipes/binutils/binutils_2.20.1.bb |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binut=
ils_2.20.1.bb
> index 5154e2d..0497675 100644
> --- a/recipes/binutils/binutils_2.20.1.bb
> +++ b/recipes/binutils/binutils_2.20.1.bb
> @@ -1,7 +1,7 @@
>  require binutils.inc
>  LICENSE =3D "GPLv3"
> =20
> -PR =3D "${INC_PR}.4"
> +PR =3D "${INC_PR}.5"
>  EXTRA_OECONF +=3D "--disable-werror"
> =20
>  #COMPATIBLE_TARGET_SYS =3D "."
> @@ -24,10 +24,11 @@ SRC_URI_append_nios2 =3D" \
>  	file://binutils-nios2.patch \
>  	"
> =20
> -SRC_URI[tarball.sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0=
800a7d53df906498afe6f6f8"
> -SRC_URI[tarball.md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> +SRC_URI[tarball.sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27=
397dc06281905d9717c8ed64"
> +SRC_URI[tarball.md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> =20
>  # powerpc patches
>  SRC_URI +=3D "\
>       file://binutils-2.16.1-e300c2c3.patch \
>       "
> +

Please remove the newly added line.


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy
[2] http://git.openembedded.org/openembedded/commit/?id=3Df4faecdbd0b7c83e5=
787735ef1495a34aca861e4
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/=
034885.html

--=-RVCBbT/WJZf41MEMU862
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6fOgUACgkQPX1aK2wOHVhcEwCfX6kDxLNipmi62oS7rXlB6MLX
wTMAmwfbYCRXBdv6NrKCi6th/UfKAlBn
=JmEm
-----END PGP SIGNATURE-----

--=-RVCBbT/WJZf41MEMU862--
