Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59E-0003Bh-Ht
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:12 +0200
Received: (qmail 32140 invoked by uid 813007); 1 Jul 2009 18:55:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:16 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:00 +0200
Message-Id: <1246474518-16737-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	john stultz <johnstul@us.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@elte.hu>
Subject: [STABLE][PATCH 098/125] linux-rp-2.6.24: fix compilation with gcc-4.3
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:12 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Since some architectures don't support __udivdi3().

Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>
Cc: john stultz <johnstul@us.ibm.com>
Cc: Ingo Molnar <mingo@elte.hu>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 ...vent-the-loop-in-timespec_add_ns-from-bei.patch |   15 +++++++++++++++
 recipes/linux/linux-rp_2.6.24.bb                   |    3 ++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch

diff --git a/recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch b/recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
new file mode 100644
index 0000000..9d7020d
--- /dev/null
+++ b/recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
@@ -0,0 +1,15 @@
+Index: linux-2.6.24/include/linux/time.h
+===================================================================
+--- a/include/linux/time.h
++++ b/include/linux/time.h
+@@ -172,6 +172,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
+ {
+	ns += a->tv_nsec;
+	while(unlikely(ns >= NSEC_PER_SEC)) {
++		/* The following asm() prevents the compiler from
++		 * optimising this loop into a modulo operation.  */
++		asm("" : "+r"(ns));
++
+		ns -= NSEC_PER_SEC;
+		a->tv_sec++;
+	}
diff --git a/recipes/linux/linux-rp_2.6.24.bb b/recipes/linux/linux-rp_2.6.24.bb
index 7b06916..dd73738 100644
--- a/recipes/linux/linux-rp_2.6.24.bb
+++ b/recipes/linux/linux-rp_2.6.24.bb
@@ -1,6 +1,6 @@
 require linux-rp.inc
 
-PR = "r22"
+PR = "r23"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_collie = "1"
@@ -23,6 +23,7 @@ DEFAULT_PREFERENCE_spitz = "1"
 # Patches submitted upstream are towards top of this list 
 # Hacks should clearly named and at the bottom
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2 \
+	   file://0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch;patch=1 \
            ${RPSRC}/export_atags-r2.patch;patch=1;status=pending \
            ${RPSRC}/lzo_crypto-r2.patch;patch=1;status=pending \
            ${RPSRC}/corgi_rearrange_lcd-r0.patch;patch=1;status=pending \
-- 
1.6.3.1





