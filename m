Return-Path: <prvs=77774814f4=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 0986079256
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 12:32:02 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7RCPGaL030444 for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:03 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2m334x6b3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:03 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7RCW2WQ001923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:32:02 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:32:01 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:32:01 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 07:32:00 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Aug 2018 15:33:38 +0300
Message-ID: <20180827123338.7571-3-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827123338.7571-1-adrian.ratiu@ni.com>
References: <20180827123338.7571-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-python][PATCH 3/3] python3-pytest-tempdir: add recipe
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
X-List-Received-Date: Mon, 27 Aug 2018 12:32:02 -0000
Content-Type: text/plain

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-devtools/python/python-pytest-tempdir.inc | 10 ++++++++++
 .../python/python-pytest-tempdir_2016.8.20.bb         | 11 ++---------
 .../python/python3-pytest-tempdir_2016.8.20.bb        |  7 +++++++
 3 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-tempdir.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-tempdir_2016.8.20.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir.inc b/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
new file mode 100644
index 000000000..196f6d644
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-tempdir.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Adds support for a predictable and repeatable temporary directory."
+HOMEPAGE = "https://github.com/saltstack/pytest-tempdir"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8751a9cf4a70be4f02697a9b89e686ce"
+
+SRC_URI[md5sum] = "f87f2583f5f8aaca7203d57ada3948b5"
+SRC_URI[sha256sum] = "65ff815966ea6dfc07ca1b43747c9888a6d883971170e67b16290f9f50d434ea"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb b/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb
index 74030dcf5..8a9b83e3d 100644
--- a/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb
+++ b/meta-python/recipes-devtools/python/python-pytest-tempdir_2016.8.20.bb
@@ -1,13 +1,6 @@
-DESCRIPTION = "Adds support for a predictable and repeatable temporary directory."
-HOMEPAGE = "https://github.com/saltstack/pytest-tempdir"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8751a9cf4a70be4f02697a9b89e686ce"
+require python-pytest-tempdir.inc
 
-SRC_URI[md5sum] = "f87f2583f5f8aaca7203d57ada3948b5"
-SRC_URI[sha256sum] = "65ff815966ea6dfc07ca1b43747c9888a6d883971170e67b16290f9f50d434ea"
-
-inherit pypi setuptools
+inherit setuptools
 
 RDEPENDS_${PN} += " \
     python-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2016.8.20.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2016.8.20.bb
new file mode 100644
index 000000000..02e821563
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2016.8.20.bb
@@ -0,0 +1,7 @@
+require python-pytest-tempdir.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} += " \
+    python3-pytest \
+    "
-- 
2.18.0


