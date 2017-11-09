Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C74B1784DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 00:39:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA90d9sJ025445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 16:39:10 -0800
Received: from localhost (128.224.163.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 8 Nov 2017 16:39:09 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 08:37:14 +0800
Message-ID: <1510187834-14779-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.244]
Subject: [meta-networking][PATCH] postfix: update to 3.2.4
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
X-List-Received-Date: Thu, 09 Nov 2017 00:39:08 -0000
Content-Type: text/plain

* Update main.cf for postfix 3.x to eliminate startup warning
* Change daemon_directory from ${libexecdir} to ${libexecdir}/postfix
* Add postfix-native to PACKAGE_WRITE_DEPS to make sure newaliases and
  postmap can be found in pkg_postinst
* Remove duplicate SRC_URI lines in bb file

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/files/{main.cf_2.0 => main.cf}             |  5 ++++-
 .../recipes-daemons/postfix/files/postfix.service      |  2 +-
 meta-networking/recipes-daemons/postfix/postfix.inc    | 13 +++++++------
 .../recipes-daemons/postfix/postfix_3.2.2.bb           | 18 ------------------
 .../recipes-daemons/postfix/postfix_3.2.4.bb           |  9 +++++++++
 5 files changed, 21 insertions(+), 26 deletions(-)
 rename meta-networking/recipes-daemons/postfix/files/{main.cf_2.0 => main.cf} (97%)
 delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
 create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.2.4.bb

diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/meta-networking/recipes-daemons/postfix/files/main.cf
similarity index 97%
rename from meta-networking/recipes-daemons/postfix/files/main.cf_2.0
rename to meta-networking/recipes-daemons/postfix/files/main.cf
index dc7feb5..e75c6fc 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf
@@ -1,3 +1,6 @@
+compatibility_level = 2
+smtputf8_enable = no
+
 # Configure your domain and accounts
 #mydomain=sample.com
 #FQDN from gethostname
@@ -30,7 +33,7 @@ queue_directory = /var/spool/postfix
 mail_spool_directory = /var/spool/mail
 readme_directory = no
 command_directory = /usr/sbin
-daemon_directory = @LIBEXECDIR@
+daemon_directory = @LIBEXECDIR@/postfix
 mail_owner = postfix
 setgid_group = postdrop
 unknown_local_recipient_reject_code = 450
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix.service b/meta-networking/recipes-daemons/postfix/files/postfix.service
index 3a9a0a1..30d54a4 100644
--- a/meta-networking/recipes-daemons/postfix/files/postfix.service
+++ b/meta-networking/recipes-daemons/postfix/files/postfix.service
@@ -7,7 +7,7 @@ Conflicts=sendmail.service exim.service
 Type=forking
 PIDFile=@LOCALSTATEDIR@/spool/postfix/pid/master.pid
 ExecStartPre=-@SBINDIR@/check_hostname.sh
-ExecStartPre=-@LIBEXECDIR@/aliasesdb
+ExecStartPre=-@LIBEXECDIR@/postfix/aliasesdb
 ExecStart=@SBINDIR@/postfix start
 ExecReload=@SBINDIR@/postfix reload
 ExecStop=@SBINDIR@/postfix stop
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a588bd3..5e11794 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
 SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
     file://makedefs.patch \
     file://install.patch \
-    file://main.cf_2.0 \
+    file://main.cf \
     file://postfix \
     file://internal_recipient \
     file://postfix.service \
@@ -135,7 +135,7 @@ SYSTEMD_SERVICE_${PN} = "postfix.service"
 do_install () {
     sh ./postfix-install 'install_root=${D}' \
         'config_directory=${sysconfdir}/postfix' \
-        'daemon_directory=${libexecdir}' \
+        'daemon_directory=${libexecdir}/postfix' \
         'command_directory=${sbindir}' \
         'queue_directory=${localstatedir}/spool/postfix' \
         'sendmail_path=${sbindir}/sendmail.postfix' \
@@ -149,7 +149,7 @@ do_install () {
     mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
-    install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
+    install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
     sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
 
     install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
@@ -163,7 +163,7 @@ do_install () {
     sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
 
-    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
+    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}/postfix
 
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
@@ -231,6 +231,7 @@ ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
 ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
 ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
 
+PACKAGE_WRITE_DEPS += "postfix-native"
 pkg_postinst_${PN} () {
     if [ "x$D" = "x" ]; then
         touch /etc/aliases
@@ -246,7 +247,7 @@ pkg_postinst_${PN} () {
         postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
 
         if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
-            # /usr/lib/sendmial is required by LSB core test
+            # /usr/lib/sendmail is required by LSB core test
             [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
         fi
     fi
@@ -255,4 +256,4 @@ pkg_postinst_${PN} () {
 # Exclude .debug directories from the main package
 FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
                ${libexecdir}/* ${systemd_unitdir}/*"
-FILES_${PN}-dbg += "${libexecdir}/.debug"
+FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
deleted file mode 100644
index 439ede9..0000000
--- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require postfix.inc
-
-SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
-           file://makedefs.patch \
-           file://install.patch \
-           file://main.cf_2.0 \
-           file://postfix \
-           file://internal_recipient \
-           file://postfix.service \
-           file://aliasesdb \
-           file://check_hostname.sh \
-           file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
-           file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
-           file://postfix-install.patch \
-           file://icu-config.patch \
-           "
-SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
-SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb23f737629769b4e4a52da42fb3ad8b0576"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.4.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.4.bb
new file mode 100644
index 0000000..8edd035
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.4.bb
@@ -0,0 +1,9 @@
+require postfix.inc
+
+SRC_URI += "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
+            file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+            file://postfix-install.patch \
+            file://icu-config.patch \
+           "
+SRC_URI[md5sum] = "60d8418278ef9f3c7d1251480ea84a42"
+SRC_URI[sha256sum] = "ec55ebaa2aa464792af8d5ee103eb68b27a42dc2b36a02fee42dafbf9740c7f6"
-- 
2.7.4


