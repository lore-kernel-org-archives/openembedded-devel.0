Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0EF774601
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 05:30:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40826255"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jun 2018 13:30:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6FD564818464
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:30:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Thu, 7 Jun 2018 13:30:47 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 27 May 2018 17:34:16 -0700
Message-ID: <1527467656-6513-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 6FD564818464.ACBFA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pytest: Fix conflict error as following:
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
X-List-Received-Date: Thu, 07 Jun 2018 05:30:55 -0000
Content-Type: text/plain

  file /usr/bin/py.test conflicts between attempted installs of python3-pytest-3.4.2-r0 and python-pytest-3.4.2-r0
  file /usr/bin/pytest conflicts between attempted installs of python3-pytest-3.4.2-r0 and python-pytest-3.4.2-r0

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-pytest_3.4.2.bb  |  1 +
 meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb |  2 ++
 3 files changed, 13 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 4feb9a0..4c32dfb 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad590
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
 
+inherit update-alternatives
+
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
@@ -22,4 +24,12 @@ RDEPENDS_${PN}_class-target += " \
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pytest:"
 
+ALTERNATIVE_${PN} += "py.test pytest"
+
+NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
+ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
+
+ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
+ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb b/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
index 201ab05..39e50ac 100644
--- a/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
@@ -6,3 +6,4 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-compiler \
     ${PYTHON_PN}-funcsigs \
 "
+ALTERNATIVE_PRIORITY = "10"
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb b/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
index 466cfa8..eba6632 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-pytest.inc
+
+ALTERNATIVE_PRIORITY = "100"
-- 
1.9.1




