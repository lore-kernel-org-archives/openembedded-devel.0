Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGd4U-0007uU-Ua for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 22:49:06 +0200
Received: from f053042198.adsl.alicedsl.de ([78.53.42.198]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGcyx-0006Nj-OQ for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 20:43:24 +0000
Message-ID: <1319056990.12686.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2011 22:43:10 +0200
In-Reply-To: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] Backport openssl-1.0.0e from meta-openembedded
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
X-List-Received-Date: Wed, 19 Oct 2011 20:49:07 -0000
X-Groupsio-MsgNum: 34910
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-2fYyKW1fA5O/y1UbXB/G"

--=-2fYyKW1fA5O/y1UbXB/G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ulf,


Am Mittwoch, den 19.10.2011, 17:10 +0200 schrieb ulf_samuelsson@telia.com:
> From: Ulf Samuelsson <ulf_samuelsson@telia.com>

please amend the commit summary and make it compliant to our commit
policy [1].

openssl: Add version 1.0.0e (backport from meta-openembedded)

Please also include the revision or URL to the commit you took this
from.

I am build testing this right now. For easier review it would be nice if
you could add this information to the commit message too.

> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@telia.com>
>=20
> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    4 +-
>  .../openssl/openssl-1.0.0e/configure-targets.patch |   31 +
>  .../openssl-1.0.0e/debian/c_rehash-compat.patch    |   43 +
>  recipes/openssl/openssl-1.0.0e/debian/ca.patch     |   20 +
>  .../openssl-1.0.0e/debian/debian-targets.patch     |   52 +
>  .../openssl-1.0.0e/debian/make-targets.patch       |   13 +
>  .../openssl/openssl-1.0.0e/debian/man-dir.patch    |   13 +
>  .../openssl-1.0.0e/debian/man-section.patch        |   32 +
>  .../openssl/openssl-1.0.0e/debian/no-rpath.patch   |   13 +
>  .../openssl-1.0.0e/debian/no-symbolic.patch        |   13 +
>  recipes/openssl/openssl-1.0.0e/debian/pic.patch    |  240 ++
>  .../openssl/openssl-1.0.0e/debian/pkg-config.patch |   34 +
>  .../openssl-1.0.0e/debian/version-script.patch     | 4509 ++++++++++++++=
++++++
>  .../engines-install-in-libdir-ssl.patch            |   53 +
>  recipes/openssl/openssl-1.0.0e/oe-ldflags.patch    |   22 +
>  .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   35 +
>  .../openssl/openssl-1.0.0e/parallel-make-fix.patch |   20 +
>  recipes/openssl/openssl-1.0.0e/shared-libs.patch   |   48 +
>  recipes/openssl/openssl-native_1.0.0e.bb           |   39 +
>  recipes/openssl/openssl.inc                        |    9 +-
>  recipes/openssl/openssl_1.0.0e.bb                  |   46 +
>  21 files changed, 5284 insertions(+), 5 deletions(-)
>  create mode 100644 recipes/openssl/openssl-1.0.0e/configure-targets.patc=
h
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/c_rehash-compat=
.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/ca.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/debian-targets.=
patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/make-targets.pa=
tch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/man-dir.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/man-section.pat=
ch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/no-rpath.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/no-symbolic.pat=
ch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/pic.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/pkg-config.patc=
h
>  create mode 100644 recipes/openssl/openssl-1.0.0e/debian/version-script.=
patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/engines-install-in-lib=
dir-ssl.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/oe-ldflags.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/openssl-fix-link.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0e/parallel-make-fix.patc=
h
>  create mode 100644 recipes/openssl/openssl-1.0.0e/shared-libs.patch
>  create mode 100644 recipes/openssl/openssl-native_1.0.0e.bb
>  create mode 100644 recipes/openssl/openssl_1.0.0e.bb

[=E2=80=A6]

> diff --git a/recipes/openssl/openssl-native_1.0.0e.bb b/recipes/openssl/o=
penssl-native_1.0.0e.bb
> new file mode 100644
> index 0000000..8be5bcb
> --- /dev/null
> +++ b/recipes/openssl/openssl-native_1.0.0e.bb
> @@ -0,0 +1,39 @@
> +require openssl.inc
> +
> +inherit pkgconfig native
> +
> +SRC_URI[src.md5sum] =3D "7040b89c4c58c7a1016c0dfa6e821c86"
> +SRC_URI[src.sha256sum] =3D "e361dc2775733fb84de7b5bf7b504778b772869e8f7b=
fac0b28b935cbf7380f7"
> +PR =3D "${INC_PR}.0"
> +
> +DEFAULT_PREFERENCE =3D "-1"

This seems strange, since this is not set in the =E2=80=9Cnormal=E2=80=9D r=
ecipe.

> +export DIRS =3D "crypto ssl apps engines"
> +
> +# This flag can contain target options (e.g -mfpu=3Dneon for armv7-a sys=
tems)
> +export FULL_OPTIMIZATION =3D " "
> +export BUILD_OPTIMIZATION =3D " "
> +
> +SRC_URI +=3D "file://configure-targets.patch \
> +            file://shared-libs.patch \
> +            file://oe-ldflags.patch \
> +            file://engines-install-in-libdir-ssl.patch \
> +            file://openssl-fix-link.patch \
> +            file://debian/version-script.patch \
> +            file://debian/pic.patch \
> +            file://debian/c_rehash-compat.patch \
> +            file://debian/ca.patch \
> +            file://debian/make-targets.patch \
> +            file://debian/no-rpath.patch \
> +            file://debian/man-dir.patch \
> +            file://debian/man-section.patch \
> +            file://debian/pkg-config.patch \
> +            file://debian/no-symbolic.patch \
> +            file://debian/debian-targets.patch \
> +           "
> +
> +PARALLEL_MAKE =3D ""
> +
> +CFLAG +=3D " -Wa,--noexecstack "
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
> index 2460913..2aff24a 100644
> --- a/recipes/openssl/openssl.inc
> +++ b/recipes/openssl/openssl.inc
> @@ -1,14 +1,17 @@
>  DESCRIPTION =3D "Secure Socket Layer (SSL) binary and related cryptograp=
hic tools."
>  HOMEPAGE =3D "http://www.openssl.org/"
> -LICENSE =3D "openssl"
>  SECTION =3D "libs/network"
> =20
> +# "openssl | SSLeay" dual license
> +LICENSE =3D "openssl"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D83d26c69f6f0172ee7f795790424b=
453"
> +
>  SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz;name=3Ds=
rc"
>  S =3D "${WORKDIR}/openssl-${PV}"
> =20
>  inherit siteinfo
> =20
> -INC_PR =3D "r14"
> +INC_PR =3D "r15"
> =20
>  AR_append =3D " r"
>  CFLAG =3D "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN'=
, '-DB_ENDIAN', d)} \
> @@ -97,7 +100,7 @@ do_configure () {
>  	# inject machine-specific flags
>  	sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" Con=
figure
>          useprefix=3D${prefix}
> -        if [ "x$useprefix" =3D "x" ]; then
> +        if [ "x$useprefix" =3D=3D "x" ]; then
>                  useprefix=3D/
>          fi       =20
>  	perl ./Configure ${EXTRA_OECONF} shared --prefix=3D$useprefix --openssl=
dir=3D${libdir}/ssl $target
> diff --git a/recipes/openssl/openssl_1.0.0e.bb b/recipes/openssl/openssl_=
1.0.0e.bb
> new file mode 100644
> index 0000000..907523b
> --- /dev/null
> +++ b/recipes/openssl/openssl_1.0.0e.bb
> @@ -0,0 +1,46 @@
> +inherit pkgconfig
> +
> +require openssl.inc
> +
> +# For target side versions of openssl enable support for OCF Linux drive=
r
> +# if they are available.
> +DEPENDS +=3D "ocf-linux"
> +CFLAG +=3D "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> +
> +SRC_URI[src.md5sum] =3D "7040b89c4c58c7a1016c0dfa6e821c86"
> +SRC_URI[src.sha256sum] =3D "e361dc2775733fb84de7b5bf7b504778b772869e8f7b=
fac0b28b935cbf7380f7"
> +
> +PR =3D "${INC_PR}.0"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9a8f968107345e0b75aa8c2ecaa7=
ec8"
> +
> +export DIRS =3D "crypto ssl apps engines"
> +export OE_LDFLAGS=3D"${LDFLAGS}"
> +
> +SRC_URI +=3D "file://configure-targets.patch \
> +            file://shared-libs.patch \
> +            file://oe-ldflags.patch \
> +            file://engines-install-in-libdir-ssl.patch \
> +            file://openssl-fix-link.patch \
> +            file://debian/version-script.patch \
> +            file://debian/pic.patch \
> +            file://debian/c_rehash-compat.patch \
> +            file://debian/ca.patch \
> +            file://debian/make-targets.patch \
> +            file://debian/no-rpath.patch \
> +            file://debian/man-dir.patch \
> +            file://debian/man-section.patch \
> +            file://debian/pkg-config.patch \
> +            file://debian/no-symbolic.patch \
> +            file://debian/debian-targets.patch \
> +           "
> +
> +PARALLEL_MAKE =3D ""
> +
> +PACKAGES +=3D " \
> +	${PN}-engines \
> +	${PN}-engines-dbg \
> +	"
> +
> +FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so"
> +FILES_${PN}-engines-dbg =3D "${libdir}/ssl/engines/.debug"


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy

--=-2fYyKW1fA5O/y1UbXB/G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6fNl4ACgkQPX1aK2wOHVjfzQCfQcTqjMreKoWpqoOKswMAZjf1
76EAnRiC0dgvnHPJGJAawf61FY5lBsNx
=Cbsn
-----END PGP SIGNATURE-----

--=-2fYyKW1fA5O/y1UbXB/G--
