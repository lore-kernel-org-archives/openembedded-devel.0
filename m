Return-Path: <robert.joslyn@redrectangle.org>
Received: from slow1-d.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 67EE178D64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 03:39:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id CAC263A233D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:16:41 +0200 (CEST)
X-Originating-IP: 204.52.246.158
Received: from localhost.localdomain (eastside-a.concentrator.fsr.net
	[204.52.246.158])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C7305E0005;
	Mon, 30 Jul 2018 02:16:39 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jul 2018 19:16:11 -0700
Message-Id: <20180730021613.26889-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
References: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
X-Spam-Level: 
Subject: [meta-python][PATCH 3/5] python-parse: Update to 1.8.4 and add Python 3 version
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
X-List-Received-Date: Mon, 30 Jul 2018 03:39:55 -0000

Correct the license to MIT. The PyPI metadata says BSD, but the license
text in the code is actually MIT.
---
 meta-python/recipes-devtools/python/python-parse.inc       | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-parse_1.8.2.bb  | 13 -------------
 meta-python/recipes-devtools/python/python-parse_1.8.4.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-parse_1.8.4.bb |  2 ++
 4 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-parse.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-parse_1.8.4.bb

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
new file mode 100644
index 000000000..2510b27ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Parse strings using a specification based on the Python format() syntax"
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
diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb b/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
deleted file mode 100644
index 8e16372c5..000000000
--- a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Parse strings using a specification based on the Python format() syntax"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1191;endline=1209;md5=5147afdd9b3615290ad8733f0137a1a1"
-
-SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
-SRC_URI[sha256sum] = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    "
diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
new file mode 100644
index 000000000..d31ccc72a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
@@ -0,0 +1,2 @@
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


