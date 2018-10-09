Return-Path: <james.feist@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 26F5A6E672
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 20:13:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Oct 2018 13:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,361,1534834800"; d="scan'208";a="87035841"
Received: from skyhawk.jf.intel.com ([10.54.51.81])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2018 13:13:06 -0700
From: James Feist <james.feist@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 13:11:52 -0700
Message-Id: <20181009201152.4057-1-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] valijson: Add recipe
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
X-List-Received-Date: Tue, 09 Oct 2018 20:13:05 -0000

valijson is a header only c++ library for JSON
schema validation.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 .../recipes-devtools/valijson/valijson_git.bb | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb

diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb b/meta-oe/recipes-devtools/valijson/valijson_git.bb
new file mode 100644
index 000000000..bcceb6884
--- /dev/null
+++ b/meta-oe/recipes-devtools/valijson/valijson_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Header-only C++ library for JSON Schema validation"
+HOMEPAGE = "https://github.com/tristanpenman/valijson"
+LICENSE = "BSD"
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
+
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+# valijson expects json.hpp where nlohmann-json_git.bb installs
+# nlohmann/json.hpp, this allows usage via json.hpp
+do_install_append() {
+    ln -rs ${D}${includedir}/nlohmann/json.hpp ${D}${includedir}/json.hpp
+}
-- 
2.17.1


