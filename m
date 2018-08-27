Return-Path: <prvs=77774814f4=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF0179209
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 12:32:00 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7RCPFTr005007 for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:01 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2m34mw62rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:01 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7RCW0Tw014349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:00 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:32:00 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:32:00 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 07:31:59 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Aug 2018 15:33:37 +0300
Message-ID: <20180827123338.7571-2-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827123338.7571-1-adrian.ratiu@ni.com>
References: <20180827123338.7571-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-python][PATCH 2/3] python3-pytest-helpers-namespace: add recipe
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
X-List-Received-Date: Mon, 27 Aug 2018 12:32:00 -0000
Content-Type: text/plain

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../python/python-pytest-helpers-namespace.inc        | 10 ++++++++++
 .../python-pytest-helpers-namespace_2016.7.10.bb      | 11 ++---------
 .../python3-pytest-helpers-namespace_2016.7.10.bb     |  7 +++++++
 3 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
new file mode 100644
index 000000000..a69867d91
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
+HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
+
+SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
+SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
index afca48702..2b6ee8550 100644
--- a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
+++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
@@ -1,13 +1,6 @@
-DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
-HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
+require python-pytest-helpers-namespace.inc
 
-SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
-SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
-
-inherit pypi setuptools
+inherit setuptools
 
 RDEPENDS_${PN} += " \
     python-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
new file mode 100644
index 000000000..f03f5d415
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
@@ -0,0 +1,7 @@
+require python-pytest-helpers-namespace.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} += " \
+    python3-pytest \
+    "
-- 
2.18.0


