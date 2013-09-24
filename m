Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0A17E610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:54:26 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Sep 2013 05:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,970,1371106800"; d="scan'208";a="298714464"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.52])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2013 05:54:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 13:54:15 +0100
Message-Id: <1380027255-15489-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] lowpan-tools: add git version
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
X-List-Received-Date: Tue, 24 Sep 2013 12:54:27 -0000

The 0.3 release was a year ago and git HEAD contains fixes to make it
work with contiki, so build from git instead of backporting all of the
patches.

Based on a patch by Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../lowpan-tools/lowpan-tools_git.bb               | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
new file mode 100644
index 0000000..cf78b45
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Utilities for managing the Linux LoWPAN stack"
+DESCRIPTION = "This is a set of utils to manage the Linux LoWPAN stack. \
+The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE 802.15.4-2006) compatibility."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "libnl python"
+
+PV = "0.3+git${SRCPV}"
+SRC_URI = "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee"
+SRCREV = "a1d9615adde6d1a568813c24a128273ed755af04"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_install_append() {
+	rmdir ${D}${localstatedir}/run
+}
+
+FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/python*"
-- 
1.8.1.2


