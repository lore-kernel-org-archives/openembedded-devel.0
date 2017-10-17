Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C6A967821B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 11:55:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2017 04:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,390,1503385200"; d="scan'208";a="164030747"
Received: from summit.tm.intel.com ([10.237.55.126])
	by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2017 04:55:48 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 14:55:39 +0300
Message-Id: <20171017115539.13778-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017105132.GB4387@jama>
References: <20171017105132.GB4387@jama>
Subject: [meta-oe][PATCH v3] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Tue, 17 Oct 2017 11:55:48 -0000

HAVE_NODEJS is a leftover from meta-refkit-core where the
layer had to adapt to different BBLAYER combinations (some
where nodejs wasn't available but mraa/upm were).

Since that check is no longer needed and nodejs is in fact
part of meta-oe, nodejs bindings can be enabled by default
(with exceptions for armv4 and armv5 where nodejs isn't
available).

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++++-
 meta-oe/recipes-extended/upm/upm_git.bb   | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 616048fac..b93fd72c8 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -31,7 +31,11 @@ FILES_${PN}-utils = "${bindir}/"
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-mraa="python"
 # will result in only the python bindings being built/packaged.
-BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+BINDINGS ??= "python nodejs"
+
+# nodejs isn't available for armv4/armv5 architectures
+BINDINGS_armv4 ??= "python"
+BINDINGS_armv5 ??= "python"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 38065ce53..da1e4add5 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -26,7 +26,11 @@ inherit distutils3-base cmake
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
 # will result in only the python bindings being built/packaged.
-BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
+BINDINGS ??= "python nodejs"
+
+# nodejs isn't available for armv4/armv5 architectures
+BINDINGS_armv4 ??= "python"
+BINDINGS_armv5 ??= "python"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
-- 
2.11.0


