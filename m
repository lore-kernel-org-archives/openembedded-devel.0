Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QoMwE-0008WG-M3 for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 23:55:46 +0200
Received: from f053037105.adsl.alicedsl.de ([78.53.37.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QoMs6-000670-CH for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 21:51:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1312309735-1628-1-git-send-email-josua.mayer97@googlemail.com>
References: <1312309735-1628-1-git-send-email-josua.mayer97@googlemail.com>
Date: Tue, 02 Aug 2011 23:51:25 +0200
Message-ID: <1312321885.3658.262.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] mokomaze: fix project urls
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
X-List-Received-Date: Tue, 02 Aug 2011 21:55:46 -0000
X-Groupsio-MsgNum: 33482
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ISxajjmKcgEvmkXRPJTX"

--=-ISxajjmKcgEvmkXRPJTX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Josua,


thank you for your patch. (I will try to push your other patches as soon
as possible.)

Am Dienstag, den 02.08.2011, 20:28 +0200 schrieb Josua Mayer:
> * Mokomaze moved to sourceforge
>   Homepage and download link were changed accordingly

Please start the commit summary with a capital letter.

> Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
> ---
>  recipes/mokomaze/mokomaze_0.5.5.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/mokomaze/mokomaze_0.5.5.bb b/recipes/mokomaze/mokoma=
ze_0.5.5.bb
> index 9ef8771..d4c2541 100644
> --- a/recipes/mokomaze/mokomaze_0.5.5.bb
> +++ b/recipes/mokomaze/mokomaze_0.5.5.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "Classic game where you control a steel ball by tilting =
a wooden labyrinth"
> -HOMEPAGE =3D "http://mokomaze.projects.openmoko.org/"
> +HOMEPAGE =3D "http://mokomaze.sourceforge.net/"
>  SECTION =3D "x11/games"
>  PRIORITY =3D "optional"
>  LICENSE =3D "GPLv3"
> @@ -9,7 +9,7 @@ RRECOMMENDS_${PN}_shr =3D "fsoraw"
>  PV =3D "0.5.5+git8"
>  PR =3D "r7"
> =20
> -SRC_URI =3D "http://mokomaze.projects.openmoko.org/files/${PN}-${PV}.tar=
.gz"
> +SRC_URI =3D "http://mokomaze.sourceforge.net/files/${PN}-${PV}.tar.gz"

There is a variable `SOURCEFORGE_MIRROR` defined. Can you try to use
that?

        $ git grep SOURCEFORGE_MIRROR
        conf/bitbake.conf:SOURCEFORGE_MIRROR =3D "http://downloads.sourcefo=
rge.net"
        [=E2=80=A6]

>  SRC_URI_append_shr =3D " file://fsoraw.patch"
>  SRC_URI_append_shr =3D " file://0001-Fix-accelerometers-with-2.6.34-kern=
els.patch"
>  SRC_URI_append_shr =3D " file://0001-Fix-vibration-on-gta02-with-2.6.34-=
kernel.patch"

When sending iterations of patches, please also note under the first
`---` what you changed in the iterations.

        ---
        v2: Remove bogus `From` line.
        ---
         recipes/mokomaze/mokomaze_0.5.5.bb |    4 ++--
        [=E2=80=A6]


Thanks,

Paul

--=-ISxajjmKcgEvmkXRPJTX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk44cV0ACgkQPX1aK2wOHVhY+gCfS63P7WL5naKS2Mhw4n7pX2fH
uhkAnRhxksCBb7d2cisdt0Fjs6mDMi0d
=eBT7
-----END PGP SIGNATURE-----

--=-ISxajjmKcgEvmkXRPJTX--
