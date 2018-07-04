Return-Path: <prvs=67237e28b6=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 141F47603B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 14:56:19 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w64EuEiV003230 for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 09:56:21 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2k0dpfjteb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:56:21 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w64EuKhm009116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 09:56:20 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 4 Jul 2018 09:56:20 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 4 Jul 2018 09:56:20 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 4 Jul 2018 09:56:19 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Jul 2018 17:55:52 +0300
Message-ID: <20180704145552.29673-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-04_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH v4] python-pyiface: Upgrade to 0.0.7
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
X-List-Received-Date: Wed, 04 Jul 2018 14:56:20 -0000
Content-Type: text/plain

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
 .../{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb}    | 0
 .../{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index 8e464a83f..895a0ae09 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -3,9 +3,9 @@ SECTION = "devel/python"
 HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
 LICENSE = "GPLv3+"
 
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
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


