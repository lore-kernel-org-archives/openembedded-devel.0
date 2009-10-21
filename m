Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0YTt-0004c2-IP
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 12:31:52 +0200
Received: (qmail 18572 invoked by uid 813007); 21 Oct 2009 10:30:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 10:30:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 12:32:34 +0200
Message-Id: <1256121154-20304-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255966150-1854-7-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-7-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.24: drop time.h.patch - it is in 2.6.24.7 update
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
X-List-Received-Date: Wed, 21 Oct 2009 10:31:52 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux-2.6.24/time.h.patch |   25 -------------------------
 recipes/linux/linux_2.6.24.bb           |    1 -
 2 files changed, 0 insertions(+), 26 deletions(-)
 delete mode 100644 recipes/linux/linux-2.6.24/time.h.patch

diff --git a/recipes/linux/linux-2.6.24/time.h.patch b/recipes/linux/linux-2.6.24/time.h.patch
deleted file mode 100644
index fd22f3a..0000000
--- a/recipes/linux/linux-2.6.24/time.h.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-....since some architectures don't support __udivdi3() (and
- we don't want to use that, anyway).
- 
- Signed-off-by: Segher Boessenkool 
- ---
- include/linux/time.h | 4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-
-Index: linux-2.6.24/include/linux/time.h
-===================================================================
---- linux-2.6.24.orig/include/linux/time.h	2008-06-23 11:17:09.021841180 +0200
-+++ linux-2.6.24/include/linux/time.h	2008-06-23 11:18:34.445167140 +0200
-@@ -173,6 +173,11 @@
- {
- 	ns += a->tv_nsec;
- 	while(unlikely(ns >= NSEC_PER_SEC)) {
-+		/* The following asm() prevents the compiler from
-+		 * optimising this loop into a modulo operation.
-+		 */
-+		asm("" : "+r"(ns));
-+
- 		ns -= NSEC_PER_SEC;
- 		a->tv_sec++;
- 	}
diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.bb
index 5a09516..b92428e 100644
--- a/recipes/linux/linux_2.6.24.bb
+++ b/recipes/linux/linux_2.6.24.bb
@@ -18,7 +18,6 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2 \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;patch=1 \
            file://squashfs-lzma-2.6.24.patch;patch=1 \
            file://ubifs-v2.6.24.patch;patch=1 \
-	   file://time.h.patch;patch=1 \
            file://defconfig"
 
 # Moved away temporarely until committed properly (work in progress).
-- 
1.6.5





