Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6301D733AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 23:04:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1IN4EOF011084 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 17:04:15 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021817041504-152638 ;
	Wed, 18 Feb 2015 17:04:15 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 17:03:39 -0600
Message-Id: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.3.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/18/2015 05:04:15 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/18/2015 05:04:15 PM,
	Serialize complete at 02/18/2015 05:04:15 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-18_07:, , signatures=0
Subject: [meta-python][PATCH 1/4] python-jinja2: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Feb 2015 23:04:14 -0000

Jinja2 is a stand-alone template engine for Python.

Copied from commit 00862f55be214e2247ad5aba3ab06a34afb20598 in
meta-cloud-services/meta-openstack and updated to version 2.7.3.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-devtools/python/python-jinja2_2.7.3.bb    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb

diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb b/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
new file mode 100644
index 0000000..e66077a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
+
+PR = "r0"
+SRCNAME = "Jinja2"
+
+SRC_URI = "https://pypi.python.org/packages/source/J/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b9dffd2f3b43d673802fe857c8445b1a"
+SRC_URI[sha256sum] = "2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-io python-pickle python-crypt python-math python-netclient python-re python-textutils python-lang python-pprint python-shell python-markupsafe"
-- 
2.3.0


