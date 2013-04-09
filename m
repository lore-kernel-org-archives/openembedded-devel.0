Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UPSyp-0002Au-HS
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 09:28:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r397B97P023419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Apr 2013 00:11:10 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 00:11:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2013 15:11:05 +0800
Message-ID: <c63fb0a794520e59580eeec88b2086494da43986.1365489405.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1365489405.git.jackie.huang@windriver.com>
References: <cover.1365489405.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-webserver][PATCH 2/2] modphp: enable mysql option in PACKAGECONFIG
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
X-List-Received-Date: Tue, 09 Apr 2013 07:29:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* enable mysql option in PACKAGECONFIG
* add patch to support autoconf 2.59+ so we can use
  autotools do_configure to fix a libtool cross-compile issue

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../modphp/files/php-5.3.14-aconf259.patch         |  209 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |   24 ++--
 2 files changed, 221 insertions(+), 12 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch

diff --git a/meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch b/meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch
new file mode 100644
index 0000000..bda0aef
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch
@@ -0,0 +1,209 @@
+Patch from fedora to support autoconf 2.59+
+
+referrence to:
+https://bugs.php.net/bug.php?id=50291
+http://lists.fedoraproject.org/pipermail/scm-commits/2012-June/807312.html
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+diff --git a/build/buildcheck.sh b/build/buildcheck.sh
+index de16264..4b05c28 100755
+--- a/build/buildcheck.sh
++++ b/build/buildcheck.sh
+@@ -28,33 +28,23 @@ if test -z "$PHP_AUTOCONF"; then
+   PHP_AUTOCONF='autoconf'
+ fi
+ 
+-# autoconf 2.13 or newer
++# autoconf 2.59 or newer
+ ac_version=`$PHP_AUTOCONF --version 2>/dev/null|head -n 1|sed -e 's/^[^0-9]*//' -e 's/[a-z]* *$//'`
+ if test -z "$ac_version"; then
+ echo "buildconf: autoconf not found."
+-echo "           You need autoconf version 2.13 or newer installed"
++echo "           You need autoconf version 2.59 or newer installed"
+ echo "           to build PHP from SVN."
+ exit 1
+ fi
+ IFS=.; set $ac_version; IFS=' '
+-if test "$1" = "2" -a "$2" -lt "13" || test "$1" -lt "2"; then
++if test "$1" = "2" -a "$2" -lt "59" || test "$1" -lt "2"; then
+ echo "buildconf: autoconf version $ac_version found."
+-echo "           You need autoconf version 2.13 or newer installed"
++echo "           You need autoconf version 2.59 or newer installed"
+ echo "           to build PHP from SVN."
+ exit 1
+ fi
+ 
+-if test "$1" = "2" -a "$2" -gt "59"; then
+-  echo "buildconf: You need autoconf 2.59 or lower to build this version of PHP."
+-  echo "           You are currently trying to use $ac_version"
+-  echo "           Most distros have separate autoconf 2.13 or 2.59 packages."
+-  echo "           On Debian/Ubuntu both autoconf2.13 and autoconf2.59 packages exist."
+-  echo "           Install autoconf2.13 and set the PHP_AUTOCONF env var to "
+-  echo "           autoconf2.13 and try again."
+-  exit 1
+-else
+-  echo "buildconf: autoconf version $ac_version (ok)"
+-fi
++echo "buildconf: autoconf version $ac_version (ok)"
+ 
+ if test "$1" = "2" -a "$2" -ge "50"; then
+   ./vcsclean
+diff --git a/configure.in b/configure.in
+index f48ce4f..6851512 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1,28 +1,6 @@
+ ## $Id$ -*- autoconf -*-
+ dnl ## Process this file with autoconf to produce a configure script.
+ 
+-divert(1)
+-
+-dnl ## Diversion 1 is the autoconf + automake setup phase. We also
+-dnl ## set the PHP version, deal with platform-specific compile
+-dnl ## options and check for the basic compile tools.
+-
+-dnl ## Diversion 2 is the initial checking of OS features, programs,
+-dnl ## libraries and so on.
+-
+-dnl ## In diversion 3 we check for compile-time options to the PHP
+-dnl ## core and how to deal with different system dependencies. 
+-dnl ## This includes whether debugging or short tags are enabled
+-dnl ## and the default behaviour of php.ini options.
+-dnl ## This is also where an SAPI interface is selected (choosing between
+-dnl ## Apache module, CGI etc.)
+-
+-dnl ## In diversion 4 we check user-configurable general settings.
+-
+-dnl ## In diversion 5 we check which extensions should be compiled.
+-dnl ## All of these are normally in the extension directories.
+-dnl ## Diversion 5 is the last one.  Here we generate files and clean up.
+-
+ dnl include Zend specific macro definitions first
+ dnl -------------------------------------------------------------------------
+ sinclude(Zend/acinclude.m4)
+@@ -30,8 +8,10 @@ sinclude(Zend/acinclude.m4)
+ dnl Basic autoconf + automake initialization, generation of config.nice.
+ dnl -------------------------------------------------------------------------
+ 
+-AC_PREREQ(2.13)
++AC_PREREQ(2.59)
+ AC_INIT(README.GIT-RULES)
++ifdef([AC_PRESERVE_HELP_ORDER], [AC_PRESERVE_HELP_ORDER], [])
++
+ 
+ PHP_CONFIG_NICE(config.nice)
+ 
+@@ -290,14 +270,6 @@ sinclude(TSRM/threads.m4)
+ sinclude(TSRM/tsrm.m4)
+ 
+ 
+-divert(2)
+-
+-dnl ## Diversion 2 is where we set PHP-specific options and come up
+-dnl ## with reasonable default values for them. We check for pthreads here
+-dnl ## because the information is needed by the SAPI configuration.
+-dnl ## This is also where an SAPI interface is selected (choosing between
+-dnl ## Apache module, CGI etc.)
+-
+ dnl .
+ dnl -------------------------------------------------------------------------
+ 
+@@ -329,13 +301,6 @@ if test "$enable_maintainer_zts" = "yes"; then
+   PTHREADS_FLAGS
+ fi
+ 
+-divert(3)
+-
+-dnl ## In diversion 3 we check for compile-time options to the PHP
+-dnl ## core and how to deal with different system dependencies. 
+-dnl ## This includes whether debugging or short tags are enabled
+-dnl ## and the default behaviour of php.ini options.
+-
+ dnl Starting system checks.
+ dnl -------------------------------------------------------------------------
+ 
+@@ -683,10 +648,6 @@ if test "x$php_crypt_r" = "x1"; then
+   PHP_CRYPT_R_STYLE
+ fi
+ 
+-divert(4)
+-
+-dnl ## In diversion 4 we check user-configurable general settings.
+-
+ dnl General settings.
+ dnl -------------------------------------------------------------------------
+ PHP_CONFIGURE_PART(General settings)
+@@ -924,11 +885,6 @@ else
+   AC_MSG_RESULT([using system default])
+ fi
+ 
+-divert(5)
+-
+-dnl ## In diversion 5 we check which extensions should be compiled.
+-dnl ## All of these are normally in the extension directories.
+-
+ dnl Extension configuration.
+ dnl -------------------------------------------------------------------------
+ 
+diff --git a/ext/standard/config.m4 b/ext/standard/config.m4
+index e28c351..c33ae1e 100644
+--- a/ext/standard/config.m4
++++ b/ext/standard/config.m4
+@@ -1,7 +1,5 @@
+ dnl $Id$ -*- autoconf -*-
+ 
+-divert(3)dnl
+-
+ dnl
+ dnl Check if flush should be called explicitly after buffered io
+ dnl
+@@ -342,8 +340,6 @@ dnl
+ AC_CHECK_FUNCS(getcwd getwd asinh acosh atanh log1p hypot glob strfmon nice fpclass isinf isnan mempcpy strpncpy)
+ AC_FUNC_FNMATCH	
+ 
+-divert(5)dnl
+-
+ dnl
+ dnl Check if there is a support means of creating a new process
+ dnl and defining which handles it receives
+diff --git a/scripts/php-config.in b/scripts/php-config.in
+index 13c25f2..d6c62cc 100644
+--- a/scripts/php-config.in
++++ b/scripts/php-config.in
+@@ -2,6 +2,7 @@
+ 
+ SED="@SED@"
+ prefix="@prefix@"
++datarootdir="@datarootdir@"
+ exec_prefix="@exec_prefix@"
+ version="@PHP_VERSION@"
+ vernum="@PHP_VERSION_ID@"
+diff --git a/scripts/phpize.in b/scripts/phpize.in
+index 40ccc77..43cd8d3 100644
+--- a/scripts/phpize.in
++++ b/scripts/phpize.in
+@@ -2,6 +2,7 @@
+ 
+ # Variable declaration
+ prefix='@prefix@'
++datarootdir='@datarootdir@'
+ exec_prefix="`eval echo @exec_prefix@`"
+ phpdir="`eval echo @libdir@`/build"
+ includedir="`eval echo @includedir@`/php"
+diff --git a/scripts/phpize.m4 b/scripts/phpize.m4
+index e3a30a5..d745ca7 100644
+--- a/scripts/phpize.m4
++++ b/scripts/phpize.m4
+@@ -1,9 +1,8 @@
+ dnl This file becomes configure.in for self-contained extensions.
+ 
+-divert(1)
+-
+-AC_PREREQ(2.13)
++AC_PREREQ(2.59)
+ AC_INIT(config.m4)
++ifdef([AC_PRESERVE_HELP_ORDER], [AC_PRESERVE_HELP_ORDER], [])
+ 
+ PHP_CONFIG_NICE(config.nice)
+ 
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 0d84ba4..fdf7b18 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -2,11 +2,13 @@ SECTION = "console/network"
 DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
 LICENSE = "PHP-3.0"
 DEPENDS = "apache2-native apache2 zlib bzip2"
+INC_PR = "r1"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://configure.patch \
            file://pthread-check-threads-m4.patch \
            file://70_mod_php5.conf \
+           file://php-5.3.14-aconf259.patch \
            "
 
 S = "${WORKDIR}/php-${PV}"
@@ -41,25 +43,21 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
                 --enable-mbstring \
                 --with-config-file-path=${sysconfdir}/php/apache2-php5"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "mysql"
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5"
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,mysql5"
 
 acpaths = ""
 
-#
-# override the autotools do_configure, which runs autoconf,
-# which breaks everything...
-#
-do_configure() {
-	gnu-configize --force
-	find . -name config.m4 -o -name configure | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
-	export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} 
-	oe_runconf
+do_configure_prepend () {
+        rm -f build/libtool.m4 ltmain.sh aclocal.m4
+        find . -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
+}
 
+do_configure_append() {
 	# No libtool, we really don't want rpath set...
-	sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
-	sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
+	sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
+	sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
 }
 
 do_install  () {
@@ -76,6 +74,8 @@ do_install  () {
 	install -d ${D}${bindir}
 	install -m 755 scripts/phpize ${D}${bindir}
 	install -m 755 scripts/php-config ${D}${bindir}
+	cat aclocal-copy/libtool.m4 aclocal-copy/lt~obsolete.m4 aclocal-copy/ltoptions.m4 \
+		aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > build/libtool.m4
 
 	oe_runmake install-build install-headers INSTALL_ROOT=${D}
 }
-- 
1.7.4.1



