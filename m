Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB677F25B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 05:54:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T5sR6n018899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:54:27 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 22:54:26 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 13:42:39 +0800
Message-ID: <5c53e8e7d48133717f3a65805d1770c848a9115d.1569734973.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569734973.git.jackie.huang@windriver.com>
References: <cover.1569734973.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/4] python-pymysql: add recipes for python2 and python3
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
X-List-Received-Date: Sun, 29 Sep 2019 05:54:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This package contains a pure-Python MySQL client library,
based on PEP 249 Most public APIs are compatible with
mysqlclient and MySQLdb.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-pymysql.inc | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-pymysql_0.9.3.bb    |  2 ++
 .../recipes-devtools/python/python3-pymysql_0.9.3.bb   |  2 ++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pymysql.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pymysql.inc b/meta-python/recipes-devtools/python/python-pymysql.inc
new file mode 100644
index 0000000..8c7f455
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymysql.inc
@@ -0,0 +1,18 @@
+SUMMARY = "A pure-Python MySQL client library"
+DESCRIPTION = " \
+  This package contains a pure-Python MySQL client library, based on PEP 249 \
+  Most public APIs are compatible with mysqlclient and MySQLdb. \
+  "
+SECTION = "devel/python"
+HOMEPAGE = "https://pymysql.readthedocs.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
+
+SRC_URI[md5sum] = "e5d9183cc0a775ac29f9e0365cca6556"
+SRC_URI[sha256sum] = "d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7"
+
+inherit pypi
+
+PYPI_PACKAGE = "PyMySQL"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-cryptography"
diff --git a/meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
new file mode 100644
index 0000000..27d097e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pymysql.inc
diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
new file mode 100644
index 0000000..13774bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pymysql.inc
-- 
2.7.4


