Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E34B17E978
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:02:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5RG2clU029423
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 09:02:38 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 09:02:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 28 Jun 2019 00:02:34 +0800
Message-ID: <1561651356-12247-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python-six: remove duplicated recipe
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
X-List-Received-Date: Thu, 27 Jun 2019 16:02:38 -0000
Content-Type: text/plain

Since commit [e3392ec python-six: put python2/3 variant together] applied,
python-six recipe was moved to meta-oe, but not remove the duplicated one

The python3-six recipe and python-six.inc is in oe-core

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python-six.inc    | 19 -------------------
 .../recipes-devtools/python/python-six_1.12.0.bb      |  2 --
 2 files changed, 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-six.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-six_1.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
deleted file mode 100644
index 4712925..0000000
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Python 2 and 3 compatibility library"
-HOMEPAGE = "http://pypi.python.org/pypi/six/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=83e0f622bd5ac7d575dbd83d094d69b5"
-
-SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
-SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
-
-do_compile_append() {
-    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
-}
-do_install_append() {
-    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
-}
-
-RDEPENDS_${PN} += "${PYTHON_PN}-io"
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-python/recipes-devtools/python/python-six_1.12.0.bb b/meta-python/recipes-devtools/python/python-six_1.12.0.bb
deleted file mode 100644
index 9075745..0000000
--- a/meta-python/recipes-devtools/python/python-six_1.12.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-six.inc
-- 
2.7.4


