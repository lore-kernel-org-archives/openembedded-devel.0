Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id EF00071A99
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:34:43 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v05HChwg027191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 5 Jan 2017 18:12:43 +0100
Received: from dev.sbt.siemens.com ([139.16.29.3])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v05HCaHD005092;
	Thu, 5 Jan 2017 18:12:42 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:12:30 +0100
Message-Id: <1483636352-22096-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483636352-22096-1-git-send-email-pascal.bach@siemens.com>
References: <1483636352-22096-1-git-send-email-pascal.bach@siemens.com>
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH 2/4] python-pytz: provide both python2 and python3 packages
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
X-List-Received-Date: Thu, 05 Jan 2017 17:34:44 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-pytz.inc     | 15 +++++++++++++++
 .../recipes-devtools/python/python-pytz_2016.7.bb       | 17 ++---------------
 .../recipes-devtools/python/python3-pytz_2016.7.bb      |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100755 meta-python/recipes-devtools/python/python-pytz.inc
 mode change 100644 => 100755 meta-python/recipes-devtools/python/python-pytz_2016.7.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-pytz_2016.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
new file mode 100755
index 0000000..19be2c7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -0,0 +1,15 @@
+SUMMARY = "World timezone definitions, modern and historical"
+HOMEPAGE = "http://pythonhosted.org/pytz"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
+
+inherit pypi
+
+SRC_URI[md5sum] = "8660ba7c3c0abd23e6e4efa493b02966"
+SRC_URI[sha256sum] = "8787de03f35f31699bcaf127e56ad14c00647965ed24d72dbaca87c6e4f843a3"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.7.bb b/meta-python/recipes-devtools/python/python-pytz_2016.7.bb
old mode 100644
new mode 100755
index 508fd3b..f2ffc59
--- a/meta-python/recipes-devtools/python/python-pytz_2016.7.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2016.7.bb
@@ -1,15 +1,2 @@
-SUMMARY = "World timezone definitions, modern and historical"
-HOMEPAGE = " http://pythonhosted.org/pytz"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
-
-SRC_URI[md5sum] = "8660ba7c3c0abd23e6e4efa493b02966"
-SRC_URI[sha256sum] = "8787de03f35f31699bcaf127e56ad14c00647965ed24d72dbaca87c6e4f843a3"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-threading \
-"
+inherit setuptools
+require python-pytz.inc
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2016.7.bb b/meta-python/recipes-devtools/python/python3-pytz_2016.7.bb
new file mode 100755
index 0000000..19a89dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytz_2016.7.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pytz.inc
-- 
2.1.4


