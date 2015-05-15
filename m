Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21AFE7412A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 06:46:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 23:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,432,1427785200"; d="scan'208";a="710558665"
Received: from unknown (HELO aehernan-DevStation.lar.corp.intel.com)
	([10.252.250.49])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2015 23:46:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2015 01:46:08 -0500
Message-Id: <1431672369-15915-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] nginx: Add suport for systemd
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
X-List-Received-Date: Fri, 15 May 2015 06:46:09 -0000

Adds support for systemd, creates a service for nginx and installs it if required

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 12 ++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb      | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx.service

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
new file mode 100644
index 0000000..705450e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Nginx Server
+After=network.target
+[Service]
+Type=forking
+PIDFile=@SYSCONFDIR@/nginx/run/nginx.pid
+ExecStartPre=mkdir -p @LOCALSTATEDIR@/log/nginx
+ExecStart=@SYSCONFDIR@/init.d/nginx start
+ExecStop=@SYSCONFDIR@/init.d/nginx stop
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
index e78ed34..0dfdb5b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
 	file://nginx.conf \
 	file://nginx.init \
 	file://nginx-volatile.conf \
+	file://nginx.service \
 "
 SRC_URI[md5sum] = "5dfaba1cbeae9087f3949860a02caa9f"
 SRC_URI[sha256sum] = "7c989a58e5408c9593da0bebcd0e4ffc3d892d1316ba5042ddb0be5b0b4102b9"
@@ -81,6 +82,14 @@ do_install () {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
 	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
+
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+            install -d ${D}${systemd_unitdir}/system
+            install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
+            sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+                    -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+                    ${D}${systemd_unitdir}/system/nginx.service
+        fi
 }
 
 pkg_postinst_${PN} () {
@@ -93,7 +102,9 @@ pkg_postinst_${PN} () {
 	fi
 }
 
-FILES_${PN} += "${localstatedir}/"
+FILES_${PN} += "${localstatedir}/ \
+                ${systemd_unitdir}/system/nginx.service \
+                "
 
 CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
 		${sysconfdir}/nginx/fastcgi.conf\
-- 
1.9.1


