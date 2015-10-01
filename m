Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5B2C7707A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:21:20 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t91ELKBb014206 for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Oct 2015 09:21:20 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015100109212050-893761 ;
	Thu, 1 Oct 2015 09:21:20 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Oct 2015 17:21:16 +0300
Message-Id: <1443709276-1285-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
References: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/01/2015 09:21:20 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/01/2015 09:21:20 AM,
	Serialize complete at 10/01/2015 09:21:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-01_04:, , signatures=0
Subject: [meta-oe][PATCH V3] meta-networking: recipes-connectivity: add relayd recipe
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
X-List-Received-Date: Thu, 01 Oct 2015 14:21:25 -0000

relayd is a daemon to relay and dynamically redirect incoming
connections to a target host.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/relayd/relayd_git.bb

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
new file mode 100644
index 0000000..aab2ab5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Layer 3 relay daemon"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab2"
+
+DEPENDS = "libubox"
+
+SRC_URI = "git://nbd.name/relayd.git"
+
+SRCREV = "2970ff60bac6b70ecb682779d5c776dc559dc0b9"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.1.4


