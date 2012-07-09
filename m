Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SoNT3-00074W-To
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2012 01:34:13 +0200
Received: from mizar.localdomain (87.0.20.4) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6317B3EBBF; Tue, 10 Jul 2012 01:23:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2012 01:22:38 +0200
Message-Id: <93242fd3ad0eb3833306ccbf3757601a3dfc2ba5.1341875525.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1341875525.git.andrea.adami@gmail.com>
References: <cover.1341875525.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1341875525.git.andrea.adami@gmail.com>
References: <cover.1341875525.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/5] linux-yocto: unset CONFIG_MTD_NAND_VERIFY_WRITE for Zaurus
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
X-List-Received-Date: Mon, 09 Jul 2012 23:34:14 -0000

* for easier UBI support whithout needing VID HDR offsets
* (dedekind, the author, says this setting is only meant for debug)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    2 +-
 recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    2 +-
 recipes-kernel/linux/linux-yocto/collie/collie.cfg |    2 +-
 recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    2 +-
 recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    2 +-
 recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/akita/akita.cfg b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
index d9096fd..6f0db54 100644
--- a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
@@ -921,7 +921,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
index 87731b6..5655f0d 100644
--- a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
+++ b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
@@ -910,7 +910,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
index ff200b8..ad709c5 100644
--- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
@@ -887,7 +887,7 @@ CONFIG_MTD_SA1100=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
index 545e5e3..c20557e 100644
--- a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
@@ -909,7 +909,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
index 0998a0f..f3f6561 100644
--- a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
+++ b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
@@ -921,7 +921,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
 # CONFIG_MTD_NAND_ECC_BCH is not set
 # CONFIG_MTD_SM_COMMON is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
diff --git a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
index 4b28265..31c6da3 100644
--- a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
+++ b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
@@ -923,7 +923,7 @@ CONFIG_MTD_PHYSMAP=y
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



