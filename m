Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 46389701F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:14:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2014 09:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="586134165"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 09:14:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:14:44 +0100
Message-Id: <3feb570da8202d17ad125b0de9ce6f4aeee52ce8.1407687153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 4/5] cronie: systemd support now in OE-Core
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
X-List-Received-Date: Sun, 10 Aug 2014 16:14:59 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../oe-core/recipes-extended/cronie/cronie/crond.service    | 10 ----------
 .../oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend  | 13 -------------
 2 files changed, 23 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service

diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service b/meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service
deleted file mode 100644
index 5ae193b..0000000
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Periodic Command Scheduler
-
-[Service]
-ExecStart=/usr/sbin/crond -n
-ExecReload=/bin/kill -HUP $MAINPID
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
index 8f45f3e..181b878 100644
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
@@ -1,17 +1,4 @@
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-inherit systemd
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "crond.service"
-
-SRC_URI += "file://crond.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
-}
 
-- 
1.9.3


