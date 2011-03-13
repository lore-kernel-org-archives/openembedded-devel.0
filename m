Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pyry9-0006em-GO
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 21:32:54 +0100
Received: by pwj9 with SMTP id 9so748115pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7kZ1KwyBjkbrdEowtULLPpZViUmV0NSy6PD5mG67NLw=;
	b=F9z5mI3JoLzFMlMKbOS9eRaLKvf5zVCN2nPLJerrbRPs2Yj5ROmDhkJwRphMlgcByq
	B+c4E+Uq/mx9AVPkx7xtnCLreIkovV8dpTFGBnYtDTRQ53biTAhzr81ws+255pDyC+kz
	6Woy6RRdLWZNovkdIqosPsg6xF1QyCrptuQYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=drjd/ymXQ4q1k27Vv2E6lV0e8roSd6wXP58pg1eWzJIb6XAaN/57psASIFyT3au9dp
	pyfqV7KIClTj+m6BjIx8+zgrQ2Fnwp4j/G6irIokQhTdM5nkX4l53IzSl/ptd/DncvWV
	dnONgoArbm/88fI8vogDaFBVfPRbtS7Gl9nx4=
Received: by 10.142.201.13 with SMTP id y13mr9648609wff.198.1300048272102;
	Sun, 13 Mar 2011 13:31:12 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w19sm9172542wfd.20.2011.03.13.13.31.09
	(version=SSLv3 cipher=OTHER); Sun, 13 Mar 2011 13:31:11 -0700 (PDT)
Message-ID: <4D7D2983.9090901@gmail.com>
Date: Sun, 13 Mar 2011 13:30:59 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
	<1300042739-17381-9-git-send-email-eric@eukrea.com>
In-Reply-To: <1300042739-17381-9-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 9/9] php: remove php-native 5.3.2
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
X-List-Received-Date: Sun, 13 Mar 2011 20:32:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2011 11:58 AM, Eric Bénard wrote:
> now that we have 5.3.5
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/php/php-5.3.2/CVE-2010-0397.patch         |   57 --------------
>   recipes/php/php-5.3.2/acinclude-xml2-config.patch |   18 -----
>   recipes/php/php-5.3.2/pear-makefile.patch         |   11 ---
>   recipes/php/php-5.3.2/php-m4-divert.patch         |   83 ---------------------
>   recipes/php/php-native_5.3.2.bb                   |   12 ---
>   5 files changed, 0 insertions(+), 181 deletions(-)
>   delete mode 100644 recipes/php/php-5.3.2/CVE-2010-0397.patch
>   delete mode 100644 recipes/php/php-5.3.2/acinclude-xml2-config.patch
>   delete mode 100644 recipes/php/php-5.3.2/pear-makefile.patch
>   delete mode 100644 recipes/php/php-5.3.2/php-m4-divert.patch
>   delete mode 100644 recipes/php/php-native_5.3.2.bb
>
> diff --git a/recipes/php/php-5.3.2/CVE-2010-0397.patch b/recipes/php/php-5.3.2/CVE-2010-0397.patch
> deleted file mode 100644
> index 0d9c23d..0000000
> --- a/recipes/php/php-5.3.2/CVE-2010-0397.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Description: Fix a null pointer dereference when processing invalid
> - XML-RPC requests.
> -Origin: vendor
> -Forwarded: http://bugs.php.net/51288
> -Last-Update: 2010-03-12
> -
> -Index: php/ext/xmlrpc/tests/bug51288.phpt
> -===================================================================
> ---- /dev/null
> -+++ php/ext/xmlrpc/tests/bug51288.phpt
> -@@ -0,0 +1,14 @@
> -+--TEST--
> -+Bug #51288 (CVE-2010-0397, NULL pointer deref when no<methodName>  in request)
> -+--FILE--
> -+<?php
> -+$method = NULL;
> -+$req = '<?xml version="1.0"?><methodCall></methodCall>';
> -+var_dump(xmlrpc_decode_request($req, $method));
> -+var_dump($method);
> -+echo "Done\n";
> -+?>
> -+--EXPECT--
> -+NULL
> -+NULL
> -+Done
> -Index: php/ext/xmlrpc/xmlrpc-epi-php.c
> -===================================================================
> ---- php.orig/ext/xmlrpc/xmlrpc-epi-php.c
> -+++ php/ext/xmlrpc/xmlrpc-epi-php.c
> -@@ -778,6 +778,7 @@
> - 	zval* retval = NULL;
> - 	XMLRPC_REQUEST response;
> - 	STRUCT_XMLRPC_REQUEST_INPUT_OPTIONS opts = {{0}};
> -+	const char *method_name;
> - 	opts.xml_elem_opts.encoding = encoding_in ? utf8_get_encoding_id_from_string(encoding_in) : ENCODING_DEFAULT;
> -
> - 	/* generate XMLRPC_REQUEST from raw xml */
> -@@ -788,10 +789,15 @@
> -
> - 		if (XMLRPC_RequestGetRequestType(response) == xmlrpc_request_call) {
> - 			if (method_name_out) {
> --				zval_dtor(method_name_out);
> --				Z_TYPE_P(method_name_out) = IS_STRING;
> --				Z_STRVAL_P(method_name_out) = estrdup(XMLRPC_RequestGetMethodName(response));
> --				Z_STRLEN_P(method_name_out) = strlen(Z_STRVAL_P(method_name_out));
> -+				method_name = XMLRPC_RequestGetMethodName(response);
> -+				if (method_name) {
> -+					zval_dtor(method_name_out);
> -+					Z_TYPE_P(method_name_out) = IS_STRING;
> -+					Z_STRVAL_P(method_name_out) = estrdup(method_name);
> -+					Z_STRLEN_P(method_name_out) = strlen(Z_STRVAL_P(method_name_out));
> -+				} else {
> -+					retval = NULL;
> -+				}
> - 			}
> - 		}
> -
> diff --git a/recipes/php/php-5.3.2/acinclude-xml2-config.patch b/recipes/php/php-5.3.2/acinclude-xml2-config.patch
> deleted file mode 100644
> index bf519d2..0000000
> --- a/recipes/php/php-5.3.2/acinclude-xml2-config.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> ---- /orig-acinclude.m4 2007-02-20 15:03:25.000000000 +0200
> -+++ /acinclude.m4      2007-02-20 15:03:24.000000000 +0200
> -@@ -2359,12 +2359,9 @@
> - AC_DEFUN([PHP_SETUP_LIBXML], [
> - AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
> - [
> --  for i in $PHP_LIBXML_DIR /usr/local /usr; do
> --    if test -x "$i/bin/xml2-config"; then
> --      ac_cv_php_xml2_config_path="$i/bin/xml2-config"
> --      break
> --    fi
> --  done
> -+
> -+      ac_cv_php_xml2_config_path="$PHP_LIBXML_DIR/xml2-config"
> -+
> - ])
> -
> -   if test -x "$ac_cv_php_xml2_config_path"; then
> diff --git a/recipes/php/php-5.3.2/pear-makefile.patch b/recipes/php/php-5.3.2/pear-makefile.patch
> deleted file mode 100644
> index 26de98a..0000000
> --- a/recipes/php/php-5.3.2/pear-makefile.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /pear/orig-Makefile.frag	2007-03-16 12:18:33.000000000 +0200
> -+++ /pear/Makefile.frag	2007-03-16 12:35:48.000000000 +0200
> -@@ -6,7 +6,7 @@
> - PEAR_INSTALL_FLAGS = -n -dshort_open_tag=0 -dsafe_mode=0 -dopen_basedir= -derror_reporting=E_ALL -dmemory_limit=-1 -ddetect_unicode=0
> -
> - install-pear-installer: $(SAPI_CLI_PATH)
> --	@$(top_builddir)/sapi/cli/php $(PEAR_INSTALL_FLAGS) $(builddir)/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)"
> -+	@$(PHP_NATIVE_DIR)/php $(PEAR_INSTALL_FLAGS) $(builddir)/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)"
> -
> - install-pear:
> - 	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
> diff --git a/recipes/php/php-5.3.2/php-m4-divert.patch b/recipes/php/php-5.3.2/php-m4-divert.patch
> deleted file mode 100644
> index dfc7b64..0000000
> --- a/recipes/php/php-5.3.2/php-m4-divert.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -Patch taken from
> -
> -http://cvs.pld-linux.org/cgi-bin/cvsweb/packages/php/php-m4-divert.patch?rev=1.1
> -
> -diff -ur php-5.2.10.org/configure.in php-5.2.10/configure.in
> ---- php-5.2.10.org/configure.in	2009-06-17 14:22:41.000000000 +0200
> -+++ php-5.2.10/configure.in	2009-08-18 12:16:25.317640253 +0200
> -@@ -1,7 +1,7 @@
> - ## $Id: configure.in,v 1.579.2.52.2.139 2009/06/17 12:22:41 iliaa Exp $ -*- autoconf -*-
> - dnl ## Process this file with autoconf to produce a configure script.
> -
> --divert(1)
> -+divert(1001)
> -
> - dnl ## Diversion 1 is the autoconf + automake setup phase. We also
> - dnl ## set the PHP version, deal with platform-specific compile
> -@@ -263,7 +263,7 @@
> - sinclude(TSRM/tsrm.m4)
> -
> -
> --divert(2)
> -+divert(1002)
> -
> - dnl ## Diversion 2 is where we set PHP-specific options and come up
> - dnl ## with reasonable default values for them. We check for pthreads here
> -@@ -302,7 +302,7 @@
> -   PTHREADS_FLAGS
> - fi
> -
> --divert(3)
> -+divert(1003)
> -
> - dnl ## In diversion 3 we check for compile-time options to the PHP
> - dnl ## core and how to deal with different system dependencies.
> -@@ -661,7 +661,7 @@
> -   PHP_CRYPT_R_STYLE
> - fi
> -
> --divert(4)
> -+divert(1004)
> -
> - dnl ## In diversion 4 we check user-configurable general settings.
> -
> -@@ -902,7 +902,7 @@
> -   AC_MSG_RESULT([using system default])
> - fi
> -
> --divert(5)
> -+divert(1005)
> -
> - dnl ## In diversion 5 we check which extensions should be compiled.
> - dnl ## All of these are normally in the extension directories.
> -diff -ur php-5.2.10.org/ext/standard/config.m4 php-5.2.10/ext/standard/config.m4
> ---- php-5.2.10.org/ext/standard/config.m4	2007-07-11 13:56:03.000000000 +0200
> -+++ php-5.2.10/ext/standard/config.m4	2009-08-18 12:16:25.317640253 +0200
> -@@ -1,6 +1,6 @@
> - dnl $Id: config.m4,v 1.80.2.3.2.3 2007/07/11 11:56:03 jani Exp $ -*- autoconf -*-
> -
> --divert(3)dnl
> -+divert(1003)dnl
> -
> - dnl
> - dnl Check if flush should be called explicitly after buffered io
> -@@ -205,7 +205,7 @@
> - AC_CHECK_FUNCS(getcwd getwd asinh acosh atanh log1p hypot glob strfmon nice fpclass isinf isnan)
> - AC_FUNC_FNMATCH	
> -
> --divert(5)dnl
> -+divert(1005)dnl
> -
> - dnl
> - dnl Check for regex library type
> -diff -ur php-5.2.10.org/scripts/phpize.m4 php-5.2.10/scripts/phpize.m4
> ---- php-5.2.10.org/scripts/phpize.m4	2009-06-02 21:54:22.000000000 +0200
> -+++ php-5.2.10/scripts/phpize.m4	2009-08-18 12:16:25.317640253 +0200
> -@@ -1,6 +1,6 @@
> - dnl This file becomes configure.in for self-contained extensions.
> -
> --divert(1)
> -+divert(1001)
> -
> - AC_PREREQ(2.13)
> - AC_INIT(config.m4)
> diff --git a/recipes/php/php-native_5.3.2.bb b/recipes/php/php-native_5.3.2.bb
> deleted file mode 100644
> index 3a2299c..0000000
> --- a/recipes/php/php-native_5.3.2.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require php-native.inc
> -
> -PR = "${INC_PR}.1"
> -
> -SRC_URI =     "http://museum.php.net/php5/php-${PV}.tar.bz2;name=src \
> -               file://acinclude-xml2-config.patch \
> -               file://php-m4-divert.patch \
> -	       file://CVE-2010-0397.patch"
> -
> -SRC_URI[src.md5sum] = "46f500816125202c48a458d0133254a4"
> -SRC_URI[src.sha256sum] = "9a380a574adcb3a9abe3226e7c3a9bae619e8a1b90842ec2a7edf0ad92afdeda"
> -



