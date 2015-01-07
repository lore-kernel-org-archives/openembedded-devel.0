Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0B3729BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 11:53:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2015 03:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="437492564"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jan 2015 03:41:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 11:53:25 +0000
Message-Id: <1420631605-28970-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <ea7b1f497731a701108d74384a3ca585690ddcc5.1420453688.git.paul.eggleton@linux.intel.com>
References: <ea7b1f497731a701108d74384a3ca585690ddcc5.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v3] php: upgrade to 5.5.15
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
X-List-Received-Date: Wed, 07 Jan 2015 11:53:41 -0000

Based on the corresponding changes to the modphp recipe in
meta-webserver. From the commit message for the modphp upgrade:

* LIC_FILES_CHKSUM needed to change because the copyright year changed
* Enabled mcrypt since upstream recommend this for acceptable
  performance
* Disabled the opcache; this is a new feature in 5.5 and the configure
  check for it currently breaks when cross-compiling.

Also fix an issue with the "phar" script which ended up with a shebang
pointing into the workdir on the host.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/php/{php_5.4.33.bb => php_5.5.15.bb}    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.5.15.bb} (93%)

diff --git a/meta-oe/recipes-devtools/php/php_5.4.33.bb b/meta-oe/recipes-devtools/php/php_5.5.15.bb
similarity index 93%
rename from meta-oe/recipes-devtools/php/php_5.4.33.bb
rename to meta-oe/recipes-devtools/php/php_5.5.15.bb
index 6fdfe0f..1031127 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.33.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.15.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
-           libc-client openssl"
+           libc-client openssl libmcrypt"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
 # The new PHP downloads server groups PHP releases by major version so find
@@ -30,8 +30,8 @@ SRC_URI_append_class-target += " \
             file://php-fpm-apache.conf \
           "
 
-SRC_URI[md5sum] = "c6878bb1cdb46bfc1e1a5cd67a024737"
-SRC_URI[sha256sum] = "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d19b74c2278e40bb5"
+SRC_URI[md5sum] = "5cb5f2ed9099299f8a4c952d59d93812"
+SRC_URI[sha256sum] = "00f24226b12fee27e332383b6304f1b9ed3f4d9173dd728a68c5c3f5a59b8ba7"
 
 S = "${WORKDIR}/php-${PV}"
 
@@ -40,7 +40,7 @@ inherit autotools pkgconfig pythonnative gettext
 SSTATE_SCAN_FILES += "build-defs.h"
 
 # Common EXTRA_OECONF
-COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
+COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared --disable-opcache"
 EXTRA_OECONF = "--enable-mbstring \
                 --enable-wddx \
                 --enable-fpm \
@@ -49,6 +49,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-imap-ssl=${STAGING_DIR_HOST} \
                 --with-zlib=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
+                --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
                 ${COMMON_EXTRA_OECONF} \
 "
 EXTRA_OECONF_virtclass-native = " \
@@ -111,6 +112,7 @@ do_install_append_class-target() {
         rmdir ${TMP}
         TMP=`dirname ${TMP}`;
     done
+    sed -i 's:^#!/.*/php:#!${bindir}/php:' ${D}${bindir}/phar.phar
 }
 
 PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-- 
1.9.3


