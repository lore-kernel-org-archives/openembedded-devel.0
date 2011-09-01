Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qz22B-0007UM-6g
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 09:49:59 +0200
Received: by wyf19 with SMTP id 19so1141423wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 00:45:04 -0700 (PDT)
Received: by 10.227.174.140 with SMTP id t12mr1287828wbz.79.1314863104024;
	Thu, 01 Sep 2011 00:45:04 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo6sm273039wbb.31.2011.09.01.00.45.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 00:45:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 09:44:51 +0200
Message-Id: <1314863091-17113-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-xfce] task-xfce-base: add thunar-volman
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Sep 2011 07:49:59 -0000

This fixes:

ERROR: There is a comment on line 34 of file /OE/tentacle/sources/meta-openembedded/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb (#    thunar-volman \) which is in the middle of a multiline expression.
Bitbake used to ignore these but no longer does so, please fix your metadata as errors are likely as a result of this change.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-base.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
index 8a87203..7589f6d 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -31,5 +31,5 @@ RDEPENDS_${PN} = " \
     xfce4-settings \
     xfce-terminal \
     thunar \
-#    thunar-volman \
+    thunar-volman \
 "
-- 
1.6.6.1



