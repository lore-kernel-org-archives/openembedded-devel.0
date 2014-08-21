Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id BD6B460169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 11:14:40 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so9116842wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 04:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DIZv3nnVSeg2QtnrmsaSlWkzIoK+rgQKmpPh8RaOHus=;
	b=b0uhbvCvKT0+jqRI8XTrQ6+sVBAz6MdspJNtu/UxzVRmDCCHfmcB/UMfEE5nqct4jq
	9/XEc+TJNr07K5IbbsqoeRJ5zaCmV8fonr57s5cpf9Ls8bn9HF4TwMq6lJo7Z+I/RX2A
	CLp6mB/bdCx5u0EPueWVVAX6BMvOP2qM4BVlC2te3q2XDui6YZ8YY6mWKzryzOx60hIm
	TgdGj5zc+LTk2h57VDsffgADEQi+rH0zJFCzeeoQdy0DX/x2BhGKlcLOC3ktBB1YGuxb
	+IU6mMAwejW89KCxNPhhM2IJmIhVI7Qttl5o1AAOF5w/Pv6Bp54vrHUoB/DGUMB7GH6C
	TXaQ==
X-Received: by 10.195.13.79 with SMTP id ew15mr63692785wjd.19.1408619681055;
	Thu, 21 Aug 2014 04:14:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eb4sm18979247wic.16.2014.08.21.04.14.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 04:14:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Aug 2014 13:14:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140821111443.GX3660@jama>
References: <674e63b93b3c0bfe18d58d6c11c1cc7a.squirrel@webmail.prtelecom.hu>
	<55c56fabb920e066ba8915e51fb4ecdf.squirrel@webmail.prtelecom.hu>
MIME-Version: 1.0
In-Reply-To: <55c56fabb920e066ba8915e51fb4ecdf.squirrel@webmail.prtelecom.hu>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] PHP 5.5.15
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
X-List-Received-Date: Thu, 21 Aug 2014 11:14:49 -0000
X-Groupsio-MsgNum: 51809
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pDtNmxPr5KTxcQ6Z"
Content-Disposition: inline

--pDtNmxPr5KTxcQ6Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2014 at 12:13:05PM +0200, zboszor@pr.hu wrote:
> > Hello,
> >
> > as a follow-up to my yesterday's mail about "[PATCH] Allow using a more
> > recent php", here's the proof of the pudding.
> >
> > I needed GD support in PHP, and it turned out that PHP 5.4.x only suppo=
rts
> > GD 2.0, while current OE has 2.1. Not wanting to downgrade GD, I chose =
to
> > upgrade PHP.
> >
> > I had to update imap-fix-autofoo.patch so it applies cleanly and I also
> > had to fix https://bugs.php.net/bug.php?id=3D66103 so it can be cross
> > compiled. (I also submitted the patch at the link).
> >
> > I enabled more extensions in PHP than what was in the previous version,
> > this is what I needed locally.
> >
> > Comments?
> >
> > Feel free to use it in any way.
>=20
> This time with the patch attached. :-)

Can you please send inline patch (preferably with git send-email as
README suggests)?

There is also issue with some files not being tracked by sstate:
[^/]*/usr/lib/php/\.channels.*
[^/]*/usr/lib/php/\.registry.*
[^/]*/usr/lib/php/\.depdb.*
[^/]*/usr/lib/php/\.filemap
[^/]*/usr/lib/php/\.lock

Can someone interested in php look into fixing them? You can detect them
easily with openembedded-core/scripts/sstate-sysroot-cruft.sh after
building php (not reusing it from ssstate).

> > Best regards,
> > Zolt=E1n B=F6sz=F6rm=E9nyi
> >
> >

> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/0001-php-don-t-use-b=
roken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php-5.5.15/000=
1-php-don-t-use-broken-wrapper-for-mkdir.patch
> new file mode 100644
> index 0000000..9b71e9d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/0001-php-don-t-use-broken-w=
rapper-for-mkdir.patch
> @@ -0,0 +1,26 @@
> +From 411ec4b31fdcc524f13fe5be80fd6769b7d16a5d Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 3 Nov 2011 14:27:15 +0100
> +Subject: [PATCH] php: don't use broken wrapper for mkdir
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> +
> +Upstream-Status: Inappropriate
> +
> + Makefile.global |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile.global b/Makefile.global
> +index 8dad0e4..abdb5d2 100644
> +--- a/Makefile.global
> ++++ b/Makefile.global
> +@@ -1,4 +1,4 @@
> +-mkinstalldirs =3D $(top_srcdir)/build/shtool mkdir -p
> ++mkinstalldirs =3D mkdir -p
> + INSTALL =3D $(top_srcdir)/build/shtool install -c
> + INSTALL_DATA =3D $(INSTALL) -m 644
> +=20
> +--=20
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/acinclude-xml2-confi=
g.patch b/meta-oe/recipes-devtools/php/php-5.5.15/acinclude-xml2-config.pat=
ch
> new file mode 100644
> index 0000000..bf519d2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/acinclude-xml2-config.patch
> @@ -0,0 +1,18 @@
> +--- /orig-acinclude.m4 2007-02-20 15:03:25.000000000 +0200
> ++++ /acinclude.m4      2007-02-20 15:03:24.000000000 +0200
> +@@ -2359,12 +2359,9 @@
> + AC_DEFUN([PHP_SETUP_LIBXML], [
> + AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
> + [
> +-  for i in $PHP_LIBXML_DIR /usr/local /usr; do
> +-    if test -x "$i/bin/xml2-config"; then
> +-      ac_cv_php_xml2_config_path=3D"$i/bin/xml2-config"
> +-      break
> +-    fi
> +-  done
> ++
> ++      ac_cv_php_xml2_config_path=3D"$PHP_LIBXML_DIR/xml2-config"
> ++
> + ])
> +
> +   if test -x "$ac_cv_php_xml2_config_path"; then
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/fix-fpm-cross-compil=
e.patch b/meta-oe/recipes-devtools/php/php-5.5.15/fix-fpm-cross-compile.pat=
ch
> new file mode 100644
> index 0000000..b009347
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/fix-fpm-cross-compile.patch
> @@ -0,0 +1,38 @@
> +From 0b44f16ea2f18a08eb1249db6621840527eab5e0 Mon Sep 17 00:00:00 2001
> +From: Jerome Loyet <fat@php.net>
> +Date: Wed, 23 May 2012 11:40:22 +0200
> +Subject: [PATCH] - Fixed bug #61839 (Unable to cross-compile PHP with
> + --enable-fpm)
> +
> +---
> +Upstream-Status: Applied=20
> +http://git.php.net/?p=3Dphp-src.git;a=3Dcommit;h=3D0b44f16ea2f18a08eb124=
9db6621840527eab5e0
> +
> + NEWS               | 1 +
> + sapi/fpm/config.m4 | 4 ++++
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/sapi/fpm/config.m4 b/sapi/fpm/config.m4
> +index 8962810..6c860c9 100644
> +--- a/sapi/fpm/config.m4
> ++++ b/sapi/fpm/config.m4
> +@@ -192,6 +192,8 @@ AC_DEFUN([AC_FPM_TRACE],
> +       have_ptrace=3Dno
> +       have_broken_ptrace=3Dyes
> +       AC_MSG_RESULT([no])
> ++    ], [
> ++      AC_MSG_RESULT([skipped (cross compiling)])
> +     ])
> +   fi
> +=20
> +@@ -264,6 +266,8 @@ AC_DEFUN([AC_FPM_TRACE],
> +     ], [
> +       proc_mem_file=3D""
> +       AC_MSG_RESULT([no])
> ++    ], [
> ++      AC_MSG_RESULT([skipped (cross compiling)])
> +     ])
> +   fi
> +  =20
> +--=20
> +1.7.11.5
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/flock-type-crosscomp=
ile.patch b/meta-oe/recipes-devtools/php/php-5.5.15/flock-type-crosscompile=
=2Epatch
> new file mode 100644
> index 0000000..1e8c587
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/flock-type-crosscompile.pat=
ch
> @@ -0,0 +1,49 @@
> +diff -durpN php-5.5.15.old/configure.in php-5.5.15/configure.in
> +--- php-5.5.15.old/configure.in	2014-07-23 11:00:58.000000000 +0200
> ++++ php-5.5.15/configure.in	2014-08-21 10:28:03.109623271 +0200
> +@@ -687,6 +687,10 @@ asprintf \
> + nanosleep \
> + )
> +=20
> ++PHP_ARG_WITH(flock-type, flock ordering type (use for cross compiling),
> ++[  --with-flock-type=3D{linux|bsd}
> ++                          Set the flock ordering type for further check=
s during cross-compiling], unknown, no)
> ++
> + dnl Some systems (like OpenSolaris) do not have nanosleep in libc
> + PHP_CHECK_FUNC_LIB(nanosleep, rt)
> +=20
> +diff -durpN php-5.5.15.old/ext/opcache/config.m4 php-5.5.15/ext/opcache/=
config.m4
> +--- php-5.5.15.old/ext/opcache/config.m4	2014-07-23 11:00:58.000000000 +=
0200
> ++++ php-5.5.15/ext/opcache/config.m4	2014-08-21 10:40:40.207914012 +0200
> +@@ -341,7 +341,14 @@ AC_TRY_RUN([
> + 	flock_type=3Dlinux
> +     AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
> +     AC_MSG_RESULT("yes")
> +-], AC_MSG_RESULT("no") )
> ++], AC_MSG_RESULT("no"), [
> ++  if test "$PHP_FLOCK_TYPE" =3D=3D "linux"; then
> ++    AC_MSG_RESULT("yes")
> ++    flock_type=3Dlinux
> ++  else
> ++    AC_MSG_RESULT("no")
> ++  fi
> ++] )
> +=20
> + AC_MSG_CHECKING("whether flock struct is BSD ordered")
> + AC_TRY_RUN([
> +@@ -357,7 +364,14 @@ AC_TRY_RUN([
> + 	flock_type=3Dbsd
> +     AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])=20
> +     AC_MSG_RESULT("yes")
> +-], AC_MSG_RESULT("no") )
> ++], AC_MSG_RESULT("no"), [
> ++  if test "$PHP_FLOCK_TYPE" =3D=3D "bsd"; then
> ++    AC_MSG_RESULT("yes")
> ++    flock_type=3Dbsd
> ++  else
> ++    AC_MSG_RESULT("no")
> ++  fi
> ++])
> +=20
> + if test "$flock_type" =3D=3D "unknown"; then
> + 	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] =
set --enable-opcache=3Dno])
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/iconv.patch b/meta-o=
e/recipes-devtools/php/php-5.5.15/iconv.patch
> new file mode 100644
> index 0000000..f3d2a16
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/iconv.patch
> @@ -0,0 +1,27 @@
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 4c28b80..d6491a1 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -2439,7 +2439,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> +   dnl Check libc first if no path is provided in --with-iconv
> +   dnl
> +=20
> +-  if test "$PHP_ICONV" =3D "yes"; then
> ++  dnl must check against no, not against yes as PHP_ICONV can also incl=
ude a path, which implies yes
> ++  if test "$PHP_ICONV" !=3D "no"; then
> +     dnl Reset LIBS temporarily as it may have already been included
> +     dnl -liconv in.
> +     LIBS_save=3D"$LIBS"
> +diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
> +index d673b0a..1fbef13 100644
> +--- a/ext/iconv/config.m4
> ++++ b/ext/iconv/config.m4
> +@@ -15,7 +15,7 @@ if test "$PHP_ICONV" !=3D "no"; then
> +=20
> +   if test "$iconv_avail" !=3D "no"; then
> +     if test -z "$ICONV_DIR"; then
> +-      for i in /usr/local /usr; do
> ++      for i in $PHP_ICONV /usr/local /usr; do
> +         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h=
"; then
> +           PHP_ICONV_PREFIX=3D"$i"
> +           break
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/imap-fix-autofoo.pat=
ch b/meta-oe/recipes-devtools/php/php-5.5.15/imap-fix-autofoo.patch
> new file mode 100644
> index 0000000..d687705
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/imap-fix-autofoo.patch
> @@ -0,0 +1,39 @@
> +diff -durpN php-5.4.31.old/acinclude.m4 php-5.4.31/acinclude.m4
> +--- php-5.4.31.old/acinclude.m4	2014-08-21 09:39:14.355458436 +0200
> ++++ php-5.4.31/acinclude.m4	2014-08-21 09:36:59.426390224 +0200
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
> +diff -durpN php-5.4.31.old/ext/imap/config.m4 php-5.4.31/ext/imap/config=
=2Em4
> +--- php-5.4.31.old/ext/imap/config.m4	2014-07-23 02:59:30.000000000 +0200
> ++++ php-5.4.31/ext/imap/config.m4	2014-08-21 09:36:25.174374637 +0200
> +@@ -109,7 +109,7 @@ if test "$PHP_IMAP" !=3D "no"; then
> +     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared)
> +     AC_DEFINE(HAVE_IMAP,1,[ ])
> +=20
> +-    for i in $PHP_IMAP /usr/local /usr; do
> ++    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
> +       IMAP_INC_CHK()
> +       el[]IMAP_INC_CHK(/include/c-client)
> +       el[]IMAP_INC_CHK(/include/imap)
> +@@ -198,13 +198,7 @@ if test "$PHP_IMAP" !=3D "no"; then
> +       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client ins=
tallation.)
> +     fi
> +=20
> +-    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r "$IMAP_D=
IR/c-client/c-client.a" ; then
> +-      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-cl=
ient.a" >/dev/null 2>&1
> +-    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r "$I=
MAP_DIR/$PHP_LIBDIR/c-client.a"; then
> +-      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/l=
ibc-client.a" >/dev/null 2>&1
> +-    fi
> +-
> +-    for lib in c-client4 c-client imap; do
> ++    for lib in /usr/lib c-client4 c-client imap; do
> +       IMAP_LIB=3D$lib
> +       IMAP_LIB_CHK($PHP_LIBDIR)
> +       IMAP_LIB_CHK(c-client)
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/pear-makefile.patch =
b/meta-oe/recipes-devtools/php/php-5.5.15/pear-makefile.patch
> new file mode 100644
> index 0000000..1928b98
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/pear-makefile.patch
> @@ -0,0 +1,13 @@
> +diff --git a/pear/Makefile.frag b/pear/Makefile.frag
> +index 1f6f70e..b19a77c 100644
> +--- a/pear/Makefile.frag
> ++++ b/pear/Makefile.frag
> +@@ -11,7 +11,7 @@ PEAR_PREFIX =3D -dp a${program_prefix}
> + PEAR_SUFFIX =3D -ds a$(program_suffix)
> +=20
> + install-pear-installer: $(SAPI_CLI_PATH)
> +-	@$(top_builddir)/sapi/cli/php $(PEAR_INSTALL_FLAGS) pear/install-pear-=
nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
> ++	@$(PHP_NATIVE_DIR)/php $(PEAR_INSTALL_FLAGS) $(builddir)/install-pear-=
nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
> +=20
> + install-pear:
> + 	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/phar-makefile.patch =
b/meta-oe/recipes-devtools/php/php-5.5.15/phar-makefile.patch
> new file mode 100644
> index 0000000..6fde251
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/phar-makefile.patch
> @@ -0,0 +1,26 @@
> +diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
> +index fc93d1d..9a8cd65 100755
> +--- a/ext/phar/Makefile.frag
> ++++ b/ext/phar/Makefile.frag
> +@@ -6,19 +6,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
> +=20
> + PHP_PHARCMD_SETTINGS =3D -d 'open_basedir=3D' -d 'output_buffering=3D0'=
 -d 'memory_limit=3D-1' -d phar.readonly=3D0 -d 'safe_mode=3D0'
> + PHP_PHARCMD_EXECUTABLE =3D ` \
> +-	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
> +-		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PAT=
H) -n"; \
> +-		if test "x$(PHP_MODULES)" !=3D "x"; then \
> +-		$(top_srcdir)/build/shtool echo -n -- " -d extension_dir=3D$(top_buil=
ddir)/modules"; \
> +-		for i in bz2 zlib phar; do \
> +-			if test -f "$(top_builddir)/modules/$$i.la"; then \
> +-				. $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -=
n -- " -d extension=3D$$dlname"; \
> +-			fi; \
> +-		done; \
> +-		fi; \
> +-	else \
> +-		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
> +-	fi;`
> ++		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
> ++
> + PHP_PHARCMD_BANG =3D `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_=
ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
> +=20
> + $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/php-fpm-apache.conf =
b/meta-oe/recipes-devtools/php/php-5.5.15/php-fpm-apache.conf
> new file mode 100644
> index 0000000..77cdd82
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/php-fpm-apache.conf
> @@ -0,0 +1,6 @@
> +# Taken from http://wiki.apache.org/httpd/PHP-FPM
> +
> +LoadModule proxy_module      lib/apache2/modules/mod_proxy.so
> +LoadModule proxy_fcgi_module lib/apache2/modules/mod_proxy_fcgi.so
> +
> +ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/usr/share/apache=
2/htdocs/
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/php-fpm.conf b/meta-=
oe/recipes-devtools/php/php-5.5.15/php-fpm.conf
> new file mode 100644
> index 0000000..21e3dfb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/php-fpm.conf
> @@ -0,0 +1,510 @@
> +;;;;;;;;;;;;;;;;;;;;;
> +; FPM Configuration ;
> +;;;;;;;;;;;;;;;;;;;;;
> +
> +; All relative paths in this configuration file are relative to PHP's in=
stall
> +; prefix (/usr). This prefix can be dynamicaly changed by using the
> +; '-p' argument from the command line.
> +
> +; Include one or more files. If glob(3) exists, it is used to include a =
bunch of
> +; files from a glob(3) pattern. This directive can be used everywhere in=
 the
> +; file.
> +; Relative path can also be used. They will be prefixed by:
> +;  - the global prefix if it's been set (-p arguement)
> +;  - /usr otherwise
> +;include=3Detc/fpm.d/*.conf
> +
> +;;;;;;;;;;;;;;;;;;
> +; Global Options ;
> +;;;;;;;;;;;;;;;;;;
> +
> +[global]
> +; Pid file
> +; Note: the default prefix is /var
> +; Default Value: none
> +;pid =3D run/php-fpm.pid
> +
> +; Error log file
> +; If it's set to "syslog", log is sent to syslogd instead of being writt=
en
> +; in a local file.
> +; Note: the default prefix is /var
> +; Default Value: log/php-fpm.log
> +;error_log =3D log/php-fpm.log
> +
> +; syslog_facility is used to specify what type of program is logging the
> +; message. This lets syslogd specify that messages from different facili=
ties
> +; will be handled differently.
> +; See syslog(3) for possible values (ex daemon equiv LOG_DAEMON)
> +; Default Value: daemon
> +;syslog.facility =3D daemon
> +
> +; syslog_ident is prepended to every message. If you have multiple FPM
> +; instances running on the same server, you can change the default value
> +; which must suit common needs.
> +; Default Value: php-fpm
> +;syslog.ident =3D php-fpm
> +
> +; Log level
> +; Possible Values: alert, error, warning, notice, debug
> +; Default Value: notice
> +;log_level =3D notice
> +
> +; If this number of child processes exit with SIGSEGV or SIGBUS within t=
he time
> +; interval set by emergency_restart_interval then FPM will restart. A va=
lue
> +; of '0' means 'Off'.
> +; Default Value: 0
> +;emergency_restart_threshold =3D 0
> +
> +; Interval of time used by emergency_restart_interval to determine when=
=20
> +; a graceful restart will be initiated.  This can be useful to work arou=
nd
> +; accidental corruptions in an accelerator's shared memory.
> +; Available Units: s(econds), m(inutes), h(ours), or d(ays)
> +; Default Unit: seconds
> +; Default Value: 0
> +;emergency_restart_interval =3D 0
> +
> +; Time limit for child processes to wait for a reaction on signals from =
master.
> +; Available units: s(econds), m(inutes), h(ours), or d(ays)
> +; Default Unit: seconds
> +; Default Value: 0
> +;process_control_timeout =3D 0
> +
> +; The maximum number of processes FPM will fork. This has been design to=
 control
> +; the global number of processes when using dynamic PM within a lot of p=
ools.
> +; Use it with caution.
> +; Note: A value of 0 indicates no limit
> +; Default Value: 0
> +; process.max =3D 128
> +
> +; Specify the nice(2) priority to apply to the master process (only if s=
et)
> +; The value can vary from -19 (highest priority) to 20 (lower priority)
> +; Note: - It will only work if the FPM master process is launched as root
> +;       - The pool process will inherit the master process priority
> +;         unless it specified otherwise
> +; Default Value: no set
> +; process.priority =3D -19
> +
> +; Send FPM to background. Set to 'no' to keep FPM in foreground for debu=
gging.
> +; Default Value: yes
> +;daemonize =3D yes
> +=20
> +; Set open file descriptor rlimit for the master process.
> +; Default Value: system defined value
> +;rlimit_files =3D 1024
> +=20
> +; Set max core size rlimit for the master process.
> +; Possible Values: 'unlimited' or an integer greater or equal to 0
> +; Default Value: system defined value
> +;rlimit_core =3D 0
> +
> +; Specify the event mechanism FPM will use. The following is available:
> +; - select     (any POSIX os)
> +; - poll       (any POSIX os)
> +; - epoll      (linux >=3D 2.5.44)
> +; - kqueue     (FreeBSD >=3D 4.1, OpenBSD >=3D 2.9, NetBSD >=3D 2.0)
> +; - /dev/poll  (Solaris >=3D 7)
> +; - port       (Solaris >=3D 10)
> +; Default Value: not set (auto detection)
> +; events.mechanism =3D epoll
> +
> +;;;;;;;;;;;;;;;;;;;;
> +; Pool Definitions ;=20
> +;;;;;;;;;;;;;;;;;;;;
> +
> +; Multiple pools of child processes may be started with different listen=
ing
> +; ports and different management options.  The name of the pool will be
> +; used in logs and stats. There is no limitation on the number of pools =
which
> +; FPM can handle. Your system will tell you anyway :)
> +
> +; Start a new pool named 'www'.
> +; the variable $pool can we used in any directive and will be replaced b=
y the
> +; pool name ('www' here)
> +[www]
> +
> +; Per pool prefix
> +; It only applies on the following directives:
> +; - 'slowlog'
> +; - 'listen' (unixsocket)
> +; - 'chroot'
> +; - 'chdir'
> +; - 'php_values'
> +; - 'php_admin_values'
> +; When not set, the global prefix (or /usr) applies instead.
> +; Note: This directive can also be relative to the global prefix.
> +; Default Value: none
> +;prefix =3D /path/to/pools/$pool
> +
> +; Unix user/group of processes
> +; Note: The user is mandatory. If the group is not set, the default user=
's group
> +;       will be used.
> +user =3D nobody
> +;group =3D nobody
> +
> +; The address on which to accept FastCGI requests.
> +; Valid syntaxes are:
> +;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific add=
ress on
> +;                            a specific port;
> +;   'port'                 - to listen on a TCP socket to all addresses =
on a
> +;                            specific port;
> +;   '/path/to/unix/socket' - to listen on a unix socket.
> +; Note: This value is mandatory.
> +listen =3D 127.0.0.1:9000
> +
> +; Set listen(2) backlog. A value of '-1' means unlimited.
> +; Default Value: 128 (-1 on FreeBSD and OpenBSD)
> +;listen.backlog =3D -1
> +
> +; Set permissions for unix socket, if one is used. In Linux, read/write
> +; permissions must be set in order to allow connections from a web serve=
r. Many
> +; BSD-derived systems allow connections regardless of permissions.=20
> +; Default Values: user and group are set as the running user
> +;                 mode is set to 0666
> +;listen.owner =3D nobody
> +;listen.group =3D nobody
> +;listen.mode =3D 0666
> +=20
> +; List of ipv4 addresses of FastCGI clients which are allowed to connect.
> +; Equivalent to the FCGI_WEB_SERVER_ADDRS environment variable in the or=
iginal
> +; PHP FCGI (5.2.2+). Makes sense only with a tcp listening socket. Each =
address
> +; must be separated by a comma. If this value is left blank, connections=
 will be
> +; accepted from any ip address.
> +; Default Value: any
> +;listen.allowed_clients =3D 127.0.0.1
> +
> +; Specify the nice(2) priority to apply to the pool processes (only if s=
et)
> +; The value can vary from -19 (highest priority) to 20 (lower priority)
> +; Note: - It will only work if the FPM master process is launched as root
> +;       - The pool processes will inherit the master process priority
> +;         unless it specified otherwise
> +; Default Value: no set
> +; priority =3D -19
> +
> +; Choose how the process manager will control the number of child proces=
ses.
> +; Possible Values:
> +;   static  - a fixed number (pm.max_children) of child processes;
> +;   dynamic - the number of child processes are set dynamically based on=
 the
> +;             following directives. With this process management, there =
will be
> +;             always at least 1 children.
> +;             pm.max_children      - the maximum number of children that=
 can
> +;                                    be alive at the same time.
> +;             pm.start_servers     - the number of children created on s=
tartup.
> +;             pm.min_spare_servers - the minimum number of children in '=
idle'
> +;                                    state (waiting to process). If the =
number
> +;                                    of 'idle' processes is less than th=
is
> +;                                    number then some children will be c=
reated.
> +;             pm.max_spare_servers - the maximum number of children in '=
idle'
> +;                                    state (waiting to process). If the =
number
> +;                                    of 'idle' processes is greater than=
 this
> +;                                    number then some children will be k=
illed.
> +;  ondemand - no children are created at startup. Children will be forke=
d when
> +;             new requests will connect. The following parameter are use=
d:
> +;             pm.max_children           - the maximum number of children=
 that
> +;                                         can be alive at the same time.
> +;             pm.process_idle_timeout   - The number of seconds after wh=
ich
> +;                                         an idle process will be killed.
> +; Note: This value is mandatory.
> +pm =3D dynamic
> +
> +; The number of child processes to be created when pm is set to 'static'=
 and the
> +; maximum number of child processes when pm is set to 'dynamic' or 'onde=
mand'.
> +; This value sets the limit on the number of simultaneous requests that =
will be
> +; served. Equivalent to the ApacheMaxClients directive with mpm_prefork.
> +; Equivalent to the PHP_FCGI_CHILDREN environment variable in the origin=
al PHP
> +; CGI. The below defaults are based on a server without much resources. =
Don't
> +; forget to tweak pm.* to fit your needs.
> +; Note: Used when pm is set to 'static', 'dynamic' or 'ondemand'
> +; Note: This value is mandatory.
> +pm.max_children =3D 5
> +
> +; The number of child processes created on startup.
> +; Note: Used only when pm is set to 'dynamic'
> +; Default Value: min_spare_servers + (max_spare_servers - min_spare_serv=
ers) / 2
> +pm.start_servers =3D 2
> +
> +; The desired minimum number of idle server processes.
> +; Note: Used only when pm is set to 'dynamic'
> +; Note: Mandatory when pm is set to 'dynamic'
> +pm.min_spare_servers =3D 1
> +
> +; The desired maximum number of idle server processes.
> +; Note: Used only when pm is set to 'dynamic'
> +; Note: Mandatory when pm is set to 'dynamic'
> +pm.max_spare_servers =3D 3
> +
> +; The number of seconds after which an idle process will be killed.
> +; Note: Used only when pm is set to 'ondemand'
> +; Default Value: 10s
> +;pm.process_idle_timeout =3D 10s;
> +=20
> +; The number of requests each child process should execute before respaw=
ning.
> +; This can be useful to work around memory leaks in 3rd party libraries.=
 For
> +; endless request processing specify '0'. Equivalent to PHP_FCGI_MAX_REQ=
UESTS.
> +; Default Value: 0
> +;pm.max_requests =3D 500
> +
> +; The URI to view the FPM status page. If this value is not set, no URI =
will be
> +; recognized as a status page. It shows the following informations:
> +;   pool                 - the name of the pool;
> +;   process manager      - static, dynamic or ondemand;
> +;   start time           - the date and time FPM has started;
> +;   start since          - number of seconds since FPM has started;
> +;   accepted conn        - the number of request accepted by the pool;
> +;   listen queue         - the number of request in the queue of pending
> +;                          connections (see backlog in listen(2));
> +;   max listen queue     - the maximum number of requests in the queue
> +;                          of pending connections since FPM has started;
> +;   listen queue len     - the size of the socket queue of pending conne=
ctions;
> +;   idle processes       - the number of idle processes;
> +;   active processes     - the number of active processes;
> +;   total processes      - the number of idle + active processes;
> +;   max active processes - the maximum number of active processes since =
FPM
> +;                          has started;
> +;   max children reached - number of times, the process limit has been r=
eached,
> +;                          when pm tries to start more children (works o=
nly for
> +;                          pm 'dynamic' and 'ondemand');
> +; Value are updated in real time.
> +; Example output:
> +;   pool:                 www
> +;   process manager:      static
> +;   start time:           01/Jul/2011:17:53:49 +0200
> +;   start since:          62636
> +;   accepted conn:        190460
> +;   listen queue:         0
> +;   max listen queue:     1
> +;   listen queue len:     42
> +;   idle processes:       4
> +;   active processes:     11
> +;   total processes:      15
> +;   max active processes: 12
> +;   max children reached: 0
> +;
> +; By default the status page output is formatted as text/plain. Passing =
either
> +; 'html', 'xml' or 'json' in the query string will return the correspond=
ing
> +; output syntax. Example:
> +;   http://www.foo.bar/status
> +;   http://www.foo.bar/status?json
> +;   http://www.foo.bar/status?html
> +;   http://www.foo.bar/status?xml
> +;
> +; By default the status page only outputs short status. Passing 'full' i=
n the
> +; query string will also return status for each pool process.
> +; Example:=20
> +;   http://www.foo.bar/status?full
> +;   http://www.foo.bar/status?json&full
> +;   http://www.foo.bar/status?html&full
> +;   http://www.foo.bar/status?xml&full
> +; The Full status returns for each process:
> +;   pid                  - the PID of the process;
> +;   state                - the state of the process (Idle, Running, ...);
> +;   start time           - the date and time the process has started;
> +;   start since          - the number of seconds since the process has s=
tarted;
> +;   requests             - the number of requests the process has served;
> +;   request duration     - the duration in ??s of the requests;
> +;   request method       - the request method (GET, POST, ...);
> +;   request URI          - the request URI with the query string;
> +;   content length       - the content length of the request (only with =
POST);
> +;   user                 - the user (PHP_AUTH_USER) (or '-' if not set);
> +;   script               - the main script called (or '-' if not set);
> +;   last request cpu     - the %cpu the last request consumed
> +;                          it's always 0 if the process is not in Idle s=
tate
> +;                          because CPU calculation is done when the requ=
est
> +;                          processing has terminated;
> +;   last request memory  - the max amount of memory the last request con=
sumed
> +;                          it's always 0 if the process is not in Idle s=
tate
> +;                          because memory calculation is done when the r=
equest
> +;                          processing has terminated;
> +; If the process is in Idle state, then informations are related to the
> +; last request the process has served. Otherwise informations are relate=
d to
> +; the current request being served.
> +; Example output:
> +;   ************************
> +;   pid:                  31330
> +;   state:                Running
> +;   start time:           01/Jul/2011:17:53:49 +0200
> +;   start since:          63087
> +;   requests:             12808
> +;   request duration:     1250261
> +;   request method:       GET
> +;   request URI:          /test_mem.php?N=3D10000
> +;   content length:       0
> +;   user:                 -
> +;   script:               /home/fat/web/docs/php/test_mem.php
> +;   last request cpu:     0.00
> +;   last request memory:  0
> +;
> +; Note: There is a real-time FPM status monitoring sample web page avail=
able
> +;       It's available in: /usr/share/fpm/status.html
> +;
> +; Note: The value must start with a leading slash (/). The value can be
> +;       anything, but it may not be a good idea to use the .php extensio=
n or it
> +;       may conflict with a real PHP file.
> +; Default Value: not set=20
> +;pm.status_path =3D /status
> +=20
> +; The ping URI to call the monitoring page of FPM. If this value is not =
set, no
> +; URI will be recognized as a ping page. This could be used to test from=
 outside
> +; that FPM is alive and responding, or to
> +; - create a graph of FPM availability (rrd or such);
> +; - remove a server from a group if it is not responding (load balancing=
);
> +; - trigger alerts for the operating team (24/7).
> +; Note: The value must start with a leading slash (/). The value can be
> +;       anything, but it may not be a good idea to use the .php extensio=
n or it
> +;       may conflict with a real PHP file.
> +; Default Value: not set
> +;ping.path =3D /ping
> +
> +; This directive may be used to customize the response of a ping request=
=2E The
> +; response is formatted as text/plain with a 200 response code.
> +; Default Value: pong
> +;ping.response =3D pong
> +
> +; The access log file
> +; Default: not set
> +;access.log =3D log/$pool.access.log
> +
> +; The access log format.
> +; The following syntax is allowed
> +;  %%: the '%' character
> +;  %C: %CPU used by the request
> +;      it can accept the following format:
> +;      - %{user}C for user CPU only
> +;      - %{system}C for system CPU only
> +;      - %{total}C  for user + system CPU (default)
> +;  %d: time taken to serve the request
> +;      it can accept the following format:
> +;      - %{seconds}d (default)
> +;      - %{miliseconds}d
> +;      - %{mili}d
> +;      - %{microseconds}d
> +;      - %{micro}d
> +;  %e: an environment variable (same as $_ENV or $_SERVER)
> +;      it must be associated with embraces to specify the name of the env
> +;      variable. Some exemples:
> +;      - server specifics like: %{REQUEST_METHOD}e or %{SERVER_PROTOCOL}e
> +;      - HTTP headers like: %{HTTP_HOST}e or %{HTTP_USER_AGENT}e
> +;  %f: script filename
> +;  %l: content-length of the request (for POST request only)
> +;  %m: request method
> +;  %M: peak of memory allocated by PHP
> +;      it can accept the following format:
> +;      - %{bytes}M (default)
> +;      - %{kilobytes}M
> +;      - %{kilo}M
> +;      - %{megabytes}M
> +;      - %{mega}M
> +;  %n: pool name
> +;  %o: ouput header
> +;      it must be associated with embraces to specify the name of the he=
ader:
> +;      - %{Content-Type}o
> +;      - %{X-Powered-By}o
> +;      - %{Transfert-Encoding}o
> +;      - ....
> +;  %p: PID of the child that serviced the request
> +;  %P: PID of the parent of the child that serviced the request
> +;  %q: the query string=20
> +;  %Q: the '?' character if query string exists
> +;  %r: the request URI (without the query string, see %q and %Q)
> +;  %R: remote IP address
> +;  %s: status (response code)
> +;  %t: server time the request was received
> +;      it can accept a strftime(3) format:
> +;      %d/%b/%Y:%H:%M:%S %z (default)
> +;  %T: time the log has been written (the request has finished)
> +;      it can accept a strftime(3) format:
> +;      %d/%b/%Y:%H:%M:%S %z (default)
> +;  %u: remote user
> +;
> +; Default: "%R - %u %t \"%m %r\" %s"
> +;access.format =3D "%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%=
%"
> +=20
> +; The log file for slow requests
> +; Default Value: not set
> +; Note: slowlog is mandatory if request_slowlog_timeout is set
> +;slowlog =3D log/$pool.log.slow
> +=20
> +; The timeout for serving a single request after which a PHP backtrace w=
ill be
> +; dumped to the 'slowlog' file. A value of '0s' means 'off'.
> +; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
> +; Default Value: 0
> +;request_slowlog_timeout =3D 0
> +=20
> +; The timeout for serving a single request after which the worker proces=
s will
> +; be killed. This option should be used when the 'max_execution_time' in=
i option
> +; does not stop script execution for some reason. A value of '0' means '=
off'.
> +; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
> +; Default Value: 0
> +;request_terminate_timeout =3D 0
> +=20
> +; Set open file descriptor rlimit.
> +; Default Value: system defined value
> +;rlimit_files =3D 1024
> +=20
> +; Set max core size rlimit.
> +; Possible Values: 'unlimited' or an integer greater or equal to 0
> +; Default Value: system defined value
> +;rlimit_core =3D 0
> +=20
> +; Chroot to this directory at the start. This value must be defined as an
> +; absolute path. When this value is not set, chroot is not used.
> +; Note: you can prefix with '$prefix' to chroot to the pool prefix or one
> +; of its subdirectories. If the pool prefix is not set, the global prefix
> +; will be used instead.
> +; Note: chrooting is a great security feature and should be used wheneve=
r=20
> +;       possible. However, all PHP paths will be relative to the chroot
> +;       (error_log, sessions.save_path, ...).
> +; Default Value: not set
> +;chroot =3D=20
> +=20
> +; Chdir to this directory at the start.
> +; Note: relative path can be used.
> +; Default Value: current directory or / when chroot
> +;chdir =3D /var/www
> +=20
> +; Redirect worker stdout and stderr into main error log. If not set, std=
out and
> +; stderr will be redirected to /dev/null according to FastCGI specs.
> +; Note: on highloaded environement, this can cause some delay in the page
> +; process time (several ms).
> +; Default Value: no
> +;catch_workers_output =3D yes
> +
> +; Limits the extensions of the main script FPM will allow to parse. This=
 can
> +; prevent configuration mistakes on the web server side. You should only=
 limit
> +; FPM to .php extensions to prevent malicious users to use other extensi=
ons to
> +; exectute php code.
> +; Note: set an empty value to allow all extensions.
> +; Default Value: .php
> +;security.limit_extensions =3D .php .php3 .php4 .php5
> +=20
> +; Pass environment variables like LD_LIBRARY_PATH. All $VARIABLEs are ta=
ken from
> +; the current environment.
> +; Default Value: clean env
> +;env[HOSTNAME] =3D $HOSTNAME
> +;env[PATH] =3D /usr/local/bin:/usr/bin:/bin
> +;env[TMP] =3D /tmp
> +;env[TMPDIR] =3D /tmp
> +;env[TEMP] =3D /tmp
> +
> +; Additional php.ini defines, specific to this pool of workers. These se=
ttings
> +; overwrite the values previously defined in the php.ini. The directives=
 are the
> +; same as the PHP SAPI:
> +;   php_value/php_flag             - you can set classic ini defines whi=
ch can
> +;                                    be overwritten from PHP call 'ini_s=
et'.=20
> +;   php_admin_value/php_admin_flag - these directives won't be overwritt=
en by
> +;                                     PHP call 'ini_set'
> +; For php_*flag, valid values are on, off, 1, 0, true, false, yes or no.
> +
> +; Defining 'extension' will load the corresponding shared extension from
> +; extension_dir. Defining 'disable_functions' or 'disable_classes' will =
not
> +; overwrite previously defined php.ini values, but will append the new v=
alue
> +; instead.
> +
> +; Note: path INI options can be relative and will be expanded with the p=
refix
> +; (pool, global or /usr)
> +
> +; Default Value: nothing is defined by default except the values in php.=
ini and
> +;                specified at startup with the -d argument
> +;php_admin_value[sendmail_path] =3D /usr/sbin/sendmail -t -i -f www@my.d=
omain.com
> +;php_flag[display_errors] =3D off
> +;php_admin_value[error_log] =3D /var/log/fpm-php.www.log
> +;php_admin_flag[log_errors] =3D on
> +;php_admin_value[memory_limit] =3D 32M
> diff --git a/meta-oe/recipes-devtools/php/php-5.5.15/php_exec_native.patc=
h b/meta-oe/recipes-devtools/php/php-5.5.15/php_exec_native.patch
> new file mode 100644
> index 0000000..31be1b7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php-5.5.15/php_exec_native.patch
> @@ -0,0 +1,19 @@
> +---
> + sapi/cli/config.m4 |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- php-5.4.14.orig/sapi/cli/config.m4
> ++++ php-5.4.14/sapi/cli/config.m4
> +@@ -34,11 +34,11 @@ if test "$PHP_CLI" !=3D "no"; then
> +     BUILD_CLI=3D"\$(LIBTOOL) --mode=3Dlink \$(CC) -export-dynamic \$(CF=
LAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS) \$(PHP_R=
PATHS) \$(PHP_GLOBAL_OBJS) \$(PHP_BINARY_OBJS) \$(PHP_CLI_OBJS) \$(EXTRA_LI=
BS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CLI_PATH)"
> +     ;;
> +   esac
> +=20
> +   dnl Set executable for tests
> +-  PHP_EXECUTABLE=3D"\$(top_builddir)/\$(SAPI_CLI_PATH)"
> ++  PHP_EXECUTABLE=3D"${PHP_NATIVE_DIR}/php"
> +   PHP_SUBST(PHP_EXECUTABLE)
> +=20
> +   dnl Expose to Makefile
> +   PHP_SUBST(SAPI_CLI_PATH)
> +   PHP_SUBST(BUILD_CLI)
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index b1bf79c..b7eb5ce 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -1,19 +1,21 @@
>  DESCRIPTION =3D "A server-side, HTML-embedded scripting language. This p=
ackage provides the CGI."
>  HOMEPAGE =3D "http://www.php.net"
>  SECTION =3D "console/network"
> -LICENSE =3D "PHP-3.0"
> +LICENSE =3D "PHP-3.01"
>  BBCLASSEXTEND =3D "native"
>  DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native \
> -           libc-client openssl"
> +           libc-client openssl libmcrypt mariadb curl \
> +	   gd jpeg libpng libxpm freetype t1lib"
>  DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> =20
> -INC_PR =3D "r5"
> +INC_PR =3D "r12"
> =20
>  # The new PHP downloads server groups PHP releases by major version so f=
ind
>  # the major version of the PHP recipe.
>  PHP_MAJVER =3D "${@d.getVar('PV',1).split('.')[0]}"
> =20
> -SRC_URI =3D "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
> +FETCHCMD_wget +=3D "--trust-server-names"
> +SRC_URI =3D "http://php.net/get/php-${PV}.tar.bz2/from/this/mirror;downl=
oadfilename=3Dphp-${PV}.tar.bz2"
> =20
>  S =3D "${WORKDIR}/php-${PV}"
> =20
> @@ -24,16 +26,28 @@ SSTATE_SCAN_FILES +=3D "build-defs.h"
>  # Common EXTRA_OECONF
>  COMMON_EXTRA_OECONF =3D "--enable-sockets --enable-pcntl --enable-shared"
>  EXTRA_OECONF =3D "--enable-mbstring \
> -                --enable-wddx \
> -                --enable-fpm \
> -                --with-imap=3D${STAGING_DIR_HOST} \
> -                --with-gettext=3D${STAGING_LIBDIR}/.. \
> -                --with-imap-ssl=3D${STAGING_DIR_HOST} \
> -                --with-zlib=3D${STAGING_LIBDIR}/.. \
> -                --with-iconv=3D${STAGING_LIBDIR}/.. \
> -                --with-libxml-dir=3D${STAGING_BINDIR_CROSS} \
> -                ${COMMON_EXTRA_OECONF} \
> +		--enable-wddx \
> +		--enable-fpm \
> +		--enable-bcmath \
> +		--enable-opcache \
> +		--with-flock-type=3Dlinux \
> +		--with-imap=3D${STAGING_DIR_HOST} \
> +		--with-gettext=3D${STAGING_LIBDIR}/.. \
> +		--with-mcrypt=3D${STAGING_LIBDIR}/.. \
> +		--with-curl=3D${STAGING_LIBDIR}/.. \
> +		--with-openssl=3D${STAGING_LIBDIR}/.. \
> +		--with-imap-ssl=3D${STAGING_DIR_HOST} \
> +		--with-zlib=3D${STAGING_LIBDIR}/.. \
> +		--with-iconv=3D${STAGING_LIBDIR}/.. \
> +		--with-libxml-dir=3D${STAGING_BINDIR_CROSS} \
> +		--with-gd=3D${STAGING_LIBDIR}/.. \
> +		--with-zlib-dir=3D${STAGING_LIBDIR}/.. \
> +		--with-png-dir=3D${STAGING_LIBDIR}/.. \
> +		--with-jpeg-dir=3D${STAGING_LIBDIR}/.. \
> +		--with-xpm-dir=3D${STAGING_LIBDIR}/.. \
> +		${COMMON_EXTRA_OECONF} \
>  "
> +
>  EXTRA_OECONF_virtclass-native =3D " \
>                  --with-zlib=3D${STAGING_LIBDIR_NATIVE}/.. \
>                  --with-libxml-dir=3D${STAGING_BINDIR_NATIVE} \
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.15.bb b/meta-oe/recipes=
-devtools/php/php_5.5.15.bb
> new file mode 100644
> index 0000000..149900a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php_5.5.15.bb
> @@ -0,0 +1,22 @@
> +require php.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52dd90569008fee5bcdbb22d945b1=
108"
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://acinclude-xml2-config.patch \
> +            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
> +
> +SRC_URI_append_pn-php +=3D "file://iconv.patch \
> +            file://imap-fix-autofoo.patch \
> +            file://pear-makefile.patch \
> +            file://phar-makefile.patch \
> +            file://php_exec_native.patch \
> +            file://fix-fpm-cross-compile.patch \
> +            file://php-fpm.conf \
> +            file://php-fpm-apache.conf \
> +	    file://flock-type-crosscompile.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "5cb5f2ed9099299f8a4c952d59d93812"
> +SRC_URI[sha256sum] =3D "00f24226b12fee27e332383b6304f1b9ed3f4d9173dd728a=
68c5c3f5a59b8ba7"
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pDtNmxPr5KTxcQ6Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP11KMACgkQN1Ujt2V2gBwykwCdHROQ0e18ELoqWsqRkvzwTMms
K3kAoKHGg2SaQ8YjazwYI5bIKgsBwy3Z
=Yh9+
-----END PGP SIGNATURE-----

--pDtNmxPr5KTxcQ6Z--
