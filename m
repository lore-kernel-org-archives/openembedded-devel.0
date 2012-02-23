Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S0MgN-0006Ca-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 01:37:15 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp205.alice.it (8.6.023.02)
	id 4F421F7B0062D7A4; Thu, 23 Feb 2012 01:28:57 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 01:28:32 +0100
Message-Id: <1329956912-32196-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1329956912-32196-1-git-send-email-andrea.adami@gmail.com>
References: <1329956912-32196-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] zaurus.inc: default using console=tty0
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
X-List-Received-Date: Thu, 23 Feb 2012 00:37:15 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index a43db8b..bee1283 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -52,12 +52,12 @@ SERIAL_CONSOLE_collie = "115200 ttySA0"
 
 PCMCIA_MANAGER ?= "pcmciautils"
 
-CMDLINE_akita = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
-CMDLINE_c7x0 = "console=ttyS0,115200n8 console=tty1"
-CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1"
-CMDLINE_poodle = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
-CMDLINE_spitz = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
-CMDLINE_tosa = "console=ttyS0,115200n8 console=tty1"
+CMDLINE_akita = "console=ttyS0,115200n8 console=tty0 fbcon=rotate:1"
+CMDLINE_c7x0 = "console=ttyS0,115200n8 console=tty0"
+CMDLINE_collie = "console=ttySA0,115200n8 console=tty0 mem=64M fbcon=rotate:1"
+CMDLINE_poodle = "console=ttyS0,115200n8 console=tty0 fbcon=rotate:1"
+CMDLINE_spitz = "console=ttyS0,115200n8 console=tty0 fbcon=rotate:1"
+CMDLINE_tosa = "console=ttyS0,115200n8 console=tty0"
 
 MACHINE_FEATURES = "apm alsa pcmcia irda usbgadget keyboard touchscreen screen vfat ext2"
 MACHINE_FEATURES_append_akita = " usbhost"
-- 
1.7.3.4



