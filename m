Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F310714B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:41:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Sep 2014 07:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="387425251"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2014 07:36:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Sep 2014 15:41:25 +0100
Message-Id: <192e5fb793865e4f0e0b0f86d9b216e1f427f6d4.1410964797.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 3/4] portmap: systemd support now in OE-Core
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
X-List-Received-Date: Wed, 17 Sep 2014 14:41:55 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-connectivity/portmap/portmap/portmap.service      | 10 ----------
 .../oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend | 11 -----------
 2 files changed, 21 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/portmap/portmap/portmap.service

diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap/portmap.service b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap/portmap.service
deleted file mode 100644
index cffb56c..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap/portmap.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Portmap
-
-[Service]
-Type=oneshot
-ExecStart=/sbin/portmap -l
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index f13b511..6ce6e70 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -1,16 +1,5 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
-
-inherit systemd
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "portmap.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-SRC_URI_append = " file://portmap.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
-}
-- 
1.9.3


