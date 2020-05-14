Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.8189.1589443442311299525
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 01:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04E8412u005012
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 01:04:02 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 14 May 2020 01:04:01 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] apache2: fix service start fail
Date: Thu, 14 May 2020 16:03:56 +0800
Message-ID: <20200514080356.16146-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

reproduce steps:
1. boot up target
2. scp apache2-2.4.41-r0.1.aarch64.rpm on target
3. rpm -i apache2-2.4.41-r0.1.aarch64.rpm
4. systemctl status apache2

Error:
httpd[7767]: (2)No such file or directory: AH02291: Cannot access directory '/var/log/apache2/' for main error log

with the old way, /var/log/apache2/ is created by service
systemd-tmpfiles-setup during boot, so only works when apache2
already installed before boot, in above scenario,
/var/log/apache2/ will not created. fix by creating it in the
service file. similar fix for sysV system

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb    | 8 --------
 .../recipes-httpd/apache2/files/apache2-volatile.conf     | 2 --
 .../recipes-httpd/apache2/files/apache2.service           | 4 ++++
 meta-webserver/recipes-httpd/apache2/files/init           | 5 +++++
 .../recipes-httpd/apache2/files/volatiles.04_apache2      | 3 ---
 5 files changed, 9 insertions(+), 13 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index 520011152..9b80bbff6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -20,9 +20,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 SRC_URI_append_class-target = " \
            file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
-           file://apache2-volatile.conf \
            file://apache2.service \
-           file://volatiles.04_apache2 \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
@@ -128,16 +126,10 @@ do_install_append_class-target() {
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
-    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
deleted file mode 100644
index ff2c58704..000000000
--- a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-d  /var/run/apache2 0755 root root -
-d  /var/log/apache2 0755 root root -
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2.service b/meta-webserver/recipes-httpd/apache2/files/apache2.service
index 9b5548c76..25d43acf8 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2.service
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2.service
@@ -5,6 +5,10 @@ After=network.target remote-fs.target nss-lookup.target
 [Service]
 Type=simple
 Environment=LANG=C
+ExecStartPre=mkdir -p /var/log/apache2
+ExecStartPre=mkdir -p /var/run/apache2
+ExecStartPre=chmod -R 0755 /var/log/apache2
+ExecStartPre=chmod -R 0755 /var/run/apache2
 ExecStart=@SBINDIR@/httpd -DFOREGROUND -D SSL -D PHP5 -k start
 ExecStop=@BASE_BINDIR@/kill -WINCH ${MAINPID}
 KillSignal=SIGCONT
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index 758d133b9..80a7ebfcb 100644
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -97,6 +97,11 @@ do_start()
             return 1
     fi
 
+    mkdir -p /var/log/apache2
+    chmod -R 0755 /var/log/apache2
+    mkdir -p /var/run/apache2
+    chmod -R 0755 /var/run/apache2
+
     if apache_conftest ; then
             $APACHECTL start
             apache_wait_start $?
diff --git a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
deleted file mode 100644
index 922075b1b..000000000
--- a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
+++ /dev/null
@@ -1,3 +0,0 @@
-# <type> <owner> <group> <mode> <path> <linksource>
-d root root 0755 /var/run/apache2 none
-d root root 0755 /var/log/apache2 none
-- 
2.17.1

