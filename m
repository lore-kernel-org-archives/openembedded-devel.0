Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S3EGL-0005Fj-4c for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 23:14:13 +0100
Received: from f053033002.adsl.alicedsl.de ([78.53.33.2] helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S3E8G-0001xN-Oe; Thu, 01 Mar 2012 22:05:53 +0000
Message-ID: <1330639540.1260.16.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 01 Mar 2012 23:05:40 +0100
In-Reply-To: <f11d949f4308dfac11d367a72761c155f1c69d01.1330609446.git.otavio@ossystems.com.br>
References: <cover.1330609446.git.otavio@ossystems.com.br>
	<f11d949f4308dfac11d367a72761c155f1c69d01.1330609446.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH][meta-oe 1/1] numlockx: add 1.2
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
X-List-Received-Date: Thu, 01 Mar 2012 22:14:13 -0000
X-Groupsio-MsgNum: 37568
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-gI48XNnaXRrJt7JFONMQ"

--=-gI48XNnaXRrJt7JFONMQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Otavio,


Am Donnerstag, den 01.03.2012, 13:44 +0000 schrieb Otavio Salvador:

your Signed-off-by line is missing.

> ---
>  meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb |   21 +++++++++++++++=
++++++
>  1 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
>=20
> diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/=
recipes-graphics/numlockx/numlockx_1.2.bb
> new file mode 100644
> index 0000000..0d4d9ff
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Enable NumLock in X11 sessions"
> +HOMEPAGE =3D "http://home.kde.org/~seli/numlockx/"
> +SECTION =3D "x11/apps"
> +DEPENDS =3D "imake-native virtual/libx11 libxtst"

That belongs after the license fields, does not it?

> +LICENSE =3D "MIT-X"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddcb1cc75e21540a4a66b54e38d95b=
047"
> +
> +SRC_URI =3D "http://home.kde.org/~seli/numlockx/numlockx-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "be9109370447eae23f6f3f8527bb1a67"
> +SRC_URI[sha256sum] =3D "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da=
29d7696cbce772e4"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--x-includes=3D${STAGING_INCDIR} \
> +                --x-libraries=3D${STAGING_LIBDIR}"
> +
> +do_configure_prepend() {
> +    # remove this from acinclude.m4 or build fails
> +    sed -i '/_AC_PATH_X_XMKMF/d' ${S}/acinclude.m4
> +}

Otherwise with the above fixed this patch is

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-gI48XNnaXRrJt7JFONMQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk9P8rQACgkQPX1aK2wOHVhnUgCfWF6wd7S34hoeoaU8H846QqXJ
7IIAn2NUpm9FFB1bdMA6S0/7YDNW2qZm
=oFvP
-----END PGP SIGNATURE-----

--=-gI48XNnaXRrJt7JFONMQ--
