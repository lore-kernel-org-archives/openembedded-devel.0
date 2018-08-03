Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	by mail.openembedded.org (Postfix) with ESMTP id 25A2B78E30
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 03:27:40 +0000 (UTC)
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id E6D2B240008;
	Fri,  3 Aug 2018 03:27:40 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2018 20:27:02 -0700
Message-Id: <20180803032704.3521-4-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180803032704.3521-1-robert.joslyn@redrectangle.org>
References: <20180803032704.3521-1-robert.joslyn@redrectangle.org>
Subject: [meta-python][PATCH v3 3/5] python3-parse: Add recipe
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
X-List-Received-Date: Fri, 03 Aug 2018 03:27:41 -0000

Correct the license to MIT. The PyPI metadata says BSD, but the license
text in the code is actually MIT.
---
 meta-python/recipes-devtools/python/python-parse.inc      | 14 ++++++++++++++
 meta-python/recipes-devtools/python/python-parse_1.8.4.bb | 15 ++-------------
 .../recipes-devtools/python/python3-parse_1.8.4.bb        |  2 ++
 3 files changed, 18 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-parse.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-parse_1.8.4.bb

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
new file mode 100644
index 000000000..fa55a93c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Parse strings using a specification based on the Python format() syntax"
+HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"
+
+SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
+SRC_URI[sha256sum] = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    "
diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
index c66d4c8a2..d31ccc72a 100644
--- a/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
+++ b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Parse strings using a specification based on the Python format() syntax"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"
-
-SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
-SRC_URI[sha256sum] = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    "
+inherit setuptools
+require python-parse.inc
diff --git a/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb
new file mode 100644
index 000000000..b1242545c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-parse.inc
-- 
2.16.4


