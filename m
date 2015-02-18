Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B03F1733AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 23:04:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1IN4EE6027730 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 17:04:15 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021817041506-152640 ;
	Wed, 18 Feb 2015 17:04:15 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 17:03:40 -0600
Message-Id: <1424300622-28832-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
References: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/18/2015 05:04:15 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/18/2015 05:04:15 PM,
	Serialize complete at 02/18/2015 05:04:15 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-18_07:, , signatures=0
Subject: [meta-python][PATCH 2/4] python-markupsafe: add recipe
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
X-List-Received-Date: Wed, 18 Feb 2015 23:04:15 -0000

MarkupSafe is a Python library for escaping HTML strings, and it is a
dependency for Jinja2.  Add a recipe to build it.

Copied from commit 6ba88a72843826370773cda29309545c7c800dc0 in
meta-cloud-services/meta-openstack and updated to version 0.23.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-devtools/python/python-markupsafe_0.23.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-markupsafe_0.23.bb

diff --git a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
new file mode 100644
index 0000000..4821c0a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
+HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
+
+PR = "r0"
+SRCNAME = "MarkupSafe"
+
+SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f5ab3deee4c37cd6a922fb81e730da6e"
+SRC_URI[sha256sum] = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-re"
-- 
2.3.0


