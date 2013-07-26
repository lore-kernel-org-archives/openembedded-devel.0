Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 12FC46B31D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 14:25:26 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2013 07:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="273748270"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2013 07:25:25 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jul 2013 17:25:29 +0300
Message-Id: <1374848729-19835-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2] lvm2: Add dependency on bash
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
X-List-Received-Date: Fri, 26 Jul 2013 14:25:26 -0000

Fixes rootfs generation error if bash is not included in the image.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 1f3b62e..cd5a339 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,10 +1,10 @@
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-DEPENDS = "udev"
+DEPENDS = "udev bash"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r1"
+INC_PR = "r2"
 
 
 S = "${WORKDIR}/LVM2.${PV}"
-- 
1.7.9.5


