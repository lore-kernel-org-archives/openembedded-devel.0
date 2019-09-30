Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1B4C7F331
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 05:22:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8U5MxBV014275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 22:22:59 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 29 Sep 2019 22:22:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Sep 2019 13:11:20 +0800
Message-ID: <1569820280-21101-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-pycurl: add recipes for python2 and python3
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
X-List-Received-Date: Mon, 30 Sep 2019 05:22:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

PycURL is a Python interface to libcurl, the multiprotocol file
transfer library. Similarly to the urllib Python module, PycURL can
be used to fetch objects identified by a URL from a Python program

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-pycurl.inc      | 26 ++++++++++++++++++++++
 .../python/python-pycurl_7.43.0.3.bb               |  2 ++
 .../python/python3-pycurl_7.43.0.3.bb              |  2 ++
 3 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pycurl.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pycurl_7.43.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pycurl.inc b/meta-python/recipes-devtools/python/python-pycurl.inc
new file mode 100644
index 0000000..ac9a370
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycurl.inc
@@ -0,0 +1,26 @@
+SUMMARY = "A Python Interface To The cURL library"
+DESCRIPTION = "\
+PycURL is a Python interface to libcurl, the multiprotocol file \
+transfer library. Similarly to the urllib Python module, PycURL can \
+be used to fetch objects identified by a URL from a Python program \
+"
+SECTION = "devel/python"
+HOMEPAGE = "http://pycurl.io/"
+
+LICENSE = "LGPLv2 | MIT"
+LIC_FILES_CHKSUM = " \
+    file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
+    file://COPYING-MIT;md5=2df767ed35d8ea83de4a93feb55e7815 \
+"
+
+SRC_URI[md5sum] = "f0ed4c805e8bec734990e2e0ee78568e"
+SRC_URI[sha256sum] = "6f08330c5cf79fa8ef68b9912b9901db7ffd34b63e225dce74db56bb21deda8e"
+
+inherit pypi
+
+PYPI_PACKAGE = "pycurl"
+
+DEPENDS = "\
+    curl \
+    ${PYTHON_PN}\
+"
diff --git a/meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb b/meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb
new file mode 100644
index 0000000..7ab2592
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pycurl.inc
diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.3.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.3.bb
new file mode 100644
index 0000000..5ad319a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pycurl.inc
-- 
2.7.4


