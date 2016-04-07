Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Apr 2016 21:40:53 UTC
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA39D77029
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 21:40:53 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5A000826R596A0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	07 Apr 2016 15:40:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=D4VOAvlNxgG0TA_F7AUA:9
Received: by 100.15.86.14 with SMTP id 11027ffd; Thu, 07 Apr 2016 20:40:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 987D8161F54;	Thu,
	7 Apr 2016 16:40:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Apr 2016 16:40:00 -0400
Message-id: <1460061600-28075-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] ne10: use bb.debug for debug messages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 21:40:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Moreover, the messages are misleading, saying "Building for arch blah",
even when this recipe is not being built. It merely checks if the recipe
is cmaptible with the currently used architecture.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 4d753a0..de97982 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -20,10 +20,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 python () {
     if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES', True).split()):
         d.setVar('NE10_TARGET_ARCH', 'armv7')
-        bb.note('Building Ne10 for armv7')
+        bb.debug(2, 'Building Ne10 for armv7')
     elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES', True).split()):
         d.setVar('NE10_TARGET_ARCH', 'aarch64')
-        bb.note('Building Ne10 for aarch64')
+        bb.debug(2, 'Building Ne10 for aarch64')
     else:
         raise bb.parse.SkipPackage("Incompatible with archs other than armv7 and aarch64")
 }
-- 
2.2.0


