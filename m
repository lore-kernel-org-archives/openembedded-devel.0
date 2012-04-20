Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SLNUy-0005xf-9B
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Apr 2012 01:44:20 +0200
Received: from mizar.localdomain (87.8.252.249) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B06F691DC; Sat, 21 Apr 2012 01:34:50 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Apr 2012 01:34:39 +0200
Message-Id: <1334964879-24189-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] linux-kexecboot_3.2: set console to tty1 to hide cursor
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
X-List-Received-Date: Fri, 20 Apr 2012 23:44:20 -0000

* revert accidental change

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.2.bbappend |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
index b3f98b1..909bf9e 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
@@ -7,12 +7,12 @@ PR = "${INC_PR}.1"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty0 console=ttyS0,115200n8"
-CMDLINE_tosa = "console=tty0 console=ttyS0,115200n8"
-CMDLINE_poodle = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_akita = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_collie = "console=tty0 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
-CMDLINE_spitz = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
 
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
-- 
1.7.3.4



