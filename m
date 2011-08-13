Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QsLJH-0006Pk-MK for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 22:59:59 +0200
Received: from f053039208.adsl.alicedsl.de ([78.53.39.208]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QsLF5-0004h8-Js for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 20:55:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313250436-32653-2-git-send-email-raj.khem@gmail.com>
References: <1313250436-32653-1-git-send-email-raj.khem@gmail.com>
	<1313250436-32653-2-git-send-email-raj.khem@gmail.com>
Date: Sat, 13 Aug 2011 22:55:24 +0200
Message-ID: <1313268924.8289.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 2/2] openssl-1.0.0: Add recipes for openssl_1.0.0d
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
X-List-Received-Date: Sat, 13 Aug 2011 20:59:59 -0000
X-Groupsio-MsgNum: 33594
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vCZ7skPdncc+r1NYpo+V"

--=-vCZ7skPdncc+r1NYpo+V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 13.08.2011, 08:47 -0700 schrieb Khem Raj:
> Delete 1.0.0c recipes

The commit summary should say =C2=BBupdate=C2=AB and not =C2=BBAdd=C2=AB th=
en.

	openssl-1.0.0: Update to openssl_1.0.0d

In my opinion =C2=BBrecipe=C2=AB is redundant for a commit summary.

> Add patches from debian

The patch headers seem to be missing. Maybe you can submit those to
Debian too.

> Remove recipes for openssl-native use BBCLASSEXTEND instead
> Drop libdeps-first.patch it would not let openssl-native build on ubuntu =
11.10

What is the error?

> Delete debian.patch, all changes in it are now provided by patches under =
debian dir
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../openssl/openssl-1.0.0c/debian.patch            |  515 ---
>  .../openssl/openssl-1.0.0c/libdeps-first.patch     |   27 -
>  .../configure-targets.patch                        |    0
>  .../openssl-1.0.0d/debian/c_rehash-compat.patch    |   43 +
>  .../openssl/openssl-1.0.0d/debian/ca.patch         |   20 +
>  .../openssl-1.0.0d/debian/debian-targets.patch     |   52 +
>  .../openssl-1.0.0d/debian/make-targets.patch       |   13 +
>  .../openssl/openssl-1.0.0d/debian/man-dir.patch    |   13 +
>  .../openssl-1.0.0d/debian/man-section.patch        |   32 +
>  .../openssl/openssl-1.0.0d/debian/no-rpath.patch   |   13 +
>  .../openssl-1.0.0d/debian/no-symbolic.patch        |   13 +
>  .../openssl/openssl-1.0.0d/debian/pic.patch        |  240 ++
>  .../openssl/openssl-1.0.0d/debian/pkg-config.patch |   34 +
>  .../openssl-1.0.0d/debian/version-script.patch     | 4491 ++++++++++++++=
++++++
>  .../engines-install-in-libdir-ssl.patch            |    0
>  .../oe-ldflags.patch                               |    0
>  .../openssl/openssl-1.0.0d/parallel-make-fix.patch |   20 +
>  .../shared-libs.patch                              |    0
>  .../openssl/openssl-native_1.0.0c.bb               |   27 -
>  .../recipes-connectivity/openssl/openssl_1.0.0c.bb |   36 -
>  .../recipes-connectivity/openssl/openssl_1.0.0d.bb |   47 +
>  21 files changed, 5031 insertions(+), 605 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0c/d=
ebian.patch
>  delete mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0c/l=
ibdeps-first.patch
>  rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =3D> openssl=
-1.0.0d}/configure-targets.patch (100%)
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/c_rehash-compat.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/ca.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/debian-targets.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/make-targets.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/man-dir.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/man-section.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/no-rpath.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/no-symbolic.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/pic.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/pkg-config.patch
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/d=
ebian/version-script.patch
>  rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =3D> openssl=
-1.0.0d}/engines-install-in-libdir-ssl.patch (100%)
>  rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =3D> openssl=
-1.0.0d}/oe-ldflags.patch (100%)
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/p=
arallel-make-fix.patch
>  rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =3D> openssl=
-1.0.0d}/shared-libs.patch (100%)
>  delete mode 100644 meta-oe/recipes-connectivity/openssl/openssl-native_1=
.0.0c.bb
>  delete mode 100644 meta-oe/recipes-connectivity/openssl/openssl_1.0.0c.b=
b
>  create mode 100644 meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.b=
b

[=E2=80=A6]

> diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb b/met=
a-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
> new file mode 100644
> index 0000000..384f3ba
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
> @@ -0,0 +1,47 @@
> +require recipes-connectivity/openssl/openssl.inc
> +
> +# For target side versions of openssl enable support for OCF Linux drive=
r
> +# if they are available.
> +DEPENDS +=3D "ocf-linux"
> +
> +CFLAG +=3D "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> +
> +PR =3D "${INC_PR}.0"
> +#- * Copyright (c) 1998-2008 The OpenSSL Project.  All rights reserved.
> +#+ * Copyright (c) 1998-2011 The OpenSSL Project.  All rights reserved.

What are those comments good for?

> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9a8f968107345e0b75aa8c2ecaa7=
ec8"
> +
> +SRC_URI[src.md5sum] =3D "40b6ea380cc8a5bf9734c2f8bf7e701e"
> +SRC_URI[src.sha256sum] =3D "92511d1f0caaa298dba250426f8e7d5d00b271847886=
d1adc62422778d6320db"
> +
> +DEFAULT_PREFERENCE =3D "-1"

Why is it not the default? Just not tested? I am not into
meta-openembedded yet but I am wondering if only distributions should
pin that in their configurations.

> +
> +export DIRS =3D "crypto ssl apps engines"
> +export OE_LDFLAGS=3D"${LDFLAGS}"
> +
> +SRC_URI +=3D "file://configure-targets.patch \
> +            file://shared-libs.patch \
> +            file://oe-ldflags.patch \
> +	    file://engines-install-in-libdir-ssl.patch \
> +	    file://debian/version-script.patch \
> +	    file://debian/pic.patch \
> +	    file://debian/c_rehash-compat.patch \
> +	    file://debian/ca.patch \
> +	    file://debian/make-targets.patch \
> +	    file://debian/no-rpath.patch \
> +	    file://debian/man-dir.patch \
> +	    file://debian/man-section.patch \
> +	    file://debian/pkg-config.patch \
> +	    file://debian/no-symbolic.patch \
> +	    file://debian/debian-targets.patch \
> +	   "

The indentations do look differently.

> +
> +PACKAGES +=3D " \
> +	${PN}-engines \
> +	${PN}-engines-dbg \
> +	"
> +
> +PARALLEL_MAKE =3D ""

Do you know what the problem with parallel builds is? What is the error?

> +FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so"
> +FILES_${PN}-engines-dbg =3D "${libdir}/ssl/engines/.debug"


Thanks,

Paul

--=-vCZ7skPdncc+r1NYpo+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5G5LcACgkQPX1aK2wOHVibUwCfUQbY5c+b5daJ190YGPTTn901
FUAAn2lsTq36HLv6U+ig1d8YQV5lXKRc
=Grt6
-----END PGP SIGNATURE-----

--=-vCZ7skPdncc+r1NYpo+V--
