Return-Path: <connor.smith@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id C2EE07564A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 21:00:56 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4QL0vUM022501 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 16:00:57 -0500
Received: from connor-ubuntu.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015052616005728-618313 ;
	Tue, 26 May 2015 16:00:57 -0500 
From: Connor Smith <connor.smith@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2015 16:00:49 -0500
Message-Id: <1432674049-23781-1-git-send-email-connor.smith@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/26/2015 04:00:57 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/26/2015 04:00:57 PM,
	Serialize complete at 05/26/2015 04:00:57 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-26_04:, , signatures=0
Cc: Connor Smith <connor.smith@ni.com>
Subject: [meta-oe][PATCH] tree: add new recipe
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
X-List-Received-Date: Tue, 26 May 2015 21:01:02 -0000

Tree is a recursive directory listing command that is useful for viewing
directory contents in a tree-like format.

Signed-off-by: Connor Smith <connor.smith@ni.com>
---
 meta-oe/recipes-support/tree/tree_1.7.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb

diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes-support/tree/tree_1.7.0.bb
new file mode 100644
index 0000000..507b12a
--- /dev/null
+++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "a recursive directory listing command"
+HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+
+SRC_URI = "ftp://mama.indstate.edu/linux/${BPN}/${BP}.tgz"
+SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
+SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/${BPN} ${D}${bindir}/${BPN}
+}
-- 
1.9.1


