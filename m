Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M4Fqh-0006jb-NK
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:54:23 +0200
Received: (qmail 25680 invoked by uid 813007); 13 May 2009 14:47:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 May 2009 14:47:38 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 16:46:54 +0200
Message-Id: <1242226019-10881-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 1/6] Remove alix machine, update geodelx one to use Alix settings
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
X-List-Received-Date: Wed, 13 May 2009 14:54:24 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

Alix.1c is GeodeLX based so no need to keep two machine configs.

And there are people which tries to use geodelx as base for their
devices and get into troubles as it uses quite old kernel.

Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 conf/machine/alix.conf    |   27 ---------------------------
 conf/machine/geodelx.conf |   15 ++++++++++++---
 2 files changed, 12 insertions(+), 30 deletions(-)
 delete mode 100644 conf/machine/alix.conf

diff --git a/conf/machine/alix.conf b/conf/machine/alix.conf
deleted file mode 100644
index 7b9aa98..0000000
--- a/conf/machine/alix.conf
+++ /dev/null
@@ -1,27 +0,0 @@
-#@TYPE: Machine
-#@NAME: Alix
-#@DESCRIPTION: Machine.inciguration for PC Engines Alix1c board
-#
-# http://pcengines.ch/alix1c.htm
-
-# i386 doesn't work with NTPL, see http://ecos.sourceware.org/ml/libc-ports/2006-03/msg00030.html
-TARGET_ARCH = "i586"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-
-OLDEST_KERNEL = "2.6.17"
-GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
-
-MACHINE_FEATURES = "kernel26 usbhost ext2 pci screen alsa acpi x86"
-
-require conf/machine/include/tune-geodelx.inc
-
-IMAGE_FSTYPES += "tar.gz"
-
-MACHINE_EXTRA_RRECOMMENDS = "\
-	kernel-modules \
-	"
-
-KERNEL_IMAGETYPE = "bzImage"
diff --git a/conf/machine/geodelx.conf b/conf/machine/geodelx.conf
index de4d9ca..bd87077 100644
--- a/conf/machine/geodelx.conf
+++ b/conf/machine/geodelx.conf
@@ -1,10 +1,15 @@
-TARGET_ARCH = "i486"
+#@TYPE: Machine
+#@NAME: Geode LX
+#@DESCRIPTION: Machine configuration for GeodeLX based devices
+
+TARGET_ARCH = "i586"
 
 require conf/machine/include/tune-geodelx.inc
 
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 
-PREFERRED_PROVIDER_virtual/kernel="linux-geodelx"
+MACHINE_FEATURES = "kernel26 usbhost ext2 pci screen alsa acpi x86"
 
 SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
 
@@ -12,3 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
 
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
+
+IMAGE_FSTYPES += "tar.gz"
+
+MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
-- 
1.6.3





