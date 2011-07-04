Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qdeyp-0002kX-C5 for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 10:58:11 +0200
Received: from g225080152.adsl.alicedsl.de ([92.225.80.152]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QdevO-0006zV-Vn for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 08:54:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309768279-4797-2-git-send-email-sledz@dresearch-fe.de>
References: <1309454880.4401.32.camel@mattotaupa>
	<1309768279-4797-2-git-send-email-sledz@dresearch-fe.de>
Date: Mon, 04 Jul 2011 10:54:23 +0200
Message-ID: <1309769664.4472.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2 2/2] ppp-2.4.5: remove `DP = "-1"`
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
X-List-Received-Date: Mon, 04 Jul 2011 08:58:11 -0000
X-Groupsio-MsgNum: 32972
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FmXnaFUSOS/crc6MMEzX"

--=-FmXnaFUSOS/crc6MMEzX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 04.07.2011, 10:31 +0200 schrieb Steffen Sledz:
> Oe-core is using 2.4.5 and it works OK there.
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/ppp/ppp_2.4.5.bb |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
> index 883b695..faab816 100644
> --- a/recipes/ppp/ppp_2.4.5.bb
> +++ b/recipes/ppp/ppp_2.4.5.bb
> @@ -3,9 +3,7 @@ DESCRIPTION =3D "Point-to-Point Protocol (PPP) daemon"
>  HOMEPAGE =3D "http://samba.org/ppp/"
>  DEPENDS =3D "libpcap"
>  LICENSE =3D "BSD GPLv2"
> -PR =3D "r2"
> -# Not well tested
> -DEFAULT_PREFERENCE =3D "-1"
> +PR =3D "r3"

Is a bump of `PR` needed? The package content does not change, does it?
=20
>  PARALLEL_MAKE =3D ""

Is the build still failing when doing a parallel build?

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-FmXnaFUSOS/crc6MMEzX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4Rf78ACgkQPX1aK2wOHVjvWACeKoATb8Ck5lWU1QTc1vuspkoG
86QAn3IMxTMJdyiuoei0iigf15Rw79tL
=A2op
-----END PGP SIGNATURE-----

--=-FmXnaFUSOS/crc6MMEzX--
