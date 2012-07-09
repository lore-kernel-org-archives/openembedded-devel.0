Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SoNT5-00074W-Em
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2012 01:34:15 +0200
Received: from mizar.localdomain (87.0.20.4) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6317B3EBEB; Tue, 10 Jul 2012 01:23:07 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2012 01:22:39 +0200
Message-Id: <fb967b1fb78035e47c1c169bc41cb5ebb31b8a7e.1341875525.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1341875525.git.andrea.adami@gmail.com>
References: <cover.1341875525.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1341875525.git.andrea.adami@gmail.com>
References: <cover.1341875525.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 5/5] linux-yocto-tiny-kexecboot: unset CONFIG_MTD_NAND_VERIFY_WRITE for Zaurus
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
X-List-Received-Date: Mon, 09 Jul 2012 23:34:15 -0000

* for easier UBI support whithout needing VID HDR offsets
* (dedekind, the author, says this setting is only meant for debug)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../akita/akita-kexecboot.cfg                      |    2 +-
 .../c7x0/c7x0-kexecboot.cfg                        |    2 +-
 .../collie/collie-kexecboot.cfg                    |    2 +-
 .../poodle/poodle-kexecboot.cfg                    |    2 +-
 .../spitz/spitz-kexecboot.cfg                      |    2 +-
 .../tosa/tosa-kexecboot.cfg                        |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-kexecboot.cfg
index 6ef926d..82bb479 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-kexecboot.cfg
@@ -552,7 +552,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-kexecboot.cfg
index 72c2383..0ef169b 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-kexecboot.cfg
@@ -552,7 +552,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-kexecboot.cfg
index 7b8321d..e01ceae 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-kexecboot.cfg
@@ -530,7 +530,7 @@ CONFIG_MTD_SA1100=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-kexecboot.cfg
index 7b3124c..04e53bd 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-kexecboot.cfg
@@ -550,7 +550,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-kexecboot.cfg
index 3a6c16f..338209d 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-kexecboot.cfg
@@ -552,7 +552,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-kexecboot.cfg
index 2dea434..855d70b 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-kexecboot.cfg
@@ -551,7 +551,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
-- 
1.7.8.6



