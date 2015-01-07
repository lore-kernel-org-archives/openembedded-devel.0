Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E89B9729BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825730"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:18 +0000
Message-Id: <899071d7f6010f53e72116d872ef2d3a80553509.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v4 03/13] php: integrate modphp
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
X-List-Received-Date: Wed, 07 Jan 2015 14:50:43 -0000

Build the mod_php Apache module within the main php recipe; this avoids
files in the sysroot from stepping on eachother and therefore avoids the
resulting build failure.

Changes made:
* Add an "apache2" PACKAGECONFIG, default disabled. This means that if
  you previously used the modphp recipe you now need to set
  PACKAGECONFIG for php to include "apache2".
* Bring in most patches and configure options from the modphp recipe.
* Specify ${libdir}/php5 as libdir. This avoids the PHP extensions
  directory being /usr/lib/extensions by default which is ugly.
* Tidy up some superfluous/malformed entries in FILES_${PN}-pear
* Drop obsolete PHP_MAJVER
* Replace virtclass- override with class-

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/php/php/70_mod_php5.conf  |  12 ++
 meta-oe/recipes-devtools/php/php/configure.patch   |  11 ++
 .../php/php/pthread-check-threads-m4.patch         |  30 +++++
 meta-oe/recipes-devtools/php/php_5.5.15.bb         | 142 ++++++++++++++++-----
 4 files changed, 163 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/70_mod_php5.conf
 create mode 100644 meta-oe/recipes-devtools/php/php/configure.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch

diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php5.conf b/meta-oe/recipes-devtools/php/php/70_mod_php5.conf
new file mode 100644
index 0000000..1de6fb1
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/70_mod_php5.conf
@@ -0,0 +1,12 @@
+# vim: ft=apache sw=4 ts=4
+<IfDefine PHP5>
+	# Load the module first
+	<IfModule !sapi_apache2.c>
+		LoadModule php5_module    lib/apache2/modules/libphp5.so
+	</IfModule>
+
+	# Set it to handle the files
+	AddHandler php5-script .php .phtml .php3 .php4 .php5
+	AddType application/x-httpd-php-source .phps
+	DirectoryIndex index.html index.html.var index.php index.phtml
+</IfDefine>
diff --git a/meta-oe/recipes-devtools/php/php/configure.patch b/meta-oe/recipes-devtools/php/php/configure.patch
new file mode 100644
index 0000000..c5334c7
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/configure.patch
@@ -0,0 +1,11 @@
+--- php-5.1.6/configure.old	2006-09-12 07:54:14.000000000 -0700
++++ php-5.1.6/configure	2006-09-12 07:54:37.000000000 -0700
+@@ -14715,8 +14715,6 @@
+ 
+ 
+ 
+-  unset ac_cv_func_dlopen
+-  unset ac_cv_func___dlopen
+   unset found
+   
+   echo $ac_n "checking for dlopen""... $ac_c" 1>&6
diff --git a/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
new file mode 100644
index 0000000..0c564cd
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/pthread-check-threads-m4.patch
@@ -0,0 +1,30 @@
+From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 8 Apr 2013 14:29:51 +0800
+Subject: [PATCH] pthread-check
+
+Enable pthreads support when cross-compiling
+
+Upstream-Status: Inapproprate [config]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ TSRM/threads.m4 |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
+index 38494ce..15d9454 100644
+--- a/TSRM/threads.m4
++++ b/TSRM/threads.m4
+@@ -86,7 +86,7 @@ int main() {
+   pthreads_working=no
+   ], [
+   dnl For cross compiling running this test is of no use. NetWare supports pthreads
+-  pthreads_working=no
++  pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-devtools/php/php_5.5.15.bb b/meta-oe/recipes-devtools/php/php_5.5.15.bb
index ff81aee..1e53a32 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.15.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.15.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the CGI."
+SUMMARY = "A server-side, HTML-embedded scripting language"
 HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
@@ -6,13 +6,9 @@ LICENSE = "PHP-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
 BBCLASSEXTEND = "native"
-DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
-           libc-client openssl libmcrypt"
-DEPENDS_virtclass-native = "zlib-native libxml2-native"
-
-# The new PHP downloads server groups PHP releases by major version so find
-# the major version of the PHP recipe.
-PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
+DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
+           uw-imap openssl libmcrypt"
+DEPENDS_class-native = "zlib-native libxml2-native"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://acinclude-xml2-config.patch \
@@ -28,6 +24,9 @@ SRC_URI_append_class-target += " \
             file://php_exec_native.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
+            file://configure.patch \
+            file://pthread-check-threads-m4.patch \
+            file://70_mod_php5.conf \
           "
 
 SRC_URI[md5sum] = "5cb5f2ed9099299f8a4c952d59d93812"
@@ -37,22 +36,38 @@ S = "${WORKDIR}/php-${PV}"
 
 inherit autotools pkgconfig pythonnative gettext
 
+# phpize is not scanned for absolute paths by default (but php-config is).
+#
+SSTATE_SCAN_FILES += "phpize"
 SSTATE_SCAN_FILES += "build-defs.h"
 
+PHP_LIBDIR = "${libdir}/php5"
+
 # Common EXTRA_OECONF
-COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared --disable-opcache"
+COMMON_EXTRA_OECONF = "--enable-sockets \
+                       --enable-pcntl \
+                       --enable-shared \
+                       --disable-opcache \
+                       --disable-rpath \
+                       --with-pic \
+                       --libdir=${PHP_LIBDIR} \
+"
 EXTRA_OECONF = "--enable-mbstring \
                 --enable-wddx \
                 --enable-fpm \
+                --enable-zip \
                 --with-imap=${STAGING_DIR_HOST} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
                 --with-imap-ssl=${STAGING_DIR_HOST} \
                 --with-zlib=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-config-file-path=${sysconfdir}/php/apache2-php5 \
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
                 ${COMMON_EXTRA_OECONF} \
 "
-EXTRA_OECONF_virtclass-native = " \
+EXTRA_OECONF_class-native = " \
                 --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
                 --without-iconv \
                 ${COMMON_EXTRA_OECONF} \
@@ -64,26 +79,54 @@ PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
                         --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-                        , \
+                        ,--without-mysql --without-mysqli --without-pdo-mysql \
                         ,mysql5"
 
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
                           , \
                           ,sqlite3"
+PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
+PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
+PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
+
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-CFLAGS += " -D_GNU_SOURCE"
+CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
 acpaths = ""
 
+do_configure_prepend () {
+    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
+    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
+}
+
+do_configure_append() {
+    # No, libtool, we really don't want rpath set...
+    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
+    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
+}
+
 do_install_append_class-native() {
-    rm -rf ${D}/${libdir}/php/.registry
-    rm -rf ${D}/${libdir}/php/.channels
-    rm -rf ${D}/${libdir}/php/.[a-z]*
+    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
+    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
+    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
+}
+
+do_install_prepend() {
+    cat aclocal-copy/libtool.m4 aclocal-copy/lt~obsolete.m4 aclocal-copy/ltoptions.m4 \
+        aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > ${S}/build/libtool.m4
+}
+
+do_install_prepend_class-target() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
+        # Install dummy config file so apxs doesn't fail
+        install -d ${D}${sysconfdir}/apache2
+        printf "\nLoadModule dummy_module modules/mod_dummy.so\n" > ${D}${sysconfdir}/apache2/httpd.conf
+    fi
 }
 
 # fixme
@@ -112,19 +155,47 @@ do_install_append_class-target() {
         rmdir ${TMP}
         TMP=`dirname ${TMP}`;
     done
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
+        install -d ${D}${libdir}/apache2/modules
+        install -d ${D}${sysconfdir}/apache2/modules.d
+        install -d ${D}${sysconfdir}/php/apache2-php5
+        install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
+        install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
+        sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php5.conf
+        cat ${S}/php.ini-production | \
+            sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
+            > ${D}${sysconfdir}/php/apache2-php5/php.ini
+        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
+    fi
 }
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
+
+php_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+
+    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
+    sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
+}
+
+MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
+
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
 RDEPENDS_${PN}-pear = "${PN}"
 RDEPENDS_${PN}-cli = "${PN}"
+RDEPENDS_${PN}-modphp = "${PN} apache2"
 RDEPENDS_${PN}-dev = "${PN}"
 
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
-FILES_${PN}-dbg =+ "${bindir}/.debug"
-FILES_${PN}-doc += "${libdir}/php/doc"
+FILES_${PN}-dbg =+ "${bindir}/.debug \
+                    ${libdir}/apache2/modules/.debug"
+FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
 FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
@@ -133,19 +204,26 @@ CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
 CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
 INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
-FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR \
-                ${libdir}/php/PEAR.php ${libdir}/php/System.php \
-                ${libdir}php/peclcmd.php ${libdir}/php/pearcmd.php \
-                ${libdir}/php/.channels  ${libdir}/php/.channels/.alias  \
-                ${libdir}/php/.channels\__uri.reg \
-                ${libdir}/php/.channels\pear.php.net.reg \
-                ${libdir}/php/.channels/pecl.php.net.reg \
-                ${libdir}/php/.registry ${libdir}/php/Archive/Tar.php \
-                ${libdir}/php/Console/Getopt.php ${libdir}/php/OS/Guess.php \
+FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/PEAR \
+                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php \
+                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.php \
+                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.alias \
+                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar.php \
+                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS/Guess.php \
+                ${PHP_LIBDIR}/php/data/PEAR \
                 ${sysconfdir}/pear.conf"
-FILES_${PN}-dev = "${includedir}/php ${libdir}/build ${bindir}/phpize \
-                ${bindir}/php-config ${libdir}/php/.depdb \
-                ${libdir}/php/.depdblock ${libdir}/php/.filemap \
-                ${libdir}/php/.lock ${libdir}/php/test"
-FILES_${PN} = "${libdir}/php"
+FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
+                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
+                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
+                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
+FILES_${PN} = "${PHP_LIBDIR}/php"
 FILES_${PN} += "${bindir}"
+
+SUMMARY_${PN}-modphp = "PHP module for the Apache HTTP server"
+FILES_${PN}-modphp = "${libdir}/apache2 ${sysconfdir}"
+
+MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp', '', d)}"
+RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
+
-- 
1.9.3


