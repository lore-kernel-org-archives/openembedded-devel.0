Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 656CE7F385
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 09:58:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8A9wbuO005343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 02:58:48 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Sep 2019 02:58:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2019 17:58:23 +0800
Message-ID: <1568109504-17588-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-oe][PATCH 1/2] php: fix module path in mod_php.conf
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
X-List-Received-Date: Tue, 10 Sep 2019 09:58:57 -0000
Content-Type: text/plain

The apache2 module's path has been changed from ${libdir} to
${libexecdir} in commit 8d4d608b4e937bb3b8e3b260bd75338c3ff7e8fd. Update
mod_php.conf to adapt it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc                 | 2 +-
 meta-oe/recipes-devtools/php/php/php-fpm-apache.conf | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index d738d2d..d280cd0 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -175,7 +175,7 @@ do_install_append_class-target() {
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
         install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
-        sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
+        sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
         cat ${S}/php.ini-production | \
             sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
             > ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}/php.ini
diff --git a/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
index ef79a0c..f7f46d2 100644
--- a/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
+++ b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
@@ -1,6 +1,6 @@
 # Taken from http://wiki.apache.org/httpd/PHP-FPM
 
-LoadModule proxy_module      /usr/lib/apache2/modules/mod_proxy.so
-LoadModule proxy_fcgi_module /usr/lib/apache2/modules/mod_proxy_fcgi.so
+LoadModule proxy_module      /usr/libexec/apache2/modules/mod_proxy.so
+LoadModule proxy_fcgi_module /usr/libexec/apache2/modules/mod_proxy_fcgi.so
 
 ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/usr/share/apache2/htdocs/
-- 
2.7.4


