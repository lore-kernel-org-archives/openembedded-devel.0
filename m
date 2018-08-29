Return-Path: <prvs=8779ca2b03=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id B99D57918F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 10:13:20 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7TACIga032343; Wed, 29 Aug 2018 05:13:21 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2m5q9crc8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 Aug 2018 05:13:21 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7TADKBG011439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 29 Aug 2018 05:13:20 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Aug 2018 05:13:20 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Aug 2018 05:13:20 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 29 Aug 2018 05:13:19 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Wed, 29 Aug 2018 13:14:55 +0300
Message-ID: <20180829101456.31305-3-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180829101456.31305-1-adrian.ratiu@ni.com>
References: <20180829101456.31305-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-29_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: Sergey Kizunov <sergey.kizunov@ni.com>
Subject: [meta-python][PATCH 3/4] python-pytest-helpers-namespace: add recipe
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
X-List-Received-Date: Wed, 29 Aug 2018 10:13:20 -0000
Content-Type: text/plain

From: Sergey Kizunov <sergey.kizunov@ni.com>

This plugin does not provide any helpers to pytest, it does, however,
provide a helpers namespace in pytest which enables you to register
helper functions in your conftest.py to be used within your tests
without having to import them.

Signed-off-by: Sergey Kizunov <sergey.kizunov@ni.com>
---
 .../python-pytest-helpers-namespace_2016.7.10.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
new file mode 100644
index 000000000..afca48702
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
+HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
+
+SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
+SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+    python-pytest \
+    "
-- 
2.18.0


