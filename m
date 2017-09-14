Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 563 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Sep 2017 16:08:56 UTC
Received: from jsm-devops-gyurco-test-0 (unknown [5.159.216.117])
	by mail.openembedded.org (Postfix) with ESMTP id 19806785AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 16:08:56 +0000 (UTC)
Received: from localhost.localdomain (jsm-devops-gyurco-test-0 [127.0.0.1])
	by jsm-devops-gyurco-test-0 (Postfix) with ESMTP id C83C8EC1458;
	Thu, 14 Sep 2017 17:59:34 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 17:59:32 +0200
Message-Id: <1505404772-1249-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] Nginx: use PACKAGECONFIG variables in configure
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
X-List-Received-Date: Thu, 14 Sep 2017 16:08:57 -0000

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 77d1b32..4a97e26 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -72,7 +72,7 @@ do_configure () {
     --prefix=${prefix} \
     --with-http_ssl_module \
     --with-http_gzip_static_module \
-    ${EXTRA_OECONF}
+    ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
 }
 
 do_install () {
-- 
2.7.4


