Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 9863B76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:48:35 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8U8maUE007083 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 03:48:36 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015093003483558-780339 ;
	Wed, 30 Sep 2015 03:48:35 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 11:48:34 +0300
Message-Id: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/30/2015 03:48:36 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/30/2015 03:48:36 AM,
	Serialize complete at 09/30/2015 03:48:36 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_02:, , signatures=0
Subject: [meta-oe][PATCH] meta-oe: recipes-devtools: add libubox recipe
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
X-List-Received-Date: Wed, 30 Sep 2015 08:48:36 -0000

libubox contains C utility functions used by OpenWrt projects

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-devtools/libubox/libubox_git.bb | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libubox/libubox_git.bb

diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
new file mode 100644
index 0000000..4b9c3bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "C utility functions for OpenWrt"
+SECTION = "libs"
+LICENSE = "libubox-custom-license"
+LIC_FILES_CHKSUM = "\
+    file://avl.c;endline=39;md5=00810155fed3d604816ec5814523d60a \
+    file://avl-cmp.c;endline=15;md5=1603e6094b432a5f3f320877a06f41b5 \
+    file://base64.c;endline=61;md5=51fdff010d45b0086ac0a6e035693dc0 \
+    file://blobmsg.c;endline=15;md5=7ed64c1570e8c9b46c4fc6fbd16c489e \
+    file://list.h;endline=28;md5=2d5f5475fbd0f08741354c5a99c2e983 \
+    file://md5.h;endline=39;md5=048bf9f68963c207a0c2b3a94c9d2aaa \
+    file://md5.c;endline=51;md5=0a448eea0bcbc89e3c7e6608f2d119a0 \
+    file://usock.h;endline=18;md5=f0dfdc8de858e66d66d74036611bba14 \
+"
+
+PR = "r0"
+
+DEPENDS = "json-c"
+RDEPENDS_${PN} = "json-c"
+
+SRC_URI = "git://git.openwrt.org/project/libubox.git;protocol=git;branch=master"
+
+SRCREV = "136a5196266d03d537f822c4e67d2fde2ed59505"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DBUILD_EXAMPLES=OFF -DBUILD_LUA=OFF"
+
+INSANE_SKIP_libubox += "dev-deps"
-- 
2.1.4


