Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 80B8C71A1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 15:20:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2016 07:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="789102835"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2016 07:20:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:20:44 +0200
Message-Id: <1479741645-2318-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1479741645-2318-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1479741645-2318-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] syslog-ng: don't use update-alternatives to manage init script
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
X-List-Received-Date: Mon, 21 Nov 2016 15:20:46 -0000

Also, explicitly conflict with other syslog providers.

[YOCTO #10433]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 898e9c2..0acdd73 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source
            file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
 "
 
-inherit autotools systemd pkgconfig update-alternatives update-rc.d
+inherit autotools systemd pkgconfig update-rc.d
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
@@ -70,7 +70,7 @@ do_install_append() {
     install -d ${D}/${sysconfdir}/${BPN}
     install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
     install -d ${D}/${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${BPN}
+    install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog
     install -d ${D}/${sysconfdir}/default/volatiles/
     install -m 755 ${WORKDIR}/volatiles.03_syslog-ng ${D}/${sysconfdir}/default/volatiles/03_syslog-ng
     install -d ${D}/${localstatedir}/lib/${BPN}
@@ -96,26 +96,12 @@ CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
+RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
+
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
-# no syslog-init for systemd
-python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        sysconfdir = d.getVar('sysconfdir', True)
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_PRIORITY', 'syslog-init', '200')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
-
-    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        pn = d.getVar('PN', True)
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/${BPN}.service' % (d.getVar('systemd_unitdir', True)))
-}
-
 INITSCRIPT_NAME = "syslog"
 INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
-- 
2.6.6


