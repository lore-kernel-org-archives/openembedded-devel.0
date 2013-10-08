Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id 712466A441
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 04:07:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUC00MLI0T38L70@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Oct 2013 23:08:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EE6E320091; Tue,
	08 Oct 2013 00:07:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Oct 2013 00:07:46 -0400
Message-id: <1381205266-29787-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qtbase.inc: PACKAGECONFIG[linuxfb] shouldn't depend on nonexistent linuxfb package
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
X-List-Received-Date: Tue, 08 Oct 2013 04:07:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index b2fa645..5d2d598 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -106,7 +106,7 @@ PACKAGECONFIG[gstreamer] = "-gstreamer,-no-gstreamer,gstreamer"
 PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
 PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
-PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb,linuxfb"
+PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
 PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
 # needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
-- 
1.8.3.2


