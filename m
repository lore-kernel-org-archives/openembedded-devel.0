Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF06718F4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 21:23:58 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id 2MPx1p00J0BVjqb01MPyQx; Sun, 12 Oct 2014 14:23:58 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Oct 2014 16:23:49 -0500
Message-Id: <1413149029-4901-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [meta-networking][PATCH] ntp: create and package ntp home directory
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
X-List-Received-Date: Sun, 12 Oct 2014 21:24:00 -0000

This allows the base recipe and bbappends to reference persistent
mutable state such as a drift file.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-networking/recipes-support/ntp/ntp.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index f55a39a..fd29a78 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -36,7 +36,9 @@ EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readl
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ntp \
+NTP_USER_HOME ?= "/var/lib/ntp"
+USERADD_PARAM_${PN} = "--system --home-dir ${NTP_USER_HOME} \
+                       --no-create-home \
                        --shell /bin/false --user-group ntp"
 
 # NB: debug is default-enabled by NTP; keep it default-enabled here.
@@ -57,6 +59,9 @@ do_install_append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync
 
+    install -m 755 -d ${D}${NTP_USER_HOME}
+    chown ntp:ntp ${D}${NTP_USER_HOME}
+
     # Fix hardcoded paths in scripts
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
     sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
@@ -111,6 +116,7 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 RSUGGESTS_${PN} = "iana-etc"
 
 FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
+    ${NTP_USER_HOME} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
 "
 FILES_${PN}-tickadj = "${sbindir}/tickadj"
-- 
1.8.5.5


