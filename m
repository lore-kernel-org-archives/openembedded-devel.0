Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KYz-0007Kk-Os for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 16:56:51 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KYo-0001gv-ED for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 14:56:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285834219-17132-1-git-send-email-sledz@dresearch.de>
References: <4CA44597.5070300@dresearch.de>
	<1285834219-17132-1-git-send-email-sledz@dresearch.de>
Date: Thu, 30 Sep 2010 16:56:36 +0200
Message-ID: <1285858596.3805.111.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Thu, 30 Sep 2010 14:56:52 -0000
X-Groupsio-MsgNum: 24224
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-cs/xzsemWnQiTwyjHg6W"

--=-cs/xzsemWnQiTwyjHg6W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.09.2010, 10:10 +0200 schrieb Steffen Sledz:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

What is your build error?

Building `epiphany-2.30.2-r2` with `MACHINE =3D "beagleboard"` for minimal
(eglibc) worked for me.

> ---
>  recipes/gnome/epiphany_2.30.2.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.=
30.2.bb
> index 426d468..38798f7 100644
> --- a/recipes/gnome/epiphany_2.30.2.bb
> +++ b/recipes/gnome/epiphany_2.30.2.bb
> @@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] =3D "29b084acfa016540d91d3601ec3d=
ff5c"
>  SRC_URI[archive.sha256sum] =3D "cd0124e71e72142593cfeb442d58d97e99ba94ac=
e6e31d94717fe977c0bfb98a"
> =20
>=20
> -EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distributo=
r-name=3D${DISTRO}"
> +EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distributo=
r-name=3D${DISTRO} --without-ca-file"
> =20
>  do_configure_prepend() {
>          touch ${S}/gnome-doc-utils.make

Besides that would PR need to be increased?


Thanks,

Paul

--=-cs/xzsemWnQiTwyjHg6W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykpSQACgkQPX1aK2wOHVhhzgCdES28S0waYH885GhzS2Jn6/jP
+tAAnRKffYvq7eE8OMdumfGrf8Jhau7/
=qRG2
-----END PGP SIGNATURE-----

--=-cs/xzsemWnQiTwyjHg6W--
