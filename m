Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 08CA571A8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:34:42 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v05HCbTr027053
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 5 Jan 2017 18:12:37 +0100
Received: from dev.sbt.siemens.com ([139.16.29.3])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v05HCaHC005092;
	Thu, 5 Jan 2017 18:12:37 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:12:29 +0100
Message-Id: <1483636352-22096-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH 1/4] python-chardet: provide both python2 and python3 packages
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
X-List-Received-Date: Thu, 05 Jan 2017 17:34:43 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-chardet.inc       |  8 ++++++++
 meta-python/recipes-devtools/python/python-chardet_2.3.0.bb  | 10 ++--------
 meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb |  2 ++
 3 files changed, 12 insertions(+), 8 deletions(-)
 create mode 100755 meta-python/recipes-devtools/python/python-chardet.inc
 mode change 100644 => 100755 meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
new file mode 100755
index 0000000..60305e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Universal encoding detector for Python 2 and 3"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+inherit pypi
+
+SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
+SRC_URI[sha256sum] = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
old mode 100644
new mode 100755
index dfc979b..b7a46e9
--- a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
@@ -1,8 +1,2 @@
-SUMMARY = "Universal encoding detector for Python 2 and 3"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
-SRC_URI[sha256sum] = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
-
-inherit pypi setuptools
+inherit setuptools
+require python-chardet.inc
diff --git a/meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb
new file mode 100755
index 0000000..038043c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-chardet_2.3.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-chardet.inc
-- 
2.1.4


