Return-Path: <prvs=67189f18c8=alexandru.vasiu@ni.com>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Jun 2018 10:26:08 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 840FA60602
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 10:26:08 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w5TAFXxt009125 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:18:49 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2jvdqwx1pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:18:48 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w5TAImJ9014707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:18:48 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 29 Jun 2018 05:18:47 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 29 Jun 2018 05:18:47 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 13:17:58 +0300
Message-ID: <20180629101758.28179-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-06-29_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to 0.0.6
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
X-List-Received-Date: Fri, 29 Jun 2018 10:26:08 -0000
Content-Type: text/plain

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
 .../{python-pyiface_0.0.5.bb => python-pyiface_0.0.6.bb}    | 0
 .../{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.6.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb => python-pyiface_0.0.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index 620b244c6..8e464a83f 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -3,9 +3,9 @@ SECTION = "devel/python"
 HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
 LICENSE = "GPLv3+"
 
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
 
-SRC_URI[md5sum] = "06c3c71fe51df740dae6a88a13afb5e0"
-SRC_URI[sha256sum] = "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1bf903ec32e043af924"
+SRC_URI[md5sum] = "2379d8d4506e6c4d83cf3d4824abce8b"
+SRC_URI[sha256sum] = "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6e4cf2d708dcd86f2"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
-- 
2.18.0


