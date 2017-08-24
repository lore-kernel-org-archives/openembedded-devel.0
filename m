Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB60078296
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 17:59:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Aug 2017 10:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,422,1498546800"; d="scan'208";a="1187817381"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2017 10:59:25 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 10:59:24 -0700
Message-Id: <20170824175924.24094-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-python][PATCH] python*-pylint: upgrade to v1.7.2 and fix qa error
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
X-List-Received-Date: Thu, 24 Aug 2017 17:59:26 -0000

Fix file-rdeps error about "#!/usr/bin/python" in python3-pylint
by inheriting python*-dir so we can change to "#!/usr/bin/env ${PYTHON_PN}"
in ${PYTHON_SITEPACKAGES_DIR}.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-pylint.inc                | 5 +++--
 .../python/{python-pylint_1.6.5.bb => python-pylint_1.7.2.bb}        | 2 +-
 meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb          | 2 --
 meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb          | 2 ++
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.6.5.bb => python-pylint_1.7.2.bb} (75%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
index 18be8a191..3ce1cae21 100644
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "31da2185bf59142479e4fa16d8a9e347"
-SRC_URI[sha256sum] = "a673984a8dd78e4a8b8cfdee5359a1309d833cf38405008f4a249994a8456719"
+SRC_URI[md5sum] = "27ee752cdcfacb05bf4940947e6b35c6"
+SRC_URI[sha256sum] = "ea6afb93a9ed810cf52ff3838eb3a15e2bf6a81b80de0eaede1ce442caa5ca69"
 
 inherit pypi
 
@@ -28,4 +28,5 @@ from pylint import run_pylint
 run_pylint()
 EOF
     chmod 755 ${D}${bindir}/pylint
+    sed -i -e 's:^#!/usr/bin/python:#!/usr/bin/env\ ${PYTHON_PN}:g' ${D}/${PYTHON_SITEPACKAGES_DIR}/pylint/test/data/ascript
 }
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb b/meta-python/recipes-devtools/python/python-pylint_1.7.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.7.2.bb
index 47ab36a3b..7b51d3fbd 100644
--- a/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
+++ b/meta-python/recipes-devtools/python/python-pylint_1.7.2.bb
@@ -1,4 +1,4 @@
-inherit setuptools
+inherit setuptools python-dir
 require python-pylint.inc
 
 RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb b/meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb
deleted file mode 100644
index fed65b303..000000000
--- a/meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-pylint.inc
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb b/meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb
new file mode 100644
index 000000000..563e8316c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 python3-dir
+require python-pylint.inc
-- 
2.13.5


