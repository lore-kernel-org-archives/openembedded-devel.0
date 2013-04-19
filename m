Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UT8Uu-0000xO-TU
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 12:24:56 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 11:07:12 +0100
Message-Id: <1366366032-8581-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1366366032-8581-1-git-send-email-ml@communistcode.co.uk>
References: <1366366032-8581-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 2/2] php: remove non-existant configure flags and improve current ones
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
X-List-Received-Date: Fri, 19 Apr 2013 10:25:13 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

- The removed flags no longer exist anywhere in the PHP source,
  remove them.

- Clean up some whitespace and make the recipe a little bit more
  readable.

- --with-zlib-dir is not needed as zlib dir can be specified with
  --with-zlib=dir flag.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-devtools/php/php.inc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 892a0b5..64f6d74 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -19,18 +19,19 @@ SSTATE_SCAN_FILES += "build-defs.h"
 
 # Common EXTRA_OECONF
 COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
-EXTRA_OECONF = "--enable-mbstring --enable-discard-path --enable-wddx \
-                --enable-magic-quotes --enable-fastcgi --enable-fpm \
+EXTRA_OECONF = "--enable-mbstring \
+                --enable-wddx \
+                --enable-fpm \
                 --with-imap=${STAGING_DIR_HOST} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
                 --with-imap-ssl=${STAGING_DIR_HOST} \
-                --with-zlib --with-zlib-dir=${STAGING_LIBDIR}/.. \
+                --with-zlib=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-libxml-dir=${STAGING_BINDIR_CROSS} \
                 ${COMMON_EXTRA_OECONF} \
 "
-EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
-                --with-zlib --with-zlib-dir=${STAGING_LIBDIR_NATIVE}/.. \
+EXTRA_OECONF_virtclass-native = " \
+                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
                 --with-libxml-dir=${STAGING_BINDIR_NATIVE} \
                 ${COMMON_EXTRA_OECONF} \
 "
@@ -41,15 +42,13 @@ PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[mysql] = "--with-mysql=\"${STAGING_DIR_TARGET}${prefix}\" \
                         --with-mysqli=\"${STAGING_BINDIR_CROSS}/mysql_config\" \
                         --with-pdo-mysql=\"${STAGING_BINDIR_CROSS}/mysql_config\" \
-                        --disable-embedded-mysqli \
                         , \
                         ,mysql5"
 
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
-                        --enable-sqlite-utf8 \
-                        --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
-                        , \
-                        ,sqlite3"
+                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
+                          , \
+                          ,sqlite3"
 
 LIBS_virtclass-native = " -lxml2 "
 LIBS_pn-php =" -lpthread "
-- 
1.8.2.1



