Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 738ED74573
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:15:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8L6Frpx028343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:15:53 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 20 Sep 2018 23:15:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Sep 2018 14:15:51 +0800
Message-ID: <1537510551-128643-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: Upgrade 7.2.9 -< 7.2.10
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
X-List-Received-Date: Fri, 21 Sep 2018 06:15:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. Upgrade 7.2.9 -> 7.2.10
2. php 5.x not support valgrind config, so move it to php_7.x.bb

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc                         | 1 -
 meta-oe/recipes-devtools/php/{php_7.2.9.bb => php_7.2.10.bb} | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.2.9.bb => php_7.2.10.bb} (80%)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 65dfd2d..9eacabe 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -92,7 +92,6 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
-PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
diff --git a/meta-oe/recipes-devtools/php/php_7.2.9.bb b/meta-oe/recipes-devtools/php/php_7.2.10.bb
similarity index 80%
rename from meta-oe/recipes-devtools/php/php_7.2.9.bb
rename to meta-oe/recipes-devtools/php/php_7.2.10.bb
index a5d5afe..8dc64bb 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.10.bb
@@ -13,12 +13,13 @@ SRC_URI_append_class-target = " \
                                 file://0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "175023bc43fd8f883e60849a02a03b93"
-SRC_URI[sha256sum] = "e9e3aaa6c317b7fea78246a758b017544366049d2789ad5a44fe9398464c53a8"
+SRC_URI[md5sum] = "0ce8ff615bfb9de7a89bab8d742c11c0"
+SRC_URI[sha256sum] = "01b6129a0921a1636b07da9bc598a876669e45a462cef4b5844fc26862dbda9d"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
                         ,--without-mysqli --without-pdo-mysql \
                         ,mysql5"
+PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
 
 FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
-- 
2.7.4


