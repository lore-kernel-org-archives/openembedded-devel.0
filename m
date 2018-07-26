Return-Path: <prvs=6745f49190=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 557C678ABE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 10:34:24 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6QAVDVJ025172 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:34:25 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2kewd3jhc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:34:25 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6QAYOcK032600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:34:24 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 26 Jul 2018 05:34:24 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 26 Jul 2018 05:34:23 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 26 Jul 2018 05:34:20 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Jul 2018 13:33:57 +0300
Message-ID: <20180726103357.28977-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-26_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to version 0.0.10
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
X-List-Received-Date: Thu, 26 Jul 2018 10:34:24 -0000
Content-Type: text/plain

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc        | 4 ++--
 .../{python-pyiface_0.0.9.bb => python-pyiface_0.0.10.bb}     | 0
 .../{python3-pyiface_0.0.9.bb => python3-pyiface_0.0.10.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.9.bb => python-pyiface_0.0.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.9.bb => python3-pyiface_0.0.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index a1156f428..087f30c22 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
-SRC_URI[md5sum] = "bc94e3d0c1cf8f49ac86514a8e90ed5c"
-SRC_URI[sha256sum] = "a58367d456ac0b4b9d1d5c31d5dd24363ad6c5bcc73edf027ded63732f784cf4"
+SRC_URI[md5sum] = "c0bf0c7eeaedb785e9fa3018158f018f"
+SRC_URI[sha256sum] = "2b22e4ad0eb541de808d59c9d804dad0f7d07e0719ff6d701f02ea296aa0b7cc"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
rename to meta-python/recipes-devtools/python/python-pyiface_0.0.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.10.bb
-- 
2.18.0


