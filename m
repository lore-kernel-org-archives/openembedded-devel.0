Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id ED66A70392
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 20:40:43 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so2066442wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UBl1NsZhKfEv5eqLXS1x0ysxrBvt04Pfv3u3YWJKDw0=;
	b=Tzhb/ILKOA+yU/y04uTCNb98+QQdB6YBA7xH6OupjgGREPpAuqgNt51E3muhiqIowC
	Sh9rbW8gpjFoJbhvdtxCXS2ngnGQ3Tg4P1a/vJc2YOhrWxKuNJkVNqMmYJksCwa/ljXy
	UBfuot80wI3CzbYdDfwvdoa4bsm4vJh2n8VfeLQW8HME5km1jYC0E16TC0oza5lC1rrr
	hQITW3usOs3sxVVlQro4fxwmNY0ygmyxJMkktJ4vAqybCETVYWWq64p+55ET1Kx3ATwk
	HTOeaB2RFXzkj917AC8QEWfa3qvCunO6RwjyRVsfNFixVfiGTZINcrYRDiYSHJ/SHAAX
	4Now==
X-Received: by 10.180.97.67 with SMTP id dy3mr479130wib.16.1405370443629;
	Mon, 14 Jul 2014 13:40:43 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host8-88-dynamic.45-79-r.retail.telecomitalia.it. [79.45.88.8])
	by mx.google.com with ESMTPSA id
	ei3sm35100832wib.13.2014.07.14.13.40.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jul 2014 13:40:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jul 2014 22:40:38 +0200
Message-Id: <1405370438-28586-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] Revert "zaurus collie: remove hardcoded mem=64M"
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
X-List-Received-Date: Mon, 14 Jul 2014 20:40:46 -0000

Unfortunately the default for sa1100/collie is 16M so for collie it is necessary
to specify mem=64M on cmdline.
The very rare 5000D users will have to change that to mem=32M.

This reverts commit f4f05028f5ad72a81d6620340fe1c92ac6486890.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc                                       | 2 +-
 recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg               | 2 +-
 recipes-kernel/linux/linux-yocto-3.14/collie/defconfig                | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 1f1d28f..f74b987 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -39,7 +39,7 @@ SERIAL_CONSOLE_collie = "115200 ttySA0"
 
 CMDLINE_akita = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_c7x0 = "console=ttyS0,115200n8 console=tty1"
-CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 fbcon=rotate:1"
+CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1"
 CMDLINE_poodle = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_spitz = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_tosa = "console=ttyS0,115200n8 console=tty1"
diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
index 323893e..5238c69 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
@@ -47,7 +47,7 @@ CONFIG_SPARSEMEM_EXTREME=y
 #
 # Boot options
 #
-CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
 
 #
 # RAM/ROM/Flash chip drivers
diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
index 32877cd..36ceadb 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
@@ -50,7 +50,7 @@ CONFIG_AEABI=y
 CONFIG_OABI_COMPAT=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
 CONFIG_KEXEC=y
 CONFIG_BINFMT_MISC=m
 CONFIG_PM_RUNTIME=y
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
index d57e807..2903270 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/defconfig
@@ -34,7 +34,7 @@ CONFIG_AEABI=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_KEXEC=y
 # CONFIG_BINFMT_SCRIPT is not set
-- 
1.9.1


