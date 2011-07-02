Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QczY8-0008Qg-BL for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:43:52 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QczUg-0005Do-2R for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 12:40:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <06120dde2158fdb5902066f18c2c1b817172094a.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
	<06120dde2158fdb5902066f18c2c1b817172094a.1309608953.git.michael.lippautz@gmail.com>
Date: Sat, 02 Jul 2011 14:40:07 +0200
Message-ID: <1309610407.4228.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 2/4] sqlalchemy: Add initial version
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
X-List-Received-Date: Sat, 02 Jul 2011 12:43:52 -0000
X-Groupsio-MsgNum: 32954
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9MZv75LyufbZBxVteObE"

--=-9MZv75LyufbZBxVteObE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 02.07.2011, 14:20 +0200 schrieb Michael Lippautz:

	sqlalchemy: Add version 0.7.1 (initial recipe)

> * Backends have to be installed separately depending on which are needed.=
 See
>   http://www.sqlalchemy.org/docs/core/engines.html for possible backends.

Does that mean those backends are not packaged yet for OE?

> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../python/python-sqlalchemy_0.7.1.bb              |   15 ++++++++++++++=
+
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7=
.1.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b=
/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
> new file mode 100644
> index 0000000..ffcb024
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "Python SQL toolkit and Object Relational Mapper that gi=
ves \
> +application developers the full power and flexibility of SQL"
> +HOMEPAGE =3D "http://www.sqlalchemy.org/"
> +LICENSE =3D "MIT"        =20
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88f48967a8bd1fe88f5425f7e659=
dbf"
> +SRCNAME =3D "SQLAlchemy"

This should go after `PR` as you also did in `pyudev`.

> +PR =3D "r0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +SRC_URI[md5sum] =3D "76e2e1e48b8047f1ca7023f143374aef"
> +SRC_URI[sha256sum] =3D "eedd2d63d6404d9bbe3c4c6a63a5442d2c2650b862f9c10f=
721cfae4a735d05a"

Please right below `SRC_URI`.


Thanks,

Paul

--=-9MZv75LyufbZBxVteObE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4PEacACgkQPX1aK2wOHVh9XgCfTQKF5KkFZJJ7ZAtISg3Xcvla
9cYAni/5N4fjgVMi2cbRdme11b98S5KI
=gKVd
-----END PGP SIGNATURE-----

--=-9MZv75LyufbZBxVteObE--
