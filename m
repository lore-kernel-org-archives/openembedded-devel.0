Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C765365D56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 21:41:19 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so4628535wgg.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 14:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Do7ej6Mf/5NZzHmJsxKLppicFm/vsSgNGyXVw0+I7A4=;
	b=fRy4hUn3QBeyHcnD+SBkRKbTWBXFKZFqUmO6FPtkGz6VE5sU1bjEBur5tRmxngSbym
	39PqMQYQ98vq+J6tDeAIfSv5svUF6Qb492Ojfp0U7UZLsgzBSVxei+VoBXUyB4D7fi3U
	eDOz+9ksnsUbPZZKeTILvW4V/W3Tc8gnufGKMnxlV/pkUy6p5a3oQyx83Zds6HKwWX2D
	ZO81g8irtQkAUBUqAnNze799WspfE2QCQU0d30jOSbYH2VSHVEP2wHZA2wz5MlKoM8Nr
	Ql2iNrj/r5li98nVdQ7rKM31LcyFDgPL2NxGDYy5fl8Jq0NKTCm1F4NJGKTrv503JoKu
	R0TQ==
X-Received: by 10.180.74.47 with SMTP id q15mr23106107wiv.75.1413495680000;
	Thu, 16 Oct 2014 14:41:20 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host35-222-dynamic.20-79-r.retail.telecomitalia.it. [79.20.222.35])
	by mx.google.com with ESMTPSA id
	fa7sm28826590wjd.27.2014.10.16.14.41.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Oct 2014 14:41:19 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Oct 2014 23:41:09 +0200
Message-Id: <1413495669-13020-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot_3.17: add rdinit=/usr/bin/kexecboot to the cmdline
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Oct 2014 21:41:28 -0000

The kernel behavior has changed and apparently the init symlink
in the initramfs is ignored (no init seems executed).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig  | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig   | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig  | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig
index c1f8315..e9b9313 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig
@@ -35,7 +35,7 @@ CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 rdinit=/usr/bin/kexecboot fbcon=rotate:1 loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig
index 89928cd..f6fe618 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig
@@ -36,7 +36,7 @@ CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 rdinit=/usr/bin/kexecboot loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig
index dfabe70..3209bd3 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig
@@ -33,7 +33,7 @@ CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 rdinit=/usr/bin/kexecboot fbcon=rotate:1 mem=64M loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig
index b9e052b..2f30d0c 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig
@@ -34,7 +34,7 @@ CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 rdinit=/usr/bin/kexecboot fbcon=rotate:1 loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig
index 25df112..908aeb2 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig
@@ -35,7 +35,7 @@ CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 rdinit=/usr/bin/kexecboot fbcon=rotate:1 loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig
index b98928e..dc298bf 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig
@@ -34,7 +34,7 @@ CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 rdinit=/usr/bin/kexecboot loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
-- 
1.9.1


