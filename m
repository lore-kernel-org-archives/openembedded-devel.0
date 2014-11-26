Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2209360030
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 11:49:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Nov 2014 03:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,462,1413270000"; d="scan'208";a="643812171"
Received: from ambyrne1-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.108])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2014 03:49:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 11:47:33 +0000
Message-Id: <1417002453-12668-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-systemd][PATCH] at: systemd support now in OE-Core
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
X-List-Received-Date: Wed, 26 Nov 2014 11:49:54 -0000

systemd support has already been added to the OE-Core at recipe based on
this file (in the dizzy branch).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-systemd/oe-core/recipes-extended/at/at/atd.service |  9 ---------
 meta-systemd/oe-core/recipes-extended/at/at_%.bbappend  | 12 ------------
 2 files changed, 21 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-extended/at/at/atd.service

diff --git a/meta-systemd/oe-core/recipes-extended/at/at/atd.service b/meta-systemd/oe-core/recipes-extended/at/at/atd.service
deleted file mode 100644
index 64a9015..0000000
--- a/meta-systemd/oe-core/recipes-extended/at/at/atd.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=Job spooling tools
-After=syslog.target
-
-[Service]
-ExecStart=/usr/sbin/atd -f
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend b/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
index 3a22fe3..181b878 100644
--- a/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
@@ -1,16 +1,4 @@
-inherit systemd
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://atd.service"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "atd.service"
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
-}
 
-- 
1.9.3


