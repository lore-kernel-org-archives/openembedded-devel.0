Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 11FDC70239
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 12:57:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5KCvTT5000776; Fri, 20 Jun 2014 13:57:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 25i6GpdPx6WP; Fri, 20 Jun 2014 13:57:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5KCvPft000763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 20 Jun 2014 13:57:27 +0100
Message-ID: <1403269039.2104.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jun 2014 13:57:19 +0100
In-Reply-To: <1403160868-25473-1-git-send-email-koen.kooi@linaro.org>
References: <1403160868-25473-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCHv3] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Fri, 20 Jun 2014 12:57:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-06-19 at 08:54 +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> 
> Changes since v3:
> 	* swapped fi/$i lines
> 
> This finally fixes the build!
> 
>  meta-oe/recipes-devtools/php/php.inc               |  2 -
>  ...cinclude-use-pkgconfig-for-libxml2-config.patch | 90 ++++++++++++++++++++++
>  meta-oe/recipes-devtools/php/php_5.4.14.bb         |  4 +-
>  3 files changed, 93 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> 
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index b1bf79c..030c090 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -31,12 +31,10 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --with-imap-ssl=${STAGING_DIR_HOST} \
>                  --with-zlib=${STAGING_LIBDIR}/.. \
>                  --with-iconv=${STAGING_LIBDIR}/.. \
> -                --with-libxml-dir=${STAGING_BINDIR_CROSS} \
>                  ${COMMON_EXTRA_OECONF} \
>  "
>  EXTRA_OECONF_virtclass-native = " \
>                  --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
> -                --with-libxml-dir=${STAGING_BINDIR_NATIVE} \
>                  ${COMMON_EXTRA_OECONF} \
>  "
>  
> diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> new file mode 100644
> index 0000000..823007e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> @@ -0,0 +1,90 @@
> +From 0ff5d4adc9f5950d66738272b3ba88ef74f69117 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen.kooi@linaro.org>
> +Date: Tue, 17 Jun 2014 09:53:00 +0200
> +Subject: [PATCH] acinclude: use pkgconfig for libxml2 config
> +
> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +Upstream-Status: pending
> +---
> + acinclude.m4 | 63 ++++++++++++++++++++++--------------------------------------
> + 1 file changed, 23 insertions(+), 40 deletions(-)
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 9c7a305..211dbd3 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -2529,48 +2529,31 @@ dnl
> + dnl Common setup macro for libxml
> + dnl
> + AC_DEFUN([PHP_SETUP_LIBXML], [
> +-AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
> +-[
> +-
> +-      ac_cv_php_xml2_config_path="$PHP_LIBXML_DIR/xml2-config"
> +-
> ++PKG_CHECK_MODULES([LIBXML], [libxml-2.0 > 2.6.11], [
> ++  PHP_EVAL_LIBLINE($LIBXML_LIBS, $1)
> ++  PHP_EVAL_INCLINE($LIBXML_CFLAGS)
> ++
> ++  dnl Check that build works with given libs
> ++  AC_CACHE_CHECK(whether libxml build works, php_cv_libxml_build_works, [
> ++    PHP_TEST_BUILD(xmlInitParser,
> ++    [
> ++      php_cv_libxml_build_works=yes
> ++      AC_MSG_RESULT(yes)
> ++    ], [
> ++      AC_MSG_RESULT(no)
> ++      AC_MSG_ERROR([build test failed.  Please check the config.log for details.])
> ++    ], [
> ++      [$]$1
> ++    ])
> ++  ])
> ++  if test "$php_cv_libxml_build_works" = "yes"; then
> ++    AC_DEFINE(HAVE_LIBXML, 1, [ ])
> ++  fi
> ++  $2
> ++], [
> ++  AC_MSG_ERROR([$LIBXML_PKG_ERRORS])
> + ])
> + 
> +-  if test -x "$ac_cv_php_xml2_config_path"; then
> +-    XML2_CONFIG="$ac_cv_php_xml2_config_path"
> +-    libxml_full_version=`$XML2_CONFIG --version`
> +-    ac_IFS=$IFS
> +-    IFS="."
> +-    set $libxml_full_version
> +-    IFS=$ac_IFS
> +-    LIBXML_VERSION=`expr [$]1 \* 1000000 + [$]2 \* 1000 + [$]3`
> +-    if test "$LIBXML_VERSION" -ge "2006011"; then
> +-      LIBXML_LIBS=`$XML2_CONFIG --libs`
> +-      LIBXML_INCS=`$XML2_CONFIG --cflags`
> +-      PHP_EVAL_LIBLINE($LIBXML_LIBS, $1)
> +-      PHP_EVAL_INCLINE($LIBXML_INCS)
> +-
> +-      dnl Check that build works with given libs
> +-      AC_CACHE_CHECK(whether libxml build works, php_cv_libxml_build_works, [
> +-        PHP_TEST_BUILD(xmlInitParser,
> +-        [
> +-          php_cv_libxml_build_works=yes
> +-        ], [
> +-          AC_MSG_RESULT(no)
> +-          AC_MSG_ERROR([build test failed.  Please check the config.log for details.])
> +-        ], [
> +-          [$]$1
> +-        ])
> +-      ])
> +-      if test "$php_cv_libxml_build_works" = "yes"; then
> +-        AC_DEFINE(HAVE_LIBXML, 1, [ ])
> +-      fi
> +-      $2
> +-    else
> +-      AC_MSG_ERROR([libxml2 version 2.6.11 or greater required.])
> +-    fi
> +-ifelse([$3],[],,[else $3])
> +-  fi
> + ])
> + 

Dropping the ifelse([$3],[],,[else $3]) isn't quite right, 

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta-oe/recipes-devtools/php/php/pkgconfig.patch?h=rpurdie/meta-oe&id=ffd98ac82cc69a1fa1d7fbc197f247aeea221b4b

is a fractional improvement.

Cheers,

Richard


