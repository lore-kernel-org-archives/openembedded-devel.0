Return-Path: <james.feist@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C4D1074583
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 17:15:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 10:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,369,1534834800"; d="scan'208";a="96693854"
Received: from skyhawk.jf.intel.com ([10.54.51.81])
	by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2018 10:15:50 -0700
From: James Feist <james.feist@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2018 10:14:18 -0700
Message-Id: <20181011171418.35757-1-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] nlohmann-json: Add symlink to json.hpp and update to 3.3.0
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
X-List-Received-Date: Thu, 11 Oct 2018 17:15:49 -0000

nlohmann-json has examples in their repo that refer to
the header as json.hpp directly, as such many packages
that require nlohmann-json expect json.hpp and not
nlohmann/json.hpp as the cmake file installs. Create symlink
so that access is available by either option. Also update
to release 3.3.0.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 .../nlohmann-json/nlohmann-json_git.bb                 | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
index a89b659ae..c1e108b38 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=9a8ae1c2d606c432a2aa2e2de15be22a"
 
 SRC_URI = "git://github.com/nlohmann/json.git"
 
-PV = "3.2.0+git${SRCPV}"
+PV = "3.3.0+git${SRCPV}"
 
-SRCREV = "8c20571136f2d5351b379a06ad6591bd980880fe"
+SRCREV = "f1768a540a7b7c5cc30cdcd6be9e9ef91083719b"
 
 S = "${WORKDIR}/git"
 
@@ -21,3 +21,9 @@ EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+# other packages commonly reference the file directly as "json.hpp"
+# create symlink to allow this usage
+do_install_append() {
+    ln -s nlohmann/json.hpp ${D}${includedir}/json.hpp
+}
-- 
2.17.1


