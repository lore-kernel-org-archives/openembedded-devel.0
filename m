Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OW1LL-0007Ny-L8
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 08:09:23 +0200
Received: from localhost.localdomain (95.244.160.23) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A7C003988EF; Tue, 6 Jul 2010 08:01:46 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jul 2010 08:01:41 +0200
Message-Id: <1278396101-30522-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1278396101-30522-1-git-send-email-GNUtoo@no-log.org>
References: <1278396101-30522-1-git-send-email-GNUtoo@no-log.org>
X-SA-Exim-Connect-IP: 82.57.200.98
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] htcdream.conf: use xf86-video-fbdev and xf86-video-tslib
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
X-List-Received-Date: Tue, 06 Jul 2010 06:09:23 -0000


Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/machine/htcdream.conf |   11 +++++++++++
 recipes/tasks/task-x11.bb  |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/conf/machine/htcdream.conf b/conf/machine/htcdream.conf
index a10edb8..3cf1ebf 100644
--- a/conf/machine/htcdream.conf
+++ b/conf/machine/htcdream.conf
@@ -19,3 +19,14 @@ MACHINE_EXTRA_RRECOMMENDS = "\
 "
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-leviathan"
+
+XSERVER = " \
+        xserver-xorg \
+        xserver-xorg-extension-glx \
+        xserver-xorg-extension-dri \
+        xf86-input-tslib \
+        xf86-input-evdev \
+        xf86-input-mouse \
+        xf86-input-keyboard \
+        xf86-video-fbdev \
+"
diff --git a/recipes/tasks/task-x11.bb b/recipes/tasks/task-x11.bb
index 5eeb8ba..77e281e 100644
--- a/recipes/tasks/task-x11.bb
+++ b/recipes/tasks/task-x11.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 PV = "1.0"
-PR = "r4"
+PR = "r5"
 
 # WORK IN PROGRESS
 
-- 
1.7.0.4



