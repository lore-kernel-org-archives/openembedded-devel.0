Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UVI45-0000mk-OI
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 11:02:05 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2A70FD20DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 10:43:46 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2013 10:44:19 +0200
Message-Id: <1366879459-22895-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] modphp: update to 5.4.14
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
X-List-Received-Date: Thu, 25 Apr 2013 09:02:06 -0000

Only build tested.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../modphp/files/php-5.3.14-aconf259.patch         | 209 ---------------------
 meta-webserver/recipes-php/modphp/modphp5.inc      |   1 -
 meta-webserver/recipes-php/modphp/modphp_5.3.19.bb |   5 -
 meta-webserver/recipes-php/modphp/modphp_5.4.14.bb |   4 +
 4 files changed, 4 insertions(+), 215 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.3.19.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.14.bb

diff --git a/meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch b/meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch
deleted file mode 100644
index bda0aef..0000000
--- a/meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch
+++ /dev/null
@@ -1,209 +0,0 @@
-Patch from fedora to support autoconf 2.59+
-
-referrence to:
-https://bugs.php.net/bug.php?id=50291
-http://lists.fedoraproject.org/pipermail/scm-commits/2012-June/807312.html
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
-diff --git a/build/buildcheck.sh b/build/buildcheck.sh
-index de16264..4b05c28 100755
---- a/build/buildcheck.sh
-+++ b/build/buildcheck.sh
-@@ -28,33 +28,23 @@ if test -z "$PHP_AUTOCONF"; then
-   PHP_AUTOCONF='autoconf'
- fi
- 
--# autoconf 2.13 or newer
-+# autoconf 2.59 or newer
- ac_version=`$PHP_AUTOCONF --version 2>/dev/null|head -n 1|sed -e 's/^[^0-9]*//' -e 's/[a-z]* *$//'`
- if test -z "$ac_version"; then
- echo "buildconf: autoconf not found."
--echo "           You need autoconf version 2.13 or newer installed"
-+echo "           You need autoconf version 2.59 or newer installed"
- echo "           to build PHP from SVN."
- exit 1
- fi
- IFS=.; set $ac_version; IFS=' '
--if test "$1" = "2" -a "$2" -lt "13" || test "$1" -lt "2"; then
-+if test "$1" = "2" -a "$2" -lt "59" || test "$1" -lt "2"; then
- echo "buildconf: autoconf version $ac_version found."
--echo "           You need autoconf version 2.13 or newer installed"
-+echo "           You need autoconf version 2.59 or newer installed"
- echo "           to build PHP from SVN."
- exit 1
- fi
- 
--if test "$1" = "2" -a "$2" -gt "59"; then
--  echo "buildconf: You need autoconf 2.59 or lower to build this version of PHP."
--  echo "           You are currently trying to use $ac_version"
--  echo "           Most distros have separate autoconf 2.13 or 2.59 packages."
--  echo "           On Debian/Ubuntu both autoconf2.13 and autoconf2.59 packages exist."
--  echo "           Install autoconf2.13 and set the PHP_AUTOCONF env var to "
--  echo "           autoconf2.13 and try again."
--  exit 1
--else
--  echo "buildconf: autoconf version $ac_version (ok)"
--fi
-+echo "buildconf: autoconf version $ac_version (ok)"
- 
- if test "$1" = "2" -a "$2" -ge "50"; then
-   ./vcsclean
-diff --git a/configure.in b/configure.in
-index f48ce4f..6851512 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1,28 +1,6 @@
- ## $Id$ -*- autoconf -*-
- dnl ## Process this file with autoconf to produce a configure script.
- 
--divert(1)
--
--dnl ## Diversion 1 is the autoconf + automake setup phase. We also
--dnl ## set the PHP version, deal with platform-specific compile
--dnl ## options and check for the basic compile tools.
--
--dnl ## Diversion 2 is the initial checking of OS features, programs,
--dnl ## libraries and so on.
--
--dnl ## In diversion 3 we check for compile-time options to the PHP
--dnl ## core and how to deal with different system dependencies. 
--dnl ## This includes whether debugging or short tags are enabled
--dnl ## and the default behaviour of php.ini options.
--dnl ## This is also where an SAPI interface is selected (choosing between
--dnl ## Apache module, CGI etc.)
--
--dnl ## In diversion 4 we check user-configurable general settings.
--
--dnl ## In diversion 5 we check which extensions should be compiled.
--dnl ## All of these are normally in the extension directories.
--dnl ## Diversion 5 is the last one.  Here we generate files and clean up.
--
- dnl include Zend specific macro definitions first
- dnl -------------------------------------------------------------------------
- sinclude(Zend/acinclude.m4)
-@@ -30,8 +8,10 @@ sinclude(Zend/acinclude.m4)
- dnl Basic autoconf + automake initialization, generation of config.nice.
- dnl -------------------------------------------------------------------------
- 
--AC_PREREQ(2.13)
-+AC_PREREQ(2.59)
- AC_INIT(README.GIT-RULES)
-+ifdef([AC_PRESERVE_HELP_ORDER], [AC_PRESERVE_HELP_ORDER], [])
-+
- 
- PHP_CONFIG_NICE(config.nice)
- 
-@@ -290,14 +270,6 @@ sinclude(TSRM/threads.m4)
- sinclude(TSRM/tsrm.m4)
- 
- 
--divert(2)
--
--dnl ## Diversion 2 is where we set PHP-specific options and come up
--dnl ## with reasonable default values for them. We check for pthreads here
--dnl ## because the information is needed by the SAPI configuration.
--dnl ## This is also where an SAPI interface is selected (choosing between
--dnl ## Apache module, CGI etc.)
--
- dnl .
- dnl -------------------------------------------------------------------------
- 
-@@ -329,13 +301,6 @@ if test "$enable_maintainer_zts" = "yes"; then
-   PTHREADS_FLAGS
- fi
- 
--divert(3)
--
--dnl ## In diversion 3 we check for compile-time options to the PHP
--dnl ## core and how to deal with different system dependencies. 
--dnl ## This includes whether debugging or short tags are enabled
--dnl ## and the default behaviour of php.ini options.
--
- dnl Starting system checks.
- dnl -------------------------------------------------------------------------
- 
-@@ -683,10 +648,6 @@ if test "x$php_crypt_r" = "x1"; then
-   PHP_CRYPT_R_STYLE
- fi
- 
--divert(4)
--
--dnl ## In diversion 4 we check user-configurable general settings.
--
- dnl General settings.
- dnl -------------------------------------------------------------------------
- PHP_CONFIGURE_PART(General settings)
-@@ -924,11 +885,6 @@ else
-   AC_MSG_RESULT([using system default])
- fi
- 
--divert(5)
--
--dnl ## In diversion 5 we check which extensions should be compiled.
--dnl ## All of these are normally in the extension directories.
--
- dnl Extension configuration.
- dnl -------------------------------------------------------------------------
- 
-diff --git a/ext/standard/config.m4 b/ext/standard/config.m4
-index e28c351..c33ae1e 100644
---- a/ext/standard/config.m4
-+++ b/ext/standard/config.m4
-@@ -1,7 +1,5 @@
- dnl $Id$ -*- autoconf -*-
- 
--divert(3)dnl
--
- dnl
- dnl Check if flush should be called explicitly after buffered io
- dnl
-@@ -342,8 +340,6 @@ dnl
- AC_CHECK_FUNCS(getcwd getwd asinh acosh atanh log1p hypot glob strfmon nice fpclass isinf isnan mempcpy strpncpy)
- AC_FUNC_FNMATCH	
- 
--divert(5)dnl
--
- dnl
- dnl Check if there is a support means of creating a new process
- dnl and defining which handles it receives
-diff --git a/scripts/php-config.in b/scripts/php-config.in
-index 13c25f2..d6c62cc 100644
---- a/scripts/php-config.in
-+++ b/scripts/php-config.in
-@@ -2,6 +2,7 @@
- 
- SED="@SED@"
- prefix="@prefix@"
-+datarootdir="@datarootdir@"
- exec_prefix="@exec_prefix@"
- version="@PHP_VERSION@"
- vernum="@PHP_VERSION_ID@"
-diff --git a/scripts/phpize.in b/scripts/phpize.in
-index 40ccc77..43cd8d3 100644
---- a/scripts/phpize.in
-+++ b/scripts/phpize.in
-@@ -2,6 +2,7 @@
- 
- # Variable declaration
- prefix='@prefix@'
-+datarootdir='@datarootdir@'
- exec_prefix="`eval echo @exec_prefix@`"
- phpdir="`eval echo @libdir@`/build"
- includedir="`eval echo @includedir@`/php"
-diff --git a/scripts/phpize.m4 b/scripts/phpize.m4
-index e3a30a5..d745ca7 100644
---- a/scripts/phpize.m4
-+++ b/scripts/phpize.m4
-@@ -1,9 +1,8 @@
- dnl This file becomes configure.in for self-contained extensions.
- 
--divert(1)
--
--AC_PREREQ(2.13)
-+AC_PREREQ(2.59)
- AC_INIT(config.m4)
-+ifdef([AC_PRESERVE_HELP_ORDER], [AC_PRESERVE_HELP_ORDER], [])
- 
- PHP_CONFIG_NICE(config.nice)
- 
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index a49dc75..6b227af 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -8,7 +8,6 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://configure.patch \
            file://pthread-check-threads-m4.patch \
            file://70_mod_php5.conf \
-           file://php-5.3.14-aconf259.patch \
 "
 
 S = "${WORKDIR}/php-${PV}"
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb b/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb
deleted file mode 100644
index ecc6e86..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-include modphp5.inc
-PR = "r1"
-
-SRC_URI[md5sum] = "e1d2a3ec7849d4b3032bd1abf1916aa4"
-SRC_URI[sha256sum] = "814ce55b950158c4ddadbcd0b2d7d8cb4b570de4a29b9db021020594e2469fd6"
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.4.14.bb b/meta-webserver/recipes-php/modphp/modphp_5.4.14.bb
new file mode 100644
index 0000000..5fea8fb
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.4.14.bb
@@ -0,0 +1,4 @@
+include modphp5.inc
+
+SRC_URI[md5sum] = "cfdc044be2c582991a1fe0967898fa38"
+SRC_URI[sha256sum] = "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02fe4a46f9c81be20a"
-- 
1.8.1.2



