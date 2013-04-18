Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USuUx-0004a4-6U
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 21:28:04 +0200
Received: by mail-da0-f50.google.com with SMTP id a4so41393dad.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=j+uTmTmQyhMcd4eWrdAG/XIhdGLTB0qWSteWZXJVP70=;
	b=M2O2vAAKMP+k9KO6sZg7O7NdN3xmhD16PuKVnDYOnh6MVgmc2R54ka3Kdkz9U4DcM1
	zO/1GTcwMXwcZ1E6XRPS0LNlztJCNH6J9/wlxltE/dzZ0hGj46SB97cFQ8O/S+jGJsWv
	LzDvstQhvZhCozy5tYzK37VM9kR2b/FMRT5nNogyKBWtfttoV6DNunJY4FwLUn60ULiF
	Avi8EoHfWS5yRYBq5pZyzBFvtPJ9ZOHJiHoiml14AVLzdySklDeKoZJvaX8KC/nGFOIw
	udqBmtZrUoZFTUwq8UF3d/r6+HrUvPKv5DEwPsPMz09c6K1aXWfv2fAzNAoNfFzpsKPY
	Hr+A==
X-Received: by 10.68.58.103 with SMTP id p7mr14842039pbq.156.1366312224904;
	Thu, 18 Apr 2013 12:10:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id lo7sm11858689pab.19.2013.04.18.12.10.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 12:10:23 -0700 (PDT)
Date: Thu, 18 Apr 2013 21:10:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130418191023.GB2489@jama>
References: <1366209695-4195-1-git-send-email-ml@communistcode.co.uk>
	<1366209695-4195-2-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366209695-4195-2-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-oe][PATCHv2] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Thu, 18 Apr 2013 19:28:24 -0000
X-Groupsio-MsgNum: 44321
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 03:41:35PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 225c3d7..639aa01 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -3,11 +3,11 @@ HOMEPAGE =3D "http://www.php.net"
>  SECTION =3D "console/network"
>  LICENSE =3D "PHP-3.0"
>  BBCLASSEXTEND =3D "native"
> -DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native mysql=
5 \
> -           libc-client openssl sqlite3"
> +DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native \
> +           libc-client openssl"
>  DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> =20
> -INC_PR =3D "r4"
> +INC_PR =3D "r5"
> =20
>  SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
> =20
> @@ -27,12 +27,7 @@ EXTRA_OECONF =3D "--enable-mbstring --enable-discard-p=
ath --enable-wddx \
>                  --with-zlib --with-zlib-dir=3D${STAGING_LIBDIR}/.. \
>                  --with-iconv=3D${STAGING_LIBDIR}/.. \
>                  --with-libxml-dir=3D${STAGING_BINDIR_CROSS} \
> -                --disable-embedded-mysqli \
> -                --with-mysql=3D"${STAGING_DIR_TARGET}${prefix}" \
> -                --with-mysqli=3D"${STAGING_BINDIR_CROSS}/mysql_config" \
> -        --with-sqlite3=3D${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
> -                --with-pdo-mysql=3D"${STAGING_BINDIR_CROSS}/mysql_config=
" \
> -                --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. ${COMMON_EXTRA_=
OECONF} \
> +                ${COMMON_EXTRA_OECONF} \
>  "
>  EXTRA_OECONF_virtclass-native =3D "--with-cgi --without-libpng --without=
-libjpeg \
>                  --with-zlib --with-zlib-dir=3D${STAGING_LIBDIR_NATIVE}/.=
=2E \
> @@ -40,6 +35,21 @@ EXTRA_OECONF_virtclass-native =3D "--with-cgi --withou=
t-libpng --without-libjpeg \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> =20
> +PACKAGECONFIG ??=3D "mysql sqlite3"
> +
> +PACKAGECONFIG[mysql] =3D "--with-mysql=3D\"${STAGING_DIR_TARGET}${prefix=
}\" \
> +                        --with-mysqli=3D\"${STAGING_BINDIR_CROSS}/mysql_=
config\" \
> +                        --with-pdo-mysql=3D\"${STAGING_BINDIR_CROSS}/mys=
ql_config\" \
> +                        --disable-embedded-mysqli \
> +                        , \
> +                        ,mysql5"
> +
> +PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAGING_LIBDIR}/.. \
> +                        --enable-sqlite-utf8 \
> +                        --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. \
> +                        , \
> +                        ,sqlite3"
> +
>  LIBS_virtclass-native =3D " -lxml2 "
>  LIBS_pn-php =3D" -lpthread "
>  export LIBS

php-native fails on jenkins with:
| configure:59644: result: no
| configure:60451: checking for MSSQL support via FreeTDS
| configure:60487: result: no
| configure:61111: checking for MySQL support
| configure:61147: result: yes
| configure:61156: checking for specified location of the MySQL UNIX socket
| configure:61171: result: no
| configure:61221: error: Cannot find MySQL header files under "/home/jenki=
ns/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr".
| Note that the MySQL client library is not bundled anymore!

I guess you should force both disabled for native.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFwRR8ACgkQN1Ujt2V2gBwGFgCghDQak9kL54DTYhgv5lSwbGlB
sZAAnidWJlOo4/nnr+hstrAFY60v6SeH
=4M78
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
