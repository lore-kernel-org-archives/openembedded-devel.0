Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
	[217.70.183.201])
	by mail.openembedded.org (Postfix) with ESMTP id 6772478DB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:10:46 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EB1F31BF205;
	Tue, 31 Jul 2018 03:10:45 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2018 20:09:36 -0700
Message-Id: <20180731030937.3685-5-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
References: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
X-Spam-Level: 
Subject: [meta-python][PATCH v2 4/5] python-parse-type: Add Python 3 recipe
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
X-List-Received-Date: Tue, 31 Jul 2018 03:10:47 -0000

Clarify license from BSD to BSD-3-Clause.
---
 meta-python/recipes-devtools/python/python-parse-type.inc   | 12 ++++++++++++
 .../recipes-devtools/python/python-parse-type_0.4.2.bb      | 13 ++-----------
 .../recipes-devtools/python/python3-parse-type_0.4.2.bb     |  2 ++
 3 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-parse-type.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc b/meta-python/recipes-devtools/python/python-parse-type.inc
new file mode 100644
index 000000000..4549ec98b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse-type.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Simplifies building parse types based on the parse module"
+HOMEPAGE = "https://github.com/jenisys/parse_type"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
+
+SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
+SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
+
+PYPI_PACKAGE = "parse_type"
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-parse"
diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
index b516c5912..8e10e801c 100644
--- a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
@@ -1,11 +1,2 @@
-SUMMARY = "Simplifies building parse types based on the parse module"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
-PYPI_PACKAGE = "parse_type"
-
-SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
-SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
-
-RDEPENDS_${PN} += "python-parse"
-
-inherit pypi setuptools
+inherit setuptools
+require python-parse-type.inc
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
new file mode 100644
index 000000000..91d9ce2d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-parse-type.inc
-- 
2.16.4


