Return-Path: <prvs=6743d8940e=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9739F75532
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:28:45 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6O8Pb8U001877 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:28:46 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2kc0uv6nfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:28:46 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6O8SjAV009015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:28:45 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 24 Jul 2018 03:28:45 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 24 Jul 2018 03:28:44 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jul 2018 11:27:15 +0300
Message-ID: <20180724082715.11769-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-24_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to version 0.0.9
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
X-List-Received-Date: Tue, 24 Jul 2018 08:28:45 -0000
Content-Type: text/plain

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc       | 4 ++--
 meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index 895a0ae09..a1156f428 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
-SRC_URI[md5sum] = "1bbc53c281925eae5f508b8b1a1f8259"
-SRC_URI[sha256sum] = "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed4f6987322051928d"
+SRC_URI[md5sum] = "bc94e3d0c1cf8f49ac86514a8e90ed5c"
+SRC_URI[sha256sum] = "a58367d456ac0b4b9d1d5c31d5dd24363ad6c5bcc73edf027ded63732f784cf4"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
new file mode 100644
index 000000000..854cb30ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyiface.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb
new file mode 100644
index 000000000..721e7b1c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyiface.inc
-- 
2.18.0


