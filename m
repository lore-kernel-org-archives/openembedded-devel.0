Return-Path: <aaron.chun.yew.chan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A91AE7D89E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 01:37:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Apr 2019 18:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,351,1549958400"; d="scan'208";a="150847408"
Received: from centaurus01.png.intel.com ([10.221.183.13])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2019 18:37:12 -0700
From: aaron.chun.yew.chan@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2019 09:37:50 +0800
Message-Id: <20190415013750.59316-1-aaron.chun.yew.chan@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] php: Fix libzip extension
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
X-List-Received-Date: Mon, 15 Apr 2019 01:37:12 -0000

From: Aaron Chun Yew Chan <aaron.chun.yew.chan@intel.com>

Phoronix Test Suite 8.x requires zlib and zip extension in PHP 7.x

Signed-off-by: Aaron Chun Yew Chan <aaron.chun.yew.chan@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 6f893ad85..d2cd05f8e 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -47,7 +47,6 @@ EXTRA_OECONF = "--enable-mbstring \
                 --enable-fpm \
                 --with-libdir=${baselib} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
-                --with-libzip=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
@@ -64,7 +63,7 @@ EXTRA_OECONF_class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
+PACKAGECONFIG ??= "zip mysql sqlite3 imap opcache openssl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG_class-native = ""
@@ -90,6 +89,7 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_LIBDIR}/..,--disable-zip, libzip"
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-- 
2.17.1


