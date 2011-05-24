Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOyj0-0004Al-K4 for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 23:01:10 +0200
Received: from f053046177.adsl.alicedsl.de ([78.53.46.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOygO-0001nO-D6 for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 20:58:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306159627-10568-1-git-send-email-sledz@dresearch-fe.de>
References: <1306159627-10568-1-git-send-email-sledz@dresearch-fe.de>
Date: Tue, 24 May 2011 22:58:09 +0200
Message-ID: <1306270689.22299.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] apr-util: disable odbc support to avoid QA error
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
X-List-Received-Date: Tue, 24 May 2011 21:01:10 -0000
X-Groupsio-MsgNum: 32267
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LHh6/KAH9ACpVCGizw4i"

--=-LHh6/KAH9ACpVCGizw4i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 23.05.2011, 16:07 +0200 schrieb Steffen Sledz:
> The odbc checker part of the configure script seems to be buggy and
> may add host pathes to compiler and linker options:

s/patches/paths/

>
> --------->snip<--------
>  checking for odbc_config... /usr/bin/odbc_config
>    adding "-I/usr/include" to CPPFLAGS
>    adding "-L/usr/lib" to LDFLAGS
>    setting LIBS to "-L/usr/lib -lodbc"
> --------->snip<--------

Did you report that problem upstream?

Why is that a QA error? I would have guessed that the compilation would
fail.

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/apr/apr-util_1.3.10.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/apr/apr-util_1.3.10.bb b/recipes/apr/apr-util_1.3.10=
.bb
> index ee32ddd..32b568e 100644
> --- a/recipes/apr/apr-util_1.3.10.bb
> +++ b/recipes/apr/apr-util_1.3.10.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
>  DEPENDS =3D "apr expat gdbm"
>  LICENSE =3D "Apache License, Version 2.0"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${P}.tar.gz \
>             file://configfix.patch \
> @@ -15,6 +15,7 @@ EXTRA_OECONF =3D "--with-apr=3D${STAGING_BINDIR_CROSS}/=
apr-1-config \
>  		--without-sqlite2 \
>  		--without-sqlite3 \
>  		--without-pgsql \
> +		--without-odbc \
>  		--with-expat=3D${STAGING_DIR_HOST}${layout_prefix}"
> =20
>  SRC_URI[md5sum] =3D "82acd25cf3df8c72eba44eaee8b80c19"

Anyway, since `odbc_config` does not seem to be packaged for
OpenEmbedded, disabling that option seems like a sane thing.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-LHh6/KAH9ACpVCGizw4i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3cG9wACgkQPX1aK2wOHVjgxgCeNLxrDR+YHI2FFjrgBahnn46Q
C+MAn3AHbCnwA8m/ZNBPz0UEZEONy19f
=X8kJ
-----END PGP SIGNATURE-----

--=-LHh6/KAH9ACpVCGizw4i--
