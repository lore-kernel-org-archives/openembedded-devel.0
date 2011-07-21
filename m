Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qk2CD-0003MD-2T for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 00:58:21 +0200
Received: from f053034050.adsl.alicedsl.de ([78.53.34.50]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qk295-0004t0-Mj for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 22:55:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
References: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
Date: Fri, 22 Jul 2011 00:54:13 +0200
Message-ID: <1311288853.7847.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] gpe-mini-browser2_svn : remove fixes SRCREV
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
X-List-Received-Date: Thu, 21 Jul 2011 22:58:21 -0000
X-Groupsio-MsgNum: 33282
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Mpj22q4TtEy4J1FFReKj"

--=-Mpj22q4TtEy4J1FFReKj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Philippe,


thank you for your patch.

Am Freitag, den 22.07.2011, 01:31 +0300 schrieb Philippe De Swert:
> * SCREV points to a broken revision which crashes due to badly initialize=
d g_threads
>   See http://bugs.openembedded.org/show_bug.cgi?id=3D5409
>=20
> Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
> ---
>  recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb b/recipes/=
gpe-mini-browser/gpe-mini-browser2_svn.bb
> index 6bc89c8..2aa55b4 100644
> --- a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
> +++ b/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
> @@ -2,8 +2,6 @@ DEPENDS =3D "gtk+ glib-2.0 libgpewidget webkit-gtk"
>  PV =3D "0.0.1+svnr${SRCPV}"
>  PR =3D "r0"
> =20
> -SRCREV =3D "9900"
> -

Please do not remove the `SRCREV` but replace it by a valid and working
revision. Otherwise the builds would not be reproducible.

>  inherit autotools
> =20
>  SRC_URI =3D "${GPE_EXTRA_SVN}"


Thanks,

Paul


--=-Mpj22q4TtEy4J1FFReKj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4org8ACgkQPX1aK2wOHVgzXQCfXX7gwkbjJMF91xsRIiag8sdV
4bkAmgLVER3EuzOgUPHzxDrSv2JzB8XU
=g++r
-----END PGP SIGNATURE-----

--=-Mpj22q4TtEy4J1FFReKj--
