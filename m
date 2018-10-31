Return-Path: <prvs=084255bac6=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id AAE2072EB0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 07:37:05 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w9V7ZnXn014362 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 02:37:06 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2netfna4s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 02:37:06 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w9V7b5ZP020084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 02:37:05 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 31 Oct 2018 02:37:05 -0500
Received: from avasiu-ro.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 31 Oct 2018 02:37:04 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Oct 2018 09:36:51 +0200
Message-ID: <20181031073651.6626-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-10-31_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to 0.0.11
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
X-List-Received-Date: Wed, 31 Oct 2018 07:37:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc        | 4 ++--
 .../{python-pyiface_0.0.10.bb => python-pyiface_0.0.11.bb}    | 0
 .../{python3-pyiface_0.0.10.bb => python3-pyiface_0.0.11.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.10.bb => python-pyiface_0.0.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.10.bb => python3-pyiface_0.0.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index 087f30c22..2e398fcef 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
-SRC_URI[md5sum] = "c0bf0c7eeaedb785e9fa3018158f018f"
-SRC_URI[sha256sum] = "2b22e4ad0eb541de808d59c9d804dad0f7d07e0719ff6d701f02ea296aa0b7cc"
+SRC_URI[md5sum] = "b066aa984656742738127c9c75436ab4"
+SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5e8a3f5"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.10.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyiface_0.0.10.bb
rename to meta-python/recipes-devtools/python/python-pyiface_0.0.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.10.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.10.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
-- 
2.19.1


