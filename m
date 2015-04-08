Return-Path: <denis@denix.org>
X-Greylist: delayed 2569 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Apr 2015 19:26:13 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id ED91D60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:26:13 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI00EF45ZGUJG0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2015 14:26:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=A7bb5BSD c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8	a=4VFo6o5B7CgOG3CVBxMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 24FCE200DD;	Wed,
	8 Apr 2015 15:26:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 08 Apr 2015 15:26:04 -0400
Message-id: <1428521164-1218-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qt5.inc: suppress QA warnings about examples libs not in libdir
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
X-List-Received-Date: Wed, 08 Apr 2015 19:26:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qt5.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 9d5bca5..0d7269c 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -40,6 +40,12 @@ do_configure_prepend() {
     mkdir -p ${S}/.git || true
 }
 
+# Many examples come with libraries installed outside of standard libdir,
+# suppress QA check complaining
+INSANE_SKIP_${PN}-examples += "libdir"
+INSANE_SKIP_${PN}-examples-dbg += "libdir"
+INSANE_SKIP_${PN}-examples-dev += "libdir"
+
 PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 # extra -dbg packages
-- 
2.2.0


