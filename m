Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhNjk-0003Uz-Vu
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:49:45 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwEAGcgPU1bdWOb/2dsb2JhbACEE6FIqxqDOwGMcoEkgzh0BIsg
X-IronPort-AV: E=Sophos;i="4.60,370,1291590000"; d="scan'208";a="800176479"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Jan 2011 15:49:01 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNj3-0006WA-JI; Mon, 24 Jan 2011 15:49:01 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNj3-0007lu-Fh; Mon, 24 Jan 2011 15:49:01 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhNj3-0006LK-50; Mon, 24 Jan 2011 15:49:01 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 15:48:59 +0100
Message-Id: <d51a8cfd5ef81f649c82d490a2b9359c47735250.1295880053.git.vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <cover.1295880053.git.vjaquez@igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
In-Reply-To: <cover.1295880053.git.vjaquez@igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: [PATCH 2/2] linux-omap4: fix break caused by the new binutils
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
X-List-Received-Date: Mon, 24 Jan 2011 14:49:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to this discussion [1], a couple patches where required by the
kernel using the latest binutils (2.21).

This patch add those patches, which were posted in the Ubuntu's kernel
repository.

1. http://comments.gmane.org/gmane.comp.handhelds.openembedded/40650

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 ...TU-Config-Fix-FTBS-caused-by-new-binutils.patch |   38 ++++++++++++++++++++
 ...0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch |   26 +++++++++++++
 recipes/linux/linux-omap4_2.6.35.3.bb              |    2 +
 3 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch
 create mode 100644 recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch

diff --git a/recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch b/recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch
new file mode 100644
index 0000000..e83a3e2
--- /dev/null
+++ b/recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch
@@ -0,0 +1,38 @@
+From 7699704e011db864c56f333bce9936a36522fb79 Mon Sep 17 00:00:00 2001
+From: Tim Gardner <tim.gardner@canonical.com>
+Date: Thu, 9 Dec 2010 08:16:52 -0700
+Subject: [PATCH 1/2] UBUNTU: [Config] Fix FTBS caused by new binutils
+
+New assemblers need -march=armv7-a+sec on command line or
+.arch_extension sec inline to enable use of the smc instruction.
+
+This patch uses as-instr to check the latter to conditionally
+enable the former in AFLAGS for files that use smc.
+
+Checked on both old and new binutils to verify that it does
+not break old versions.
+
+Signed-off-by: John Rigby <john.rigby@linaro.org>
+Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
+---
+ arch/arm/mach-omap2/Makefile |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
+index 75251b4..0241b4d 100644
+--- a/arch/arm/mach-omap2/Makefile
++++ b/arch/arm/mach-omap2/Makefile
+@@ -29,7 +29,9 @@ obj-$(CONFIG_HOTPLUG_CPU)		+= omap-hotplug.o
+ obj-$(CONFIG_ARCH_OMAP4)		+= omap44xx-smc.o omap4-common.o \
+ 					   omap4-wakeupgen.o
+ 
+-AFLAGS_omap44xx-smc.o			:=-Wa,-march=armv7-a
++plus_sec := $(call as-instr,.arch_extension sec,+sec)
++AFLAGS_omap-headsmp.o                  :=-Wa,-march=armv7-a$(plus_sec)
++AFLAGS_omap44xx-smc.o                  :=-Wa,-march=armv7-a$(plus_sec)
+ 
+ # Functions loaded to SRAM
+ obj-$(CONFIG_ARCH_OMAP2420)		+= sram242x.o
+-- 
+1.7.0.2
+
diff --git a/recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch b/recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch
new file mode 100644
index 0000000..ea16ab1
--- /dev/null
+++ b/recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch
@@ -0,0 +1,26 @@
+From da58d36fb6b13899249bf1efbf25f7385d048bb3 Mon Sep 17 00:00:00 2001
+From: Tim Gardner <tim.gardner@canonical.com>
+Date: Tue, 14 Dec 2010 06:56:34 -0700
+Subject: [PATCH 2/2] Add AFLAGS for sleep44xx to fix FTBS
+
+Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
+---
+ arch/arm/mach-omap2/Makefile |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
+index 0241b4d..865a3e2 100644
+--- a/arch/arm/mach-omap2/Makefile
++++ b/arch/arm/mach-omap2/Makefile
+@@ -59,6 +59,8 @@ obj-$(CONFIG_ARCH_OMAP4)		+= pm44xx.o pm_bus.o cpuidle44xx.o \
+ 					   omap4-mpuss-lowpower.o sleep44xx.o \
+ 					   voltage.o opp44xx_data.o
+ 
++AFLAGS_sleep44xx.o                  :=-Wa,-march=armv7-a$(plus_sec)
++
+ obj-$(CONFIG_PM_DEBUG)			+= pm-debug.o
+ obj-$(CONFIG_OMAP_SMARTREFLEX)          += sr_device.o smartreflex.o
+ obj-$(CONFIG_OMAP_SMARTREFLEX_CLASS3)	+= smartreflex-class3.o
+-- 
+1.7.0.2
+
diff --git a/recipes/linux/linux-omap4_2.6.35.3.bb b/recipes/linux/linux-omap4_2.6.35.3.bb
index 4db0b28..f5a11f4 100644
--- a/recipes/linux/linux-omap4_2.6.35.3.bb
+++ b/recipes/linux/linux-omap4_2.6.35.3.bb
@@ -15,6 +15,8 @@ SRC_URI = "git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol
            file://0006-ARM-Add-option-to-allow-userspace-access-to-performa.patch \
            file://0007-OMAP4-do-not-force-select-options-which-are-not-requ.patch \
            file://0008-omap4-pandaboard-add-support-for-DVI-output.patch \
+	   file://0001-UBUNTU-Config-Fix-FTBS-caused-by-new-binutils.patch \
+	   file://0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch \
            file://defconfig"
 
 S = "${WORKDIR}/git"
-- 
1.7.0.2



