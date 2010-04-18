Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1O3RQS-0003DD-9b for openembedded-devel@lists.openembedded.org;
	Sun, 18 Apr 2010 12:08:29 +0200
Received: from f053041117.adsl.alicedsl.de ([78.53.41.117]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1O3RN4-0001j1-BV for openembedded-devel@lists.openembedded.org;
	Sun, 18 Apr 2010 10:04:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1271481456-9183-1-git-send-email-sgarman@zenlinux.com>
References: <1271481456-9183-1-git-send-email-sgarman@zenlinux.com>
Date: Sun, 18 Apr 2010 12:04:55 +0200
Message-ID: <1271585095.3754.44.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nano: Add version 2.2.4
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
X-List-Received-Date: Sun, 18 Apr 2010 10:08:29 -0000
X-Groupsio-MsgNum: 18696
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hgBuPgaXAi0DELwVRox5"

--=-hgBuPgaXAi0DELwVRox5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 16.04.2010, 22:17 -0700 schrieb Scott Garman:
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>
> ---
>  recipes/nano/nano_2.2.4.bb |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/nano/nano_2.2.4.bb
>=20
> diff --git a/recipes/nano/nano_2.2.4.bb b/recipes/nano/nano_2.2.4.bb
> new file mode 100644
> index 0000000..b4973f8
> --- /dev/null
> +++ b/recipes/nano/nano_2.2.4.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "GNU nano (Nano's ANOther editor, or \
> +Not ANOther editor) is an enhanced clone of the \
> +Pico text editor."
> +HOMEPAGE =3D "http://www.nano-editor.org/"
> +LICENSE =3D "GPLv2"
> +SECTION =3D "console/utils"
> +DEPENDS =3D "ncurses"
> +
> +SRC_URI =3D "http://www.nano-editor.org/dist/v2.2/nano-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "6304308afb1f7ef4a5e93eb99206632a"
> +SRC_URI[sha256sum] =3D "971b8547be157de5a814cb26c804dc2515b686d7188f4dc0=
16269312965d4da5"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--enable-all"

It build fine for me.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I do not have commit rights though.

Do you have time to create an include file for all recipes and send a
patch on top of this one?


Thanks,

Paul

--=-hgBuPgaXAi0DELwVRox5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkvK2UcACgkQPX1aK2wOHVgqHgCfaZROk9mpakKLN1xDCLwFmmBy
rqcAn3ERqynXVSuanKMQ4VhzpKYN9kF7
=Zyyr
-----END PGP SIGNATURE-----

--=-hgBuPgaXAi0DELwVRox5--
