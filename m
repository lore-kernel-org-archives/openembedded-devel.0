Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C56560685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 21:43:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9QLhWWr013974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 14:43:33 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 26 Oct 2017 14:43:30 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Oct 2017 14:43:31 -0700
Message-ID: <20171026214331.174436-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] postfix: fix send mail failure and eliminate warning
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
X-List-Received-Date: Thu, 26 Oct 2017 21:43:32 -0000
Content-Type: text/plain

From: Yi Zhao <yi.zhao@windriver.com>

* Update main.cf for postfix 3.x to eliminate startup warning
* Set daemon_directory from ${libexecdir} to ${libexecdir}/postfix
* Using absolute path for newaliases and postmap to generate the correct
  db file in pkg_postinst
* Remove duplicate SRC_URI lines in postfix_3.2.2.bb

(LOCAL REV: NOT UPSTREAM) -- will sent to oe-devel later

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

* Move use of newaliases and postmap on host to install phase
  because absolute path might not exist at rootfs build time.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../postfix/files/{main.cf_2.0 => main.cf}         |  3 +++
 .../recipes-daemons/postfix/postfix.inc            | 28 ++++++++++++----------
 .../recipes-daemons/postfix/postfix_3.2.2.bb       | 17 ++++---------
 3 files changed, 22 insertions(+), 26 deletions(-)
 rename meta-networking/recipes-daemons/postfix/files/{main.cf_2.0 => main.cf} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/meta-networking/recipes-daemons/postfix/files/main.cf
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/files/main.cf_2.0
rename to meta-networking/recipes-daemons/postfix/files/main.cf
index dc7feb5..2371ace 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf
@@ -1,3 +1,6 @@
+compatibility_level = 2
+smtputf8_enable = no
+
 # Configure your domain and accounts
 #mydomain=sample.com
 #FQDN from gethostname
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a588bd3..8dad45f 100644
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
@@ -149,8 +149,8 @@ do_install () {
     mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
-    install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
-    sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
+    install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
+    sed -i 's#@LIBEXECDIR@#${libexecdir}/postfix#' ${D}${sysconfdir}/postfix/main.cf
 
     install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
 
@@ -159,11 +159,11 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
+    sed -i -e 's#@LIBEXECDIR@#${libexecdir}/postfix#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
 
-    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
+    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}/postfix
 
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
@@ -217,6 +217,12 @@ do_install_append_class-native() {
 do_install_append_class-target() {
     # Remove references to buildmachine paths in target makedefs.out
     sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
+    # Since we are building recipe postfix, newaliases and postmap come from our sysroot_native.
+    touch ${D}/etc/aliases
+    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
+    touch ${D}/etc/postfix/virtual_alias
+    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
+
 }
 
 NATIVE_INSTALL_WORKS = "1"
@@ -240,13 +246,8 @@ pkg_postinst_${PN} () {
         touch /etc/postfix/virtual_alias
         postmap /etc/postfix/virtual_alias
     else
-        touch $D/etc/aliases
-        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
-        touch $D/etc/postfix/virtual_alias
-        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
-
         if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
-            # /usr/lib/sendmial is required by LSB core test
+            # /usr/lib/sendmail is required by LSB core test
             [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
         fi
     fi
@@ -255,4 +256,5 @@ pkg_postinst_${PN} () {
 # Exclude .debug directories from the main package
 FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
                ${libexecdir}/* ${systemd_unitdir}/*"
-FILES_${PN}-dbg += "${libexecdir}/.debug"
+CONFFILES_${PN} = "/etc/aliases /etc/postfix/virtual_alias*"
+FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
index 439ede9..89af406 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
@@ -1,18 +1,9 @@
 require postfix.inc
 
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
+SRC_URI += "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
+            file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+            file://postfix-install.patch \
+            file://icu-config.patch \
            "
 SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
 SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb23f737629769b4e4a52da42fb3ad8b0576"
-- 
2.7.4


