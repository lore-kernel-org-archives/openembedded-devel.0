Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R4Iwz-0003CY-LU
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 22:54:25 +0200
Received: from mizar.localdomain (87.5.26.159) by smtp209.alice.it (8.5.124.08)
	id 4E2CB712044076CC; Thu, 15 Sep 2011 22:43:48 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Sep 2011 22:43:32 +0200
Message-Id: <1316119412-3685-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <201109150057.47810.paul.eggleton@linux.intel.com>
References: <201109150057.47810.paul.eggleton@linux.intel.com>
Subject: [meta-handheld][PATCH v2] linux-kexecboot.inc: hardcode loglevel=3 to keep bootlogo intact
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
X-List-Received-Date: Thu, 15 Sep 2011 20:54:25 -0000

* Being a second-stage bootloader we don't expect any output on screen.
* Adding 'debug' as commandline arg is pointless because
* linux-kexecboot is compiled without debug and printk in order
* to minimize the size.
* Full debug implies not only editing the commandline (e.g. earlyprintk)
* but re-enabling full debug options in the defconfigs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot.inc |   19 ++++++++-----------
 1 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
index fb9760a..ea0bbd6 100644
--- a/recipes-kernel/linux/linux-kexecboot.inc
+++ b/recipes-kernel/linux/linux-kexecboot.inc
@@ -1,5 +1,5 @@
 # We set INC_PR here, since a change in the kexecboot recipe will need to get picked up by *all* the kernels:
-INC_PR = "r43"
+INC_PR = "r44"
 
 inherit kernel siteinfo
 
@@ -19,16 +19,13 @@ DEPENDS += "xz-native"
 LOGO_SIZE ?= "."
 SRC_URI = "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
 
-# Set the verbosity of kernel messages during runtime
-CMDLINE_DEBUG ?= '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "loglevel=3", d)}'
-
-# Note how we set master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8 ${CMDLINE_DEBUG}"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8 ${CMDLINE_DEBUG}"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 ${CMDLINE_DEBUG}"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 ${CMDLINE_DEBUG}"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M ${CMDLINE_DEBUG}"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 ${CMDLINE_DEBUG}"
+# Note how we set loglevel=3 and master console on serial to protect bootlogo.
+CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8 loglevel=3"
+CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8 loglevel=3"
+CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
+CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
 
 PACKAGES = ""
 PROVIDES = ""
-- 
1.7.3.4



