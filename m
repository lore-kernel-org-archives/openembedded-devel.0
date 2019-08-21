Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Aug 2019 04:24:02 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 048E77C377
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 04:24:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2019 21:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,410,1559545200"; d="scan'208";a="202896723"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2019 21:16:56 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2019 12:16:55 +0800
Message-Id: <20190821041655.29741-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ade: add recipe
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
X-List-Received-Date: Wed, 21 Aug 2019 04:24:03 -0000
Content-Transfer-Encoding: 8bit

ADE Framework is a graph construction, manipulation, and processing
framework.  ADE Framework is suitable for organizing data flow
processing and execution.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/opencv/ade_0.1.1f.bb | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/ade_0.1.1f.bb

diff --git a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
new file mode 100644
index 000000000..51e274d3f
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A graph construction, manipulation, and processing framework"
+DESCRIPTION = "ADE Framework is a graph construction, manipulation, \
+and processing framework. ADE Framework is suitable for \
+organizing data flow processing and execution."
+HOMEPAGE = "https://github.com/opencv/ade"
+
+SRC_URI = "git://github.com/opencv/ade.git;protocol=git \
+           "
+
+SRCREV = "58b2595a1a95cc807be8bf6222f266a9a1f393a9"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
+
+FILES_${PN}-dev += "${datadir}/ade/*.cmake"
-- 
2.21.0


