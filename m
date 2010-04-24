Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O5fEb-0003ug-B4
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 15:17:26 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 628114B011B;
	Sat, 24 Apr 2010 15:13:46 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 608234B004D;
	Sat, 24 Apr 2010 15:13:44 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Apr 2010 15:14:47 +0200
Message-Id: <1272114888-16964-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1272114888-16964-2-git-send-email-eric@eukrea.com>
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>
	<1272114888-16964-2-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Sat, 24 Apr 2010 13:17:26 -0000

this patch fix the following error (met for a x86 target) :

| loader/module.o: In function `MODULE_GetProcAddress':
| module.c:(.text+0x125): undefined reference to `report_entry'
| module.c:(.text+0x12f): undefined reference to `report_ret'
| module.c:(.text+0x139): undefined reference to `wrapper_target'
| module.c:(.text+0x13e): undefined reference to `wrapper'
| loader/module.o: In function `LoadLibraryExA':
| module.c:(.text+0x10d4): undefined reference to `report_entry'
| module.c:(.text+0x10de): undefined reference to `report_ret'
| module.c:(.text+0x10ea): undefined reference to `wrapper_target'
| module.c:(.text+0x10f0): undefined reference to `wrapper'
| collect2: ld returned 1 exit status
| make: *** [mplayer] Error 1

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/mplayer/files/fix-emu_qtx_api.diff |   33 ++++++++++++++++++++++++++++
 recipes/mplayer/mplayer_svn.bb             |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mplayer/files/fix-emu_qtx_api.diff

diff --git a/recipes/mplayer/files/fix-emu_qtx_api.diff b/recipes/mplayer/files/fix-emu_qtx_api.diff
new file mode 100644
index 0000000..e657475
--- /dev/null
+++ b/recipes/mplayer/files/fix-emu_qtx_api.diff
@@ -0,0 +1,33 @@
+http://bugs.gentoo.org/213836
+
+Fix the following error :
+
+| loader/module.o: In function `MODULE_GetProcAddress':
+| module.c:(.text+0x125): undefined reference to `report_entry'
+| module.c:(.text+0x12f): undefined reference to `report_ret'
+| module.c:(.text+0x139): undefined reference to `wrapper_target'
+| module.c:(.text+0x13e): undefined reference to `wrapper'
+| loader/module.o: In function `LoadLibraryExA':
+| module.c:(.text+0x10d4): undefined reference to `report_entry'
+| module.c:(.text+0x10de): undefined reference to `report_ret'
+| module.c:(.text+0x10ea): undefined reference to `wrapper_target'
+| module.c:(.text+0x10f0): undefined reference to `wrapper'
+| collect2: ld returned 1 exit status
+| make: *** [mplayer] Error 1
+
+---
+diff --git a/loader/module.c b/loader/module.c
+index e316cf0..2023acb 100644
+--- a/loader/module.c
++++ b/loader/module.c
+@@ -9,8 +9,8 @@
+  */
+ 
+ // define for quicktime calls debugging and/or MacOS-level emulation:
+-#ifndef __APPLE__
+-#define EMU_QTX_API
++#ifdef __APPLE__
++#undef EMU_QTX_API
+ #endif /* __APPLE__ */
+ 
+ // define for quicktime debugging (verbose logging):
diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
index dd94767..3a08e26 100644
--- a/recipes/mplayer/mplayer_svn.bb
+++ b/recipes/mplayer/mplayer_svn.bb
@@ -14,6 +14,7 @@ SRC_URI = "svn://svn.mplayerhq.hu/mplayer;module=trunk \
        file://fix-exp.diff;patch=1;maxrev=30291 \
 	   file://fix-addrinfo.patch;patch=1;maxrev=30302 \
        file://fix-avconfig.diff;patch=1;maxrev=30376 \
+	   file://fix-emu_qtx_api.diff;patch=1;maxrev=30165 \
 "
 
 SRCREV = "30165"
-- 
1.6.3.3



