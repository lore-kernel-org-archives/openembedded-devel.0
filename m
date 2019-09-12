Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 213D579C92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 00:37:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 17:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="336416202"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by orsmga004.jf.intel.com with ESMTP; 11 Sep 2019 17:37:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 08:36:58 +0800
Message-Id: <20190912003658.12448-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-defusedxml: add recipe
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
X-List-Received-Date: Thu, 12 Sep 2019 00:37:01 -0000
Content-Transfer-Encoding: 8bit

defusedxml is a pure Python package with modified subclasses of all
stdlib XML parsers that prevent any potentially malicious operation.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3-defusedxml_0.6.0.bb                | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
new file mode 100644
index 000000000..d041d0e6c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "XML bomb protection for Python stdlib modules"
+DESCRIPTION = "Python package with modified subclasses of all stdlib XML \
+parsers that prevent any potentially malicious operation."
+
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e"
+
+SRC_URI[md5sum] = "a59741f675c4cba649de40a99f732897"
+SRC_URI[sha256sum] = "f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5"
+
+inherit pypi setuptools3
-- 
2.21.0


