Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qiwhh-0000TN-RI for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 00:54:21 +0200
Received: from f053040145.adsl.alicedsl.de ([78.53.40.145]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiweX-0001T8-Nu for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 22:51:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <392f3ed37f0da6ab6833da30d0d7bf428831f313.1311013624.git.tom_rini@mentor.com>
References: <cover.1311013624.git.tom_rini@mentor.com>
	<392f3ed37f0da6ab6833da30d0d7bf428831f313.1311013624.git.tom_rini@mentor.com>
Date: Tue, 19 Jul 2011 00:50:18 +0200
Message-ID: <1311029418.24784.55.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 2/2] mercurial-native: Add 1.9 version
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
X-List-Received-Date: Mon, 18 Jul 2011 22:54:21 -0000
X-Groupsio-MsgNum: 33222
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ABXcao63nl7c/DXHlxc1"

--=-ABXcao63nl7c/DXHlxc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.07.2011, 11:33 -0700 schrieb Tom Rini:=20
> This is based on 91c14caa8819b08def8ea99e02949e49604c2e86 from oe.dev
> with an update to 1.9.
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  .../mercurial/mercurial-native_1.9.bb              |   24 ++++++++++++++=
++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_1=
.9.bb
>=20
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb b=
/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
> new file mode 100644
> index 0000000..b4438a3
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "The Mercurial distributed SCM"
> +HOMEPAGE =3D "http://mercurial.selenic.com/"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "python-native"
> +PR =3D "r1"

Start with `r0` please.

> +
> +SRC_URI =3D "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz=
"
> +SRC_URI[md5sum] =3D "d4842129fa2732eb6ed1180467bc32e2"
> +SRC_URI[sha256sum] =3D "711e4b1cd2924a7a88499d6c431a9122390183bf554d4e15=
3edbb3b2f30123e0"
> +
> +S =3D "${WORKDIR}/mercurial-${PV}"
> +
> +inherit native
> +
> +EXTRA_OEMAKE =3D "STAGING_LIBDIR=3D${STAGING_LIBDIR} STAGING_INCDIR=3D${=
STAGING_INCDIR} \
> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} PREFIX=3D${prefi=
x}"
> +
> +do_install () {
> +        oe_runmake -e install-bin DESTDIR=3D${D} PREFIX=3D${prefix}
> +}
> +
> +NATIVE_INSTALL_WORKS =3D "1"


Thanks,

Paul

--=-ABXcao63nl7c/DXHlxc1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4kuKoACgkQPX1aK2wOHVgrrgCeJJaJfAmPJSFWlpOC3tWujdi3
W9gAnAuqbQMs2gOYQekGue0iYvwLGBhn
=tmXn
-----END PGP SIGNATURE-----

--=-ABXcao63nl7c/DXHlxc1--
