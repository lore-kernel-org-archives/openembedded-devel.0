Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NYLfS-0000b2-Ha
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 16:43:29 +0100
Received: (qmail 3609 invoked by uid 813007); 22 Jan 2010 15:41:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jan 2010 15:41:07 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 16:41:00 +0100
Message-Id: <1264174860-2130-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH] sanity.bbclass: handle lack of permission to read /proc/sys/vm/mmap_min_addr
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
X-List-Received-Date: Fri, 22 Jan 2010 15:43:29 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
  "cat /proc/sys/vm/mmap_min_addr" returns now
  "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
  Its probably becuse of
  http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
  But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
  is intentional or just bug which should be fixed in kernel.

This patch makes bitbake ignore reading error. Possible QEmu failure is not
handled yet.

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/sanity.bbclass |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index f65df61..f57d8e4 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -96,11 +96,14 @@ def check_sanity(e):
 			if not check_app_exists("qemu-arm", e.data):
 				messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-		if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-			f = file("/proc/sys/vm/mmap_min_addr", "r")
-			if (f.read().strip() != "0"):
-				messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
-			f.close()
+		try:
+			if os.path.exists("/proc/sys/vm/mmap_min_addr"):
+				f = file("/proc/sys/vm/mmap_min_addr", "r")
+				if (f.read().strip() != "0"):
+					messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
+				f.close()
+		except:
+			pass
 
 	for util in required_utilities.split():
 		if not check_app_exists( util, e.data ):
-- 
1.6.6





