Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0YRT-0004TX-Bf
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 12:29:22 +0200
Received: (qmail 8261 invoked by uid 813007); 21 Oct 2009 10:28:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 10:28:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 12:30:07 +0200
Message-Id: <1256121007-19753-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1256120603-4832-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1256120603-4832-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.23: added time.h.patch to make it build for ARM
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
X-List-Received-Date: Wed, 21 Oct 2009 10:29:22 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux-2.6.23/time.h.patch |   25 +++++++++++++++++++++++++
 recipes/linux/linux_2.6.23.bb           |    2 ++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.23/time.h.patch

diff --git a/recipes/linux/linux-2.6.23/time.h.patch b/recipes/linux/linux-2.6.23/time.h.patch
new file mode 100644
index 0000000..fd22f3a
--- /dev/null
+++ b/recipes/linux/linux-2.6.23/time.h.patch
@@ -0,0 +1,25 @@
+....since some architectures don't support __udivdi3() (and
+ we don't want to use that, anyway).
+ 
+ Signed-off-by: Segher Boessenkool 
+ ---
+ include/linux/time.h | 4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+
+Index: linux-2.6.24/include/linux/time.h
+===================================================================
+--- linux-2.6.24.orig/include/linux/time.h	2008-06-23 11:17:09.021841180 +0200
++++ linux-2.6.24/include/linux/time.h	2008-06-23 11:18:34.445167140 +0200
+@@ -173,6 +173,11 @@
+ {
+ 	ns += a->tv_nsec;
+ 	while(unlikely(ns >= NSEC_PER_SEC)) {
++		/* The following asm() prevents the compiler from
++		 * optimising this loop into a modulo operation.
++		 */
++		asm("" : "+r"(ns));
++
+ 		ns -= NSEC_PER_SEC;
+ 		a->tv_sec++;
+ 	}
diff --git a/recipes/linux/linux_2.6.23.bb b/recipes/linux/linux_2.6.23.bb
index 1485444..69cdb57 100644
--- a/recipes/linux/linux_2.6.23.bb
+++ b/recipes/linux/linux_2.6.23.bb
@@ -23,6 +23,8 @@ SRC_URI += "file://sched-cfs-v2.6.23.12-v24.1.patch;patch=1"
 # Add support for squashfs-lzma (a highly compressed read-only filesystem)
 SRC_URI += "http://kamikaze.waninkoko.info/patches/2.6.23/klight1/broken-out/squashfs-lzma-2.6.23.patch;patch=1"
 
+SRC_URI += "file://time.h.patch;patch=1"
+
 # The Atmel patch doesn't apply against 2.6.23.12  :( 
 SRC_URI_avr32 = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.23.tar.bz2 \
                  file://defconfig \
-- 
1.6.5





