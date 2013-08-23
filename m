Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 079736B1FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:33:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 04:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="350624745"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.235])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2013 04:33:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 12:33:37 +0100
Message-Id: <da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377257565.git.paul.eggleton@linux.intel.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377257565.git.paul.eggleton@linux.intel.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Fri, 23 Aug 2013 11:33:54 -0000

This bbappend has effectively been merged into OE-Core, although the
log buffer size is the busybox default rather than 64K - layers may
change this either by providing their own /etc/default/busybox-syslog
file (when using systemd) or modifying the
CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
config.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-core/busybox/busybox/busybox-syslog.default |  1 -
 meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend        | 11 -----------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
 delete mode 100644 meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend

diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
deleted file mode 100644
index 8a21e6d..0000000
--- a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
+++ /dev/null
@@ -1 +0,0 @@
-OPTIONS="-C64"
diff --git a/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
deleted file mode 100644
index 7a2f0c3..0000000
--- a/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://busybox-syslog.default"
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
-}
-
-FILES_${PN}-syslog += "${sysconfdir}/default/busybox-syslog"
-- 
1.8.1.2


