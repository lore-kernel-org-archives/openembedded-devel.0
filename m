Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BDD4A60720
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 13:35:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 06:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236077740"
Received: from summit.tm.intel.com ([10.237.55.152])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 06:35:47 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Oct 2017 16:35:46 +0300
Message-Id: <20171027133546.21563-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.15.0.rc1
Subject: [meta-oe][PATCH] mraa/upm: drop HAVE_NODEJS conditional
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
X-List-Received-Date: Fri, 27 Oct 2017 13:35:47 -0000

HAVE_NODEJS is a leftover from meta-refkit-core where the
layer had to adapt to different BBLAYER combinations (some
where nodejs wasn't available but mraa/upm were).

mraa/upm nodejs bindings currently fail to build (due to a problem
in swig with nodejs > v7.x) so we keep them disabled until a newer
version of swig lands in OE-core.

The commit adds BINDINGS overrides for armv4/5 to remind that nodejs
isn't available on those architectures.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 8 +++++++-
 meta-oe/recipes-extended/upm/upm_git.bb   | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 616048fac..c4b9c6f90 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -31,7 +31,13 @@ FILES_${PN}-utils = "${bindir}/"
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-mraa="python"
 # will result in only the python bindings being built/packaged.
-BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+# Note: 'nodejs' is disabled by default because the bindings
+# generation currently fails with nodejs (>v7.x).
+BINDINGS ??= "python"
+
+# nodejs isn't available for armv4/armv5 architectures
+BINDINGS_armv4 ??= "python"
+BINDINGS_armv5 ??= "python"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 38065ce53..a5c2bb321 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -26,7 +26,13 @@ inherit distutils3-base cmake
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
 # will result in only the python bindings being built/packaged.
-BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+# Note: 'nodejs' is disabled by default because the bindings
+# generation currently fails with nodejs (>v7.x).
+BINDINGS ??= "python"
+
+# nodejs isn't available for armv4/armv5 architectures
+BINDINGS_armv4 ??= "python"
+BINDINGS_armv5 ??= "python"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
-- 
2.11.0


