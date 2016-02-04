Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A52A777348
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 15:03:20 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u14F3KWA018743
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 16:03:21 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.41])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u14F3Kwt020415;
	Thu, 4 Feb 2016 16:03:20 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:03:13 +0100
Message-Id: <1454598194-11339-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH 1/2] nginx: make nginx user and home directory configurable
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
X-List-Received-Date: Thu, 04 Feb 2016 15:03:22 -0000

This allows selecting a different user then "www" in a bbappend.
It also allows to change the default value of "/var/www/localhost" to something else.
---
 meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
index 06d61c7..08f53a7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
@@ -27,6 +27,9 @@ inherit update-rc.d useradd
 CFLAGS_append = " -fPIE -pie"
 CXXFLAGS_append = " -fPIE -pie"
 
+NGINX_WWWDIR ?= "${localstatedir}/www/localhost"
+NGINX_USER   ?= "www"
+
 EXTRA_OECONF = ""
 
 do_configure () {
@@ -71,9 +74,9 @@ do_install () {
 	fi
 	install -d ${D}${sysconfdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
-	install -d ${D}${localstatedir}/www/localhost
-	mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
-	chown www:www-data -R ${D}${localstatedir}
+	install -d ${D}${NGINX_WWWDIR}
+	mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
+	chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
 
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
@@ -130,6 +133,6 @@ INITSCRIPT_PARAMS = "defaults 92 20"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = " \
     --system --no-create-home \
-    --home ${localstatedir}/www/localhost \
+    --home ${NGINX_WWWDIR} \
     --groups www-data \
-    --user-group www"
+    --user-group ${NGINX_USER}"
-- 
2.1.4


