Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NFraS-0001gn-Cl
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 16:57:55 +0100
Received: (qmail 17820 invoked by uid 813007); 2 Dec 2009 15:56:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Dec 2009 15:56:14 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Dec 2009 16:56:26 +0100
Message-Id: <1259769386-5786-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5.3
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] linux-bug: bumped SRCREV for new fixes, autoload SDIO wifi
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
X-List-Received-Date: Wed, 02 Dec 2009 15:57:55 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

---
 recipes/linux/linux-bug_2.6.27.2.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
index bb4d11f..85ed0a9 100644
--- a/recipes/linux/linux-bug_2.6.27.2.bb
+++ b/recipes/linux/linux-bug_2.6.27.2.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
 
 PV_append = "+svnr${SRCREV}"
 KV = "2.6.27.2"
-PR = "r30"
+PR = "r31"
 
 COMPATIBLE_MACHINE = "bug"
 
 SVN_PRJ = "bug-linux-${KV}"
-SRCREV = "10371"
+SRCREV = "10550"
 
 SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
            file://defconfig \
@@ -46,5 +46,6 @@ module_autoload_bugpm = "bugpm"
 module_autoload_bugpm_apm = "bugpm_apm"
 module_autoload_rtc-isl12026 = "rtc-isl12026"
 module_autoload_bug_v4l2_capture = "bug_v4l2_capture"
+module_autoload_libertas_sdio = "libertas_sdio"
 # bmi_lcd_core loaded to ensure xserver device nodes are created on boot.
 module_autoload_bmi_lcd_core = "bmi_lcd_core"
-- 
1.6.5.3





