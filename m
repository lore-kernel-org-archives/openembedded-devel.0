Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C8D136A9C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 12:49:03 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 05:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="275273311"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.217])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 05:49:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2013 13:48:55 +0100
Message-Id: <18d045a5ea38ec48ff2456341c10fa11e959f25f.1375188498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375188498.git.paul.eggleton@linux.intel.com>
References: <cover.1375188498.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1375188498.git.paul.eggleton@linux.intel.com>
References: <cover.1375188498.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] pointercal-xinput: remove
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
X-List-Received-Date: Tue, 30 Jul 2013 12:49:04 -0000

This is now part of OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../pointercal-xinput/pointercal.xinput               |  1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb        | 19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
deleted file mode 100644
index 9633fc5..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
+++ /dev/null
@@ -1 +0,0 @@
-# replace with valid machine specific pointercal.xinput
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
deleted file mode 100644
index bfb952f..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r4"
-
-SRC_URI = "file://pointercal.xinput"
-S = "${WORKDIR}"
-
-do_install() {
-    # Only install file if it has a contents
-    if [ -s ${S}/pointercal.xinput ]; then
-        install -d ${D}${sysconfdir}/
-        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
-    fi
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
-- 
1.8.1.2


