Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 620A66E614
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 23:04:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1IN4FbV011117 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 17:04:15 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021817041509-152644 ;
	Wed, 18 Feb 2015 17:04:15 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 17:03:42 -0600
Message-Id: <1424300622-28832-4-git-send-email-ben.shelton@ni.com>
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
Subject: [meta-python][PATCH 4/4] python-requests: add recipe
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

Requests is an HTTP library for Python with a clean and succinct API.

Copied from commit bc572006bfcec10523658b8675f30bf45b43a998 in
meta-cloud-services/meta-openstack and updated to version 2.5.1.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-devtools/python/python-requests_2.5.1.bb    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-requests_2.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb b/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
new file mode 100644
index 0000000..b719dca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Python HTTP for Humans."
+HOMEPAGE = "http://python-requests.org"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
+
+PR = "r0"
+SRCNAME = "requests"
+
+SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c270eb5551a02e8ab7a4cbb83e22af2e"
+SRC_URI[sha256sum] = "7b7735efd3b1e2323dc9fcef060b380d05f5f18bd0f247f5e9e74a628279de66"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.3.0


