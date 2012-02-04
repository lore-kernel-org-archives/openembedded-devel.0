Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RtoDO-0004uO-69
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 23:36:14 +0100
Received: from mizar.localdomain (87.14.255.111) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD021175E2; Sat, 4 Feb 2012 23:28:15 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  4 Feb 2012 23:28:14 +0100
Message-Id: <1328394494-6445-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] zaurus.inc: remove module_autoload remnants, now built in kernel
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
X-List-Received-Date: Sat, 04 Feb 2012 22:36:14 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |   24 +-----------------------
 1 files changed, 1 insertions(+), 23 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index bd0d6f4..099bb3e 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -82,27 +82,5 @@ MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
 # Install /boot/boot.cfg in target images
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg "
 
-# Install kernel and symlink in /boot, add kernel-modules metapackage
+# Install kernel and symlink in /boot
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-base kernel-image "
-
-# FIXME
-# blindly import from linux-rp.inc (2.6.2x)
-#
-module_autoload_pxaficp_ir = "pxaficp_ir"
-module_autoload_snd-pcm-oss = "snd-pcm-oss"
-module_autoload_pcmcia_core = "pcmcia_core"
-module_autoload_pxa2xx_cs = "pxa2xx_cs"
-module_autoload_ohci-hcd_tosa = "ohci-hcd"
-module_autoload_snd-soc-corgi_c7x0 = "snd-soc-corgi"
-module_autoload_snd-soc-spitz_akita = "snd-soc-spitz"
-module_autoload_snd-soc-spitz_spitz = "snd-soc-spitz"
-module_autoload_snd-soc-poodle_poodle = "snd-soc-poodle"
-module_autoload_locomo-spi_collie = "locomo-spi"
-module_autoload_mmc_block_collie = "mmc_block"
-module_autoload_mmc_spi = "mmc-spi"
-module_autoload_locomokbd_collie = "locomokbd"
-module_autoload_sa1100-cs_collie = "sa1100_cs"
-module_autoload_collie-ts_collie = "collie-ts"
-module_autoload_leds-locomo_collie = "leds-locomo"
-module_autoload_power_collie = "power"
-# Fixme ? module-snd for tosa
-- 
1.7.3.4



