Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B03286E614
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 23:04:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1IN4Eov027733 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 17:04:15 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021817041507-152642 ;
	Wed, 18 Feb 2015 17:04:15 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 17:03:41 -0600
Message-Id: <1424300622-28832-3-git-send-email-ben.shelton@ni.com>
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
Subject: [meta-python][PATCH 3/4] python-msgpack: add recipe
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

python-msgpack implements the MessagePack binary serialization format
for Python.

Copied from commit 91ed2353847d4121e3dd8ad10ca0c24194ac9765 in
meta-cloud-services/meta-openstack and updated to version 0.4.5.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-devtools/python/python-msgpack_0.4.5.bb     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
new file mode 100644
index 0000000..206b03d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "MessagePack (de)serializer"
+HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
+
+PR = "r0"
+SRCNAME = "msgpack-python"
+
+SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3b82bc542d5599896695512e7c32f42d"
+SRC_URI[sha256sum] = "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3e475c3d33308014cbb"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.3.0


