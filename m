Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHbV9-0003MT-9N for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 15:20:39 +0200
Received: from f053040124.adsl.alicedsl.de ([78.53.40.124]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHbPf-0005gy-ET for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 13:14:59 +0000
Message-ID: <1319289285.3496.40.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Oct 2011 15:14:45 +0200
In-Reply-To: <1319286535-2935-1-git-send-email-ulf_samuelsson@telia.com>
References: <1319286535-2935-1-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] freetype_2.4.3.bb; Change order of configuration.
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
X-List-Received-Date: Sat, 22 Oct 2011 13:20:39 -0000
X-Groupsio-MsgNum: 34982
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-OCVUlxxsSZiPSM2JE6ju"

--=-OCVUlxxsSZiPSM2JE6ju
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 22.10.2011, 14:28 +0200 schrieb ulf_samuelsson@telia.com:
> From: Ulf Samuelsson <ulf_samuelsson@telia.com>
>=20
> Build of freetype-native is broken on Ubuntu 11.10 x64 - possible others.

It works for me without problem with Debian Squeeze (32-bit). So what is
the error message in the first place?

> Problem fixed in openembedded-core 2.4.4 recipe

It seems it was not present since the beginning, i. e. version 2.3.12.

> Backporting the change will allow the build to complete.
>=20
> openembedded-core-contrib/meta/recipes-graphics/freetype
>=20
> Signed-Off-By: Ulf Samuelsson <ulf.samuelsson@telia.com>
> ---
>  recipes/freetype/freetype_2.4.3.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/freetype/freetype_2.4.3.bb b/recipes/freetype/freety=
pe_2.4.3.bb
> index 66d2e51..dfc1b43 100644
> --- a/recipes/freetype/freetype_2.4.3.bb
> +++ b/recipes/freetype/freetype_2.4.3.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Freetype font rendering library"
>  SECTION =3D "libs"
>  LICENSE =3D "freetype GPLv2"
> -PR =3D "r1"
> +PR =3D "r2"
>  DEPENDS =3D "zlib"
> =20
>  SRC_URI =3D "\
> @@ -23,9 +23,9 @@ LDFLAGS_append =3D " -Wl,-rpath-link -Wl,${STAGING_DIR_=
TARGET}${libdir}"
> =20
>  do_configure() {
>  	cd builds/unix
> -	gnu-configize --force
> -	aclocal -I .
>  	libtoolize --force --copy
> +	aclocal -I .
> +	gnu-configize --force
>  	autoconf
>  	cd ${S}
>  	oe_runconf


Thanks,

Paul

--=-OCVUlxxsSZiPSM2JE6ju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6iwcUACgkQPX1aK2wOHVgjNwCfbWiCcyhiJrhXzXDRp7kAxFPS
v7wAn0gKgnI+jGpw/Gp1yPDBIKI1ResC
=lRym
-----END PGP SIGNATURE-----

--=-OCVUlxxsSZiPSM2JE6ju--
