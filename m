Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id D94566A5A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:05:00 +0000 (UTC)
Received: from aimless.elisa-laajakaista.fi
	(a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 3B95E26541;
	Mon, 22 Jul 2013 16:04:59 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2013 17:04:54 +0300
Message-Id: <1374501894-17068-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-webserver][PATCH] apache2: move pidfile to run
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
X-List-Received-Date: Mon, 22 Jul 2013 14:05:01 -0000

pidile was stored in /var/apache2/log which is saved over boots.
This might prevent startup of apache2 on boots. Move it to /run
where pidfiles in general belong.
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb | 2 ++
 meta-webserver/recipes-httpd/apache2/files/init       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
index cf1e469..8c9416a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
@@ -68,6 +68,8 @@ do_install_append() {
     # Ensure configuration file pulls in conf.d and modules.d
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+    # match with that is in init script
+    printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index 346dc0d..a1adbd7 100755
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -14,7 +14,7 @@ NAME=apache2
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
 DAEMON=/usr/sbin/httpd
 SUEXEC=/usr/lib/apache/suexec
-PIDFILE=/var/apache2/logs/httpd.pid
+PIDFILE=/run/httpd.pid
 CONF=/etc/apache2/httpd.conf
 APACHECTL=/usr/sbin/apachectl 
 
-- 
1.8.3.1


