Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 513DD77CCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 16:52:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w28GqVSu011521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Mar 2018 08:52:31 -0800 (PST)
Received: from localhost.localdomain (128.224.125.89) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Mar 2018 08:51:56 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Mar 2018 18:54:55 +0200
Message-ID: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python] [PATCH 1/4] python-pynetlinux: add recipe for 1.1 version
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
X-List-Received-Date: Thu, 08 Mar 2018 16:52:30 -0000
Content-Type: text/plain

Linux network configuration library for Python.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta-python/recipes-devtools/python/python-pynetlinux.inc     | 11 +++++++++++
 meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pynetlinux.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pynetlinux.inc b/meta-python/recipes-devtools/python/python-pynetlinux.inc
new file mode 100644
index 0000000..6a39896
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pynetlinux.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Linux network configuration library for Python"
+DESCRIPTION = "This library contains Python bindings to ioctl calls"
+SECTION = "devel/python"
+HOMEPAGE = "http://github.com/rlisagor/pynetlinux"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=74e1861736ee959824fe7542323c12e9"
+
+inherit pypi
+
+SRC_URI[md5sum] = "3336e5d4a478acca4e35bf3125b4f883"
+SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
diff --git a/meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb
new file mode 100644
index 0000000..c45ad6a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pynetlinux.inc
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
new file mode 100644
index 0000000..f6d9e3c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pynetlinux.inc
-- 
2.7.4


