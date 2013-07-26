Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9136B31D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 14:20:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2013 07:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="352212058"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2013 07:20:52 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jul 2013 17:20:56 +0300
Message-Id: <1374848456-19550-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] ebtables: Load ebtables kernel module
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
X-List-Received-Date: Fri, 26 Jul 2013 14:20:53 -0000

Ebtables needs some kernel configs options to work properly. The standard yocto
kernel config includes these as modules. Add code to load the ebtables module.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 78e069a..6ac886e 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -2,10 +2,13 @@ SUMMARY = "Utility for basic Ethernet frame filtering on a Linux bridge, MAC NAT
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "console/network"
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} += "perl"
 
+RRECOMMENDS_${PN} += "kernel-module-ebtables \
+    "
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://installnonroot.patch \
            file://01debian_defaultconfig.patch \
-- 
1.7.9.5


