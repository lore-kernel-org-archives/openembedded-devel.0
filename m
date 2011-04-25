Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEQy2-0003mZ-PQ for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:06 +0200
Received: from f053045128.adsl.alicedsl.de ([78.53.45.128]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEQwO-0005l0-4r for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 18:55:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303756273-22385-4-git-send-email-tom_rini@mentor.com>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
	<1303756273-22385-4-git-send-email-tom_rini@mentor.com>
Date: Mon, 25 Apr 2011 20:54:38 +0200
Message-ID: <1303757678.15311.113.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 3/3] bluez4: Add 4.91 and make it default for Angstrom
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:07 -0000
X-Groupsio-MsgNum: 31447
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SErXjmnuiW06eltBQxRg"

--=-SErXjmnuiW06eltBQxRg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tom,


On Mo, 2011-04-25 at 11:31 -0700, Tom Rini wrote:

what build configuration did you use for build testing? Could you add
that to the commit message please.

> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  recipes/bluez/bluez4_4.91.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/bluez/bluez4_4.91.bb
>=20
> diff --git a/recipes/bluez/bluez4_4.91.bb b/recipes/bluez/bluez4_4.91.bb
> new file mode 100644
> index 0000000..16f06d5
> --- /dev/null
> +++ b/recipes/bluez/bluez4_4.91.bb
> @@ -0,0 +1,18 @@
> +require bluez4.inc
> +
> +SRC_URI[md5sum] =3D "3059b7ef5168c84cd0c6a67034ce79f9"
> +SRC_URI[sha256sum] =3D "11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842=
a0bbcad8a4eac18d"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_angstrom =3D "1"
> +
> +DEPENDS +=3D "libsndfile1"
> +
> +PR =3D "${INC_PR}.0"
> +
> +# Not all distros have a recent enough udev
> +BTUDEV =3D " --disable-udevrules"
> +BTUDEV_angstrom =3D " --enable-udevrules"
> +BTUDEV_shr =3D " --enable-udevrules"
> +
> +EXTRA_OECONF +=3D "${BTUDEV}"

Please create the patch next time adding `-M -C -C` to `git
format-patch`. Additionally adding the recipe and making it default for
=C8=A6ngstr=C3=B6m could have been two commits in my opinion.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I will build test with `minimal-uclibc` and report back.


Thanks,

Paul

--=-SErXjmnuiW06eltBQxRg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk21w24ACgkQPX1aK2wOHVgO8QCdGN+4J1hZcjCIE01ZrCtXP2VQ
ErIAnAwC+BRcoGcsRa2/38LnokiMYEZ+
=vgkL
-----END PGP SIGNATURE-----

--=-SErXjmnuiW06eltBQxRg--
