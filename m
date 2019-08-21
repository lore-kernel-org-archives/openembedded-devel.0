Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 21C566D409
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 14:55:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2019 16:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,414,1559545200"; d="scan'208";a="207927533"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.192])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2019 16:33:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 07:33:16 +0800
Message-Id: <20190821233316.27076-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAMKF1soxLZTRZ42HiMGkTpoN827YN+UTs3THpr8EX+_Kw8jgJg@mail.gmail.com>
References: <CAMKF1soxLZTRZ42HiMGkTpoN827YN+UTs3THpr8EX+_Kw8jgJg@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] ade: add recipe
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
X-List-Received-Date: Thu, 22 Aug 2019 14:55:08 -0000
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
index 000000000..332820d14
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A graph construction, manipulation, and processing framework"
+DESCRIPTION = "ADE Framework is a graph construction, manipulation, \
+and processing framework. ADE Framework is suitable for \
+organizing data flow processing and execution."
+HOMEPAGE = "https://github.com/opencv/ade"
+
+SRC_URI = "git://github.com/opencv/ade.git \
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
+FILES_${PN}-dev += "${datadir}/${BPN}/*.cmake"
-- 
2.21.0


