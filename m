Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDA47E6F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:49:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2019 00:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="200693248"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.71.177])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2019 00:49:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 15:49:28 +0800
Message-Id: <20190912074928.29791-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAMKF1srcuBMHGVuNQ1E7hwWamPkg4Svo5i5dy_SMCM-5-WFmjg@mail.gmail.com>
References: <CAMKF1srcuBMHGVuNQ1E7hwWamPkg4Svo5i5dy_SMCM-5-WFmjg@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python3-networkx: add recipe
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
X-List-Received-Date: Thu, 12 Sep 2019 07:49:42 -0000
Content-Transfer-Encoding: 8bit

networkx only supports python3 starting v2.3. Move the common code to
.inc and remove python-2to3 RDEPENDS which is no longer needed:

https://github.com/networkx/networkx/commit/4e611d7ea90c20864daba912d6118220d5bbddf3

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-devtools/python/python-networkx.inc        | 10 ++++++++++
 .../recipes-devtools/python/python-networkx_2.2.bb     | 10 +++-------
 .../recipes-devtools/python/python3-networkx_2.3.bb    |  8 ++++++++
 3 files changed, 21 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-networkx.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-networkx_2.3.bb

diff --git a/meta-python/recipes-devtools/python/python-networkx.inc b/meta-python/recipes-devtools/python/python-networkx.inc
new file mode 100644
index 000000000..a4c31b2b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-networkx.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Python package for creating and manipulating graphs and networks"
+LICENSE = "BSD-3-Clause"
+
+inherit pypi
+
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += "\
+                   ${PYTHON_PN}-decorator \
+                   "
diff --git a/meta-python/recipes-devtools/python/python-networkx_2.2.bb b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
index a2381661c..648f0312f 100644
--- a/meta-python/recipes-devtools/python/python-networkx_2.2.bb
+++ b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
@@ -1,12 +1,8 @@
-DESCRIPTION = "Python package for creating and manipulating graphs and networks"
-LICENSE = "BSD-3-Clause"
+require python-networkx.inc
+
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3376ff7c9c58048c62d91431f7f08cde"
 
 SRC_URI[md5sum] = "82608a3686fb3e61f20cf13bfd3c1b4a"
 SRC_URI[sha256sum] = "45e56f7ab6fe81652fb4bc9f44faddb0e9025f469f602df14e3b2551c2ea5c8b"
 
-PYPI_PACKAGE_EXT = "zip"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-2to3"
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.3.bb b/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
new file mode 100644
index 000000000..8feb6daa3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
@@ -0,0 +1,8 @@
+require python-networkx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
+
+SRC_URI[md5sum] = "320d3f6c7872732baa63cedafddadea9"
+SRC_URI[sha256sum] = "8311ddef63cf5c5c5e7c1d0212dd141d9a1fe3f474915281b73597ed5f1d4e3d"
+
+inherit setuptools3
-- 
2.21.0


