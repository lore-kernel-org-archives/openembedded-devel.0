Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8626F62133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:08:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3L98OxQ031402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 02:08:25 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 02:08:23 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Apr 2017 17:08:16 +0800
Message-ID: <3f4902bcc57f266f8d2276d527269044b6c827f9.1492765386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492765386.git.jackie.huang@windriver.com>
References: <cover.1492765386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/4] python-pysnmp: add new recipe
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
X-List-Received-Date: Fri, 21 Apr 2017 09:08:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-pysnmp is a pure-Python SNMPv1/v2c/v3 library,
it's required by python-snimpy.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-pysnmp_4.3.5.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb

diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb b/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
new file mode 100644
index 000000000..0b38d58e4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "A pure-Python SNMPv1/v2c/v3 library"
+DESCRIPTION = "SNMP v1/v2c/v3 engine and apps written in pure-Python. \
+  Supports Manager/Agent/Proxy roles, scriptable MIBs, asynchronous \
+  operation (asyncio, twisted, asyncore) and multiple transports.\
+"
+HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=280606d9c18f200e03e0c247ac61475a"
+
+SRCNAME = "pysnmp"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "387aaa23c168ccc0b59775cfdf519fc0"
+SRC_URI[sha256sum] = "38253fe95cea33f352fb36e85f3c2874043401724300c4888df74835161169d2"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-pycrypto \
+                   python-pyasn1 \
+                   python-pysmi \
+"
-- 
2.11.0


