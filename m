Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIGNQ-00086J-3e for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 10:27:08 +0200
Received: from f053032229.adsl.alicedsl.de ([78.53.32.229]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIGLw-0004Kq-Tr; Fri, 06 May 2011 08:25:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304091838-23333-3-git-send-email-christian.charreyre@cioinfoindus.fr>
References: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>
	<1304091838-23333-3-git-send-email-christian.charreyre@cioinfoindus.fr>
Date: Fri, 06 May 2011 10:24:27 +0200
Message-ID: <1304670267.4041.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] python-numpy: add missing release dependencies
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
X-List-Received-Date: Fri, 06 May 2011 08:27:08 -0000
X-Groupsio-MsgNum: 31650
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NNFcMA6gONBtOV9w0YBS"

--=-NNFcMA6gONBtOV9w0YBS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


I just wanted to commit your patches, but looking at this patch again I
have one more question. (I am sorry.)

Am Freitag, den 29.04.2011, 17:43 +0200 schrieb C. Charreyre:
> Signed-off-by: C. Charreyre <christian.charreyre@cioinfoindus.fr>
> ---
>  recipes/python/python-numpy_1.1.1.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/python/python-numpy_1.1.1.bb b/recipes/python/python=
-numpy_1.1.1.bb
> index f5c23e0..9dda508 100644
> --- a/recipes/python/python-numpy_1.1.1.bb
> +++ b/recipes/python/python-numpy_1.1.1.bb
> @@ -4,6 +4,8 @@ PRIORITY =3D "optional"
>  LICENSE =3D "PSF"
>  PR =3D "ml0"
> =20
> +RDEPENDS_${PN} =3D "python-compiler python-mmap python-pkgutil python-py=
doc python-unittest"
> +

Why are those runtime dependencies needed. Does not `python-numpy` start
at all or are just some features of it not working? Depending on that it
should maybe be a `RRECOMMENDS_${PN}`? I am wondering why the original
recipe author did not put them in.

>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
>             file://unbreak-assumptions.diff \
>  	   file://trycompile.diff \


Thanks,

Paul


PS: Do you get the message delivered directly or just the digest? I am
asking because the threading is broken. If you do get the messages,
could you please use the reply to list option of Thunderbird. Then
everything should be fine.

PPS: I am putting you in CC, so that you maybe get my message earlier
and we will be able to commit your patches before the weekend.

--=-NNFcMA6gONBtOV9w0YBS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3DsDsACgkQPX1aK2wOHVgfnQCgg52gBC3mZEh+MlO3h3iaZg9h
1kkAniN3aaVEXPV31SBt7rub8YEjz8/z
=FL+y
-----END PGP SIGNATURE-----

--=-NNFcMA6gONBtOV9w0YBS--
