Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
	[217.70.183.201])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED4778DBD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:10:49 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 68A931BF208;
	Tue, 31 Jul 2018 03:10:49 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2018 20:09:37 -0700
Message-Id: <20180731030937.3685-6-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
References: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
X-Spam-Level: 
Subject: [meta-python][PATCH v2 5/5] python-behave: Add Python 3 recipe
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
X-List-Received-Date: Tue, 31 Jul 2018 03:10:50 -0000

Fix broken dependencies of Python 2 recipe as well.
---
 meta-python/recipes-devtools/python/python-behave.inc    | 15 +++++++++++++++
 .../recipes-devtools/python/python-behave_1.2.6.bb       | 16 +++++++---------
 .../recipes-devtools/python/python3-behave_1.2.6.bb      |  2 ++
 3 files changed, 24 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-behave.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python-behave.inc b/meta-python/recipes-devtools/python/python-behave.inc
new file mode 100644
index 000000000..ded75801d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-behave.inc
@@ -0,0 +1,15 @@
+SUMMARY = "A behavior-driven development framework, Python style"
+HOMEPAGE = "https://github.com/behave/behave"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
+
+SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
+SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-parse-type \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+    "
diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
index 679730262..66221682a 100644
--- a/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
@@ -1,10 +1,8 @@
-SUMMARY = "A behavior-driven development framework, Python style"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
+inherit setuptools
+require python-behave.inc
 
-SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
-SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
-
-RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil python-misc python-argparse python-xml python-enum34 python-parse python-parse-type python-six"
-
-inherit pypi setuptools
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-enum34 \
+    ${PYTHON_PN}-traceback2 \
+    "
diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
new file mode 100644
index 000000000..1c55871b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-behave.inc
-- 
2.16.4


