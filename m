Return-Path: <prvs=67237e28b6=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5486007A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 08:57:42 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w648u8lq028011 for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 03:57:43 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2k0dpk1ye0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2018 03:57:43 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w648vgke009784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 03:57:42 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 4 Jul 2018 03:57:42 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 4 Jul 2018 03:57:41 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Jul 2018 11:57:02 +0300
Message-ID: <20180704085702.14811-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-04_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH v3] python-pyiface: Upgrade to 0.0.7
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
X-List-Received-Date: Wed, 04 Jul 2018 08:57:42 -0000
Content-Type: text/plain

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc        | 4 ++--
 .../{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb}      | 0
 .../{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index 8e464a83f..c341779bf 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
 
-SRC_URI[md5sum] = "2379d8d4506e6c4d83cf3d4824abce8b"
-SRC_URI[sha256sum] = "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6e4cf2d708dcd86f2"
+SRC_URI[md5sum] = "1bbc53c281925eae5f508b8b1a1f8259"
+SRC_URI[sha256sum] = "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed4f6987322051928d"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
rename to meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
-- 
2.18.0


