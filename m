Return-Path: <james.feist@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEA079A37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 23:22:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2018 16:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,342,1534834800"; d="scan'208";a="78831582"
Received: from skyhawk.jf.intel.com ([10.54.51.81])
	by orsmga008.jf.intel.com with ESMTP; 04 Oct 2018 16:18:28 -0700
From: James Feist <james.feist@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2018 16:15:37 -0700
Message-Id: <20181004231537.23403-1-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] nlohmann-json: Add recipe
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
X-List-Received-Date: Thu, 04 Oct 2018 23:22:51 -0000

nlohmann-json is a c++ header-only json library.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 .../nlohmann-json/nlohmann-json_git.bb        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
new file mode 100644
index 000000000..a89b659ae
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "JSON for modern C++"
+HOMEPAGE = "https://nlohmann.github.io/json/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=9a8ae1c2d606c432a2aa2e2de15be22a"
+
+SRC_URI = "git://github.com/nlohmann/json.git"
+
+PV = "3.2.0+git${SRCPV}"
+
+SRCREV = "8c20571136f2d5351b379a06ad6591bd980880fe"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
+
+# nlohmann-json is a header only C++ library, so the main package will be empty.
+
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


