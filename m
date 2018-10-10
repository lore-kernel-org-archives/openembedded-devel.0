Return-Path: <james.feist@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A61F679A57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 23:15:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2018 16:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,366,1534834800"; d="scan'208";a="77843515"
Received: from skyhawk.jf.intel.com ([10.54.51.81])
	by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2018 16:14:53 -0700
From: James Feist <james.feist@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Oct 2018 16:13:37 -0700
Message-Id: <20181010231337.46391-1-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] valijson: Add recipe
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
X-List-Received-Date: Wed, 10 Oct 2018 23:15:38 -0000

valijson is a header only c++ library for JSON
schema validation.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---

Changes since v1:
    - Fixed license
    - Simplified symlink
    - Removed extra whitespace

 .../recipes-devtools/valijson/valijson_git.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb

diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb b/meta-oe/recipes-devtools/valijson/valijson_git.bb
new file mode 100644
index 000000000..e7edab646
--- /dev/null
+++ b/meta-oe/recipes-devtools/valijson/valijson_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Header-only C++ library for JSON Schema validation"
+HOMEPAGE = "https://github.com/tristanpenman/valijson"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
+
+SRC_URI = "git://github.com/tristanpenman/valijson.git"
+PV = "0.1+git${SRCPV}"
+
+SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
+
+# valijson is a header only C++ library, so the main package will be empty.
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+# valijson expects json.hpp where nlohmann-json_git.bb installs
+# nlohmann/json.hpp, this allows usage via json.hpp
+do_install_append() {
+    ln -s nlohmann/json.hpp ${D}${includedir}/json.hpp
+}
-- 
2.17.1


