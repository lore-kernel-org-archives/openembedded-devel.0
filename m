Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkh-0001Hp-Ro
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:07 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 03979189477; Tue, 31 Mar 2009 22:40:16 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:16 +0200
Message-Id: <1238532016-3172-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] linux-omap 2.6.29: disable alignment trapping completely for omap3board
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:08 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../linux/linux-omap-2.6.29/beagleboard/defconfig  |    2 +-
 .../linux-omap-2.6.29/fix-unaligned-access.diff    |   41 ++++++++++++++++++++
 .../linux-omap-2.6.29/make-alignment-visible.diff  |   26 ++++++++++++
 .../linux-omap-2.6.29/omap3-pandora/defconfig      |    2 +-
 recipes/linux/linux-omap-2.6.29/omap3evm/defconfig |    2 +-
 recipes/linux/linux-omap-2.6.29/omapzoom/defconfig |    2 +-
 recipes/linux/linux-omap_2.6.29.bb                 |    4 +-
 7 files changed, 74 insertions(+), 5 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff
 create mode 100644 recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff

diff --git a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
index f6c503c..2292ae2 100644
--- a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
@@ -288,7 +288,7 @@ CONFIG_ZONE_DMA_FLAG=0
 CONFIG_VIRT_TO_BUS=y
 CONFIG_UNEVICTABLE_LRU=y
 CONFIG_LEDS=y
-CONFIG_ALIGNMENT_TRAP=y
+CONFIG_ALIGNMENT_TRAP=n
 
 #
 # Boot options
diff --git a/recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff b/recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff
new file mode 100644
index 0000000..c82090f
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.29/fix-unaligned-access.diff
@@ -0,0 +1,41 @@
+From: Mans Rullgard <mans@mansr.com>
+Date: Sat, 28 Mar 2009 12:54:25 +0000 (+0000)
+Subject: NSM: Fix unaligned accesses in nsm_init_private()
+X-Git-Url: http://git.mansr.com/?p=linux-omap;a=commitdiff_plain;h=8f2bd6fdde1ebfef57f65b6cf29b29008c23d297
+
+NSM: Fix unaligned accesses in nsm_init_private()
+
+This fixes unaligned accesses in nsm_init_private() when
+creating nlm_reboot keys.
+
+Signed-off-by: Mans Rullgard <mans@mansr.com>
+---
+
+diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
+index 5e2c4d5..6d5d4a4 100644
+--- a/fs/lockd/mon.c
++++ b/fs/lockd/mon.c
+@@ -16,6 +16,8 @@
+ #include <linux/sunrpc/svc.h>
+ #include <linux/lockd/lockd.h>
+ 
++#include <asm/unaligned.h>
++
+ #define NLMDBG_FACILITY		NLMDBG_MONITOR
+ #define NSM_PROGRAM		100024
+ #define NSM_VERSION		1
+@@ -274,10 +276,12 @@ static void nsm_init_private(struct nsm_handle *nsm)
+ {
+ 	u64 *p = (u64 *)&nsm->sm_priv.data;
+ 	struct timespec ts;
++	s64 ns;
+ 
+ 	ktime_get_ts(&ts);
+-	*p++ = timespec_to_ns(&ts);
+-	*p = (unsigned long)nsm;
++	ns = timespec_to_ns(&ts);
++	put_unaligned(ns, p);
++	put_unaligned((unsigned long)nsm, p + 1);
+ }
+ 
+ static struct nsm_handle *nsm_create_handle(const struct sockaddr *sap,
diff --git a/recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff b/recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff
new file mode 100644
index 0000000..9b3958f
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.29/make-alignment-visible.diff
@@ -0,0 +1,26 @@
+From: Mans Rullgard <mans@mansr.com>
+Date: Mon, 13 Oct 2008 19:32:16 +0000 (+0100)
+Subject: ARM: Add prompt for CONFIG_ALIGNMENT_TRAP
+X-Git-Url: http://git.mansr.com/?p=linux-omap;a=commitdiff_plain;h=60d60f0ca47fcf4fbb649e45aa64f5a0a4c2f2c8
+
+ARM: Add prompt for CONFIG_ALIGNMENT_TRAP
+
+This adds a prompt text for CONFIG_ALIGNMENT_TRAP, thus making it
+visible in make *config.
+
+Signed-off-by: Mans Rullgard <mans@mansr.com>
+---
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 61314f6..18d3119 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -971,7 +971,7 @@ config LEDS_CPU
+ 	  will overrule the CPU usage LED.
+ 
+ config ALIGNMENT_TRAP
+-	bool
++	bool "Enable alignment trap"
+ 	depends on CPU_CP15_MMU
+ 	default y if !ARCH_EBSA110
+ 	help
diff --git a/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig b/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig
index 5db83f0..8ac420c 100644
--- a/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/omap3-pandora/defconfig
@@ -298,7 +298,7 @@ CONFIG_ZONE_DMA_FLAG=0
 CONFIG_VIRT_TO_BUS=y
 CONFIG_UNEVICTABLE_LRU=y
 CONFIG_LEDS=y
-CONFIG_ALIGNMENT_TRAP=y
+CONFIG_ALIGNMENT_TRAP=n
 
 #
 # Boot options
diff --git a/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig b/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig
index da5a8c4..da72671 100644
--- a/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/omap3evm/defconfig
@@ -298,7 +298,7 @@ CONFIG_ZONE_DMA_FLAG=0
 CONFIG_VIRT_TO_BUS=y
 CONFIG_UNEVICTABLE_LRU=y
 CONFIG_LEDS=y
-CONFIG_ALIGNMENT_TRAP=y
+CONFIG_ALIGNMENT_TRAP=n
 
 #
 # Boot options
diff --git a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
index d2d2ee5..aa11eb0 100644
--- a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
@@ -291,7 +291,7 @@ CONFIG_ZONE_DMA_FLAG=0
 CONFIG_VIRT_TO_BUS=y
 CONFIG_UNEVICTABLE_LRU=y
 # CONFIG_LEDS is not set
-CONFIG_ALIGNMENT_TRAP=y
+CONFIG_ALIGNMENT_TRAP=n
 
 #
 # Boot options
diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
index f5c20ba..a74bd62 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -10,7 +10,7 @@ DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "90e758af52ba803cba233fabee81176d99589f09"
 
-PR = "r2+gitr${SRCREV}"
+PR = "r3+gitr${SRCREV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
 	   file://defconfig"
@@ -22,6 +22,8 @@ SRC_URI_append = " \
            file://fix-install.patch;patch=1 \
            file://DSS2.diff;patch=1 \
            file://0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch;patch=1 \
+           file://fix-unaligned-access.diff;patch=1 \
+           file://make-alignment-visible.diff;patch=1 \
 "
 
 
-- 
1.5.6.5



