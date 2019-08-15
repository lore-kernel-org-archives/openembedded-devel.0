Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34DF16C0F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:26:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7FLQrKJ016989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:26:53 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 15 Aug 2019 14:26:52 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Aug 2019 14:26:52 -0700
Message-ID: <20190815212652.207154-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][V2][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Thu, 15 Aug 2019 21:26:52 -0000
Content-Type: text/plain

Add back zlib support.  Define zip support but do not enable it.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 33bcf12..b63ed4c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -59,7 +59,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --enable-fpm \
                 --with-libdir=${baselib} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
-                --with-libzip=${STAGING_LIBDIR}/.. \
+                --with-zlib=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
@@ -81,6 +81,8 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
 "
 PACKAGECONFIG_class-native = ""
 
+PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
+
 PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
                         --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4


