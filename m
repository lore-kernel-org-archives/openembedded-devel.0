Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF1FA71E14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 05:29:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G5T6pE007078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 21:29:10 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 15 Feb 2017 21:29:05 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 13:21:30 +0800
Message-ID: <072683df97ae2288be0bd8057326852904db4f70.1487222337.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1487222337.git.jackie.huang@windriver.com>
References: <cover.1487222337.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2 v2] python-funcsigs: add new recipe
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
X-List-Received-Date: Thu, 16 Feb 2017 05:29:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-funcsigs is required by python-mock.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-funcsigs_1.0.2.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb b/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb
new file mode 100644
index 0000000..dad15ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
+DESCRPTION = " \
+funcsigs is a backport of the `PEP 362`_ function signature features from \
+Python 3.3's `inspect`_ module. The backport is compatible with Python 2.6, \
+2.7 as well as 3.3 and up. 3.2 was supported by version 0.4, but with \
+setuptools and pip no longer supporting 3.2, we cannot make any statement \
+about 3.2 compatibility. \
+"
+
+HOMEPAGE = "http://funcsigs.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
+
+SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
+SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
+
+inherit pypi setuptools
-- 
2.8.3


