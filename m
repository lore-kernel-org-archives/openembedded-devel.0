Return-Path: <prvs=364843e53b=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7021471DD2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 12:48:42 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w3KClIY5005406 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:48:43 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2hds2ts5b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:48:42 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w3KCmgOF027517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:48:42 -0500
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 20 Apr 2018 07:48:42 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 20 Apr 2018 07:48:41 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 20 Apr 2018 07:48:41 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Apr 2018 15:48:29 +0300
Message-ID: <20180420124829.10095-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-04-20_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-oe][meta-python][PATCH] python-configparser: add new recipe
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
X-List-Received-Date: Fri, 20 Apr 2018 12:48:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This module provides the ConfigParser class which implements a basic configuration language which provides a structure similar to what’s found in Microsoft Windows INI files.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 .../recipes-devtools/python/python-configparser.inc   | 11 +++++++++++
 .../python/python-configparser_3.5.0.bb               |  2 ++
 .../python/python3-configparser_3.5.0.bb              |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-configparser.inc
 create mode 100644 meta-python/recipes-devtools/python/python-configparser_3.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-configparser_3.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
new file mode 100644
index 000000000..c1fb8582c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-configparser.inc
@@ -0,0 +1,11 @@
+SUMMARY = "This module provides the ConfigParser class which implements a basic configuration language which provides a structure similar to what’s found in Microsoft Windows INI files."
+SECTION = "devel/python"
+HOMEPAGE = "https://docs.python.org/3/library/configparser.html"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "cfdd915a5b7a6c09917a64a573140538"
+SRC_URI[sha256sum] = "5308b47021bc2340965c371f0f058cc6971a04502638d4244225c49d80db273a"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-configparser_3.5.0.bb b/meta-python/recipes-devtools/python/python-configparser_3.5.0.bb
new file mode 100644
index 000000000..69f045dba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-configparser_3.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-configparser.inc
diff --git a/meta-python/recipes-devtools/python/python3-configparser_3.5.0.bb b/meta-python/recipes-devtools/python/python3-configparser_3.5.0.bb
new file mode 100644
index 000000000..770cba596
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configparser_3.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-configparser.inc
-- 
2.17.0


