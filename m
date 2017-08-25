Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 128DD783E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:37:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9b4VU002517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:37:17 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 25 Aug 2017 01:41:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 16:40:40 +0800
Message-ID: <8c18d34a6d2bf2742e5fc25d600713f75c26099b.1503650271.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1503650271.git.jackie.huang@windriver.com>
References: <cover.1503650271.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] python-html5lib: add Python3 support
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
X-List-Received-Date: Fri, 25 Aug 2017 09:37:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Extend the recipe for Python3 support.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-html5lib.inc  | 14 ++++++++++++++
 .../python/python-html5lib_0.999999999.bb                | 16 ++--------------
 .../python/python3-html5lib_0.999999999.bb               |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-html5lib.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb

diff --git a/meta-python/recipes-devtools/python/python-html5lib.inc b/meta-python/recipes-devtools/python/python-html5lib.inc
new file mode 100644
index 000000000..9c59e0d18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-html5lib.inc
@@ -0,0 +1,14 @@
+SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
+
+SRC_URI[md5sum] = "8578e4e3a341436cb9743a9e4a299239"
+SRC_URI[sha256sum] = "ee747c0ffd3028d2722061936b5c65ee4fe13c8e4613519b4447123fc4546298"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-webencodings \
+    ${PYTHON_PN}-xml \
+    "
diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb
index d0f7b56ee..f5941a2a1 100644
--- a/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb
@@ -1,14 +1,2 @@
-SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
-
-SRC_URI[md5sum] = "8578e4e3a341436cb9743a9e4a299239"
-SRC_URI[sha256sum] = "ee747c0ffd3028d2722061936b5c65ee4fe13c8e4613519b4447123fc4546298"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-webencodings \
-    ${PYTHON_PN}-xml \
-    "
+inherit setuptools
+require python-html5lib.inc
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb b/meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb
new file mode 100644
index 000000000..6bd8b49f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-html5lib.inc
-- 
2.11.0


