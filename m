Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.1748.1588748533242199249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 00:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04672BiC014390
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 May 2020 00:02:12 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 6 May
 2020 00:02:11 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH] nginx: remove /var/log/nginx when do_install
Date: Wed, 6 May 2020 15:02:09 +0800
Message-ID: <20200506070209.25338-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Remove directory /var/log/nginx when do_install because it is created by
volatiles file.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 2824c6652..de080a2b0 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -90,7 +90,7 @@ do_install () {
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/${BPN} - - - -" \
             > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-        echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+        echo "d ${localstatedir}/log/${BPN} 0755 root root -" \
             >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
     install -d ${D}${sysconfdir}/${BPN}
@@ -139,6 +139,8 @@ do_install () {
             -e 's,@BASE_BINDIR@,${base_bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
+
+    rm -rf ${D}${localstatedir}/log/
 }
 
 pkg_postinst_${PN} () {
-- 
2.17.1

