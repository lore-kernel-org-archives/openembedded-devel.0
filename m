Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8486FE97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 22:22:21 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id k48so5568492wev.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TKRPsHzTD568LNoHBAU9x5BRMKxxeCjOKehCnXZ0V0U=;
	b=tsoSH9XHcse+/mbZewRTv95L2rPLSves3uT3ZWvR7sWXzoawRC4L7M798nT7uzus2E
	9leYlRAdWEmhDxaXf9w3tq0n8ifa56+2NW+m//N7eRlJHjz5YyTNw4ffW7BCQzFkhV0t
	yvfL4lu0VX9kpLIUXs+wm2oW90cjuYVLL28KLZfb6P8HAdEOnyJRLP7giOX3LMX3xekb
	efFqtGQQJrggMtVaFp2GPHLx/U299Syn4CUp171RPEPXtPAtT34CpKpnQPKoKtTH/RwI
	Y1aql9dFJaMEYUnF337O40eoGP7O6fhouU9xO+8YXGdRMfLEgM8fxfIZx0kyBUAjADhl
	BGZA==
X-Received: by 10.194.5.103 with SMTP id r7mr31831289wjr.41.1402957342652;
	Mon, 16 Jun 2014 15:22:22 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host103-90-dynamic.45-79-r.retail.telecomitalia.it. [79.45.90.103])
	by mx.google.com with ESMTPSA id
	v45sm36829464eeg.29.2014.06.16.15.22.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jun 2014 15:22:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 00:22:12 +0200
Message-Id: <a9e1ea0a5b548c48256cfc22139fe14d4db6c3b1.1402956940.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1402956940.git.andrea.adami@gmail.com>
References: <cover.1402956940.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1402956940.git.andrea.adami@gmail.com>
References: <cover.1402956940.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] zaurus collie: remove hardcoded mem=64M
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
X-List-Received-Date: Mon, 16 Jun 2014 22:22:25 -0000

Surely rare today, the SL-5000D has only 32MB ram.
Remove historical setting used for mtd-ram.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc                                       | 2 +-
 recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg               | 2 +-
 recipes-kernel/linux/linux-yocto-3.14/collie/defconfig                | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index f74b987..1f1d28f 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -39,7 +39,7 @@ SERIAL_CONSOLE_collie = "115200 ttySA0"
 
 CMDLINE_akita = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_c7x0 = "console=ttyS0,115200n8 console=tty1"
-CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1"
+CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_poodle = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_spitz = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_tosa = "console=ttyS0,115200n8 console=tty1"
diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
index 5238c69..323893e 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
@@ -47,7 +47,7 @@ CONFIG_SPARSEMEM_EXTREME=y
 #
 # Boot options
 #
-CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
 
 #
 # RAM/ROM/Flash chip drivers
diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
index 36ceadb..32877cd 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
@@ -50,7 +50,7 @@ CONFIG_AEABI=y
 CONFIG_OABI_COMPAT=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
 CONFIG_KEXEC=y
 CONFIG_BINFMT_MISC=m
 CONFIG_PM_RUNTIME=y
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
index 2903270..d57e807 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
@@ -34,7 +34,7 @@ CONFIG_AEABI=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
-- 
1.9.1


