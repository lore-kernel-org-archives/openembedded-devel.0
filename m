Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA3871F59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373635"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:22 +0000
Message-Id: <1e44b1621d30e44cdbdde2349da6694e8b85a0da.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 09/12] php: add PACKAGECONFIG for imap
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:42 -0000

Allow imap support to be easily disabled; default it to enabled based on
previous configuration.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/php/php_5.5.20.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.20.bb b/meta-oe/recipes-devtools/php/php_5.5.20.bb
index 03384cc..ad6602a 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.20.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.20.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native \
-           uw-imap openssl libmcrypt"
+           openssl libmcrypt"
 DEPENDS_class-native = "zlib-native libxml2-native"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
@@ -56,9 +56,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --enable-wddx \
                 --enable-fpm \
                 --enable-zip \
-                --with-imap=${STAGING_DIR_HOST} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
-                --with-imap-ssl=${STAGING_DIR_HOST} \
                 --with-zlib=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
@@ -74,7 +72,7 @@ EXTRA_OECONF_class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 \
+PACKAGECONFIG ??= "mysql sqlite3 imap \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG_class-native = ""
 
@@ -92,6 +90,10 @@ PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--witho
 PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
 PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
 PACKAGECONFIG[pam] = ",,libpam"
+PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
+                       --with-imap-ssl=${STAGING_DIR_HOST} \
+                       ,--without-imap --without-imap-ssl \
+                       ,uw-imap"
 
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
1.9.3


