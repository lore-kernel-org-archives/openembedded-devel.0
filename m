Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACC5E71A1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:52:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v497qhxw024341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 May 2017 00:52:43 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 9 May 2017 00:52:42 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 May 2017 03:52:41 -0400
Message-ID: <1494316361-47734-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V3] php: fix install error for libphp*.so
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 07:52:44 -0000
Content-Type: text/plain

1. Different version php have different libphp*.so, so we need to install its
   corresponding libphp*.so, for example:

    php-7.1.0  libphp7.so
    php-5.6.26 libphp5.so

2. Fix php-5.6.26 compiling errors:

    ld: TSRM/.libs/TSRM.o: undefined reference to symbol
    'pthread_sigmask@@GLIBC_2.2.5'
    error adding symbols: DSO missing from command line

3. Create a configure script like 70_mod_php5, we name it 70_mod_php7, this
   file connect the php7 and the apache2, so they work together to let the
   LAMP works correctly.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../php/php-5.6.26/0001-Add-lpthread-to-link.patch | 38 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php.inc               | 18 +++++-----
 meta-oe/recipes-devtools/php/php/70_mod_php7.conf  |  9 +++++
 meta-oe/recipes-devtools/php/php_5.6.26.bb         |  1 +
 meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb  |  4 +--
 5 files changed, 60 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/70_mod_php7.conf

diff --git a/meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch b/meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch
new file mode 100644
index 0000000..f70e550
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch
@@ -0,0 +1,38 @@
+From ed0a954983d50267c2fc0bc13aba929ea0cad971 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 2 May 2017 06:34:40 +0000
+Subject: [PATCH] Add -lpthread to link
+
+When building the php-5.6.26, the following errors occured:
+
+    ld: TSRM/.libs/TSRM.o: undefined reference to symbol
+    'pthread_sigmask@@GLIBC_2.2.5'
+
+    error adding symbols: DSO missing from command line
+
+This is because no pthread to link, so we should add it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ configure.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index a467dff1..9afef652 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1058,7 +1058,8 @@ case $php_sapi_module in
+     ;;
+ esac
+ 
+-EXTRA_LIBS="$EXTRA_LIBS $DLIBS $LIBS"
++PTHREAD_LIBS="-lpthread"
++EXTRA_LIBS="$EXTRA_LIBS $DLIBS $LIBS $PTHREAD_LIBS"
+ 
+ dnl this has to be here to prevent the openssl crypt() from
+ dnl overriding the system provided crypt().
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index d3ec9de..0e55020 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -9,6 +9,8 @@ DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
            openssl libmcrypt"
 DEPENDS_class-native = "zlib-native libxml2-native"
 
+PHP_MAJOR_VERSION = "${@d.getVar('PV', True).split('.')[0]}"
+
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://acinclude-xml2-config.patch \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
@@ -24,7 +26,7 @@ SRC_URI_append_class-target = " \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://configure.patch \
-            file://70_mod_php5.conf \
+            file://70_mod_php${PHP_MAJOR_VERSION}.conf \
             file://php-fpm.service \
           "
 S = "${WORKDIR}/php-${PV}"
@@ -36,7 +38,7 @@ inherit autotools pkgconfig pythonnative gettext
 SSTATE_SCAN_FILES += "phpize"
 SSTATE_SCAN_FILES += "build-defs.h"
 
-PHP_LIBDIR = "${libdir}/php5"
+PHP_LIBDIR = "${libdir}/php${PHP_MAJOR_VERSION}"
 
 # Common EXTRA_OECONF
 COMMON_EXTRA_OECONF = "--enable-sockets \
@@ -57,7 +59,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
-                --with-config-file-path=${sysconfdir}/php/apache2-php5 \
+                --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
                 ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
                 ${COMMON_EXTRA_OECONF} \
@@ -175,13 +177,13 @@ do_install_append_class-target() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
         install -d ${D}${libdir}/apache2/modules
         install -d ${D}${sysconfdir}/apache2/modules.d
-        install -d ${D}${sysconfdir}/php/apache2-php5
-        install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
-        install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
-        sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php5.conf
+        install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
+        install -m 755  libs/libphp${PHP_MAJOR_VERSION}.so ${D}${libdir}/apache2/modules
+        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
+        sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
         cat ${S}/php.ini-production | \
             sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
-            > ${D}${sysconfdir}/php/apache2-php5/php.ini
+            > ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/php.ini
         rm -f ${D}${sysconfdir}/apache2/httpd.conf*
     fi
 }
diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf b/meta-oe/recipes-devtools/php/php/70_mod_php7.conf
new file mode 100644
index 0000000..d206265
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/70_mod_php7.conf
@@ -0,0 +1,9 @@
+LoadModule php7_module lib/apache2/modules/libphp7.so
+
+<FilesMatch "\.ph(p[2-7]?|tml)$">
+	SetHandler application/x-httpd-php
+</FilesMatch>
+
+<FilesMatch "\.phps$">
+	SetHandler application/x-httpd-php-source
+</FilesMatch>
diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
index ddc7ce3..dfce949 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://pthread-check-threads-m4.patch \
+            file://0001-Add-lpthread-to-link.patch \
            "
 SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
 SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
index 077bdc8..7741378 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
@@ -29,5 +29,5 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-FILES_${PN} += "${libdir}/php5/extensions/*/*.so"
-FILES_${PN}-dbg += "${libdir}/php5/extensions/*/.debug"
+FILES_${PN} += "${libdir}/php*/extensions/*/*.so"
+FILES_${PN}-dbg += "${libdir}/php*/extensions/*/.debug"
-- 
2.8.1


