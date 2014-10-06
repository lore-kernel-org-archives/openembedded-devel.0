Return-Path: <koen.kooi@linaro.org>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id EE31A65E0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Oct 2014 17:24:23 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gi9so4765114lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 10:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gAoU+BxLdKdpTAC/6UdQsf89JQyUrqRGd2MfItLZMfc=;
	b=dZwlP5EL+Tq/4GeJdjLNHWdWYp7aR9rClhRRdvvYjk0LEUDgIQwpVanCh/yeEtxr4u
	jk/vsmXz0nGNH7pIMn+fCuOnJsL3ARAi5cUcMHTTc6pjVLqVbJweyhlD0UvDQP9wx5Wv
	k9UhAtZRzK7IT25a2AXMMYm/C2RIVJLyLWH87f1t9IpTWDqoiyW9P41Sek1iyLQEjWey
	mMMT28ul4twbRv8cbQGBm7/embc383kiDV6+TTOM0cqXM7wbExBqtKjf6wn3XTj/FxPO
	FvODdOpy9xdlwDdEMKKsCMjppjRLW7TBiq67ocV/8CMajP3brUtPTzFx+fbrqEpYMixD
	LyeQ==
X-Gm-Message-State: ALoCoQmY0FiEKxaTC2udaBhU550SQFlHkie8uPu2KztzGrs9EMRcenRAaDpPqXkwS14Wnyc4SCfi
MIME-Version: 1.0
X-Received: by 10.112.54.130 with SMTP id j2mr24987481lbp.41.1412616264019;
	Mon, 06 Oct 2014 10:24:24 -0700 (PDT)
Received: by 10.114.217.33 with HTTP; Mon, 6 Oct 2014 10:24:23 -0700 (PDT)
In-Reply-To: <20141006153154.GW25706@jama>
References: <1412589301-6669-1-git-send-email-koen.kooi@linaro.org>
	<1412589301-6669-3-git-send-email-koen.kooi@linaro.org>
	<20141006153154.GW25706@jama>
Date: Mon, 6 Oct 2014 19:24:23 +0200
Message-ID: <CAP0W-RkD2rwdWPKt=mkyGYPC8ahx56DEybrrSv3Lv_zsVDKi9Q@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 06 Oct 2014 17:24:34 -0000
Content-Type: text/plain; charset=UTF-8

On 6 October 2014 17:31, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Oct 06, 2014 at 11:55:01AM +0200, Koen Kooi wrote:
> > One patch was a backport and can be dropped, add Upstream-status to the
> others.
>
> Can we build modphp here and drop separate recipe:
> meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
>
> Currently they overlap in staged files, so only one of them will get
> built anyway.
>

We can probably do that, but I have no idea what the difference between the
recipes is, I just fix the QA warnings in the build :)


>
> > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > ---
> >  ...cinclude-use-pkgconfig-for-libxml2-config.patch |  8 ++--
> >  ...01-php-don-t-use-broken-wrapper-for-mkdir.patch | 12 +++---
> >  .../php/php/acinclude-xml2-config.patch            | 15 +++++--
> >  .../php/php/fix-fpm-cross-compile.patch            | 38
> -----------------
> >  meta-oe/recipes-devtools/php/php/iconv.patch       |  9 ++++-
> >  .../php/php/imap-fix-autofoo.patch                 | 47
> ++++++++++++----------
> >  .../recipes-devtools/php/php/pear-makefile.patch   |  7 +++-
> >  .../recipes-devtools/php/php/phar-makefile.patch   | 11 ++++-
> >  .../recipes-devtools/php/php/php_exec_native.patch | 19 +++++----
> >  .../php/{php_5.4.14.bb => php_5.4.33.bb}           |  9 ++---
> >  10 files changed, 81 insertions(+), 94 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
> >  rename meta-oe/recipes-devtools/php/{php_5.4.14.bb => php_5.4.33.bb}
> (95%)
> >
> > diff --git
> a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> > index 823007e..51a5e43 100644
> > ---
> a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> > +++
> b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> > @@ -1,7 +1,7 @@
> > -From 0ff5d4adc9f5950d66738272b3ba88ef74f69117 Mon Sep 17 00:00:00 2001
> > +From 003c9feaae6ed5c173edcea51193e49bc94ac39a Mon Sep 17 00:00:00 2001
> >  From: Koen Kooi <koen.kooi@linaro.org>
> >  Date: Tue, 17 Jun 2014 09:53:00 +0200
> > -Subject: [PATCH] acinclude: use pkgconfig for libxml2 config
> > +Subject: [PATCH 3/8] acinclude: use pkgconfig for libxml2 config
> >
> >  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >  Upstream-Status: pending
> > @@ -10,10 +10,10 @@ Upstream-Status: pending
> >   1 file changed, 23 insertions(+), 40 deletions(-)
> >
> >  diff --git a/acinclude.m4 b/acinclude.m4
> > -index 9c7a305..211dbd3 100644
> > +index 206fcbf..a6c0d84 100644
> >  --- a/acinclude.m4
> >  +++ b/acinclude.m4
> > -@@ -2529,48 +2529,31 @@ dnl
> > +@@ -2530,48 +2530,31 @@ dnl
> >   dnl Common setup macro for libxml
> >   dnl
> >   AC_DEFUN([PHP_SETUP_LIBXML], [
> > diff --git
> a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
> b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
> > index 9b71e9d..2f7d581 100644
> > ---
> a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
> > +++
> b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
> > @@ -1,18 +1,18 @@
> > -From 411ec4b31fdcc524f13fe5be80fd6769b7d16a5d Mon Sep 17 00:00:00 2001
> > +From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
> >  From: Koen Kooi <koen@dominion.thruhere.net>
> >  Date: Thu, 3 Nov 2011 14:27:15 +0100
> > -Subject: [PATCH] php: don't use broken wrapper for mkdir
> > +Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
> >
> >  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >  ---
> >
> >  Upstream-Status: Inappropriate
> >
> > - Makefile.global |    2 +-
> > - 1 files changed, 1 insertions(+), 1 deletions(-)
> > + Makefile.global | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/Makefile.global b/Makefile.global
> > -index 8dad0e4..abdb5d2 100644
> > +index ff858c2..ae554b4 100644
> >  --- a/Makefile.global
> >  +++ b/Makefile.global
> >  @@ -1,4 +1,4 @@
> > @@ -22,5 +22,5 @@ index 8dad0e4..abdb5d2 100644
> >   INSTALL_DATA = $(INSTALL) -m 644
> >
> >  --
> > -1.7.2.5
> > +1.9.3
> >
> > diff --git
> a/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> b/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> > index bf519d2..30811a7 100644
> > --- a/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> > +++ b/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
> > @@ -1,6 +1,10 @@
> > ---- /orig-acinclude.m4 2007-02-20 15:03:25.000000000 +0200
> > -+++ /acinclude.m4      2007-02-20 15:03:24.000000000 +0200
> > -@@ -2359,12 +2359,9 @@
> > +Upstream-status: Unknown
> > +
> > +diff --git a/acinclude.m4 b/acinclude.m4
> > +index 4fd452e..206fcbf 100644
> > +--- a/acinclude.m4
> > ++++ b/acinclude.m4
> > +@@ -2532,12 +2532,9 @@ dnl
> >   AC_DEFUN([PHP_SETUP_LIBXML], [
> >   AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
> >   [
> > @@ -14,5 +18,8 @@
> >  +      ac_cv_php_xml2_config_path="$PHP_LIBXML_DIR/xml2-config"
> >  +
> >   ])
> > -
> > +
> >     if test -x "$ac_cv_php_xml2_config_path"; then
> > +--
> > +1.9.3
> > +
> > diff --git
> a/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
> b/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
> > deleted file mode 100644
> > index b009347..0000000
> > --- a/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From 0b44f16ea2f18a08eb1249db6621840527eab5e0 Mon Sep 17 00:00:00 2001
> > -From: Jerome Loyet <fat@php.net>
> > -Date: Wed, 23 May 2012 11:40:22 +0200
> > -Subject: [PATCH] - Fixed bug #61839 (Unable to cross-compile PHP with
> > - --enable-fpm)
> > -
> > ----
> > -Upstream-Status: Applied
> > -
> http://git.php.net/?p=php-src.git;a=commit;h=0b44f16ea2f18a08eb1249db6621840527eab5e0
> > -
> > - NEWS               | 1 +
> > - sapi/fpm/config.m4 | 4 ++++
> > - 2 files changed, 5 insertions(+)
> > -
> > -diff --git a/sapi/fpm/config.m4 b/sapi/fpm/config.m4
> > -index 8962810..6c860c9 100644
> > ---- a/sapi/fpm/config.m4
> > -+++ b/sapi/fpm/config.m4
> > -@@ -192,6 +192,8 @@ AC_DEFUN([AC_FPM_TRACE],
> > -       have_ptrace=no
> > -       have_broken_ptrace=yes
> > -       AC_MSG_RESULT([no])
> > -+    ], [
> > -+      AC_MSG_RESULT([skipped (cross compiling)])
> > -     ])
> > -   fi
> > -
> > -@@ -264,6 +266,8 @@ AC_DEFUN([AC_FPM_TRACE],
> > -     ], [
> > -       proc_mem_file=""
> > -       AC_MSG_RESULT([no])
> > -+    ], [
> > -+      AC_MSG_RESULT([skipped (cross compiling)])
> > -     ])
> > -   fi
> > -
> > ---
> > -1.7.11.5
> > diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch
> b/meta-oe/recipes-devtools/php/php/iconv.patch
> > index f3d2a16..255fbb0 100644
> > --- a/meta-oe/recipes-devtools/php/php/iconv.patch
> > +++ b/meta-oe/recipes-devtools/php/php/iconv.patch
> > @@ -1,8 +1,10 @@
> > +Upstream-status: Unknown
> > +
> >  diff --git a/acinclude.m4 b/acinclude.m4
> > -index 4c28b80..d6491a1 100644
> > +index a6c0d84..df11abd 100644
> >  --- a/acinclude.m4
> >  +++ b/acinclude.m4
> > -@@ -2439,7 +2439,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> > +@@ -2452,7 +2452,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
> >     dnl Check libc first if no path is provided in --with-iconv
> >     dnl
> >
> > @@ -25,3 +27,6 @@ index d673b0a..1fbef13 100644
> >           if test -f "$i/include/iconv.h" || test -f
> "$i/include/giconv.h"; then
> >             PHP_ICONV_PREFIX="$i"
> >             break
> > +--
> > +1.9.3
> > +
> > diff --git a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> > index 3695b7b..da04c2d 100644
> > --- a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> > +++ b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
> > @@ -1,8 +1,23 @@
> > -Index: php-5.2.11/ext/imap/config.m4
> > -===================================================================
> > ---- php-5.2.11.orig/ext/imap/config.m4       2009-12-10
> 12:27:52.800974533 -0700
> > -+++ php-5.2.11/ext/imap/config.m4    2009-12-10 12:28:33.720976583 -0700
> > -@@ -103,7 +103,7 @@
> > +Upstream-status: Unknown
> > +
> > +diff --git a/acinclude.m4 b/acinclude.m4
> > +index df11abd..06e7236 100644
> > +--- a/acinclude.m4
> > ++++ b/acinclude.m4
> > +@@ -2357,7 +2357,7 @@ AC_DEFUN([PHP_SETUP_OPENSSL],[
> > +       PHP_OPENSSL_DIR="/usr/local/ssl /usr/local /usr
> /usr/local/openssl"
> > +     fi
> > +
> > +-    for i in $PHP_OPENSSL_DIR; do
> > ++    for i in $PHP_OPENSSL_DIR $PHP_OPENSSL_DIR/usr; do
> > +       if test -r $i/include/openssl/evp.h; then
> > +         OPENSSL_INCDIR=$i/include
> > +       fi
> > +diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
> > +index 3fcf674..f08caf7 100644
> > +--- a/ext/imap/config.m4
> > ++++ b/ext/imap/config.m4
> > +@@ -109,7 +109,7 @@ if test "$PHP_IMAP" != "no"; then
> >       PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared)
> >       AC_DEFINE(HAVE_IMAP,1,[ ])
> >
> > @@ -11,13 +26,13 @@ Index: php-5.2.11/ext/imap/config.m4
> >         IMAP_INC_CHK()
> >         el[]IMAP_INC_CHK(/include/c-client)
> >         el[]IMAP_INC_CHK(/include/imap)
> > -@@ -192,13 +192,7 @@
> > +@@ -198,13 +198,7 @@ if test "$PHP_IMAP" != "no"; then
> >         AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client
> installation.)
> >       fi
> >
> > --    if test -r "$IMAP_DIR/c-client/c-client.a"; then
> > +-    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r
> "$IMAP_DIR/c-client/c-client.a" ; then
> >  -      ln -s "$IMAP_DIR/c-client/c-client.a"
> "$IMAP_DIR/c-client/libc-client.a" >/dev/null 2>&1
> > --    elif test -r "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
> > +-    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r
> "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
> >  -      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a"
> "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" >/dev/null 2>&1
> >  -    fi
> >  -
> > @@ -26,16 +41,6 @@ Index: php-5.2.11/ext/imap/config.m4
> >         IMAP_LIB=$lib
> >         IMAP_LIB_CHK($PHP_LIBDIR)
> >         IMAP_LIB_CHK(c-client)
> > -Index: php-5.2.11/acinclude.m4
> > -===================================================================
> > ---- php-5.2.11.orig/acinclude.m4     2009-12-10 12:37:13.134722881 -0700
> > -+++ php-5.2.11/acinclude.m4  2009-12-10 12:37:39.342007053 -0700
> > -@@ -2338,7 +2338,7 @@
> > -       PHP_OPENSSL_DIR="/usr/local/ssl /usr/local /usr
> /usr/local/openssl"
> > -     fi
> > -
> > --    for i in $PHP_OPENSSL_DIR; do
> > -+    for i in $PHP_OPENSSL_DIR $PHP_OPENSSL_DIR/usr; do
> > -       if test -r $i/include/openssl/evp.h; then
> > -         OPENSSL_INCDIR=$i/include
> > -       fi
> > +--
> > +1.9.3
> > +
> > diff --git a/meta-oe/recipes-devtools/php/php/pear-makefile.patch
> b/meta-oe/recipes-devtools/php/php/pear-makefile.patch
> > index 1928b98..9927d2d 100644
> > --- a/meta-oe/recipes-devtools/php/php/pear-makefile.patch
> > +++ b/meta-oe/recipes-devtools/php/php/pear-makefile.patch
> > @@ -1,5 +1,7 @@
> > +Upstream-status: Unknown
> > +
> >  diff --git a/pear/Makefile.frag b/pear/Makefile.frag
> > -index 1f6f70e..b19a77c 100644
> > +index 00bacae..739eeca 100644
> >  --- a/pear/Makefile.frag
> >  +++ b/pear/Makefile.frag
> >  @@ -11,7 +11,7 @@ PEAR_PREFIX = -dp a${program_prefix}
> > @@ -11,3 +13,6 @@ index 1f6f70e..b19a77c 100644
> >
> >   install-pear:
> >       @echo "Installing PEAR environment:
> $(INSTALL_ROOT)$(peardir)/"
> > +--
> > +1.9.3
> > +
> > diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> > index 6fde251..8a1136d 100644
> > --- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> > +++ b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> > @@ -1,8 +1,12 @@
> > +Upstream-status: Unknown
> > +
> >  diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
> > -index fc93d1d..9a8cd65 100755
> > +old mode 100644
> > +new mode 100755
> > +index ed6de9f..9d03198
> >  --- a/ext/phar/Makefile.frag
> >  +++ b/ext/phar/Makefile.frag
> > -@@ -6,19 +6,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
> > +@@ -5,19 +5,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
> >
> >   PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d
> 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
> >   PHP_PHARCMD_EXECUTABLE = ` \
> > @@ -24,3 +28,6 @@ index fc93d1d..9a8cd65 100755
> >   PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n --
> "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
> >
> >   $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
> > +--
> > +1.9.3
> > +
> > diff --git a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
> b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
> > index 31be1b7..0506bdd 100644
> > --- a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
> > +++ b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
> > @@ -1,12 +1,10 @@
> > ----
> > - sapi/cli/config.m4 |    2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > +Upstream-status: Inappriate
> >
> > ---- php-5.4.14.orig/sapi/cli/config.m4
> > -+++ php-5.4.14/sapi/cli/config.m4
> > -@@ -34,11 +34,11 @@ if test "$PHP_CLI" != "no"; then
> > -     BUILD_CLI="\$(LIBTOOL) --mode=link \$(CC) -export-dynamic
> \$(CFLAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS)
> \$(PHP_RPATHS) \$(PHP_GLOBAL_OBJS) \$(PHP_BINARY_OBJS) \$(PHP_CLI_OBJS)
> \$(EXTRA_LIBS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CLI_PATH)"
> > -     ;;
> > +diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
> > +index cdfa1f7..0fe11e3 100644
> > +--- a/sapi/cli/config.m4
> > ++++ b/sapi/cli/config.m4
> > +@@ -36,7 +36,7 @@ if test "$PHP_CLI" != "no"; then
> >     esac
> >
> >     dnl Set executable for tests
> > @@ -15,5 +13,6 @@
> >     PHP_SUBST(PHP_EXECUTABLE)
> >
> >     dnl Expose to Makefile
> > -   PHP_SUBST(SAPI_CLI_PATH)
> > -   PHP_SUBST(BUILD_CLI)
> > +--
> > +1.9.3
> > +
> > diff --git a/meta-oe/recipes-devtools/php/php_5.4.14.bb
> b/meta-oe/recipes-devtools/php/php_5.4.33.bb
> > similarity index 95%
> > rename from meta-oe/recipes-devtools/php/php_5.4.14.bb
> > rename to meta-oe/recipes-devtools/php/php_5.4.33.bb
> > index b738701..52e39a5 100644
> > --- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
> > +++ b/meta-oe/recipes-devtools/php/php_5.4.33.bb
> > @@ -10,13 +10,11 @@ DEPENDS = "zlib libxml2 virtual/libiconv php-native
> lemon-native \
> >             libc-client openssl"
> >  DEPENDS_virtclass-native = "zlib-native libxml2-native"
> >
> > -PR = "r6"
> > -
> >  # The new PHP downloads server groups PHP releases by major version so
> find
> >  # the major version of the PHP recipe.
> >  PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
> >
> > -SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2 \
> > +SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
> >             file://acinclude-xml2-config.patch \
> >             file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
> >             file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> \
> > @@ -28,13 +26,12 @@ SRC_URI_append_class-target += " \
> >              file://pear-makefile.patch \
> >              file://phar-makefile.patch \
> >              file://php_exec_native.patch \
> > -            file://fix-fpm-cross-compile.patch \
> >              file://php-fpm.conf \
> >              file://php-fpm-apache.conf \
> >            "
> >
> > -SRC_URI[md5sum] = "cfdc044be2c582991a1fe0967898fa38"
> > -SRC_URI[sha256sum] =
> "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02fe4a46f9c81be20a"
> > +SRC_URI[md5sum] = "c6878bb1cdb46bfc1e1a5cd67a024737"
> > +SRC_URI[sha256sum] =
> "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d19b74c2278e40bb5"
> >
> >  S = "${WORKDIR}/php-${PV}"
> >
> > --
> > 1.9.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

