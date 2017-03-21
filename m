Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1B319779CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 09:43:00 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v2L9h0Ij027892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 10:43:00 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.72])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v2L9guxJ011836;
	Tue, 21 Mar 2017 10:42:59 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Mar 2017 10:42:51 +0100
Message-Id: <1490089371-23969-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490089371-23969-1-git-send-email-pascal.bach@siemens.com>
References: <1490089371-23969-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-webserver][PATCH 2/2] nginx: make sure the user is correctly set for the volatile directories
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
X-List-Received-Date: Tue, 21 Mar 2017 09:43:01 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx.inc                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
index 93f3c66..472fde1 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
@@ -1,2 +1,2 @@
-d www www-data 0755 /run/nginx none
+d @NGINX_USER@ www-data 0755 /run/nginx none
 d root root 0755 /var/log/nginx none
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 7f83937..f98f299 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -105,6 +105,7 @@ do_install () {
     install -d ${D}${sysconfdir}/default/volatiles
     install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
+    sed -i 's,@NGINX_USER@,${NGINX_USER},g' ${D}${sysconfdir}/default/volatiles/99_nginx
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
         install -d ${D}${systemd_unitdir}/system
-- 
2.1.4


