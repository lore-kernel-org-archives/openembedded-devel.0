Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S5QQW-00016V-JD
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 00:37:48 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650770D5D5; Thu, 8 Mar 2012 00:29:11 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 00:29:01 +0100
Message-Id: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/3] linux-3.1: remove CONFIG_RAMOOPS=y from Zaurus defconfigs
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
X-List-Received-Date: Wed, 07 Mar 2012 23:37:48 -0000

* this was enabled by mistake, nonsense on Zaurus

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-3.1/akita/defconfig  |    1 -
 recipes-kernel/linux/linux-3.1/c7x0/defconfig   |    1 -
 recipes-kernel/linux/linux-3.1/collie/defconfig |    1 -
 recipes-kernel/linux/linux-3.1/poodle/defconfig |    1 -
 recipes-kernel/linux/linux-3.1/spitz/defconfig  |    1 -
 recipes-kernel/linux/linux-3.1/tosa/defconfig   |    1 -
 6 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.1/akita/defconfig b/recipes-kernel/linux/linux-3.1/akita/defconfig
index 9b5bafb..dfab582 100644
--- a/recipes-kernel/linux/linux-3.1/akita/defconfig
+++ b/recipes-kernel/linux/linux-3.1/akita/defconfig
@@ -179,7 +179,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
diff --git a/recipes-kernel/linux/linux-3.1/c7x0/defconfig b/recipes-kernel/linux/linux-3.1/c7x0/defconfig
index cbcd789..025008b 100644
--- a/recipes-kernel/linux/linux-3.1/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-3.1/c7x0/defconfig
@@ -168,7 +168,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_I2C_PXA=y
 CONFIG_SPI=y
diff --git a/recipes-kernel/linux/linux-3.1/collie/defconfig b/recipes-kernel/linux/linux-3.1/collie/defconfig
index b6b4315..679532b 100644
--- a/recipes-kernel/linux/linux-3.1/collie/defconfig
+++ b/recipes-kernel/linux/linux-3.1/collie/defconfig
@@ -175,7 +175,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_SA1100=y
 CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_SPI=y
 CONFIG_GPIO_SYSFS=y
diff --git a/recipes-kernel/linux/linux-3.1/poodle/defconfig b/recipes-kernel/linux/linux-3.1/poodle/defconfig
index a2dc2ec..0124824 100644
--- a/recipes-kernel/linux/linux-3.1/poodle/defconfig
+++ b/recipes-kernel/linux/linux-3.1/poodle/defconfig
@@ -167,7 +167,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_I2C_PXA=y
 CONFIG_SPI=y
diff --git a/recipes-kernel/linux/linux-3.1/spitz/defconfig b/recipes-kernel/linux/linux-3.1/spitz/defconfig
index 9b5bafb..dfab582 100644
--- a/recipes-kernel/linux/linux-3.1/spitz/defconfig
+++ b/recipes-kernel/linux/linux-3.1/spitz/defconfig
@@ -179,7 +179,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
diff --git a/recipes-kernel/linux/linux-3.1/tosa/defconfig b/recipes-kernel/linux/linux-3.1/tosa/defconfig
index 7f10c29..187bab2 100644
--- a/recipes-kernel/linux/linux-3.1/tosa/defconfig
+++ b/recipes-kernel/linux/linux-3.1/tosa/defconfig
@@ -180,7 +180,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_I2C_PXA=y
 CONFIG_SPI=y
-- 
1.7.3.4



