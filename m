Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B268B6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:55:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 23:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; 
   d="scan'208";a="2574538"
Received: from tungchin-suna.ccr.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.6.144])
	by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2016 23:55:46 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2016 09:55:44 +0300
Message-Id: <20160830065545.21812-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-python][PATCH 1/2] python3-vcversioner: add recipe
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
X-List-Received-Date: Tue, 30 Aug 2016 06:55:50 -0000

python3-vcversioner is needed by other python3 modules so it's good to have
a recipe for it.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 .../python/python3-vcversioner_2.16.0.0.bb         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
new file mode 100644
index 0000000..189a65a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Python vcversioner, automagically update the project's version"
+HOMEPAGE = "https://github.com/habnabit/vcversioner"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=827a7a91a8d20d3c666b665cd96db8e3"
+
+SRC_URI[md5sum] = "aab6ef5e0cf8614a1b1140ed5b7f107d"
+SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b"
+
+inherit pypi setuptools3
+
+do_compile_append() {
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+
+do_install_append() {
+    install -m 0644 ${S}/vcversioner*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-subprocess \
+    "
+
+BBCLASSEXTEND = "native"
-- 
2.9.3


