Return-Path: <prvs=8779ca2b03=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 8B82C7918F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 10:13:18 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7TACMBH009759; Wed, 29 Aug 2018 05:13:18 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2m34mwd2fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 Aug 2018 05:13:18 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7TADHq3011430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 29 Aug 2018 05:13:17 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Aug 2018 05:13:17 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 29 Aug 2018 05:13:16 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Wed, 29 Aug 2018 13:14:53 +0300
Message-ID: <20180829101456.31305-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-29_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: Sergey Kizunov <sergey.kizunov@ni.com>
Subject: [meta-python][PATCH 1/4] python-pytest-tempdir: add recipe
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
X-List-Received-Date: Wed, 29 Aug 2018 10:13:18 -0000
Content-Type: text/plain

From: Sergey Kizunov <sergey.kizunov@ni.com>

Adds support for a predictable and repeatable temporary directory.

Signed-off-by: Sergey Kizunov <sergey.kizunov@ni.com>
---
 .../python/python-pytest-tempdir_2016.8.20.bb      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb b/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb
new file mode 100644
index 000000000..74030dcf5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Adds support for a predictable and repeatable temporary directory."
+HOMEPAGE = "https://github.com/saltstack/pytest-tempdir"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8751a9cf4a70be4f02697a9b89e686ce"
+
+SRC_URI[md5sum] = "f87f2583f5f8aaca7203d57ada3948b5"
+SRC_URI[sha256sum] = "65ff815966ea6dfc07ca1b43747c9888a6d883971170e67b16290f9f50d434ea"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+    python-pytest \
+    "
-- 
2.18.0


