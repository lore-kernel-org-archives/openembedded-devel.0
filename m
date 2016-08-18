Return-Path: <gyurco@freemail.hu>
Received: from mail-outd.mail.t-online.hu (mail-outd.mail.t-online.hu
	[195.228.240.54])
	by mail.openembedded.org (Postfix) with ESMTP id E3C21766E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:58:36 +0000 (UTC)
Received: from fsmeopfe.local (51B6146C.dsl.pool.telekom.hu [81.182.20.108])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail00d.mail.t-online.hu (Postfix) with ESMTPSA id 3sFSP740xzzTr2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 15:58:35 +0200 (CEST)
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 15:58:34 +0200
Message-ID: <1561177.QVzWruQ2fm@gyurco.localdomain>
User-Agent: KMail/5.2.3 (Linux/4.6.6-300.fc24.x86_64; KDE/5.25.0; x86_64; ; )
MIME-Version: 1.0
X-DCC--Metrics: mail00d.mail.t-online.hu 1308; Body=1 Fuz1=1 Fuz2=1
X-Spam-Probability: 1.80461201538e-12
Subject: [meta-webserver][PATCH]nginx: optimize systemd unit file
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
X-List-Received-Date: Thu, 18 Aug 2016 13:58:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

     
    - Call the nginx binary directly, no need to
      wrap the SysV init file.
    - Create /var/log/nginx with tmpfiles, like volatiles without systemd.
    - Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)
    
    Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-
webserver/recipes-httpd/nginx/files/nginx.service
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/
recipes-httpd/nginx/nginx.inc
index fe51ca0..25ac7a4 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -75,6 +75,9 @@ do_install () {
                install -d ${D}${sysconfdir}/tmpfiles.d
                echo "d /run/${BPN} - - - -" \
                     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+                     >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+
        fi
        install -d ${D}${sysconfdir}/${BPN}
        ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
@@ -90,6 +93,7 @@ do_install () {
        install -d ${D}${sysconfdir}/nginx
        install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/
nginx.conf
        sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/
nginx.conf
+       sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/
nginx.conf
        install -d ${D}${sysconfdir}/nginx/sites-enabled
 
        install -d ${D}${sysconfdir}/default/volatiles
@@ -101,7 +105,7 @@ do_install () {
             install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/
system/
             sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
                     -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
-                    -e 's,@BASEBINDIR@,${base_bindir},g' \
+                    -e 's,@SBINDIR@,${sbindir},g' \
                     ${D}${systemd_unitdir}/system/nginx.service
         fi
 }


