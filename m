Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QesGQ-00030E-OW for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 19:21:22 +0200
Received: from g225080076.adsl.alicedsl.de ([92.225.80.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QesD4-00055s-23 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 17:17:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <a975594904046a990cda00ae9d968315fa36433a.1310045515.git.michael.lippautz@gmail.com>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
	<a975594904046a990cda00ae9d968315fa36433a.1310045515.git.michael.lippautz@gmail.com>
Date: Thu, 07 Jul 2011 19:17:31 +0200
Message-ID: <1310059051.4153.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCHv2 2/4] python-sqlalchemy: Add version 0.7.1 (initial recipe)
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
X-List-Received-Date: Thu, 07 Jul 2011 17:21:22 -0000
X-Groupsio-MsgNum: 33052
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BwB8tovu2DDFqbtqVUYG"

--=-BwB8tovu2DDFqbtqVUYG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 07.07.2011, 15:36 +0200 schrieb Michael Lippautz:
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../python/python-sqlalchemy_0.7.1.bb              |   16 ++++++++++++++=
++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7=
.1.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b=
/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
> new file mode 100644
> index 0000000..a50ce2e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Python SQL toolkit and Object Relational Mapper that gi=
ves \
> +application developers the full power and flexibility of SQL"
> +HOMEPAGE =3D "http://www.sqlalchemy.org/"
> +LICENSE =3D "MIT"        =20

This line has trailing white space. Please check those using `git diff
--check` or read the output from Git when committing stuff.

> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88f48967a8bd1fe88f5425f7e659=
dbf"
> +RDEPENDS_${PN} +=3D "python-numbers"
> +PR =3D "r0"
> +
> +SRCNAME =3D "SQLAlchemy"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "76e2e1e48b8047f1ca7023f143374aef"
> +SRC_URI[sha256sum] =3D "eedd2d63d6404d9bbe3c4c6a63a5442d2c2650b862f9c10f=
721cfae4a735d05a"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools


Thanks,

Paul

--=-BwB8tovu2DDFqbtqVUYG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4V6iUACgkQPX1aK2wOHVgJiQCfaAt4tYGlOii0zTTiY9WJIH5A
YsoAn0rRJ+JBqmZkhncFwC03G/G6flC9
=/Rgc
-----END PGP SIGNATURE-----

--=-BwB8tovu2DDFqbtqVUYG--
