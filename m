Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA1160024
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Feb 2015 05:25:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57028537"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Feb 2015 13:21:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t135OJDA016318
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Feb 2015 13:24:19 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 3 Feb 2015 13:25:03 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Feb 2015 13:20:16 +0800
Message-ID: <1422940816-42071-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] php: update to 5.5.21 to fix some bugs.
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
X-List-Received-Date: Tue, 03 Feb 2015 05:25:12 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/php_5.5.20.bb | 236 -----------------------------
 meta-oe/recipes-devtools/php/php_5.5.21.bb | 236 +++++++++++++++++++++++++++++
 2 files changed, 236 insertions(+), 236 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.20.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.5.21.bb

diff --git a/meta-oe/recipes-devtools/php/php_5.5.20.bb b/meta-oe/recipes-devtools/php/php_5.5.20.bb
deleted file mode 100644
index 1c0557f..0000000
--- a/meta-oe/recipes-devtools/php/php_5.5.20.bb
+++ /dev/null
@@ -1,236 +0,0 @@
-SUMMARY = "A server-side, HTML-embedded scripting language"
-HOMEPAGE = "http://www.php.net"
-SECTION = "console/network"
-
-LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
-
-BBCLASSEXTEND = "native"
-DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
-           openssl libmcrypt"
-DEPENDS_class-native = "zlib-native libxml2-native"
-
-SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
-           file://acinclude-xml2-config.patch \
-           file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
-           file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
-          "
-
-SRC_URI_append_class-target += " \
-            file://iconv.patch \
-            file://imap-fix-autofoo.patch \
-            file://pear-makefile.patch \
-            file://phar-makefile.patch \
-            file://php_exec_native.patch \
-            file://php-fpm.conf \
-            file://php-fpm-apache.conf \
-            file://configure.patch \
-            file://pthread-check-threads-m4.patch \
-            file://70_mod_php5.conf \
-          "
-
-SRC_URI[md5sum] = "9dfc1d4d2b44fb7e2b4ee9651d032203"
-SRC_URI[sha256sum] = "f28a150d1cd8991bd1a41dce4fdff4e343d1dbe01a48b9b44bea74532ce0391a"
-
-S = "${WORKDIR}/php-${PV}"
-
-inherit autotools pkgconfig pythonnative gettext
-
-# phpize is not scanned for absolute paths by default (but php-config is).
-#
-SSTATE_SCAN_FILES += "phpize"
-SSTATE_SCAN_FILES += "build-defs.h"
-
-PHP_LIBDIR = "${libdir}/php5"
-
-# Common EXTRA_OECONF
-COMMON_EXTRA_OECONF = "--enable-sockets \
-                       --enable-pcntl \
-                       --enable-shared \
-                       --disable-opcache \
-                       --disable-rpath \
-                       --with-pic \
-                       --libdir=${PHP_LIBDIR} \
-"
-EXTRA_OECONF = "--enable-mbstring \
-                --enable-wddx \
-                --enable-fpm \
-                --enable-zip \
-                --with-gettext=${STAGING_LIBDIR}/.. \
-                --with-zlib=${STAGING_LIBDIR}/.. \
-                --with-iconv=${STAGING_LIBDIR}/.. \
-                --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
-                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
-                --with-config-file-path=${sysconfdir}/php/apache2-php5 \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
-                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
-                ${COMMON_EXTRA_OECONF} \
-"
-EXTRA_OECONF_class-native = " \
-                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
-                --without-iconv \
-                ${COMMON_EXTRA_OECONF} \
-"
-
-PACKAGECONFIG ??= "mysql sqlite3 imap \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
-PACKAGECONFIG_class-native = ""
-
-PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
-                        --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
-                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-                        ,--without-mysql --without-mysqli --without-pdo-mysql \
-                        ,mysql5"
-
-PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
-                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
-                          , \
-                          ,sqlite3"
-PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
-PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
-PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
-PACKAGECONFIG[pam] = ",,libpam"
-PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
-                       --with-imap-ssl=${STAGING_DIR_HOST} \
-                       ,--without-imap --without-imap-ssl \
-                       ,uw-imap"
-
-
-export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
-
-EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
-
-acpaths = ""
-
-do_configure_prepend () {
-    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
-    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
-}
-
-do_configure_append() {
-    # No, libtool, we really don't want rpath set...
-    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
-    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
-}
-
-do_install_append_class-native() {
-    rm -rf ${D}/${PHP_LIBDIR}/php/.registry
-    rm -rf ${D}/${PHP_LIBDIR}/php/.channels
-    rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
-}
-
-do_install_prepend() {
-    cat aclocal-copy/libtool.m4 aclocal-copy/lt~obsolete.m4 aclocal-copy/ltoptions.m4 \
-        aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > ${S}/build/libtool.m4
-}
-
-do_install_prepend_class-target() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
-        # Install dummy config file so apxs doesn't fail
-        install -d ${D}${sysconfdir}/apache2
-        printf "\nLoadModule dummy_module modules/mod_dummy.so\n" > ${D}${sysconfdir}/apache2/httpd.conf
-    fi
-}
-
-# fixme
-do_install_append_class-target() {
-    install -d ${D}/${sysconfdir}/
-    if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
-         mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
-    fi
-    rm -rf ${D}/${TMPDIR}
-    rm -rf ${D}/.registry
-    rm -rf ${D}/.channels
-    rm -rf ${D}/.[a-z]*
-    rm -rf ${D}/var
-    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
-    sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
-    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
-    install -d ${D}/${sysconfdir}/apache2/conf.d
-    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
-    install -d ${D}${sysconfdir}/init.d
-    sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
-    sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
-    sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
-    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
-    TMP=`dirname ${D}/${TMPDIR}`
-    while test ${TMP} != ${D}; do
-        rmdir ${TMP}
-        TMP=`dirname ${TMP}`;
-    done
-
-    if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
-        install -d ${D}${libdir}/apache2/modules
-        install -d ${D}${sysconfdir}/apache2/modules.d
-        install -d ${D}${sysconfdir}/php/apache2-php5
-        install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
-        install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
-        sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php5.conf
-        cat ${S}/php.ini-production | \
-            sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
-            > ${D}${sysconfdir}/php/apache2-php5/php.ini
-        rm -f ${D}${sysconfdir}/apache2/httpd.conf*
-    fi
-}
-
-SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
-
-php_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-
-    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
-    sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
-}
-
-MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
-
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-
-RDEPENDS_${PN}-pear = "${PN}"
-RDEPENDS_${PN}-phar = "${PN}-cli"
-RDEPENDS_${PN}-cli = "${PN}"
-RDEPENDS_${PN}-modphp = "${PN} apache2"
-RDEPENDS_${PN}-dev = "${PN}"
-
-INITSCRIPT_PACKAGES = "${PN}-fpm"
-inherit update-rc.d
-
-FILES_${PN}-dbg =+ "${bindir}/.debug \
-                    ${libdir}/apache2/modules/.debug"
-FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
-FILES_${PN}-cli = "${bindir}/php"
-FILES_${PN}-phar = "${bindir}/phar*"
-FILES_${PN}-cgi = "${bindir}/php-cgi"
-FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
-FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
-CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
-INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
-FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/PEAR \
-                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php \
-                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.php \
-                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.alias \
-                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar.php \
-                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS/Guess.php \
-                ${PHP_LIBDIR}/php/data/PEAR \
-                ${sysconfdir}/pear.conf"
-FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
-                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
-                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
-                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
-FILES_${PN} = "${PHP_LIBDIR}/php"
-FILES_${PN} += "${bindir}"
-
-SUMMARY_${PN}-modphp = "PHP module for the Apache HTTP server"
-FILES_${PN}-modphp = "${libdir}/apache2 ${sysconfdir}"
-
-MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp', '', d)}"
-RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
-RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
-RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
-
diff --git a/meta-oe/recipes-devtools/php/php_5.5.21.bb b/meta-oe/recipes-devtools/php/php_5.5.21.bb
new file mode 100644
index 0000000..08f6c35
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.5.21.bb
@@ -0,0 +1,236 @@
+SUMMARY = "A server-side, HTML-embedded scripting language"
+HOMEPAGE = "http://www.php.net"
+SECTION = "console/network"
+
+LICENSE = "PHP-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
+
+BBCLASSEXTEND = "native"
+DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
+           openssl libmcrypt"
+DEPENDS_class-native = "zlib-native libxml2-native"
+
+SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
+           file://acinclude-xml2-config.patch \
+           file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
+           file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
+          "
+
+SRC_URI_append_class-target += " \
+            file://iconv.patch \
+            file://imap-fix-autofoo.patch \
+            file://pear-makefile.patch \
+            file://phar-makefile.patch \
+            file://php_exec_native.patch \
+            file://php-fpm.conf \
+            file://php-fpm-apache.conf \
+            file://configure.patch \
+            file://pthread-check-threads-m4.patch \
+            file://70_mod_php5.conf \
+          "
+
+SRC_URI[md5sum] = "8fe631ac52a3df9d6429faad81cf2562"
+SRC_URI[sha256sum] = "62e9429975c4ca5d7067a5052d5388fbf2ac8c51eeee581d59b04cc5a8da83fe"
+
+S = "${WORKDIR}/php-${PV}"
+
+inherit autotools pkgconfig pythonnative gettext
+
+# phpize is not scanned for absolute paths by default (but php-config is).
+#
+SSTATE_SCAN_FILES += "phpize"
+SSTATE_SCAN_FILES += "build-defs.h"
+
+PHP_LIBDIR = "${libdir}/php5"
+
+# Common EXTRA_OECONF
+COMMON_EXTRA_OECONF = "--enable-sockets \
+                       --enable-pcntl \
+                       --enable-shared \
+                       --disable-opcache \
+                       --disable-rpath \
+                       --with-pic \
+                       --libdir=${PHP_LIBDIR} \
+"
+EXTRA_OECONF = "--enable-mbstring \
+                --enable-wddx \
+                --enable-fpm \
+                --enable-zip \
+                --with-gettext=${STAGING_LIBDIR}/.. \
+                --with-zlib=${STAGING_LIBDIR}/.. \
+                --with-iconv=${STAGING_LIBDIR}/.. \
+                --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-config-file-path=${sysconfdir}/php/apache2-php5 \
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
+                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
+                ${COMMON_EXTRA_OECONF} \
+"
+EXTRA_OECONF_class-native = " \
+                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
+                --without-iconv \
+                ${COMMON_EXTRA_OECONF} \
+"
+
+PACKAGECONFIG ??= "mysql sqlite3 imap \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
+                        --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
+                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
+                        ,--without-mysql --without-mysqli --without-pdo-mysql \
+                        ,mysql5"
+
+PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
+                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
+                          , \
+                          ,sqlite3"
+PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
+PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
+PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
+PACKAGECONFIG[pam] = ",,libpam"
+PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
+                       --with-imap-ssl=${STAGING_DIR_HOST} \
+                       ,--without-imap --without-imap-ssl \
+                       ,uw-imap"
+
+
+export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
+export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
+CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
+
+EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
+
+acpaths = ""
+
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
+do_install_append_class-native() {
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
+}
+
+# fixme
+do_install_append_class-target() {
+    install -d ${D}/${sysconfdir}/
+    if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
+         mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
+    fi
+    rm -rf ${D}/${TMPDIR}
+    rm -rf ${D}/.registry
+    rm -rf ${D}/.channels
+    rm -rf ${D}/.[a-z]*
+    rm -rf ${D}/var
+    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
+    sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
+    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
+    install -d ${D}/${sysconfdir}/apache2/conf.d
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+    install -d ${D}${sysconfdir}/init.d
+    sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
+    install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
+    TMP=`dirname ${D}/${TMPDIR}`
+    while test ${TMP} != ${D}; do
+        rmdir ${TMP}
+        TMP=`dirname ${TMP}`;
+    done
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
+}
+
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
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+
+RDEPENDS_${PN}-pear = "${PN}"
+RDEPENDS_${PN}-phar = "${PN}-cli"
+RDEPENDS_${PN}-cli = "${PN}"
+RDEPENDS_${PN}-modphp = "${PN} apache2"
+RDEPENDS_${PN}-dev = "${PN}"
+
+INITSCRIPT_PACKAGES = "${PN}-fpm"
+inherit update-rc.d
+
+FILES_${PN}-dbg =+ "${bindir}/.debug \
+                    ${libdir}/apache2/modules/.debug"
+FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
+FILES_${PN}-cli = "${bindir}/php"
+FILES_${PN}-phar = "${bindir}/phar*"
+FILES_${PN}-cgi = "${bindir}/php-cgi"
+FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
+FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
+CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
+CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
+INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
+INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
+FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${PHP_LIBDIR}/php/PEAR \
+                ${PHP_LIBDIR}/php/PEAR*.php ${PHP_LIBDIR}/php/System.php \
+                ${PHP_LIBDIR}/php/peclcmd.php ${PHP_LIBDIR}/php/pearcmd.php \
+                ${PHP_LIBDIR}/php/.channels ${PHP_LIBDIR}/php/.channels/.alias \
+                ${PHP_LIBDIR}/php/.registry ${PHP_LIBDIR}/php/Archive/Tar.php \
+                ${PHP_LIBDIR}/php/Console/Getopt.php ${PHP_LIBDIR}/php/OS/Guess.php \
+                ${PHP_LIBDIR}/php/data/PEAR \
+                ${sysconfdir}/pear.conf"
+FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
+                ${bindir}/php-config ${PHP_LIBDIR}/php/.depdb \
+                ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
+                ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
+FILES_${PN} = "${PHP_LIBDIR}/php"
+FILES_${PN} += "${bindir}"
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
1.9.1


