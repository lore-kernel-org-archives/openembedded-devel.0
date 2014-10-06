Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DA5AB601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Oct 2014 09:55:13 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y10so6029312wgg.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 02:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CPxAR3aCU2uoo5reMV5qel58TxdK9QTFx1wTAl9KmfI=;
	b=fL2XRfEtOMq9HPT1/IEVziyv35U/pPIuTjaQeb9x+5Y7dclxfJkNhhrbFEbfJgoIGg
	dYKsnf9sFzeFDqe3LLshzAYWX2lab2rJqQh6BTZ7cSzhIt28DtfQpYnQ4XqwoYdpN8en
	NFjj67H9VltMGlsZn2csgBSfSWT3fIn8Zo9GtIizGEElj2mtd7k0Ez8rDqFMaV1sTKio
	Vx7uFmJig3vtWBBU1rmuniQfpdRStn3q5KVESW6m730C3BDgEGVJjQ+eH+tRGODnY7EQ
	mbJsGT4Pjye+7m3fORBRXk01zS5cg8Vubsme/UzOvfYiKjzXvsjBU/xXnFRyKiuxV9uD
	uXqg==
X-Gm-Message-State: ALoCoQmEzwrIc+Kgvybr5B22jbWabWbwcHo9d0xJKNXhrO/axYYZ45VTHWmxNAHjs62YgVVMy23Y
X-Received: by 10.180.84.98 with SMTP id x2mr18023918wiy.18.1412589314289;
	Mon, 06 Oct 2014 02:55:14 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id q2sm10758030wiy.23.2014.10.06.02.55.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 02:55:13 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Oct 2014 11:54:59 +0200
Message-Id: <1412589301-6669-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 1/3] php 5.4.14: merge .inc and .bb
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
X-List-Received-Date: Mon, 06 Oct 2014 09:55:18 -0000

There's only one version of the recipe in the repo and the split makes it harder to debug and fix problems.

Also fix target overrides and style issues.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-devtools/php/php.inc       | 132 --------------------------
 meta-oe/recipes-devtools/php/php_5.4.14.bb | 146 +++++++++++++++++++++++++++--
 2 files changed, 138 insertions(+), 140 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php.inc

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
deleted file mode 100644
index 6bdae78..0000000
--- a/meta-oe/recipes-devtools/php/php.inc
+++ /dev/null
@@ -1,132 +0,0 @@
-DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the CGI."
-HOMEPAGE = "http://www.php.net"
-SECTION = "console/network"
-LICENSE = "PHP-3.0"
-BBCLASSEXTEND = "native"
-DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
-           libc-client openssl"
-DEPENDS_virtclass-native = "zlib-native libxml2-native"
-
-INC_PR = "r5"
-
-# The new PHP downloads server groups PHP releases by major version so find
-# the major version of the PHP recipe.
-PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
-
-SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
-
-S = "${WORKDIR}/php-${PV}"
-
-inherit autotools pkgconfig pythonnative gettext
-
-SSTATE_SCAN_FILES += "build-defs.h"
-
-# Common EXTRA_OECONF
-COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
-EXTRA_OECONF = "--enable-mbstring \
-                --enable-wddx \
-                --enable-fpm \
-                --with-imap=${STAGING_DIR_HOST} \
-                --with-gettext=${STAGING_LIBDIR}/.. \
-                --with-imap-ssl=${STAGING_DIR_HOST} \
-                --with-zlib=${STAGING_LIBDIR}/.. \
-                --with-iconv=${STAGING_LIBDIR}/.. \
-                ${COMMON_EXTRA_OECONF} \
-"
-EXTRA_OECONF_virtclass-native = " \
-                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
-                --without-iconv \
-                ${COMMON_EXTRA_OECONF} \
-"
-
-PACKAGECONFIG ??= "mysql sqlite3"
-PACKAGECONFIG_class-native = ""
-
-PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
-                        --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
-                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-                        , \
-                        ,mysql5"
-
-PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
-                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
-                          , \
-                          ,sqlite3"
-
-export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-CFLAGS += " -D_GNU_SOURCE"
-
-EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
-
-acpaths = ""
-
-do_install_append_pn-php-native() {
-    rm -rf ${D}/${libdir}/php/.registry
-    rm -rf ${D}/${libdir}/php/.channels
-    rm -rf ${D}/${libdir}/php/.[a-z]*
-}
-
-# fixme
-do_install_append_pn-php() {
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
-}
-
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-
-RDEPENDS_${PN}-pear = "${PN}"
-RDEPENDS_${PN}-cli = "${PN}"
-RDEPENDS_${PN}-dev = "${PN}"
-
-INITSCRIPT_PACKAGES = "${PN}-fpm"
-inherit update-rc.d
-
-FILES_${PN}-dbg =+ "${bindir}/.debug"
-FILES_${PN}-doc += "${libdir}/php/doc"
-FILES_${PN}-cli = "${bindir}/php"
-FILES_${PN}-cgi = "${bindir}/php-cgi"
-FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
-FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
-CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
-INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
-FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR \
-                ${libdir}/php/PEAR.php ${libdir}/php/System.php \
-                ${libdir}php/peclcmd.php ${libdir}/php/pearcmd.php \
-                ${libdir}/php/.channels  ${libdir}/php/.channels/.alias  \
-                ${libdir}/php/.channels\__uri.reg \
-                ${libdir}/php/.channels\pear.php.net.reg \
-                ${libdir}/php/.channels/pecl.php.net.reg \
-                ${libdir}/php/.registry ${libdir}/php/Archive/Tar.php \
-                ${libdir}/php/Console/Getopt.php ${libdir}/php/OS/Guess.php \
-                ${sysconfdir}/pear.conf"
-FILES_${PN}-dev = "${includedir}/php ${libdir}/build ${bindir}/phpize \
-                ${bindir}/php-config ${libdir}/php/.depdb \
-                ${libdir}/php/.depdblock ${libdir}/php/.filemap \
-                ${libdir}/php/.lock ${libdir}/php/test"
-FILES_${PN} = "${libdir}/php"
-FILES_${PN} += "${bindir}"
diff --git a/meta-oe/recipes-devtools/php/php_5.4.14.bb b/meta-oe/recipes-devtools/php/php_5.4.14.bb
index 3c9d3c0..98a8cdc 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.14.bb
@@ -1,15 +1,29 @@
-require php.inc
+DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the CGI."
+HOMEPAGE = "http://www.php.net"
+SECTION = "console/network"
 
+LICENSE = "PHP-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
 
-PR = "${INC_PR}.0"
+BBCLASSEXTEND = "native"
+DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
+           libc-client openssl"
+DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-SRC_URI += "file://acinclude-xml2-config.patch \
-            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
-            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
-           "
+PR = "r6"
 
-SRC_URI_append_pn-php += "file://iconv.patch \
+# The new PHP downloads server groups PHP releases by major version so find
+# the major version of the PHP recipe.
+PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
+
+SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2 \
+           file://acinclude-xml2-config.patch \
+           file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
+           file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
+          "
+
+SRC_URI_append_class-target += " \
+            file://iconv.patch \
             file://imap-fix-autofoo.patch \
             file://pear-makefile.patch \
             file://phar-makefile.patch \
@@ -17,7 +31,123 @@ SRC_URI_append_pn-php += "file://iconv.patch \
             file://fix-fpm-cross-compile.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
-"
+          "
 
 SRC_URI[md5sum] = "cfdc044be2c582991a1fe0967898fa38"
 SRC_URI[sha256sum] = "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02fe4a46f9c81be20a"
+
+S = "${WORKDIR}/php-${PV}"
+
+inherit autotools pkgconfig pythonnative gettext
+
+SSTATE_SCAN_FILES += "build-defs.h"
+
+# Common EXTRA_OECONF
+COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
+EXTRA_OECONF = "--enable-mbstring \
+                --enable-wddx \
+                --enable-fpm \
+                --with-imap=${STAGING_DIR_HOST} \
+                --with-gettext=${STAGING_LIBDIR}/.. \
+                --with-imap-ssl=${STAGING_DIR_HOST} \
+                --with-zlib=${STAGING_LIBDIR}/.. \
+                --with-iconv=${STAGING_LIBDIR}/.. \
+                ${COMMON_EXTRA_OECONF} \
+"
+EXTRA_OECONF_virtclass-native = " \
+                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
+                --without-iconv \
+                ${COMMON_EXTRA_OECONF} \
+"
+
+PACKAGECONFIG ??= "mysql sqlite3"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
+                        --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
+                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
+                        , \
+                        ,mysql5"
+
+PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
+                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
+                          , \
+                          ,sqlite3"
+
+export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
+export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
+CFLAGS += " -D_GNU_SOURCE"
+
+EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
+
+acpaths = ""
+
+do_install_append_class-native() {
+    rm -rf ${D}/${libdir}/php/.registry
+    rm -rf ${D}/${libdir}/php/.channels
+    rm -rf ${D}/${libdir}/php/.[a-z]*
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
+}
+
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+
+RDEPENDS_${PN}-pear = "${PN}"
+RDEPENDS_${PN}-cli = "${PN}"
+RDEPENDS_${PN}-dev = "${PN}"
+
+INITSCRIPT_PACKAGES = "${PN}-fpm"
+inherit update-rc.d
+
+FILES_${PN}-dbg =+ "${bindir}/.debug"
+FILES_${PN}-doc += "${libdir}/php/doc"
+FILES_${PN}-cli = "${bindir}/php"
+FILES_${PN}-cgi = "${bindir}/php-cgi"
+FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
+FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
+CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
+CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
+INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
+INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
+FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR \
+                ${libdir}/php/PEAR.php ${libdir}/php/System.php \
+                ${libdir}php/peclcmd.php ${libdir}/php/pearcmd.php \
+                ${libdir}/php/.channels  ${libdir}/php/.channels/.alias  \
+                ${libdir}/php/.channels\__uri.reg \
+                ${libdir}/php/.channels\pear.php.net.reg \
+                ${libdir}/php/.channels/pecl.php.net.reg \
+                ${libdir}/php/.registry ${libdir}/php/Archive/Tar.php \
+                ${libdir}/php/Console/Getopt.php ${libdir}/php/OS/Guess.php \
+                ${sysconfdir}/pear.conf"
+FILES_${PN}-dev = "${includedir}/php ${libdir}/build ${bindir}/phpize \
+                ${bindir}/php-config ${libdir}/php/.depdb \
+                ${libdir}/php/.depdblock ${libdir}/php/.filemap \
+                ${libdir}/php/.lock ${libdir}/php/test"
+FILES_${PN} = "${libdir}/php"
+FILES_${PN} += "${bindir}"
-- 
1.9.3


