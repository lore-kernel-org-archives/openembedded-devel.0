Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PcpkW-0003yf-5m
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 02:43:44 +0100
Received: by ywi6 with SMTP id 6so30824ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 17:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=a6IgRSYCKjddenQX24UwkN/Xz+tbPil9FBmh3mBz7Cg=;
	b=Wh+l8zvWZ0rlKRYbO2ub1r3j6yfEQjZS9+H9eRsqIqn6kzMq7j7Uik7T8FULMNuCkk
	8qqxNMclOrgLCl4+n4bqvJ+cxwhXQy0xatskeSQSfAnJlOSebqxtzJPWpgjN9q+i/LjS
	UIbcorHjFqKc3fSj4HCOwgVhwxNWoBKIobhAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LawwHpYlSc7IScbr5NwWbhRR22123bq8nkvka3y0ReC8NFZ16LLV9G3laxkSbUGvZ9
	Kk/sP94/lwjljXssRyklS4JFXFyu7quKtOH4+hk5XrH/ALQRvx6WJSUK/ezvfFiZ7HtX
	XCa14xKkjqvLQlRgZjCyJoP9/qBxB+XsgPvYI=
Received: by 10.151.43.18 with SMTP id v18mr102195ybj.446.1294796591942;
	Tue, 11 Jan 2011 17:43:11 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id r41sm153820yba.16.2011.01.11.17.43.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 17:43:10 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 18:43:06 -0700
Message-Id: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] busybox: move syslog config to /etc/default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jan 2011 01:43:44 -0000

From: Chris Larson <chris_larson@mentor.com>

The busybox syslog syslog.conf is parsed by the /etc/init.d script, not by the
syslog process itself, so it belongs in /etc/default.  In addition, the file
format is *completely* different from the standard sysklogd configuration, so
while we should resolve the file conflict between busybox-syslog and sysklogd,
we should not use update-alternatives for it, so this is a cleaner solution.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 recipes/busybox/busybox.inc  |   13 +++++++++----
 recipes/busybox/files/syslog |    4 ++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index a9d1e6e..1106910 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r38"
+INC_PR = "r39"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -47,7 +47,8 @@ RDEPENDS_${PN} += "${PN}-mountall"
 RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
+                      ${sysconfdir}/default/syslog"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 
 FILES_${PN} += "${datadir}/udhcpc"
@@ -58,7 +59,7 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-udhcpd"
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
-CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf"
+CONFFILES_${PN}-syslog = "${sysconfdir}/default/syslog"
 
 # This disables the syslog startup links in slugos (see slugos-init)
 INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
@@ -168,7 +169,11 @@ do_install () {
 
 	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
-		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
+	        sed -i -e 's,/etc/default/syslog,${sysconfdir}/default/syslog,' \
+	            ${D}${sysconfdir}/init.d/syslog.${PN}
+
+		install -d ${D}${sysconfdir}/default
+		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/default/syslog
 	fi
 	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
diff --git a/recipes/busybox/files/syslog b/recipes/busybox/files/syslog
index 61d273b..6e86346 100644
--- a/recipes/busybox/files/syslog
+++ b/recipes/busybox/files/syslog
@@ -5,8 +5,8 @@
 #               Configuration file added by <bruno.randolf@4g-systems.biz>
 set -e
 
-if [ -f /etc/syslog.conf ]; then
-	. /etc/syslog.conf
+if [ -f /etc/default/syslog ]; then
+	. /etc/default/syslog
 	LOG_LOCAL=0
 	LOG_REMOTE=0
 	for D in $DESTINATION; do
-- 
1.7.2.3



