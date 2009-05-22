Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1M7YiD-00074d-MJ
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 19:39:18 +0200
Received: from localhost.localdomain ([62.205.175.245]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n4MHVYS9005868
	for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 21:31:35 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Date: Fri, 22 May 2009 21:31:34 +0400
Message-Id: <1243013494-7590-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.0.6
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Fri, 22 May 2009 21:31:35 +0400 (MSD)
Subject: [PATCH] linux-handhelds-2.6: fix compilation with gcc-4.3
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
X-List-Received-Date: Fri, 22 May 2009 17:39:22 -0000

Backport time.h patch from 2.6.25 kernel
(commit 38332cb98772f5ea757e6486bed7ed0381cb5f98)

It fixes following error during compilation:
  LD      .tmp_vmlinux1
kernel/built-in.o: In function `getnstimeofday':
utsname_sysctl.c:(.text+0xf110): undefined reference to `__aeabi_uldivmod'
kernel/built-in.o: In function `do_gettimeofday':
utsname_sysctl.c:(.text+0xf1d0): undefined reference to `__aeabi_uldivmod'
utsname_sysctl.c:(.text+0xf1ec): undefined reference to `__aeabi_uldivmod'
kernel/built-in.o: In function `do_timer':
utsname_sysctl.c:(.text+0x100ec): undefined reference to `__aeabi_uldivmod'
utsname_sysctl.c:(.text+0x1010c): undefined reference to `__aeabi_uldivmod'
make: *** [.tmp_vmlinux1] Error 1

See also similar OE bug #4333

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 ...vent-the-loop-in-timespec_add_ns-from-bei.patch |   34 ++++++++++++++++++++
 recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb   |    3 +-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch

diff --git a/recipes/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch b/recipes/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
new file mode 100644
index 0000000..ad10b67
--- /dev/null
+++ b/recipes/linux/linux-handhelds-2.6-2.6.21/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
@@ -0,0 +1,34 @@
+From 38332cb98772f5ea757e6486bed7ed0381cb5f98 Mon Sep 17 00:00:00 2001
+From: Segher Boessenkool <segher@kernel.crashing.org>
+Date: Tue, 4 Mar 2008 14:59:54 -0800
+Subject: [PATCH] time: prevent the loop in timespec_add_ns() from being optimised away
+
+Since some architectures don't support __udivdi3().
+
+Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>
+Cc: john stultz <johnstul@us.ibm.com>
+Cc: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+---
+ include/linux/time.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/time.h b/include/linux/time.h
+index 2091a19..d32ef0a 100644
+--- a/include/linux/time.h
++++ b/include/linux/time.h
+@@ -174,6 +174,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
+ {
+ 	ns += a->tv_nsec;
+ 	while(unlikely(ns >= NSEC_PER_SEC)) {
++		/* The following asm() prevents the compiler from
++		 * optimising this loop into a modulo operation.  */
++		asm("" : "+r"(ns));
++
+ 		ns -= NSEC_PER_SEC;
+ 		a->tv_sec++;
+ 	}
+-- 
+1.6.0.6
+
diff --git a/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb b/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb
index f6bb173..d955c0a 100644
--- a/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb
+++ b/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb
@@ -1,7 +1,7 @@
 SECTION = "kernel"
 DESCRIPTION = "handhelds.org Linux kernel 2.6 for PocketPCs and other consumer handheld devices."
 LICENSE = "GPL"
-PR = "r25"
+PR = "r26"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -13,6 +13,7 @@ SRC_URI = "${HANDHELDS_CVS};module=linux/kernel26;tag=${@'K' + bb.data.getVar('P
            file://linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch;patch=1 \
            http://www.rpsys.net/openzaurus/patches/archive/export_atags-r0a.patch;patch=1 \
            file://gcc4x-limits.patch;patch=1 \
+           file://0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch;patch=1 \
 	   file://defconfig"
 
 require linux-handhelds-2.6.inc
-- 
1.6.0.6



