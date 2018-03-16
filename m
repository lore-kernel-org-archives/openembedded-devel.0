Return-Path: <prvs=261329a6b7=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 74717788E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 13:22:06 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2GDLVfm014372 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:22:07 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2gr8sh8yjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:22:07 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w2GDM6XJ011563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:22:06 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 16 Mar 2018 08:22:06 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 16 Mar 2018 08:22:05 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 16 Mar 2018 08:22:05 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Mar 2018 15:21:41 +0200
Message-ID: <20180316132141.22580-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-16_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH v4] Add support for pyiface
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
X-List-Received-Date: Fri, 16 Mar 2018 13:22:06 -0000
Content-Type: text/plain

Pyiface is a package that exposes the network interfaces of the
operating system in a easy to use and transparent way.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyiface.inc       | 11 +++++++++++
 meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-pyiface_0.0.4.bb |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyiface.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyiface_0.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
new file mode 100644
index 000000000..4d0c8dc9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Pyiface is a package that exposes the network interfaces of the operating system in a easy to use and transparent way"
+SECTION = "devel/python"
+HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
+LICENSE = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
+
+SRC_URI[md5sum] = "edcdd71109c4259af8348006a8049c9c"
+SRC_URI[sha256sum] = "dc984de0e1bcf6871ef88b1a92d1fb75717d4f602a60caeb66136093d4a8f62e"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
new file mode 100644
index 000000000..854cb30ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyiface.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.4.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.4.bb
new file mode 100644
index 000000000..721e7b1c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyiface_0.0.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyiface.inc
-- 
2.16.2


