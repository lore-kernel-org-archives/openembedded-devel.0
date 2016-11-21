Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 47111607A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 15:20:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2016 07:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="789102836"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2016 07:20:48 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:20:45 +0200
Message-Id: <1479741645-2318-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1479741645-2318-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1479741645-2318-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] rsyslog: don't use update-alternatives to manage init script
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
X-List-Received-Date: Mon, 21 Nov 2016 15:20:47 -0000

Also, explicitly conflict with other syslog providers.

[YOCTO #10433]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb | 34 +++-------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index 7242323..c0e0a6d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
 SRC_URI[md5sum] = "ad0f25f429aa2daa326732950a5eeb6c"
 SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca"
 
-inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
+inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages"
 
@@ -114,7 +114,7 @@ do_install_ptest() {
 
 do_install_append() {
     install -d "${D}${sysconfdir}/init.d"
-    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog.${BPN}
+    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
     install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
     install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.rsyslog
 }
@@ -124,20 +124,10 @@ FILES_${PN} += "${bindir}"
 INITSCRIPT_NAME = "syslog"
 INITSCRIPT_PARAMS = "defaults"
 
-# higher than sysklogd's 100
-ALTERNATIVE_PRIORITY = "110"
-
-ALTERNATIVE_${PN} = "syslogd syslog-conf syslog-logrotate"
-
-ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
-ALTERNATIVE_TARGET[syslogd] = "${sbindir}/rsyslogd"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
-ALTERNATIVE_TARGET[syslog-conf] = "${sysconfdir}/rsyslog.conf"
-ALTERNATIVE_LINK_NAME[syslog-logrotate] = "${sysconfdir}/logrotate.d/syslog"
-ALTERNATIVE_TARGET[syslog-logrotate] = "${sysconfdir}/logrotate.rsyslog"
-
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
 
+RCONFLICTS_${PN} = "busybox-syslog sysklogd syslog-ng"
+
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
@@ -154,19 +144,3 @@ VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
 RDEPENDS_${PN}-ptest += "make diffutils gzip bash gawk coreutils procps"
 RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
-
-# no syslog-init for systemd
-python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        sysconfdir = d.getVar('sysconfdir', True)
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
-
-    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        pn = d.getVar('PN', True)
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
-}
-- 
2.6.6


