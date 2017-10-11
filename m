Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9275760123
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 07:35:27 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 11 Oct 2017 00:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,360,1503385200"; d="scan'208";a="137340058"
Received: from summit.tm.intel.com ([10.237.55.21])
	by orsmga004.jf.intel.com with ESMTP; 11 Oct 2017 00:35:27 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Oct 2017 10:35:21 +0300
Message-Id: <20171011073521.15508-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.15.0.rc0
Subject: [meta-oe][PATCH] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Wed, 11 Oct 2017 07:35:27 -0000

HAVE_NODEJS is a leftover from meta-refkit-core where the
layer had to adapt to different BBLAYER combinations (some
where nodejs wasn't available but mraa/upm were).

Since that check is no longer needed and nodejs is in fact
part of meta-oe, nodejs bindings can be enabled by default.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 2 +-
 meta-oe/recipes-extended/upm/upm_git.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 616048fac..56557cca8 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -31,7 +31,7 @@ FILES_${PN}-utils = "${bindir}/"
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-mraa="python"
 # will result in only the python bindings being built/packaged.
-BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+BINDINGS ??= "python nodejs"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 38065ce53..a258ac8b2 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -26,7 +26,7 @@ inherit distutils3-base cmake
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
 # will result in only the python bindings being built/packaged.
-BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+BINDINGS ??= "python nodejs"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
-- 
2.11.0


