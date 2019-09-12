Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 411B27E954
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 01:33:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 18:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189841748"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by orsmga006.jf.intel.com with ESMTP; 11 Sep 2019 18:33:59 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 09:33:54 +0800
Message-Id: <20190912013354.2924-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912013354.2924-1-anuj.mittal@intel.com>
References: <20190912013354.2924-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python3-networkx: add recipe
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
X-List-Received-Date: Thu, 12 Sep 2019 01:33:59 -0000
Content-Transfer-Encoding: 8bit

networkx only supports python3 starting v2.3. Move the common code to
.inc and remove python-2to3 RDEPENDS which is no longer needed:

https://github.com/networkx/networkx/commit/4e611d7ea90c20864daba912d6118220d5bbddf3

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-devtools/python/python-networkx.inc      | 10 ++++++++++
 .../recipes-devtools/python/python-networkx_2.2.bb   | 10 +++-------
 .../recipes-devtools/python/python3-networkx_2.3.bb  | 12 +++---------
 3 files changed, 16 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-networkx.inc

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
index da844ce1e..8feb6daa3 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
@@ -1,14 +1,8 @@
-DESCRIPTION = "Python package for creating and manipulating graphs and networks"
-LICENSE = "BSD-3-Clause"
+require python-networkx.inc
+
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
 
 SRC_URI[md5sum] = "320d3f6c7872732baa63cedafddadea9"
 SRC_URI[sha256sum] = "8311ddef63cf5c5c5e7c1d0212dd141d9a1fe3f474915281b73597ed5f1d4e3d"
 
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = "zip"
-
-RDEPENDS_${PN} += "\
-                   python3-decorator \
-                   "
+inherit setuptools3
-- 
2.21.0


