Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0ZUU-0007xs-I2
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 13:36:33 +0200
Received: (qmail 5826 invoked by uid 813007); 21 Oct 2009 11:35:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 11:35:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 13:37:14 +0200
Message-Id: <1256125034-10826-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1256121007-19753-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1256121007-19753-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.23: dropped em-x270 copy of time.h.patch
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
X-List-Received-Date: Wed, 21 Oct 2009 11:36:34 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../em-x270/01-prevent_loop_timespec_add_ns.patch  |   19 -------------------
 recipes/linux/linux_2.6.23.bb                      |    3 +--
 2 files changed, 1 insertions(+), 21 deletions(-)
 delete mode 100644 recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch

diff --git a/recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch b/recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch
deleted file mode 100644
index a2f6e17..0000000
--- a/recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch
+++ /dev/null
@@ -1,19 +0,0 @@
----
- include/linux/time.h |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-diff --git a/include/linux/time.h b/include/linux/time.h
-index 2091a19..d32ef0a 100644
---- a/include/linux/time.h
-+++ b/include/linux/time.h
-@@ -173,6 +173,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
- {
-	ns += a->tv_nsec;
-	while(unlikely(ns >= NSEC_PER_SEC)) {
-+		/* The following asm() prevents the compiler from
-+		 * optimising this loop into a modulo operation.  */
-+		asm("" : "+r"(ns));
-+		
-		ns -= NSEC_PER_SEC;
-		a->tv_sec++;
-	}
-
diff --git a/recipes/linux/linux_2.6.23.bb b/recipes/linux/linux_2.6.23.bb
index 69cdb57..65f400d 100644
--- a/recipes/linux/linux_2.6.23.bb
+++ b/recipes/linux/linux_2.6.23.bb
@@ -31,8 +31,7 @@ SRC_URI_avr32 = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.23.tar.bz2
                  http://avr32linux.org/twiki/pub/Main/LinuxPatches/linux-2.6.23.atmel.3.patch.bz2;patch=1 \
                 "
 SRC_URI_append_em-x270 = "\
-	file://em-x270.patch;patch=1 \
-	file://01-prevent_loop_timespec_add_ns.patch;patch=1"
+	file://em-x270.patch;patch=1 "
 
 SRC_URI_append_cm-x270 = "\
 	file://0001-cm-x270-base2.patch;patch=1 \
-- 
1.6.5





