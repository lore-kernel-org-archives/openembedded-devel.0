Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 048FD73D9A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 06:45:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 May 2015 23:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,432,1427785200"; d="scan'208";a="710558294"
Received: from unknown (HELO aehernan-DevStation.lar.corp.intel.com)
	([10.252.250.49])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2015 23:45:03 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2015 01:45:02 -0500
Message-Id: <1431672302-15816-2-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1431672302-15816-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1431672302-15816-1-git-send-email-alejandro.hernandez@linux.intel.com>
Subject: [meta-oe][PATCH] php-fpm: Add support for systemd
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
X-List-Received-Date: Fri, 15 May 2015 06:45:03 -0000

Adds suport for systemd, creates a service for php-fpm and installs it if required

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-oe/recipes-devtools/php/php/php-fpm.service | 10 ++++++++++
 meta-oe/recipes-devtools/php/php_5.5.24.bb       | 13 ++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/php-fpm.service

diff --git a/meta-oe/recipes-devtools/php/php/php-fpm.service b/meta-oe/recipes-devtools/php/php/php-fpm.service
new file mode 100644
index 0000000..ac79dc9
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php-fpm.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=PHP-FPM
+After=network.target
+[Service]
+Type=forking
+PIDFile=@LOCALSTATEDIR@/run/php-fpm.pid
+ExecStart=@SYSCONFDIR@/init.d/php-fpm start
+ExecStop=@SYSCONFDIR@/init.d/php-fpm stop
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
index 76185fb..3e656af 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
@@ -27,6 +27,7 @@ SRC_URI_append_class-target += " \
             file://configure.patch \
             file://pthread-check-threads-m4.patch \
             file://70_mod_php5.conf \
+            file://php-fpm.service \
           "
 
 SRC_URI[md5sum] = "f9a8f3e4bb88b33b087bd63732b1402a"
@@ -156,6 +157,16 @@ do_install_append_class-target() {
     sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
     sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
     install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+            ${D}${systemd_unitdir}/system/php-fpm.service
+    fi
+
     TMP=`dirname ${D}/${TMPDIR}`
     while test ${TMP} != ${D}; do
         rmdir ${TMP}
@@ -206,7 +217,7 @@ FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
 FILES_${PN}-phar = "${bindir}/phar*"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
-FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
+FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service"
 FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
 CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-- 
1.9.1


