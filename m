Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2508078399
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 16:13:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 16 Aug 2017 09:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,383,1498546800"; d="scan'208";a="119662207"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.corp.intel.com)
	([10.254.118.231])
	by orsmga004.jf.intel.com with ESMTP; 16 Aug 2017 09:13:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Aug 2017 09:13:04 -0700
Message-Id: <1502899984-3160-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [meta-qt5][PATCH] meta-toolchain-qt5: don't rely on COREBASE/LICENSE
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
X-List-Received-Date: Wed, 16 Aug 2017 16:13:04 -0000

This file lists the licenses in use by OE-Core and it not a
proper license file, just use the COPYING.MIT.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 recipes-qt/meta/meta-toolchain-qt5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/meta/meta-toolchain-qt5.bb b/recipes-qt/meta/meta-toolchain-qt5.bb
index 8991176..2027b54 100644
--- a/recipes-qt/meta/meta-toolchain-qt5.bb
+++ b/recipes-qt/meta/meta-toolchain-qt5.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Meta package for building an installable Qt5 toolchain and SDK"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit populate_sdk populate_sdk_qt5
-- 
2.7.5


