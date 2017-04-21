Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10FB4779CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:08:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3L98MvQ001120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 02:08:23 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 02:08:22 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Apr 2017 17:08:15 +0800
Message-ID: <e0e0fc51bfb46d77769050a63848e6a72f903d58.1492765386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492765386.git.jackie.huang@windriver.com>
References: <cover.1492765386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/4] python-pysmi: add new recipe
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
X-List-Received-Date: Fri, 21 Apr 2017 09:08:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-pysmi is a pure-Python implementation of SNMP/SMI
MIB parsing and conversion library.

It's required by python-pysnmp.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-pysmi_0.1.2.bb  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
new file mode 100644
index 000000000..aa234dd70
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "SNMP SMI/MIB Parser"
+DESCRIPTION = "A pure-Python implementation of SNMP/SMI MIB \
+  parsing and conversion library. Can produce PySNMP MIB modules. \
+"
+HOMEPAGE = "https://pypi.python.org/pypi/pysmi"
+SECTION = "devel/python"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d8b1bbadd635f187dee74d999a8c67b8"
+
+SRCNAME = "pysmi"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f8754e9ed75698cc16b40f125df85b12"
+SRC_URI[sha256sum] = "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "python-ply"
-- 
2.11.0


