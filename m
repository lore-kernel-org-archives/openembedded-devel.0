Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AC303602D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:44:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Sep 2019 19:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,542,1559545200"; d="scan'208";a="195555659"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2019 19:44:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2019 10:44:11 +0800
Message-Id: <1569293051-81789-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-test-generator: add recipe
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
X-List-Received-Date: Tue, 24 Sep 2019 02:44:14 -0000

Generator is a helper for generating test methods for nose
while still using unittest.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3-test-generator_0.1.2.bb                | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
new file mode 100644
index 0000000..14943a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Generator is a helper for generating test methods for nose while still using unittest."
+DESCRIPTION = "Python package with modified subclasses of all stdlib XML \
+parsers that prevent any potentially malicious operation."
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00"
+
+SRC_URI[md5sum] = "6c69e73ba5b4b3ed62f7bcda071c64f1"
+SRC_URI[sha256sum] = "ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-nose-native"
+
+RDEPENDS_${PN} += "python3-six"
-- 
2.7.4


