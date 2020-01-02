Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D1CE67F822
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:03:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 002H39fj021979
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Jan 2020 09:03:09 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 2 Jan 2020 09:03:09 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 12:03:09 -0500
Message-ID: <20200102170309.2187663-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-twisted: fix broken MemoryReactor import
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
X-List-Received-Date: Thu, 02 Jan 2020 17:03:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Twisted's application/runner/test/test_runner.py was trying to import
from a deprecated module and failing. The module import has been
corrected and accepted in Twisted upstream, but there's no release
with it yet for Yocto to upgrade to, hence the backport.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python-twisted.inc                 |  5 +++
 ...r-import-in-test_runner-to-be-from-t.patch | 38 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 084123b97..d005a2ac2 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -7,6 +7,11 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
 
+# allow for common patches for python- and python3-twisted
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-twisted:"
+
+SRC_URI += "file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch"
+
 SRC_URI[sha256sum] = "7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d"
 SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
 
diff --git a/meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch b/meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
new file mode 100644
index 000000000..39fc7d43e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
@@ -0,0 +1,38 @@
+From 754f21282ad2775db8ff501d40bbc497faeb17ba Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 17 Dec 2019 15:09:22 -0500
+Subject: [PATCH] fix MemoryReactor import in test_runner to be from
+ twisted.internet.testing
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/754f21282ad2775db8ff501d40bbc497faeb17ba]
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ src/twisted/application/newsfragments/9746.misc    | 1 +
+ src/twisted/application/runner/test/test_runner.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 src/twisted/application/newsfragments/9746.misc
+
+diff --git a/src/twisted/application/newsfragments/9746.misc b/src/twisted/application/newsfragments/9746.misc
+new file mode 100644
+index 000000000..8b1378917
+--- /dev/null
++++ b/src/twisted/application/newsfragments/9746.misc
+@@ -0,0 +1 @@
++
+diff --git a/src/twisted/application/runner/test/test_runner.py b/src/twisted/application/runner/test/test_runner.py
+index 9abc3449a..cce495b12 100644
+--- a/src/twisted/application/runner/test/test_runner.py
++++ b/src/twisted/application/runner/test/test_runner.py
+@@ -15,7 +15,7 @@ from twisted.logger import (
+     LogLevel, LogPublisher, LogBeginner,
+     FileLogObserver, FilteringLogObserver, LogLevelFilterPredicate,
+ )
+-from twisted.test.proto_helpers import MemoryReactor
++from twisted.internet.testing import MemoryReactor
+ 
+ from ...runner import _runner
+ from .._exit import ExitStatus
+-- 
+2.24.1
+
-- 
2.24.1


