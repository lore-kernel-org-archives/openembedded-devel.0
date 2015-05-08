Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DCA0F60034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 19:14:59 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t48JF0sh011448 for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 14:15:00 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015050814150047-1121765 ;
	Fri, 8 May 2015 14:15:00 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 May 2015 14:14:46 -0500
Message-Id: <1431112486-23487-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.2.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/08/2015 02:15:00 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/08/2015 02:15:00 PM,
	Serialize complete at 05/08/2015 02:15:00 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-08_07:, , signatures=0
Subject: [PATCH] dpkg start-stop-daemon: Fix RCONFLICTS typo
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
X-List-Received-Date: Fri, 08 May 2015 19:15:00 -0000

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Reviewed-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Brad Mouring <brad.mouring@ni.com>
---
 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index c8d88b7..efdd6b7 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
 # start-stop-daemon is usually shipped by dpkg
 DEPENDS = "ncurses"
-RCONFLICS_${PN} = "dpkg" 
+RCONFLICTS_${PN} = "dpkg"
 
 PNBLACKLIST[start-stop-daemon] ?= "BROKEN: fails because of gettext, partial fix is available here http://patchwork.openembedded.org/patch/89867/"
 
-- 
2.2.2


