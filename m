Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S0Mg4-0006Ca-Ix
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 01:36:56 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp205.alice.it (8.6.023.02)
	id 4F421F7B0062D68C; Thu, 23 Feb 2012 01:28:35 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 01:28:31 +0100
Message-Id: <1329956912-32196-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/2] linux-kexecboot: use console=tty0 for all Zaurus
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
X-List-Received-Date: Thu, 23 Feb 2012 00:36:56 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.1.bbappend |   12 ++++++------
 recipes-kernel/linux/linux-kexecboot_3.2.bbappend |   12 ++++++------
 recipes-kernel/linux/linux-kexecboot_git.bbappend |   12 ++++++------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
index 74d63bb..ce58d19 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
@@ -3,12 +3,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_c7x0 = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty0 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
 
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
index 375dcdd..0d4d01d 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
@@ -5,12 +5,12 @@ DEFAULT_PREFERENCE = "-1"
 COMPATIBLE_MACHINE = "(spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_c7x0 = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty0 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
 
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
diff --git a/recipes-kernel/linux/linux-kexecboot_git.bbappend b/recipes-kernel/linux/linux-kexecboot_git.bbappend
index 1acab8a..13a72e6 100644
--- a/recipes-kernel/linux/linux-kexecboot_git.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_git.bbappend
@@ -5,12 +5,12 @@ DEFAULT_PREFERENCE = "-2"
 COMPATIBLE_MACHINE = "(spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_c7x0 = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty0 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
 
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
-- 
1.7.3.4



