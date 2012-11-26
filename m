Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Td4Zo-0008Ra-S2
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 20:42:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6307277eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 11:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=15UJ/BQM7CntFz62z2GylqekdAUBmnMYpqYVYgT46LM=;
	b=ghBGuRRLZF5iafuJE26pH/0oHG3aB5HROAVI6kLTvXDwgOqzXAyAS1R90Ox41EJKNU
	MjTpcz/uuKtT2Cq7upV5duB/e0qBbE4ww3FG0cMh0cByK8YZ0qpIJq63U9w03IZEk5/q
	ZBIDl0tQaSzpeq1Fg2yjwt7ZhTz4Bwr7KHFXIppEJCO4WQaPf9RDdCaTkm8X+quidyQa
	PAOpE3dE4nkMVwuymHLqQQv+ofWBnnuPo/jFs/5nXjqzIQXh0HdtCMHAkHQ+QwErDh0j
	ceo3yMNswxJtB2UJ9A5UzAS/J2mBy5kymEeLA9BawcX7zLYx59AWsOIMP7+GID5dFA1u
	sqIA==
Received: by 10.14.211.135 with SMTP id w7mr49152563eeo.4.1353958112812;
	Mon, 26 Nov 2012 11:28:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm35916956eeo.8.2012.11.26.11.28.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 11:28:32 -0800 (PST)
Date: Mon, 26 Nov 2012 20:28:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121126192838.GC18943@jama.jama.net>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
	<1353864310-20097-5-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1353864310-20097-5-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-webserver][PATCH 5/7] php: upgrade to 5.3.19
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
X-List-Received-Date: Mon, 26 Nov 2012 19:42:44 -0000
X-Groupsio-MsgNum: 41725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 25, 2012 at 06:25:08PM +0100, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc         |  4 ++--
>  meta-oe/recipes-devtools/php/php/iconv.patch | 26 +++++++++++++---------=
----
>  meta-oe/recipes-devtools/php/php_5.3.19.bb   | 19 +++++++++++++++++++
>  meta-oe/recipes-devtools/php/php_5.3.6.bb    | 19 -------------------
>  4 files changed, 34 insertions(+), 34 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/php/php_5.3.19.bb
>  delete mode 100644 meta-oe/recipes-devtools/php/php_5.3.6.bb

Fixes the build issue with new libxml2 I've reported few days ago, so:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 87eb4b1..03b7b40 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -1,13 +1,13 @@
>  DESCRIPTION =3D "A server-side, HTML-embedded scripting language. This p=
ackage provides the CGI."
>  HOMEPAGE =3D "http://www.php.net"
>  SECTION =3D "console/network"
> -LICENSE =3D "PHP"
> +LICENSE =3D "PHP-3.0"
>  BBCLASSEXTEND =3D "native"
>  DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native mysql=
5 \
>             libc-client openssl"
>  DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> =20
> -INC_PR =3D "r2"
> +INC_PR =3D "r0"
> =20
>  SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
> =20
> diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recip=
es-devtools/php/php/iconv.patch
> index 66b39cc..f3d2a16 100644
> --- a/meta-oe/recipes-devtools/php/php/iconv.patch
> +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
> @@ -1,21 +1,21 @@
> -Index: php-5.2.13/acinclude.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- php-5.2.13.orig/acinclude.m4
> -+++ php-5.2.13/acinclude.m4
> -@@ -2430,7 +2430,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> -   dnl
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 4c28b80..d6491a1 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -2439,7 +2439,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>     dnl Check libc first if no path is provided in --with-iconv
>     dnl
> +=20
>  -  if test "$PHP_ICONV" =3D "yes"; then
>  +  dnl must check against no, not against yes as PHP_ICONV can also incl=
ude a path, which implies yes
>  +  if test "$PHP_ICONV" !=3D "no"; then
> -     AC_CHECK_FUNC(iconv, [
> -       found_iconv=3Dyes
> -     ],[
> -Index: php-5.2.13/ext/iconv/config.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- php-5.2.13.orig/ext/iconv/config.m4
> -+++ php-5.2.13/ext/iconv/config.m4
> +     dnl Reset LIBS temporarily as it may have already been included
> +     dnl -liconv in.
> +     LIBS_save=3D"$LIBS"
> +diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
> +index d673b0a..1fbef13 100644
> +--- a/ext/iconv/config.m4
> ++++ b/ext/iconv/config.m4
>  @@ -15,7 +15,7 @@ if test "$PHP_ICONV" !=3D "no"; then
>  =20
>     if test "$iconv_avail" !=3D "no"; then
> diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes=
-devtools/php/php_5.3.19.bb
> new file mode 100644
> index 0000000..e96b760
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php_5.3.19.bb
> @@ -0,0 +1,19 @@
> +require php.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb564efdf78cce8ea6e4b5a4f7c05=
d97"
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://acinclude-xml2-config.patch \
> +            file://php-m4-divert.patch \
> +            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
> +
> +SRC_URI_append_pn-php +=3D "file://iconv.patch \
> +            file://imap-fix-autofoo.patch \
> +            file://pear-makefile.patch \
> +            file://phar-makefile.patch \
> +            file://php_exec_native.patch \
> +            "
> +
> +SRC_URI[md5sum] =3D "e1d2a3ec7849d4b3032bd1abf1916aa4"
> +SRC_URI[sha256sum] =3D "814ce55b950158c4ddadbcd0b2d7d8cb4b570de4a29b9db0=
21020594e2469fd6"
> diff --git a/meta-oe/recipes-devtools/php/php_5.3.6.bb b/meta-oe/recipes-=
devtools/php/php_5.3.6.bb
> deleted file mode 100644
> index 9524bd9..0000000
> --- a/meta-oe/recipes-devtools/php/php_5.3.6.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require php.inc
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb564efdf78cce8ea6e4b5a4f7c05=
d97"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://acinclude-xml2-config.patch \
> -            file://php-m4-divert.patch \
> -            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
> -
> -SRC_URI_append_pn-php +=3D "file://iconv.patch \
> -            file://imap-fix-autofoo.patch \
> -            file://pear-makefile.patch \
> -            file://phar-makefile.patch \
> -            file://php_exec_native.patch \
> -            "
> -
> -SRC_URI[md5sum] =3D "2286f5a82a6e8397955a0025c1c2ad98"
> -SRC_URI[sha256sum] =3D "30ae880f22e3ee93eccc9b80e3c58b0d6364d139bb4366dc=
c27f2fab658d3198"
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCzwuYACgkQN1Ujt2V2gBzW/QCgsvyeqNWl1orC701icesxXAw4
M5UAoI8a0OJHBKLrmBbqOLQXtmZ4l73C
=uJ0H
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
