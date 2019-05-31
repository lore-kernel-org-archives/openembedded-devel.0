Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA2F7E54A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:23:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V8MxG8025962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 01:23:16 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 31 May 2019 01:22:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 May 2019 16:22:58 +0800
Message-ID: <1559290978-297054-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php-fpm-apache: fix module path
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
X-List-Received-Date: Fri, 31 May 2019 08:23:25 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

with configuration:
IMAGE_INSTALL_append = " apache2 php-fpm-apache2"

systemctl status apache2.service report error:
httpd: Syntax error on line 509 of /etc/apache2/httpd.conf: Syntax error on line 3 of /etc/apache2/conf.d/php-fpm.conf: Cannot load lib/apache

fix by correct the module path

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php/php-fpm-apache.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
index 77cdd82..ef79a0c 100644
--- a/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
+++ b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
@@ -1,6 +1,6 @@
 # Taken from http://wiki.apache.org/httpd/PHP-FPM
 
-LoadModule proxy_module      lib/apache2/modules/mod_proxy.so
-LoadModule proxy_fcgi_module lib/apache2/modules/mod_proxy_fcgi.so
+LoadModule proxy_module      /usr/lib/apache2/modules/mod_proxy.so
+LoadModule proxy_fcgi_module /usr/lib/apache2/modules/mod_proxy_fcgi.so
 
 ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/usr/share/apache2/htdocs/
-- 
2.7.4


