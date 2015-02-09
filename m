Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 964FE606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Feb 2015 03:32:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57304485"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Feb 2015 11:28:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t193VeHK031887
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Feb 2015 11:31:40 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 9 Feb 2015 11:32:25 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Feb 2015 11:27:37 +0800
Message-ID: <1423452457-23371-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] [meta-networking]postfix: instead ${exec_prefix}/libexec/${PN} by ${libexecdir}
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
X-List-Received-Date: Mon, 09 Feb 2015 03:32:29 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 28563af..155bf21 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -129,7 +129,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 do_install () {
     sh ./postfix-install 'install_root=${D}' \
         'config_directory=${sysconfdir}/postfix' \
-        'daemon_directory=${exec_prefix}/libexec/postfix' \
+        'daemon_directory=${libexecdir}' \
         'command_directory=${sbindir}' \
         'queue_directory=${localstatedir}/spool/postfix' \
         'sendmail_path=${sbindir}/sendmail.postfix' \
@@ -150,7 +150,7 @@ do_install () {
     install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
     sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/postfix.service
 
-    install -m 0755 ${WORKDIR}/aliasesdb ${D}${exec_prefix}/libexec/postfix/
+    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
 
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
@@ -234,5 +234,5 @@ pkg_postinst_${PN} () {
 
 # Exclude .debug directories from the main package
 FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
-               ${exec_prefix}/libexec/postfix/* ${systemd_unitdir}/*"
-FILES_${PN}-dbg += "${exec_prefix}/libexec/postfix/.debug"
+               ${libexecdir}/* ${systemd_unitdir}/*"
+FILES_${PN}-dbg += "${libexecdir}/.debug"
-- 
1.9.1


