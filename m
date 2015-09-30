Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C002477010
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:33:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8U9XJqr005336 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 04:33:19 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015093004331911-785736 ;
	Wed, 30 Sep 2015 04:33:19 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 12:33:18 +0300
Message-Id: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/30/2015 04:33:19 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/30/2015 04:33:19 AM,
	Serialize complete at 09/30/2015 04:33:19 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_02:, , signatures=0
Subject: [meta-oe][PATCH] meta-oe: recipes-connectivity: add relayd recipe
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
X-List-Received-Date: Wed, 30 Sep 2015 09:33:20 -0000

relayd is a daemon to relay and dynamically redirect incoming
connections to a target host.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-connectivity/relayd/relayd_git.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/relayd/relayd_git.bb

diff --git a/meta-oe/recipes-connectivity/relayd/relayd_git.bb b/meta-oe/recipes-connectivity/relayd/relayd_git.bb
new file mode 100644
index 0000000..15fba0c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/relayd/relayd_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Layer 3 relay daemon"
+SECTION = "console/network"
+LICENSE = "relayd-custom-license"
+LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab2"
+PR = "r0"
+
+DEPENDS = "libubox"
+RDEPENDS_${PN} = "libubox"
+
+SRC_URI = "git://nbd.name/relayd.git;protocol=git;branch=master"
+
+SRCREV = "2970ff60bac6b70ecb682779d5c776dc559dc0b9"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+INSANE_SKIP_relayd += "dev-deps"
-- 
2.1.4


