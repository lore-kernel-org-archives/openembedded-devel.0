Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R87EU-0000Bz-AA for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 11:12:14 +0200
Received: from f053036041.adsl.alicedsl.de ([78.53.36.41]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R879I-00056O-MY; Mon, 26 Sep 2011 09:06:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 11:06:50 +0200
In-Reply-To: <1317025653-2362-1-git-send-email-eyalr@ti.com>
References: <1317025653-2362-1-git-send-email-eyalr@ti.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1317028012.20963.9.camel@mattotaupa>
Mime-Version: 1.0
Cc: Eyal Reizer <eyalreizer@googlemail.com>
Subject: Re: [PATCH] iw: build version 0.9.22 from git sources
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
X-List-Received-Date: Mon, 26 Sep 2011 09:12:14 -0000
X-Groupsio-MsgNum: 34476
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-IhhfWwTUpazSwAhCAtrI"

--=-IhhfWwTUpazSwAhCAtrI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eyal,


Am Montag, den 26.09.2011, 11:27 +0300 schrieb Eyal Reizer:

how has this recipe been tested?

> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/iw/iw_git.bb |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/iw/iw_git.bb
>=20
> diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
> new file mode 100644
> index 0000000..e4d0cd5
> --- /dev/null
> +++ b/recipes/iw/iw_git.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "nl80211 based CLI configuration utility for wireless de=
vices"
> +HOMEPAGE =3D "http://linuxwireless.org/en/users/Documentation/iw"
> +SECTION =3D "base"
> +PRIORITY =3D "optional"
> +LICENSE =3D "BSD"

Could you create a inc file to not duplicate the header and the
overrides below? Or can 0.9.20 be removed?

> +
> +SRCREV =3D "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
> +PR =3D "r1"

Please start with `r0`.

> +PV =3D "0.9.22"
> +PR_append =3D "+gitr${SRCPV}"
> +
> +DEPENDS =3D "libnl pkgconfig"
> +
> +SRC_URI =3D " \
> +	git://git.sipsolutions.net/iw.git;protocol=3Dgit \
> +	"
> +CFLAGS +=3D "-DCONFIG_LIBNL20"
> +
> +S =3D "${WORKDIR}/git/"
> +
> +do_compile() {
> +	oe_runmake
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR=3D${D} install
> +}
> +
> +

Please remove the new lines at the end.


Thanks,

Paul

--=-IhhfWwTUpazSwAhCAtrI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6AQKoACgkQPX1aK2wOHVjvMgCfWzhe2bI0i6DVr27RYyoKUW27
wSoAnRmH1zzto+dg1zNyhXtHtKJzUhjy
=dhtT
-----END PGP SIGNATURE-----

--=-IhhfWwTUpazSwAhCAtrI--
