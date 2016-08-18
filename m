Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 581 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Aug 2016 18:30:33 UTC
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id AC16D7318D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:30:33 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 347548055E;
	Thu, 18 Aug 2016 20:20:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XFl66xrE3g20; Thu, 18 Aug 2016 20:20:51 +0200 (CEST)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 501EB8055D;
	Thu, 18 Aug 2016 20:20:51 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 20:20:16 +0200
Message-Id: <1471544416-4500-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCHv3 1/2] nginx: optimize systemd unit file
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
X-List-Received-Date: Thu, 18 Aug 2016 18:30:35 -0000

- Call the nginx binary directly, no need to wrap the SysV init file.
- Create /var/log/nginx with tmpfiles, like volatiles without systemd.
- Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 9 ++++-----
 meta-webserver/recipes-httpd/nginx/nginx.inc           | 5 ++++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index 9926a4b..ce99061 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -3,10 +3,9 @@ Description=Nginx Server
 After=network.target
 [Service]
 Type=forking
-PIDFile=@SYSCONFDIR@/nginx/run/nginx.pid
-ExecStartPre=@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
-ExecStart=@SYSCONFDIR@/init.d/nginx start
-ExecStop=@SYSCONFDIR@/init.d/nginx stop
+PIDFile=/run/nginx/nginx.pid
+ExecStart=@SBINDIR@/nginx
+ExecStop=@SBINDIR@/nginx -s stop
+ExecReload=@SBINDIR@/nginx -s reload
 [Install]
 WantedBy=multi-user.target
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index fe51ca0..7698c90 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -75,6 +75,8 @@ do_install () {
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/${BPN} - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+                     >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
 	fi
 	install -d ${D}${sysconfdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
@@ -90,6 +92,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/nginx
 	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
 	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
+	sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
 	install -d ${D}${sysconfdir}/nginx/sites-enabled
 
 	install -d ${D}${sysconfdir}/default/volatiles
@@ -101,7 +104,7 @@ do_install () {
             install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
             sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
                     -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
-                    -e 's,@BASEBINDIR@,${base_bindir},g' \
+                    -e 's,@SBINDIR@,${sbindir},g' \
                     ${D}${systemd_unitdir}/system/nginx.service
         fi
 }
-- 
2.7.4


