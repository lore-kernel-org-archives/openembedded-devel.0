Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A25B665CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:33:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K8XTmB026426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 01:33:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 20 Aug 2015 01:33:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Aug 2015 16:29:35 +0800
Message-ID: <1440059375-24661-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: create recipe for 5.6.12
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
X-List-Received-Date: Thu, 20 Aug 2015 08:33:31 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The difference between 5.6.x and 5.5.x is in http://php.net/migration56
Most improvements in PHP 5.6.x have no impact on existing code.
There are a few incompatibilities and new features that should be
considered, and code should be tested before switching PHP versions
in production environments.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |  56 +++++
 meta-oe/recipes-devtools/php/php.inc               | 271 ++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.5.26.bb         | 273 +--------------------
 meta-oe/recipes-devtools/php/php_5.6.12.bb         |   5 +
 4 files changed, 333 insertions(+), 272 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
 create mode 100644 meta-oe/recipes-devtools/php/php.inc
 create mode 100644 meta-oe/recipes-devtools/php/php_5.6.12.bb

diff --git a/meta-oe/recipes-devtools/php/php-5.6.12/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.12/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
new file mode 100644
index 0000000..39c334f
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-5.6.12/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
@@ -0,0 +1,56 @@
+[PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
+
+Upstream-Status: Pending
+
+AC_TRY_RUN is not suitable for cross-compile
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ ext/fileinfo/config.m4 | 31 ++++++-------------------------
+ 1 file changed, 6 insertions(+), 25 deletions(-)
+
+diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
+index 7e98d62..8a8ea0e 100644
+--- a/ext/fileinfo/config.m4
++++ b/ext/fileinfo/config.m4
+@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" != "no"; then
+     libmagic/readcdf.c libmagic/softmagic.c"
+ 
+   AC_MSG_CHECKING([for strcasestr])
+-  AC_TRY_RUN([
+-#include <string.h>
+-#include <strings.h>
+-#include <stdlib.h>
+-
+-int main(void)
+-{
+-        char *s0, *s1, *ret;
+-
+-        s0 = (char *) malloc(42);
+-        s1 = (char *) malloc(8);
+-
+-        memset(s0, 'X', 42);
+-        s0[24] = 'Y';
+-        s0[26] = 'Z';
+-        s0[41] = '\0';
+-        memset(s1, 'x', 8);
+-        s1[0] = 'y';
+-        s1[2] = 'Z';
+-        s1[7] = '\0';
+-
+-        ret = strcasestr(s0, s1);
+-
+-        return !(NULL != ret);
+-}
++  AC_TRY_COMPILE([
++     #include <string.h>
++     #include <strings.h>
++     #include <stdlib.h>
++  ],[
++     strcasestr(NULL, NULL);
+   ],[
+     dnl using the platform implementation
+     AC_MSG_RESULT(yes)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
new file mode 100644
index 0000000..67d2362
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -0,0 +1,271 @@
+SUMMARY = "A server-side, HTML-embedded scripting language"
+HOMEPAGE = "http://www.php.net"
+SECTION = "console/network"
+
+LICENSE = "PHP-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
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
+            file://php-fpm.service \
+          "
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
+                --with-libdir=${baselib} \
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
+CFLAGS_append_aarch64 = " -O2"
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
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+            ${D}${systemd_unitdir}/system/php-fpm.service
+    fi
+
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
+FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service"
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
+do_install_append_class-native() {
+    create_wrapper ${D}${bindir}/php \
+        PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
+}
+
+SSTATEPOSTINSTFUNCS_append_class-native = " php_sstate_postinst "
+
+php_sstate_postinst() {
+    if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+    then
+        head -n1 ${sysconfdir}/pear.conf > ${sysconfdir}/pear.tmp.conf
+        for p in `tail -n1  ${sysconfdir}/pear.conf | sed -s 's/;/ /g'`; do
+            echo $p | awk -F: 'BEGIN {OFS = ":"; ORS = ";"}{if(NF==3){print $1, length($3)-2*match($3, /^"/), $3} else {print $0}}';
+        done >> ${sysconfdir}/pear.tmp.conf
+        mv -f ${sysconfdir}/pear.tmp.conf ${sysconfdir}/pear.conf
+    fi
+}
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
+# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
+# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
+# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
+# | make: *** [ext/standard/math.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-devtools/php/php_5.5.26.bb b/meta-oe/recipes-devtools/php/php_5.5.26.bb
index 85fdccb..deaf145 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.26.bb
@@ -1,275 +1,4 @@
-SUMMARY = "A server-side, HTML-embedded scripting language"
-HOMEPAGE = "http://www.php.net"
-SECTION = "console/network"
-
-LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
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
-            file://php-fpm.service \
-          "
+require php.inc
 
 SRC_URI[md5sum] = "383a4b35327809afd2822e1e5efc8ee1"
 SRC_URI[sha256sum] = "816afffdb03ff4c542bc172a2f77f9c69b817df82d60cce05c1b4f578c2c926e"
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
-                --with-libdir=${baselib} \
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
-CFLAGS_append_aarch64 = " -O2"
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
-    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/system/
-        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
-            ${D}${systemd_unitdir}/system/php-fpm.service
-    fi
-
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
-FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service"
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
-do_install_append_class-native() {
-    create_wrapper ${D}${bindir}/php \
-        PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
-}
-
-SSTATEPOSTINSTFUNCS_append_class-native = " php_sstate_postinst "
-
-php_sstate_postinst() {
-    if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-    then
-        head -n1 ${sysconfdir}/pear.conf > ${sysconfdir}/pear.tmp.conf
-        for p in `tail -n1  ${sysconfdir}/pear.conf | sed -s 's/;/ /g'`; do
-            echo $p | awk -F: 'BEGIN {OFS = ":"; ORS = ";"}{if(NF==3){print $1, length($3)-2*match($3, /^"/), $3} else {print $0}}';
-        done >> ${sysconfdir}/pear.tmp.conf
-        mv -f ${sysconfdir}/pear.tmp.conf ${sysconfdir}/pear.conf
-    fi
-}
-
-# Fails to build with thumb-1 (qemuarm)
-# | {standard input}: Assembler messages:
-# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
-# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
-# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
-# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
-# | make: *** [ext/standard/math.lo] Error 1
-ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.12.bb b/meta-oe/recipes-devtools/php/php_5.6.12.bb
new file mode 100644
index 0000000..ba78c32
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.6.12.bb
@@ -0,0 +1,5 @@
+require php.inc
+
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
+SRC_URI[md5sum] = "4578dee9d979114610a444bee263ed9b"
+SRC_URI[sha256sum] = "6f27104272af7b2a996f85e4100fac627630fbdaf39d7bd263f16cf529c8853a"
-- 
1.9.1


