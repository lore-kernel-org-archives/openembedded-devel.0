Received: from 6.27.mail-out.ovh.net ([46.105.50.195] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyqVm-0008UV-P5
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 19:59:30 +0100
Received: (qmail 17757 invoked by uid 503); 13 Mar 2011 19:51:11 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:29 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:58 +0100
Message-Id: <1300042739-17381-8-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1412159958811520336
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 8/9] php: add 5.3.5
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
X-List-Received-Date: Sun, 13 Mar 2011 18:59:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

which is the latest version

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/php/php-5.3.5/acinclude-xml2-config.patch |   18 ++++
 recipes/php/php-5.3.5/iconv.patch                 |   27 +++++
 recipes/php/php-5.3.5/imap-fix-autofoo.patch      |   41 ++++++++
 recipes/php/php-5.3.5/pear-makefile.patch         |   13 +++
 recipes/php/php-5.3.5/phar-makefile.patch         |   26 +++++
 recipes/php/php-5.3.5/php-m4-divert.patch         |   83 ++++++++++++++++
 recipes/php/php-5.3.5/php_exec_native.patch       |   11 ++
 recipes/php/php-native_5.3.5.bb                   |   11 ++
 recipes/php/php_5.3.5.bb                          |  108 +++++++++++++++++++++
 9 files changed, 338 insertions(+), 0 deletions(-)
 create mode 100644 recipes/php/php-5.3.5/acinclude-xml2-config.patch
 create mode 100644 recipes/php/php-5.3.5/iconv.patch
 create mode 100644 recipes/php/php-5.3.5/imap-fix-autofoo.patch
 create mode 100644 recipes/php/php-5.3.5/pear-makefile.patch
 create mode 100644 recipes/php/php-5.3.5/phar-makefile.patch
 create mode 100644 recipes/php/php-5.3.5/php-m4-divert.patch
 create mode 100644 recipes/php/php-5.3.5/php_exec_native.patch
 create mode 100644 recipes/php/php-native_5.3.5.bb
 create mode 100644 recipes/php/php_5.3.5.bb

diff --git a/recipes/php/php-5.3.5/acinclude-xml2-config.patch b/recipes/php/php-5.3.5/acinclude-xml2-config.patch
new file mode 100644
index 0000000..bf519d2
--- /dev/null
+++ b/recipes/php/php-5.3.5/acinclude-xml2-config.patch
@@ -0,0 +1,18 @@
+--- /orig-acinclude.m4 2007-02-20 15:03:25.000000000 +0200
++++ /acinclude.m4      2007-02-20 15:03:24.000000000 +0200
+@@ -2359,12 +2359,9 @@
+ AC_DEFUN([PHP_SETUP_LIBXML], [
+ AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
+ [
+-  for i in $PHP_LIBXML_DIR /usr/local /usr; do
+-    if test -x "$i/bin/xml2-config"; then
+-      ac_cv_php_xml2_config_path="$i/bin/xml2-config"
+-      break
+-    fi
+-  done
++
++      ac_cv_php_xml2_config_path="$PHP_LIBXML_DIR/xml2-config"
++
+ ])
+
+   if test -x "$ac_cv_php_xml2_config_path"; then
diff --git a/recipes/php/php-5.3.5/iconv.patch b/recipes/php/php-5.3.5/iconv.patch
new file mode 100644
index 0000000..66b39cc
--- /dev/null
+++ b/recipes/php/php-5.3.5/iconv.patch
@@ -0,0 +1,27 @@
+Index: php-5.2.13/acinclude.m4
+===================================================================
+--- php-5.2.13.orig/acinclude.m4
++++ php-5.2.13/acinclude.m4
+@@ -2430,7 +2430,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+   dnl
+   dnl Check libc first if no path is provided in --with-iconv
+   dnl
+-  if test "$PHP_ICONV" = "yes"; then
++  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
++  if test "$PHP_ICONV" != "no"; then
+     AC_CHECK_FUNC(iconv, [
+       found_iconv=yes
+     ],[
+Index: php-5.2.13/ext/iconv/config.m4
+===================================================================
+--- php-5.2.13.orig/ext/iconv/config.m4
++++ php-5.2.13/ext/iconv/config.m4
+@@ -15,7 +15,7 @@ if test "$PHP_ICONV" != "no"; then
+ 
+   if test "$iconv_avail" != "no"; then
+     if test -z "$ICONV_DIR"; then
+-      for i in /usr/local /usr; do
++      for i in $PHP_ICONV /usr/local /usr; do
+         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
+           PHP_ICONV_PREFIX="$i"
+           break
diff --git a/recipes/php/php-5.3.5/imap-fix-autofoo.patch b/recipes/php/php-5.3.5/imap-fix-autofoo.patch
new file mode 100644
index 0000000..3695b7b
--- /dev/null
+++ b/recipes/php/php-5.3.5/imap-fix-autofoo.patch
@@ -0,0 +1,41 @@
+Index: php-5.2.11/ext/imap/config.m4
+===================================================================
+--- php-5.2.11.orig/ext/imap/config.m4	2009-12-10 12:27:52.800974533 -0700
++++ php-5.2.11/ext/imap/config.m4	2009-12-10 12:28:33.720976583 -0700
+@@ -103,7 +103,7 @@
+     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared)
+     AC_DEFINE(HAVE_IMAP,1,[ ])
+ 
+-    for i in $PHP_IMAP /usr/local /usr; do
++    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
+       IMAP_INC_CHK()
+       el[]IMAP_INC_CHK(/include/c-client)
+       el[]IMAP_INC_CHK(/include/imap)
+@@ -192,13 +192,7 @@
+       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
+     fi
+ 
+-    if test -r "$IMAP_DIR/c-client/c-client.a"; then
+-      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-client.a" >/dev/null 2>&1
+-    elif test -r "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
+-      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" >/dev/null 2>&1
+-    fi
+-
+-    for lib in c-client4 c-client imap; do
++    for lib in /usr/lib c-client4 c-client imap; do
+       IMAP_LIB=$lib
+       IMAP_LIB_CHK($PHP_LIBDIR)
+       IMAP_LIB_CHK(c-client)
+Index: php-5.2.11/acinclude.m4
+===================================================================
+--- php-5.2.11.orig/acinclude.m4	2009-12-10 12:37:13.134722881 -0700
++++ php-5.2.11/acinclude.m4	2009-12-10 12:37:39.342007053 -0700
+@@ -2338,7 +2338,7 @@
+       PHP_OPENSSL_DIR="/usr/local/ssl /usr/local /usr /usr/local/openssl"
+     fi
+ 
+-    for i in $PHP_OPENSSL_DIR; do
++    for i in $PHP_OPENSSL_DIR $PHP_OPENSSL_DIR/usr; do
+       if test -r $i/include/openssl/evp.h; then
+         OPENSSL_INCDIR=$i/include
+       fi
diff --git a/recipes/php/php-5.3.5/pear-makefile.patch b/recipes/php/php-5.3.5/pear-makefile.patch
new file mode 100644
index 0000000..1928b98
--- /dev/null
+++ b/recipes/php/php-5.3.5/pear-makefile.patch
@@ -0,0 +1,13 @@
+diff --git a/pear/Makefile.frag b/pear/Makefile.frag
+index 1f6f70e..b19a77c 100644
+--- a/pear/Makefile.frag
++++ b/pear/Makefile.frag
+@@ -11,7 +11,7 @@ PEAR_PREFIX = -dp a${program_prefix}
+ PEAR_SUFFIX = -ds a$(program_suffix)
+ 
+ install-pear-installer: $(SAPI_CLI_PATH)
+-	@$(top_builddir)/sapi/cli/php $(PEAR_INSTALL_FLAGS) pear/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
++	@$(PHP_NATIVE_DIR)/php $(PEAR_INSTALL_FLAGS) $(builddir)/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
+ 
+ install-pear:
+ 	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
diff --git a/recipes/php/php-5.3.5/phar-makefile.patch b/recipes/php/php-5.3.5/phar-makefile.patch
new file mode 100644
index 0000000..6fde251
--- /dev/null
+++ b/recipes/php/php-5.3.5/phar-makefile.patch
@@ -0,0 +1,26 @@
+diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
+index fc93d1d..9a8cd65 100755
+--- a/ext/phar/Makefile.frag
++++ b/ext/phar/Makefile.frag
+@@ -6,19 +6,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
+ 
+ PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
+ PHP_PHARCMD_EXECUTABLE = ` \
+-	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
+-		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
+-		if test "x$(PHP_MODULES)" != "x"; then \
+-		$(top_srcdir)/build/shtool echo -n -- " -d extension_dir=$(top_builddir)/modules"; \
+-		for i in bz2 zlib phar; do \
+-			if test -f "$(top_builddir)/modules/$$i.la"; then \
+-				. $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
+-			fi; \
+-		done; \
+-		fi; \
+-	else \
+-		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
+-	fi;`
++		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
++
+ PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
+ 
+ $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
diff --git a/recipes/php/php-5.3.5/php-m4-divert.patch b/recipes/php/php-5.3.5/php-m4-divert.patch
new file mode 100644
index 0000000..dfc7b64
--- /dev/null
+++ b/recipes/php/php-5.3.5/php-m4-divert.patch
@@ -0,0 +1,83 @@
+Patch taken from
+
+http://cvs.pld-linux.org/cgi-bin/cvsweb/packages/php/php-m4-divert.patch?rev=1.1
+
+diff -ur php-5.2.10.org/configure.in php-5.2.10/configure.in
+--- php-5.2.10.org/configure.in	2009-06-17 14:22:41.000000000 +0200
++++ php-5.2.10/configure.in	2009-08-18 12:16:25.317640253 +0200
+@@ -1,7 +1,7 @@
+ ## $Id: configure.in,v 1.579.2.52.2.139 2009/06/17 12:22:41 iliaa Exp $ -*- autoconf -*-
+ dnl ## Process this file with autoconf to produce a configure script.
+ 
+-divert(1)
++divert(1001)
+ 
+ dnl ## Diversion 1 is the autoconf + automake setup phase. We also
+ dnl ## set the PHP version, deal with platform-specific compile
+@@ -263,7 +263,7 @@
+ sinclude(TSRM/tsrm.m4)
+ 
+ 
+-divert(2)
++divert(1002)
+ 
+ dnl ## Diversion 2 is where we set PHP-specific options and come up
+ dnl ## with reasonable default values for them. We check for pthreads here
+@@ -302,7 +302,7 @@
+   PTHREADS_FLAGS
+ fi
+ 
+-divert(3)
++divert(1003)
+ 
+ dnl ## In diversion 3 we check for compile-time options to the PHP
+ dnl ## core and how to deal with different system dependencies.
+@@ -661,7 +661,7 @@
+   PHP_CRYPT_R_STYLE
+ fi
+ 
+-divert(4)
++divert(1004)
+ 
+ dnl ## In diversion 4 we check user-configurable general settings.
+ 
+@@ -902,7 +902,7 @@
+   AC_MSG_RESULT([using system default])
+ fi
+ 
+-divert(5)
++divert(1005)
+ 
+ dnl ## In diversion 5 we check which extensions should be compiled.
+ dnl ## All of these are normally in the extension directories.
+diff -ur php-5.2.10.org/ext/standard/config.m4 php-5.2.10/ext/standard/config.m4
+--- php-5.2.10.org/ext/standard/config.m4	2007-07-11 13:56:03.000000000 +0200
++++ php-5.2.10/ext/standard/config.m4	2009-08-18 12:16:25.317640253 +0200
+@@ -1,6 +1,6 @@
+ dnl $Id: config.m4,v 1.80.2.3.2.3 2007/07/11 11:56:03 jani Exp $ -*- autoconf -*-
+ 
+-divert(3)dnl
++divert(1003)dnl
+ 
+ dnl
+ dnl Check if flush should be called explicitly after buffered io
+@@ -205,7 +205,7 @@
+ AC_CHECK_FUNCS(getcwd getwd asinh acosh atanh log1p hypot glob strfmon nice fpclass isinf isnan)
+ AC_FUNC_FNMATCH	
+ 
+-divert(5)dnl
++divert(1005)dnl
+ 
+ dnl
+ dnl Check for regex library type
+diff -ur php-5.2.10.org/scripts/phpize.m4 php-5.2.10/scripts/phpize.m4
+--- php-5.2.10.org/scripts/phpize.m4	2009-06-02 21:54:22.000000000 +0200
++++ php-5.2.10/scripts/phpize.m4	2009-08-18 12:16:25.317640253 +0200
+@@ -1,6 +1,6 @@
+ dnl This file becomes configure.in for self-contained extensions.
+ 
+-divert(1)
++divert(1001)
+ 
+ AC_PREREQ(2.13)
+ AC_INIT(config.m4)
diff --git a/recipes/php/php-5.3.5/php_exec_native.patch b/recipes/php/php-5.3.5/php_exec_native.patch
new file mode 100644
index 0000000..a563c9a
--- /dev/null
+++ b/recipes/php/php-5.3.5/php_exec_native.patch
@@ -0,0 +1,11 @@
+--- php/configure.in.orig	2011-03-12 02:13:19.000000000 +0100
++++ php/configure.in	2011-03-12 02:14:05.000000000 +0100
+@@ -1216,7 +1216,7 @@
+   PHP_INSTALL_CLI_TARGET="install-cli"
+   PHP_ADD_SOURCES(sapi/cli, php_cli.c php_cli_readline.c,, cli)
+   PHP_INSTALLED_SAPIS="cli $PHP_SAPI"
+-  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
++  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
+ else
+   PHP_INSTALLED_SAPIS="$PHP_SAPI"
+ fi
diff --git a/recipes/php/php-native_5.3.5.bb b/recipes/php/php-native_5.3.5.bb
new file mode 100644
index 0000000..3d4f2be
--- /dev/null
+++ b/recipes/php/php-native_5.3.5.bb
@@ -0,0 +1,11 @@
+require php-native.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI =     "http://downloads.php.net/johannes/php-${PV}.tar.gz;name=src \
+               file://acinclude-xml2-config.patch \
+               file://php-m4-divert.patch \
+              "
+
+SRC_URI[src.md5sum] = "fb727a3ac72bf0ce37e1a20468a7bb81"
+SRC_URI[src.sha256sum] = "95474df979efbf2b1a298998fe9954200f59048681817a97eb18415346fb6ca4"
diff --git a/recipes/php/php_5.3.5.bb b/recipes/php/php_5.3.5.bb
new file mode 100644
index 0000000..23be66c
--- /dev/null
+++ b/recipes/php/php_5.3.5.bb
@@ -0,0 +1,108 @@
+require php.inc
+
+DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
+           libc-client openssl"
+
+PR = "${INC_PR}.0"
+
+SRC_URI =     "http://downloads.php.net/johannes/php-${PV}.tar.gz;name=src \
+               file://acinclude-xml2-config.patch \
+               file://php-m4-divert.patch \
+               file://iconv.patch \
+               file://imap-fix-autofoo.patch \
+	       file://pear-makefile.patch \
+               file://phar-makefile.patch \
+               file://php_exec_native.patch \
+              "
+
+SRC_URI[src.md5sum] = "fb727a3ac72bf0ce37e1a20468a7bb81"
+SRC_URI[src.sha256sum] = "95474df979efbf2b1a298998fe9954200f59048681817a97eb18415346fb6ca4"
+
+export THREADS="pthread"
+export LIBS=" -lpthread "
+
+EXTRA_OECONF = "    --enable-mbstring \
+                    --enable-discard-path \
+                    --enable-sockets \
+                    --enable-shared \
+                    --enable-pcntl \
+                    --enable-wddx \
+                    --disable-embedded-mysqli \
+                    --disable-rpath \
+                    --enable-magic-quotes \
+                    --enable-fastcgi \
+                    --with-imap=${STAGING_DIR_HOST} \
+                    --with-imap-ssl=${STAGING_DIR_HOST} \
+                    --with-zlib --with-zlib-dir=${STAGING_LIBDIR}/.. \
+                    --with-iconv=${STAGING_LIBDIR}/.. \
+                    --with-libxml-dir=${STAGING_BINDIR_CROSS} \
+                    --with-mysql="${STAGING_DIR_TARGET}${layout_exec_prefix}" \
+                    --with-mysqli="${STAGING_BINDIR_CROSS}/mysql_config" \
+                    --with-pdo-mysql="${STAGING_BINDIR_CROSS}/mysql_config" \
+                    --without-pdo-sqlite \
+               "
+
+export LD_LIBRARY_PATH = "${STAGING_LIBDIR}"
+export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
+export PHP_PEAR_PHP_BIN = "${bindir}/php"
+
+#LDFLAGS += "-lstdc++"
+
+do_configure_append() {
+    find ${S} -type f -readable -writable | xargs sed -i 's:I/usr/include:I${STAGING_INCDIR}:g'
+    # use same fix as libiconv
+    sed -i -e  s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ \
+           -e s/^runpath_var/#runpath_var/ ${S}/*-libtool
+}
+
+# fixme
+do_install_append() {
+    mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ${D}/${sysconfdir}
+    rm -rf ${D}/${STAGING_DIR_NATIVE}
+    rm -rf ${D}/.registry
+    rm -rf ${D}/.channels
+    rm -rf ${D}/.[a-z]*
+    sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
+}
+
+PACKAGES = "${PN}-dbg \
+            ${PN}-cli \
+            ${PN}-cgi \
+            ${PN}-pear \
+            ${PN}-dev \
+            ${PN}-doc \
+            ${PN} \
+"
+
+
+FILES_${PN}-dbg            =+ "${bindir}/.debug"
+
+FILES_${PN}-doc            += "${libdir}/php/doc" 
+
+FILES_${PN}-cli            = "${bindir}/php"
+FILES_${PN}-cgi            = "${bindir}/php-cgi"
+
+FILES_${PN}-pear            = "${bindir}/pear* ${bindir}/pecl \
+                             ${libdir}/php/PEAR \
+                             ${libdir}/php/PEAR.php \
+                             ${libdir}/php/System.php ${libdir}php/peclcmd.php ${libdir}/php/pearcmd.php \
+                             ${libdir}/php/.channels  ${libdir}/php/.channels/.alias  \
+                             ${libdir}/php/.channels\__uri.reg \
+                             ${libdir}/php/.channels\pear.php.net.reg ${libdir}/php/.channels/pecl.php.net.reg \
+                             ${libdir}/php/.registry \
+                             ${libdir}/php/Archive/Tar.php \
+                             ${libdir}/php/Console/Getopt.php ${libdir}/php/OS/Guess.php \
+                             ${sysconfdir}/pear.conf"
+
+
+FILES_${PN}-dev            = "${includedir}/php ${libdir}/build \
+                             ${bindir}/phpize ${bindir}/php-config \
+                             ${libdir}/php/.depdb ${libdir}/php/.depdblock ${libdir}/php/.filemap ${libdir}/php/.lock \
+                             ${libdir}/php/test "
+
+FILES_${PN}                 = "${libdir}/php"
+FILES_${PN}                += "${bindir}"
+
+RDEPENDS_${PN}-pear         = ${PN}
+RDEPENDS_${PN}-cli          = ${PN}
+RDEPENDS_${PN}-dev          = ${PN}
-- 
1.7.0.4



