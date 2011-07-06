Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeOhk-0006EA-0g for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 11:47:36 +0200
Received: from f053037185.adsl.alicedsl.de ([78.53.37.185]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeOeL-0001r2-Dd; Wed, 06 Jul 2011 09:44:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309916936-17283-1-git-send-email-agnel.joel@gmail.com>
References: <1309916936-17283-1-git-send-email-agnel.joel@gmail.com>
Date: Wed, 06 Jul 2011 11:43:45 +0200
Message-ID: <1309945425.4518.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	beagle@list.ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] linux-omap-psp: Fix the user button GPIO to the correct value for a BeagleBoard-xM
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
X-List-Received-Date: Wed, 06 Jul 2011 09:47:36 -0000
X-Groupsio-MsgNum: 32997
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-OkumAoxNRZyTAIQk9YuX"

--=-OkumAoxNRZyTAIQk9YuX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Dienstag, den 05.07.2011, 20:48 -0500 schrieb Joel A Fernandes:

1. What has changed in this patch iteration? (You can put that below the
`---`.)
2. Could you elaborate a bit more what the problem was, i. e. how the
situation was before, and how the fix works? For example pointing to the
thread on the BeagleBoard list.(?)
3. Is a similar patch also needed for 2.6.39?

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
>  ...agle-cleaned-up-board-revision-conditions.patch |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-oma=
p3-beagle-cleaned-up-board-revision-conditions.patch b/recipes/linux/linux-=
omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision=
-conditions.patch
> index 513a101..fb91cb6 100644
> --- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beag=
le-cleaned-up-board-revision-conditions.patch
> +++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beag=
le-cleaned-up-board-revision-conditions.patch
> @@ -143,8 +143,8 @@ index 4bde54b..664a9c6 100644
>   	omap3_beagle_i2c_init();
>  =20
>  -	if (cpu_is_omap3630()) {
> -+	if ((omap3_beagle_get_rev() !=3D OMAP3BEAGLE_BOARD_XMAB) &&
> -+		(omap3_beagle_get_rev() !=3D OMAP3BEAGLE_BOARD_XMC)) {
> ++	if ((omap3_beagle_get_rev() =3D=3D OMAP3BEAGLE_BOARD_XMAB) ||
> ++		(omap3_beagle_get_rev() =3D=3D OMAP3BEAGLE_BOARD_XMC)) {
>   		gpio_buttons[0].gpio =3D 4;
>   	}


Thanks,

Paul

--=-OkumAoxNRZyTAIQk9YuX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4ULlEACgkQPX1aK2wOHVg1zgCbBayi9xNMu9u+T0vp8+IvxG9L
HDwAn0MqB5tDnpMBeGUGLzu/WSXugxbA
=OEwT
-----END PGP SIGNATURE-----

--=-OkumAoxNRZyTAIQk9YuX--
