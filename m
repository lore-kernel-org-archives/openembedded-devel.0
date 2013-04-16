Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1US5Uh-0001VM-R9
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 15:00:28 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B9A6BD2284
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 14:42:13 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 14:42:49 +0200
Message-Id: <1366116169-19800-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] php: update to 5.4.14
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
X-List-Received-Date: Tue, 16 Apr 2013 13:00:35 -0000
X-List-Received-Date: Tue, 16 Apr 2013 13:00:35 -0000

Build tested for AArch64 and x86.
Runtime tested on x86.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/php/php.inc               |  4 +-
 .../recipes-devtools/php/php/phar-makefile.patch   |  8 +--
 .../recipes-devtools/php/php/php-m4-divert.patch   | 83 ----------------------
 .../recipes-devtools/php/php/php_exec_native.patch | 26 ++++---
 .../php/{php_5.3.19.bb => php_5.4.14.bb}           |  5 +-
 5 files changed, 26 insertions(+), 100 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/php-m4-divert.patch
 rename meta-oe/recipes-devtools/php/{php_5.3.19.bb => php_5.4.14.bb} (75%)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 176d4a1..225c3d7 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -64,7 +64,9 @@ do_install_append_pn-php-native() {
 # fixme
 do_install_append_pn-php() {
     install -d ${D}/${sysconfdir}/
-    mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
+    if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
+         mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
+    fi
     rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
index 9d1dc7b..6fde251 100644
--- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
@@ -4,8 +4,8 @@ index fc93d1d..9a8cd65 100755
 +++ b/ext/phar/Makefile.frag
 @@ -6,19 +6,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
  
-    PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
-    PHP_PHARCMD_EXECUTABLE = ` \
+ PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
+ PHP_PHARCMD_EXECUTABLE = ` \
 -	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
 -		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
 -		if test "x$(PHP_MODULES)" != "x"; then \
@@ -21,6 +21,6 @@ index fc93d1d..9a8cd65 100755
 -	fi;`
 +		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
 +
-    PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
+ PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
  
-    $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
+ $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
diff --git a/meta-oe/recipes-devtools/php/php/php-m4-divert.patch b/meta-oe/recipes-devtools/php/php/php-m4-divert.patch
deleted file mode 100644
index dfc7b64..0000000
--- a/meta-oe/recipes-devtools/php/php/php-m4-divert.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Patch taken from
-
-http://cvs.pld-linux.org/cgi-bin/cvsweb/packages/php/php-m4-divert.patch?rev=1.1
-
-diff -ur php-5.2.10.org/configure.in php-5.2.10/configure.in
---- php-5.2.10.org/configure.in	2009-06-17 14:22:41.000000000 +0200
-+++ php-5.2.10/configure.in	2009-08-18 12:16:25.317640253 +0200
-@@ -1,7 +1,7 @@
- ## $Id: configure.in,v 1.579.2.52.2.139 2009/06/17 12:22:41 iliaa Exp $ -*- autoconf -*-
- dnl ## Process this file with autoconf to produce a configure script.
- 
--divert(1)
-+divert(1001)
- 
- dnl ## Diversion 1 is the autoconf + automake setup phase. We also
- dnl ## set the PHP version, deal with platform-specific compile
-@@ -263,7 +263,7 @@
- sinclude(TSRM/tsrm.m4)
- 
- 
--divert(2)
-+divert(1002)
- 
- dnl ## Diversion 2 is where we set PHP-specific options and come up
- dnl ## with reasonable default values for them. We check for pthreads here
-@@ -302,7 +302,7 @@
-   PTHREADS_FLAGS
- fi
- 
--divert(3)
-+divert(1003)
- 
- dnl ## In diversion 3 we check for compile-time options to the PHP
- dnl ## core and how to deal with different system dependencies.
-@@ -661,7 +661,7 @@
-   PHP_CRYPT_R_STYLE
- fi
- 
--divert(4)
-+divert(1004)
- 
- dnl ## In diversion 4 we check user-configurable general settings.
- 
-@@ -902,7 +902,7 @@
-   AC_MSG_RESULT([using system default])
- fi
- 
--divert(5)
-+divert(1005)
- 
- dnl ## In diversion 5 we check which extensions should be compiled.
- dnl ## All of these are normally in the extension directories.
-diff -ur php-5.2.10.org/ext/standard/config.m4 php-5.2.10/ext/standard/config.m4
---- php-5.2.10.org/ext/standard/config.m4	2007-07-11 13:56:03.000000000 +0200
-+++ php-5.2.10/ext/standard/config.m4	2009-08-18 12:16:25.317640253 +0200
-@@ -1,6 +1,6 @@
- dnl $Id: config.m4,v 1.80.2.3.2.3 2007/07/11 11:56:03 jani Exp $ -*- autoconf -*-
- 
--divert(3)dnl
-+divert(1003)dnl
- 
- dnl
- dnl Check if flush should be called explicitly after buffered io
-@@ -205,7 +205,7 @@
- AC_CHECK_FUNCS(getcwd getwd asinh acosh atanh log1p hypot glob strfmon nice fpclass isinf isnan)
- AC_FUNC_FNMATCH	
- 
--divert(5)dnl
-+divert(1005)dnl
- 
- dnl
- dnl Check for regex library type
-diff -ur php-5.2.10.org/scripts/phpize.m4 php-5.2.10/scripts/phpize.m4
---- php-5.2.10.org/scripts/phpize.m4	2009-06-02 21:54:22.000000000 +0200
-+++ php-5.2.10/scripts/phpize.m4	2009-08-18 12:16:25.317640253 +0200
-@@ -1,6 +1,6 @@
- dnl This file becomes configure.in for self-contained extensions.
- 
--divert(1)
-+divert(1001)
- 
- AC_PREREQ(2.13)
- AC_INIT(config.m4)
diff --git a/meta-oe/recipes-devtools/php/php/php_exec_native.patch b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
index a563c9a..31be1b7 100644
--- a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
+++ b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
@@ -1,11 +1,19 @@
---- php/configure.in.orig	2011-03-12 02:13:19.000000000 +0100
-+++ php/configure.in	2011-03-12 02:14:05.000000000 +0100
-@@ -1216,7 +1216,7 @@
-   PHP_INSTALL_CLI_TARGET="install-cli"
-   PHP_ADD_SOURCES(sapi/cli, php_cli.c php_cli_readline.c,, cli)
-   PHP_INSTALLED_SAPIS="cli $PHP_SAPI"
+---
+ sapi/cli/config.m4 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- php-5.4.14.orig/sapi/cli/config.m4
++++ php-5.4.14/sapi/cli/config.m4
+@@ -34,11 +34,11 @@ if test "$PHP_CLI" != "no"; then
+     BUILD_CLI="\$(LIBTOOL) --mode=link \$(CC) -export-dynamic \$(CFLAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS) \$(PHP_RPATHS) \$(PHP_GLOBAL_OBJS) \$(PHP_BINARY_OBJS) \$(PHP_CLI_OBJS) \$(EXTRA_LIBS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CLI_PATH)"
+     ;;
+   esac
+ 
+   dnl Set executable for tests
 -  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
 +  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
- else
-   PHP_INSTALLED_SAPIS="$PHP_SAPI"
- fi
+   PHP_SUBST(PHP_EXECUTABLE)
+ 
+   dnl Expose to Makefile
+   PHP_SUBST(SAPI_CLI_PATH)
+   PHP_SUBST(BUILD_CLI)
diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes-devtools/php/php_5.4.14.bb
similarity index 75%
rename from meta-oe/recipes-devtools/php/php_5.3.19.bb
rename to meta-oe/recipes-devtools/php/php_5.4.14.bb
index 0ce8113..4e0efb1 100644
--- a/meta-oe/recipes-devtools/php/php_5.3.19.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.14.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://acinclude-xml2-config.patch \
-            file://php-m4-divert.patch \
             file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
 
 SRC_URI_append_pn-php += "file://iconv.patch \
@@ -18,5 +17,5 @@ SRC_URI_append_pn-php += "file://iconv.patch \
             file://php-fpm-apache.conf \
 "
 
-SRC_URI[md5sum] = "e1d2a3ec7849d4b3032bd1abf1916aa4"
-SRC_URI[sha256sum] = "814ce55b950158c4ddadbcd0b2d7d8cb4b570de4a29b9db021020594e2469fd6"
+SRC_URI[md5sum] = "cfdc044be2c582991a1fe0967898fa38"
+SRC_URI[sha256sum] = "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02fe4a46f9c81be20a"
-- 
1.8.1.2



