Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF8B65E0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Oct 2014 15:30:52 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so4971349wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 08:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Gmrkada1EfRM5yKvJdZyDdrAlvrlYiQ1dRXiqdmon+8=;
	b=LUeTrtgszfAi3L/4hmojYN2tdsmxUbhORUEQx2FuKHUj84U+lmbcKFPVGIYK/CnOzf
	1Wc+YYflEJzAOTDFEUH35vJ0d6QVzwl4ql4Wo14eUUm3aigDTut5FUAd4Ed4dgxqUlVr
	7wPF/5CHqjGnn/yn6leuAkhCsMnD/wAZ1NrK/UksmeuxoVGOMcW2w/2K0RVaYAwk1am2
	JMUY38TL/T9uJC2ObMVwB5HnMbFfn3X9irUGOw5778FijH+jttOx4oh/bQbPx7Z8+IfJ
	5LkW+GrzFGmqkDc+8XOilb3HypRuBW2RPbIj8mRJE55u4IdPHsD24v57t4KjikVFLxAT
	vkXg==
X-Received: by 10.194.59.109 with SMTP id y13mr4288425wjq.124.1412609453228;
	Mon, 06 Oct 2014 08:30:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ga7sm4177478wic.5.2014.10.06.08.30.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 08:30:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Oct 2014 17:31:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141006153154.GW25706@jama>
References: <1412589301-6669-1-git-send-email-koen.kooi@linaro.org>
	<1412589301-6669-3-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1412589301-6669-3-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH 3/3] php: update to 5.4.33
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Oct 2014 15:30:57 -0000
X-Groupsio-MsgNum: 52376
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b6rSbt24+kIAbQdu"
Content-Disposition: inline

--b6rSbt24+kIAbQdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 11:55:01AM +0200, Koen Kooi wrote:
> One patch was a backport and can be dropped, add Upstream-status to the o=
thers.

Can we build modphp here and drop separate recipe:
meta-webserver/recipes-php/modphp/modphp_5.5.15.bb

Currently they overlap in staged files, so only one of them will get
built anyway.

> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...cinclude-use-pkgconfig-for-libxml2-config.patch |  8 ++--
>  ...01-php-don-t-use-broken-wrapper-for-mkdir.patch | 12 +++---
>  .../php/php/acinclude-xml2-config.patch            | 15 +++++--
>  .../php/php/fix-fpm-cross-compile.patch            | 38 -----------------
>  meta-oe/recipes-devtools/php/php/iconv.patch       |  9 ++++-
>  .../php/php/imap-fix-autofoo.patch                 | 47 ++++++++++++----=
------
>  .../recipes-devtools/php/php/pear-makefile.patch   |  7 +++-
>  .../recipes-devtools/php/php/phar-makefile.patch   | 11 ++++-
>  .../recipes-devtools/php/php/php_exec_native.patch | 19 +++++----
>  .../php/{php_5.4.14.bb =3D> php_5.4.33.bb}           |  9 ++---
>  10 files changed, 81 insertions(+), 94 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/php/php/fix-fpm-cross-compil=
e.patch
>  rename meta-oe/recipes-devtools/php/{php_5.4.14.bb =3D> php_5.4.33.bb} (=
95%)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfi=
g-for-libxml2-config.patch b/meta-oe/recipes-devtools/php/php/0001-acinclud=
e-use-pkgconfig-for-libxml2-config.patch
> index 823007e..51a5e43 100644
> --- a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-l=
ibxml2-config.patch
> +++ b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-l=
ibxml2-config.patch
> @@ -1,7 +1,7 @@
> -From 0ff5d4adc9f5950d66738272b3ba88ef74f69117 Mon Sep 17 00:00:00 2001
> +From 003c9feaae6ed5c173edcea51193e49bc94ac39a Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Tue, 17 Jun 2014 09:53:00 +0200
> -Subject: [PATCH] acinclude: use pkgconfig for libxml2 config
> +Subject: [PATCH 3/8] acinclude: use pkgconfig for libxml2 config
> =20
>  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>  Upstream-Status: pending
> @@ -10,10 +10,10 @@ Upstream-Status: pending
>   1 file changed, 23 insertions(+), 40 deletions(-)
> =20
>  diff --git a/acinclude.m4 b/acinclude.m4
> -index 9c7a305..211dbd3 100644
> +index 206fcbf..a6c0d84 100644
>  --- a/acinclude.m4
>  +++ b/acinclude.m4
> -@@ -2529,48 +2529,31 @@ dnl
> +@@ -2530,48 +2530,31 @@ dnl
>   dnl Common setup macro for libxml
>   dnl
>   AC_DEFUN([PHP_SETUP_LIBXML], [
> diff --git a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-w=
rapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0001-php-don-t-us=
e-broken-wrapper-for-mkdir.patch
> index 9b71e9d..2f7d581 100644
> --- a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-=
for-mkdir.patch
> +++ b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-=
for-mkdir.patch
> @@ -1,18 +1,18 @@
> -From 411ec4b31fdcc524f13fe5be80fd6769b7d16a5d Mon Sep 17 00:00:00 2001
> +From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen@dominion.thruhere.net>
>  Date: Thu, 3 Nov 2011 14:27:15 +0100
> -Subject: [PATCH] php: don't use broken wrapper for mkdir
> +Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
> =20
>  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>  ---
> =20
>  Upstream-Status: Inappropriate
> =20
> - Makefile.global |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> + Makefile.global | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/Makefile.global b/Makefile.global
> -index 8dad0e4..abdb5d2 100644
> +index ff858c2..ae554b4 100644
>  --- a/Makefile.global
>  +++ b/Makefile.global
>  @@ -1,4 +1,4 @@
> @@ -22,5 +22,5 @@ index 8dad0e4..abdb5d2 100644
>   INSTALL_DATA =3D $(INSTALL) -m 644
>  =20
>  --=20
> -1.7.2.5
> +1.9.3
> =20
> diff --git a/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch=
 b/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> index bf519d2..30811a7 100644
> --- a/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> +++ b/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> @@ -1,6 +1,10 @@
> ---- /orig-acinclude.m4 2007-02-20 15:03:25.000000000 +0200
> -+++ /acinclude.m4      2007-02-20 15:03:24.000000000 +0200
> -@@ -2359,12 +2359,9 @@
> +Upstream-status: Unknown
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 4fd452e..206fcbf 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -2532,12 +2532,9 @@ dnl
>   AC_DEFUN([PHP_SETUP_LIBXML], [
>   AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
>   [
> @@ -14,5 +18,8 @@
>  +      ac_cv_php_xml2_config_path=3D"$PHP_LIBXML_DIR/xml2-config"
>  +
>   ])
> -
> +=20
>     if test -x "$ac_cv_php_xml2_config_path"; then
> +--=20
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch=
 b/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
> deleted file mode 100644
> index b009347..0000000
> --- a/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 0b44f16ea2f18a08eb1249db6621840527eab5e0 Mon Sep 17 00:00:00 2001
> -From: Jerome Loyet <fat@php.net>
> -Date: Wed, 23 May 2012 11:40:22 +0200
> -Subject: [PATCH] - Fixed bug #61839 (Unable to cross-compile PHP with
> - --enable-fpm)
> -
> ----
> -Upstream-Status: Applied=20
> -http://git.php.net/?p=3Dphp-src.git;a=3Dcommit;h=3D0b44f16ea2f18a08eb124=
9db6621840527eab5e0
> -
> - NEWS               | 1 +
> - sapi/fpm/config.m4 | 4 ++++
> - 2 files changed, 5 insertions(+)
> -
> -diff --git a/sapi/fpm/config.m4 b/sapi/fpm/config.m4
> -index 8962810..6c860c9 100644
> ---- a/sapi/fpm/config.m4
> -+++ b/sapi/fpm/config.m4
> -@@ -192,6 +192,8 @@ AC_DEFUN([AC_FPM_TRACE],
> -       have_ptrace=3Dno
> -       have_broken_ptrace=3Dyes
> -       AC_MSG_RESULT([no])
> -+    ], [
> -+      AC_MSG_RESULT([skipped (cross compiling)])
> -     ])
> -   fi
> -=20
> -@@ -264,6 +266,8 @@ AC_DEFUN([AC_FPM_TRACE],
> -     ], [
> -       proc_mem_file=3D""
> -       AC_MSG_RESULT([no])
> -+    ], [
> -+      AC_MSG_RESULT([skipped (cross compiling)])
> -     ])
> -   fi
> -  =20
> ---=20
> -1.7.11.5
> diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recip=
es-devtools/php/php/iconv.patch
> index f3d2a16..255fbb0 100644
> --- a/meta-oe/recipes-devtools/php/php/iconv.patch
> +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
> @@ -1,8 +1,10 @@
> +Upstream-status: Unknown
> +
>  diff --git a/acinclude.m4 b/acinclude.m4
> -index 4c28b80..d6491a1 100644
> +index a6c0d84..df11abd 100644
>  --- a/acinclude.m4
>  +++ b/acinclude.m4
> -@@ -2439,7 +2439,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> +@@ -2452,7 +2452,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
>     dnl Check libc first if no path is provided in --with-iconv
>     dnl
>  =20
> @@ -25,3 +27,6 @@ index d673b0a..1fbef13 100644
>           if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h=
"; then
>             PHP_ICONV_PREFIX=3D"$i"
>             break
> +--=20
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch b/me=
ta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> index 3695b7b..da04c2d 100644
> --- a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> +++ b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> @@ -1,8 +1,23 @@
> -Index: php-5.2.11/ext/imap/config.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- php-5.2.11.orig/ext/imap/config.m4	2009-12-10 12:27:52.800974533 -07=
00
> -+++ php-5.2.11/ext/imap/config.m4	2009-12-10 12:28:33.720976583 -0700
> -@@ -103,7 +103,7 @@
> +Upstream-status: Unknown
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index df11abd..06e7236 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -2357,7 +2357,7 @@ AC_DEFUN([PHP_SETUP_OPENSSL],[
> +       PHP_OPENSSL_DIR=3D"/usr/local/ssl /usr/local /usr /usr/local/open=
ssl"
> +     fi
> +=20
> +-    for i in $PHP_OPENSSL_DIR; do
> ++    for i in $PHP_OPENSSL_DIR $PHP_OPENSSL_DIR/usr; do
> +       if test -r $i/include/openssl/evp.h; then
> +         OPENSSL_INCDIR=3D$i/include
> +       fi
> +diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
> +index 3fcf674..f08caf7 100644
> +--- a/ext/imap/config.m4
> ++++ b/ext/imap/config.m4
> +@@ -109,7 +109,7 @@ if test "$PHP_IMAP" !=3D "no"; then
>       PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared)
>       AC_DEFINE(HAVE_IMAP,1,[ ])
>  =20
> @@ -11,13 +26,13 @@ Index: php-5.2.11/ext/imap/config.m4
>         IMAP_INC_CHK()
>         el[]IMAP_INC_CHK(/include/c-client)
>         el[]IMAP_INC_CHK(/include/imap)
> -@@ -192,13 +192,7 @@
> +@@ -198,13 +198,7 @@ if test "$PHP_IMAP" !=3D "no"; then
>         AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client ins=
tallation.)
>       fi
>  =20
> --    if test -r "$IMAP_DIR/c-client/c-client.a"; then
> +-    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r "$IMAP_D=
IR/c-client/c-client.a" ; then
>  -      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-cl=
ient.a" >/dev/null 2>&1
> --    elif test -r "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
> +-    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r "$I=
MAP_DIR/$PHP_LIBDIR/c-client.a"; then
>  -      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/l=
ibc-client.a" >/dev/null 2>&1
>  -    fi
>  -
> @@ -26,16 +41,6 @@ Index: php-5.2.11/ext/imap/config.m4
>         IMAP_LIB=3D$lib
>         IMAP_LIB_CHK($PHP_LIBDIR)
>         IMAP_LIB_CHK(c-client)
> -Index: php-5.2.11/acinclude.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- php-5.2.11.orig/acinclude.m4	2009-12-10 12:37:13.134722881 -0700
> -+++ php-5.2.11/acinclude.m4	2009-12-10 12:37:39.342007053 -0700
> -@@ -2338,7 +2338,7 @@
> -       PHP_OPENSSL_DIR=3D"/usr/local/ssl /usr/local /usr /usr/local/open=
ssl"
> -     fi
> -=20
> --    for i in $PHP_OPENSSL_DIR; do
> -+    for i in $PHP_OPENSSL_DIR $PHP_OPENSSL_DIR/usr; do
> -       if test -r $i/include/openssl/evp.h; then
> -         OPENSSL_INCDIR=3D$i/include
> -       fi
> +--=20
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php/pear-makefile.patch b/meta-=
oe/recipes-devtools/php/php/pear-makefile.patch
> index 1928b98..9927d2d 100644
> --- a/meta-oe/recipes-devtools/php/php/pear-makefile.patch
> +++ b/meta-oe/recipes-devtools/php/php/pear-makefile.patch
> @@ -1,5 +1,7 @@
> +Upstream-status: Unknown
> +
>  diff --git a/pear/Makefile.frag b/pear/Makefile.frag
> -index 1f6f70e..b19a77c 100644
> +index 00bacae..739eeca 100644
>  --- a/pear/Makefile.frag
>  +++ b/pear/Makefile.frag
>  @@ -11,7 +11,7 @@ PEAR_PREFIX =3D -dp a${program_prefix}
> @@ -11,3 +13,6 @@ index 1f6f70e..b19a77c 100644
>  =20
>   install-pear:
>   	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
> +--=20
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch b/meta-=
oe/recipes-devtools/php/php/phar-makefile.patch
> index 6fde251..8a1136d 100644
> --- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> +++ b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> @@ -1,8 +1,12 @@
> +Upstream-status: Unknown
> +
>  diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
> -index fc93d1d..9a8cd65 100755
> +old mode 100644
> +new mode 100755
> +index ed6de9f..9d03198
>  --- a/ext/phar/Makefile.frag
>  +++ b/ext/phar/Makefile.frag
> -@@ -6,19 +6,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
> +@@ -5,19 +5,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
>  =20
>   PHP_PHARCMD_SETTINGS =3D -d 'open_basedir=3D' -d 'output_buffering=3D0'=
 -d 'memory_limit=3D-1' -d phar.readonly=3D0 -d 'safe_mode=3D0'
>   PHP_PHARCMD_EXECUTABLE =3D ` \
> @@ -24,3 +28,6 @@ index fc93d1d..9a8cd65 100755
>   PHP_PHARCMD_BANG =3D `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_=
ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
>  =20
>   $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
> +--=20
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php/php_exec_native.patch b/met=
a-oe/recipes-devtools/php/php/php_exec_native.patch
> index 31be1b7..0506bdd 100644
> --- a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
> +++ b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
> @@ -1,12 +1,10 @@
> ----
> - sapi/cli/config.m4 |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> +Upstream-status: Inappriate
> =20
> ---- php-5.4.14.orig/sapi/cli/config.m4
> -+++ php-5.4.14/sapi/cli/config.m4
> -@@ -34,11 +34,11 @@ if test "$PHP_CLI" !=3D "no"; then
> -     BUILD_CLI=3D"\$(LIBTOOL) --mode=3Dlink \$(CC) -export-dynamic \$(CF=
LAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS) \$(PHP_R=
PATHS) \$(PHP_GLOBAL_OBJS) \$(PHP_BINARY_OBJS) \$(PHP_CLI_OBJS) \$(EXTRA_LI=
BS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CLI_PATH)"
> -     ;;
> +diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
> +index cdfa1f7..0fe11e3 100644
> +--- a/sapi/cli/config.m4
> ++++ b/sapi/cli/config.m4
> +@@ -36,7 +36,7 @@ if test "$PHP_CLI" !=3D "no"; then
>     esac
>  =20
>     dnl Set executable for tests
> @@ -15,5 +13,6 @@
>     PHP_SUBST(PHP_EXECUTABLE)
>  =20
>     dnl Expose to Makefile
> -   PHP_SUBST(SAPI_CLI_PATH)
> -   PHP_SUBST(BUILD_CLI)
> +--=20
> +1.9.3
> +
> diff --git a/meta-oe/recipes-devtools/php/php_5.4.14.bb b/meta-oe/recipes=
-devtools/php/php_5.4.33.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/php/php_5.4.14.bb
> rename to meta-oe/recipes-devtools/php/php_5.4.33.bb
> index b738701..52e39a5 100644
> --- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.4.33.bb
> @@ -10,13 +10,11 @@ DEPENDS =3D "zlib libxml2 virtual/libiconv php-native=
 lemon-native \
>             libc-client openssl"
>  DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> =20
> -PR =3D "r6"
> -
>  # The new PHP downloads server groups PHP releases by major version so f=
ind
>  # the major version of the PHP recipe.
>  PHP_MAJVER =3D "${@d.getVar('PV',1).split('.')[0]}"
> =20
> -SRC_URI =3D "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2 \
> +SRC_URI =3D "http://php.net/distributions/php-${PV}.tar.bz2 \
>             file://acinclude-xml2-config.patch \
>             file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
>             file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
> @@ -28,13 +26,12 @@ SRC_URI_append_class-target +=3D " \
>              file://pear-makefile.patch \
>              file://phar-makefile.patch \
>              file://php_exec_native.patch \
> -            file://fix-fpm-cross-compile.patch \
>              file://php-fpm.conf \
>              file://php-fpm-apache.conf \
>            "
> =20
> -SRC_URI[md5sum] =3D "cfdc044be2c582991a1fe0967898fa38"
> -SRC_URI[sha256sum] =3D "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02=
fe4a46f9c81be20a"
> +SRC_URI[md5sum] =3D "c6878bb1cdb46bfc1e1a5cd67a024737"
> +SRC_URI[sha256sum] =3D "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d=
19b74c2278e40bb5"
> =20
>  S =3D "${WORKDIR}/php-${PV}"
> =20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b6rSbt24+kIAbQdu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQyteoACgkQN1Ujt2V2gByyEgCdFpv8A6PWCkYGJg4PP9KJnqbE
BekAn1yLUR8KympeQj6DBUhcjPvTmaG4
=ot+6
-----END PGP SIGNATURE-----

--b6rSbt24+kIAbQdu--
