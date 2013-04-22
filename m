Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUKGx-0005br-AG
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 19:11:27 +0200
Received: by mail-pd0-f169.google.com with SMTP id 10so215573pdc.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wLkKnaAarMCLyqh1xt5uyXBPhXeRrSncGUkhqAbnwxQ=;
	b=Yh8eT4F5ec6ZkESI43fQUpRaN8TMdY2t98PMp/jDF10asJK84MjrKRqJByOCP6hwUt
	rNbh3Pcf8EFItjxRuoOxsy0ElkN0F9kCZSNPDu2jghVw6XZuP/RMYGRQljhnHXTD7SOD
	ugS4g19efExe1rKcrY0eYAIrPhfwyUpjNSc8FxU/sIuwHKjiFWIgfVHQF+uE7f+JBk8L
	ECFDNpHi6Vckh/TJvV+wNuQpFeFEcxkMLvkBrRIiBCkeBVOkdlomGrc1QwBaz0IqFAZI
	+2Xqa5XArO7jX/OOVHsGTShVaLqH820p1ihqsKNtzV01jHM81zu/Nn0r6DdZjBKpDSY8
	qR6A==
X-Received: by 10.66.121.202 with SMTP id lm10mr13359931pab.138.1366649623451; 
	Mon, 22 Apr 2013 09:53:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPS id
	c5sm25791196pbl.37.2013.04.22.09.53.40
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 09:53:42 -0700 (PDT)
Date: Mon, 22 Apr 2013 18:53:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130422165350.GA3217@jama>
References: <1366366032-8581-1-git-send-email-ml@communistcode.co.uk>
	<1366366032-8581-2-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366366032-8581-2-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [PATCH 1/2] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Mon, 22 Apr 2013 17:11:36 -0000
X-Groupsio-MsgNum: 44366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2013 at 11:07:11AM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 225c3d7..892a0b5 100644
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
> @@ -40,6 +35,22 @@ EXTRA_OECONF_virtclass-native =3D "--with-cgi --withou=
t-libpng --without-libjpeg \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> =20
> +PACKAGECONFIG ??=3D "mysql sqlite3"
> +PACKAGECONFIG_class-native =3D ""
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
> --=20
> 1.8.2.1

Now target php is failing with:
| configure:61165: result: no
| configure:61215: error: Cannot find MySQL header files under
"/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/us=
r".
| Note that the MySQL client library is not bundled anymore!

full log here:
qemuarm
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30422_080202.log/bitbake.world.log

qemux86
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30422_125516.log/bitbake.world.log

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF1ax4ACgkQN1Ujt2V2gBzUoQCgn0yce80Ff0qhh2wK0d/S6dOJ
vu4An1ev+1UdRQiCBuoO+9/UbRMJTRW+
=iH3x
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
