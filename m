Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USTpJ-000433-5Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:59:18 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 15:41:35 +0100
Message-Id: <1366209695-4195-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1366209695-4195-1-git-send-email-ml@communistcode.co.uk>
References: <1366209695-4195-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCHv2] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Wed, 17 Apr 2013 14:59:25 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-devtools/php/php.inc | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 225c3d7..639aa01 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 LICENSE = "PHP-3.0"
 BBCLASSEXTEND = "native"
-DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
-           libc-client openssl sqlite3"
+DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
+           libc-client openssl"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
 
@@ -27,12 +27,7 @@ EXTRA_OECONF = "--enable-mbstring --enable-discard-path --enable-wddx \
                 --with-zlib --with-zlib-dir=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-libxml-dir=${STAGING_BINDIR_CROSS} \
-                --disable-embedded-mysqli \
-                --with-mysql="${STAGING_DIR_TARGET}${prefix}" \
-                --with-mysqli="${STAGING_BINDIR_CROSS}/mysql_config" \
-        --with-sqlite3=${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
-                --with-pdo-mysql="${STAGING_BINDIR_CROSS}/mysql_config" \
-                --with-pdo-sqlite=${STAGING_LIBDIR}/.. ${COMMON_EXTRA_OECONF} \
+                ${COMMON_EXTRA_OECONF} \
 "
 EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
                 --with-zlib --with-zlib-dir=${STAGING_LIBDIR_NATIVE}/.. \
@@ -40,6 +35,21 @@ EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
                 ${COMMON_EXTRA_OECONF} \
 "
 
+PACKAGECONFIG ??= "mysql sqlite3"
+
+PACKAGECONFIG[mysql] = "--with-mysql=\"${STAGING_DIR_TARGET}${prefix}\" \
+                        --with-mysqli=\"${STAGING_BINDIR_CROSS}/mysql_config\" \
+                        --with-pdo-mysql=\"${STAGING_BINDIR_CROSS}/mysql_config\" \
+                        --disable-embedded-mysqli \
+                        , \
+                        ,mysql5"
+
+PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
+                        --enable-sqlite-utf8 \
+                        --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
+                        , \
+                        ,sqlite3"
+
 LIBS_virtclass-native = " -lxml2 "
 LIBS_pn-php =" -lpthread "
 export LIBS
-- 
1.8.2



