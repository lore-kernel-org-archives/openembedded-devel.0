Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DF48D6FDA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 17:35:11 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jun 2014 10:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,495,1400050800"; d="scan'208";a="446620683"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.19])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2014 10:35:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 18:34:58 +0100
Message-Id: <14cda656c80f03fb7372190496a31adfa610bd14.1403026461.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403026460.git.paul.eggleton@linux.intel.com>
References: <cover.1403026460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1403026460.git.paul.eggleton@linux.intel.com>
References: <cover.1403026460.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/3] pv: upgrade to 1.5.3
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
X-List-Received-Date: Tue, 17 Jun 2014 17:35:14 -0000

Autotools breakage fixed upstream (which also fixes the S!=B issue).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/pv/{pv_1.4.6.bb => pv_1.5.3.bb} | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/pv/{pv_1.4.6.bb => pv_1.5.3.bb} (55%)

diff --git a/meta-oe/recipes-support/pv/pv_1.4.6.bb b/meta-oe/recipes-support/pv/pv_1.5.3.bb
similarity index 55%
rename from meta-oe/recipes-support/pv/pv_1.4.6.bb
rename to meta-oe/recipes-support/pv/pv_1.5.3.bb
index 8aec14c..5695412 100644
--- a/meta-oe/recipes-support/pv/pv_1.4.6.bb
+++ b/meta-oe/recipes-support/pv/pv_1.5.3.bb
@@ -4,14 +4,8 @@ LICENSE = "Artistic-License-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d55ff76f5caa83efc23aa527dbb0b191"
-SRC_URI[sha256sum] = "edfea0033ec6222eb60b4ec6d905dd2dccdb5900beef03f67f42ca9ed67e9fe2"
+SRC_URI[md5sum] = "efe8e9e4cad5f3264a32258a63bf2c8e"
+SRC_URI[sha256sum] = "76f3999b1c3b3027163dce6ef667cdf8dafb75218ee25e54a03bfe590478f90e"
 
 inherit autotools
 
-# broken autotools
-do_configure() {
-	cp ${S}/autoconf/configure.in ${S}
-	gnu-configize --force
-	oe_runconf
-}
-- 
1.9.3


