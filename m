Return-Path: <denis@denix.org>
X-Greylist: delayed 411 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Oct 2016 20:05:01 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC476FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A38E20A33;
	Thu,  6 Oct 2016 19:58:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MILkJQabl2xo; Thu,  6 Oct 2016 19:58:10 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2661B208FE;
	Thu,  6 Oct 2016 19:58:09 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 21387162152;
	Thu,  6 Oct 2016 15:58:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 15:58:07 -0400
Message-Id: <1475783887-20739-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-python][PATCH] python-pybind11: add pybind11 for operability between C++11 and Python
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
X-List-Received-Date: Thu, 06 Oct 2016 20:05:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-python/recipes-devtools/python/python-pybind11.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
new file mode 100644
index 0000000..e13f6a5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Seamless operability between C++11 and Python"
+HOMEPAGE = "https://github.com/wjakob/pybind11"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1e9383cd3e97753d7dd6067d079519ea"
+PR = "r0"
+
+SRC_URI = "https://pypi.python.org/packages/89/0b/f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9/pybind11-1.8.1.tar.gz"
+SRC_URI[md5sum] = "67845d8fd89a1c400dc7c61ccdee14d6"
+SRC_URI[sha256sum] = "358d4b7d8c38cd1dde66064178c6bbaaa2c479a44e67e642820fe0f329a4fff8"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
new file mode 100644
index 0000000..e567430
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pybind11.inc
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
new file mode 100644
index 0000000..355e284
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pybind11.inc
-- 
2.7.4


