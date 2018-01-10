Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79C9D6093F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 03:11:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0A3Bg4I012944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jan 2018 19:11:43 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 9 Jan 2018 19:11:42 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>,
	<macdonald@mentor.com>
Date: Wed, 10 Jan 2018 11:09:56 +0800
Message-ID: <1515553796-22399-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [meta-networking][PATCH] postfix: fix generating aliases db files
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
X-List-Received-Date: Wed, 10 Jan 2018 03:11:43 -0000
Content-Type: text/plain

When generating aliases db files, the newaliases tries to chdir
/var/spool/postfix on the host. It would cause a failure if the host
doesn't install postfix:
newaliases: fatal: chdir /var/spool/postfix: No such file or directory

Move this step from do_install to pkg_postinst to make sure newaliases
and postmap run during the image creation.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/postfix/files/main.cf   |  2 +-
 .../recipes-daemons/postfix/files/postfix.service       |  2 +-
 meta-networking/recipes-daemons/postfix/postfix.inc     | 17 ++++++++---------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf b/meta-networking/recipes-daemons/postfix/files/main.cf
index 2371ace..e75c6fc 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf
@@ -33,7 +33,7 @@ queue_directory = /var/spool/postfix
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
index e48fc39..fa5eef9 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -150,7 +150,7 @@ do_install () {
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
-    sed -i 's#@LIBEXECDIR@#${libexecdir}/postfix#' ${D}${sysconfdir}/postfix/main.cf
+    sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
 
     install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
 
@@ -159,7 +159,7 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@LIBEXECDIR@#${libexecdir}/postfix#g' ${D}${systemd_unitdir}/system/postfix.service
+    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
 
@@ -217,12 +217,6 @@ do_install_append_class-native() {
 do_install_append_class-target() {
     # Remove references to buildmachine paths in target makedefs.out
     sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
-    # Since we are building recipe postfix, newaliases and postmap come from our sysroot_native.
-    touch ${D}/etc/aliases
-    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
-    touch ${D}/etc/postfix/virtual_alias
-    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
-
 }
 
 ALTERNATIVE_${PN} = "sendmail"
@@ -235,6 +229,7 @@ ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
 ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
 ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
 
+PACKAGE_WRITE_DEPS += "postfix-native"
 pkg_postinst_${PN} () {
     if [ "x$D" = "x" ]; then
         touch /etc/aliases
@@ -244,6 +239,11 @@ pkg_postinst_${PN} () {
         touch /etc/postfix/virtual_alias
         postmap /etc/postfix/virtual_alias
     else
+        touch $D/etc/aliases
+        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
+        touch $D/etc/postfix/virtual_alias
+        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
+
         if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
             # /usr/lib/sendmail is required by LSB core test
             [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
@@ -254,5 +254,4 @@ pkg_postinst_${PN} () {
 # Exclude .debug directories from the main package
 FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
                ${libexecdir}/* ${systemd_unitdir}/*"
-CONFFILES_${PN} = "/etc/aliases /etc/postfix/virtual_alias*"
 FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
-- 
2.7.4


