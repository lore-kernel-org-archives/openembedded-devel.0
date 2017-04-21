Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC4CB62133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:08:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3L98QGe007133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 02:08:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 02:08:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Apr 2017 17:08:17 +0800
Message-ID: <97663b5511d6f39b01d0663507950947344e96b7.1492765386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492765386.git.jackie.huang@windriver.com>
References: <cover.1492765386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 4/4] python-snimpy: add new recipe
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
X-List-Received-Date: Fri, 21 Apr 2017 09:08:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Snimpy is a Python-based tool providing a simple
interface to build SNMP query.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/python-snimpy_0.8.11.bb                 | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb

diff --git a/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb b/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
new file mode 100644
index 000000000..cbdc6bd86
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Interactive SNMP tool"
+DESCRIPTION = "Snimpy is a Python-based tool providing a simple interface to build SNMP query"
+HOMEPAGE = "https://pypi.python.org/pypi/snimpy"
+SECTION = "devel/python"
+
+DEPENDS = "libsmi python-cffi-native python-vcversioner-native"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=7c53ab2d1240828625c3e093d049d4f4"
+
+SRCNAME = "snimpy"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7f6270ce2e7206df165602e66d5ceb96"
+SRC_URI[sha256sum] = "10410614c7bff1053ca65bd760ce919f1a074f4988b857df4c57cf35847922b0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "python-cffi \
+                  python-pycparser \
+                  python-pysnmp \
+                  python-setuptools \
+"
-- 
2.11.0


