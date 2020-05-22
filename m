Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6598.1590116134925922460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 19:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04M2t3Vx017466
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 19:55:24 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 21 May
 2020 19:54:53 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-webserver][PATCH] apache2: create log/run directory via pkg_postinst
Date: Fri, 22 May 2020 10:54:49 +0800
Message-ID: <20200522025449.26172-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

The commit e789c3837ca8d65abb4bac29dc2e5c595c8ce05b tries to create
log/run directory in initscript/systemd unit file. This is not a correct
method. We should create them in pkg_postinst.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.43.bb    | 18 ++++++++++++++++++
 .../apache2/files/apache2-volatile.conf        |  2 ++
 .../apache2/files/apache2.service              |  4 ----
 .../recipes-httpd/apache2/files/init           |  5 -----
 .../apache2/files/volatiles.04_apache2         |  3 +++
 5 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index 9b80bbff6..a7083d80e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -20,7 +20,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 SRC_URI_append_class-target = " \
            file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
+           file://apache2-volatile.conf \
            file://apache2.service \
+           file://volatiles.04_apache2 \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
@@ -126,10 +128,16 @@ do_install_append_class-target() {
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
@@ -206,3 +214,13 @@ RDEPENDS_${PN}-scripts += "perl ${PN}"
 RDEPENDS_${PN}-dev = "perl"
 
 BBCLASSEXTEND = "native"
+
+pkg_postinst_${PN}() {
+    if [ -z "$D" ]; then
+        if type systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
new file mode 100644
index 000000000..ff2c58704
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
@@ -0,0 +1,2 @@
+d  /var/run/apache2 0755 root root -
+d  /var/log/apache2 0755 root root -
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2.service b/meta-webserver/recipes-httpd/apache2/files/apache2.service
index 25d43acf8..9b5548c76 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2.service
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2.service
@@ -5,10 +5,6 @@ After=network.target remote-fs.target nss-lookup.target
 [Service]
 Type=simple
 Environment=LANG=C
-ExecStartPre=mkdir -p /var/log/apache2
-ExecStartPre=mkdir -p /var/run/apache2
-ExecStartPre=chmod -R 0755 /var/log/apache2
-ExecStartPre=chmod -R 0755 /var/run/apache2
 ExecStart=@SBINDIR@/httpd -DFOREGROUND -D SSL -D PHP5 -k start
 ExecStop=@BASE_BINDIR@/kill -WINCH ${MAINPID}
 KillSignal=SIGCONT
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index 80a7ebfcb..758d133b9 100644
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -97,11 +97,6 @@ do_start()
             return 1
     fi
 
-    mkdir -p /var/log/apache2
-    chmod -R 0755 /var/log/apache2
-    mkdir -p /var/run/apache2
-    chmod -R 0755 /var/run/apache2
-
     if apache_conftest ; then
             $APACHECTL start
             apache_wait_start $?
diff --git a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
new file mode 100644
index 000000000..922075b1b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/run/apache2 none
+d root root 0755 /var/log/apache2 none
-- 
2.17.1

