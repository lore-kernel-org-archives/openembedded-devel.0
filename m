Return-Path: <razvan.heghedus@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E0F5C71B2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:16:48 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uASGGnmI016677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:16:49 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 28 Nov 2016 10:16:49 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 28 Nov 2016 10:16:49 -0600
Received: from razvanh-ro.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 28 Nov 2016 10:16:48 -0600
From: Heghedus Razvan <razvan.heghedus@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Nov 2016 18:16:32 +0200
Message-ID: <20161128161632.32542-1-razvan.heghedus@ni.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611280266
Subject: [meta-oe][PATCH v2] python-pyconnman: Add new recipe
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
X-List-Received-Date: Mon, 28 Nov 2016 16:16:49 -0000
Content-Type: text/plain

Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
---
 .../python-pyconnman/python-pyconnman_0.1.0.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
new file mode 100644
index 0000000..6eeab7e
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python-based Network Connectivity Management"
+HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "b7fa82034b1c0e1fb1b518ffe3bb4fc0"
+SRC_URI[sha256sum] = "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f8162fab4a"
+
+PYPI_PACKAGE = "pyconnman"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "python-dbus python-pprint"
\ No newline at end of file
-- 
2.10.2


