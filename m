Return-Path: <prvs=2609448c5c=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D206378854
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:06:30 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2C96Me1002451 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:06:31 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2gmc92ks4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:06:31 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w2C96UMW006113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:06:30 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 12 Mar 2018 04:06:30 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 12 Mar 2018 04:06:30 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 12 Mar 2018 04:06:29 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Mar 2018 11:06:27 +0200
Message-ID: <20180312090627.9422-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-12_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH v3] Add support for pyiface
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
X-List-Received-Date: Mon, 12 Mar 2018 09:06:30 -0000
Content-Type: text/plain

Pyiface is a package that exposes the network interfaces of the
operating system in a easy to use and transparent way.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc      | 10 ++++++++++
 meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb |  2 ++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyiface.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
new file mode 100644
index 000000000..08733fcc8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -0,0 +1,10 @@
+SUMMARY = "Pyiface Recipe - Adds Pyiface library for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
+LICENSE = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
+
+SRC_URI[md5sum] = "edcdd71109c4259af8348006a8049c9c"
+SRC_URI[sha256sum] = "dc984de0e1bcf6871ef88b1a92d1fb75717d4f602a60caeb66136093d4a8f62e"
+
+inherit pypi
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
new file mode 100644
index 000000000..854cb30ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyiface.inc
\ No newline at end of file
-- 
2.16.2


