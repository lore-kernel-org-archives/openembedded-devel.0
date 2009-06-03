Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MBxFm-0000JW-VY
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 22:40:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 242124CF09E;
	Wed,  3 Jun 2009 16:31:08 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14557-07; Wed,  3 Jun 2009 16:31:08 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 0374C4CF192; Wed,  3 Jun 2009 16:31:07 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id B47A24CEC7B;
	Wed,  3 Jun 2009 16:31:06 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id ACDF91B48A0; Wed,  3 Jun 2009 16:31:06 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 16:31:04 -0400
Message-Id: <1244061064-25155-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1244061064-25155-1-git-send-email-msmith@cbnco.com>
References: <1244060096.5049.60.camel@lenovo.internal.reciva.com>
	<1244061064-25155-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/2] busybox: Split syslog initscript into busybox-syslog
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
X-List-Received-Date: Wed, 03 Jun 2009 20:40:07 -0000

The same is already done for httpd and udhcpd.

This fixes Busybox deb upgrades: the prerm script was failing because
the last command "/etc/init.d/syslog stop", added by the update-rc.d
class, runs after the /bin/sh symlink has been removed.

Many images expect busybox to contain the syslog initscript, so busybox
RRECOMMENDS busybox-syslog.

busybox-{syslog,httpd,udhcpd} now RDEPEND on busybox, for consistency
with other packages in the recipe (e.g. busybox-mdev).

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/busybox/busybox.inc |   26 +++++++++++++++++++-------
 1 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index e312147..1f2731d 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -33,24 +33,34 @@ SRC_URI_append_nylon = " file://xargs-double-size.patch;patch=1"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
 EXTRA_OEMAKE_append = " CROSS=${HOST_PREFIX}"
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd"
+PACKAGES =+ "${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
+
 # We need this RRECOMMENDS because libc dlopens libgcc
 # and shlib mechanism can not detect it because its not
 # listed in the NEEDED field.
 RRECOMMENDS += "libgcc"
+
+# Make busybox recommend busybox-syslog for those images that expect it
+RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
+
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog ${sysconfdir}/syslog.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 
 FILES_${PN} += "${datadir}/udhcpc"
 
-INITSCRIPT_PACKAGES = "${PN} ${PN}-httpd ${PN}-udhcpd"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
+INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
-INITSCRIPT_NAME_${PN} = "syslog"
-CONFFILES_${PN} = "${sysconfdir}/syslog.conf"
+CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf"
 
 # This disables the syslog startup links in slugos (see slugos-init)
-INITSCRIPT_PARAMS_${PN}_slugos = "start 20 ."
+INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
+
+RDEPENDS_${PN}-httpd += "${PN}"
+RDEPENDS_${PN}-syslog += "${PN}"
+RDEPENDS_${PN}-udhcpd += "${PN}"
 
 # Use gcc for linking so LDFLAGS actually makes sense
 LD = "${CC} -nostdlib"
@@ -81,8 +91,10 @@ do_install () {
 	install -m 0755 ${S}/busybox ${D}${base_bindir}
 	ln -sf busybox ${D}${base_bindir}/sh
 
-	install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/
-	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
+	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
+		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/
+		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
+	fi
 	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
-- 
1.6.3



