Return-Path: <prvs=77774814f4=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD6279223
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 12:32:00 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7RCPFTq005007 for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:00 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2m34mw62rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:00 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7RCVxEg014322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:31:59 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:31:58 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 07:31:56 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Aug 2018 15:33:36 +0300
Message-ID: <20180827123338.7571-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-python][PATCH 1/3] python3-pyconnman: add recipe
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
 .../python-pyconnman/python-pyconnman.inc           | 12 ++++++++++++
 .../python-pyconnman/python-pyconnman_0.1.0.bb      | 13 +++----------
 .../python-pyconnman/python3-pyconnman_0.1.0.bb     |  5 +++++
 3 files changed, 20 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
 create mode 100644 meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
new file mode 100644
index 000000000..beb2baf83
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python-based Network Connectivity Management"
+HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "b7fa82034b1c0e1fb1b518ffe3bb4fc0"
+SRC_URI[sha256sum] = "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f8162fab4a"
+
+inherit pypi
+
+RDEPENDS_${PN} = "connman"
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
index 77b5e4dcf..3c12db944 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
@@ -1,12 +1,5 @@
-DESCRIPTION = "Python-based Network Connectivity Management"
-HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
-LICENSE = "Apache-2.0"
+require python-pyconnman.inc
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+inherit setuptools
 
-SRC_URI[md5sum] = "b7fa82034b1c0e1fb1b518ffe3bb4fc0"
-SRC_URI[sha256sum] = "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f8162fab4a"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "connman python-dbus python-pprint"
+RDEPENDS_${PN} += "python-dbus python-pprint"
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
new file mode 100644
index 000000000..e0f3fdd75
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
@@ -0,0 +1,5 @@
+require python-pyconnman.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-dbus python3-pprint"
-- 
2.18.0


