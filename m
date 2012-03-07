Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S5QQX-00016V-Eu
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 00:37:49 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650770D5DE; Thu, 8 Mar 2012 00:29:14 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 00:29:02 +0100
Message-Id: <1331162943-4863-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
References: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux-3.2: remove CONFIG_RAMOOPS=y from Zaurus defconfigs
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
X-List-Received-Date: Wed, 07 Mar 2012 23:37:49 -0000

* this was enabled by mistake, nonsense on Zaurus

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-3.2/akita/defconfig  |    1 -
 recipes-kernel/linux/linux-3.2/c7x0/defconfig   |    1 -
 recipes-kernel/linux/linux-3.2/collie/defconfig |    1 -
 recipes-kernel/linux/linux-3.2/poodle/defconfig |    1 -
 recipes-kernel/linux/linux-3.2/spitz/defconfig  |    1 -
 recipes-kernel/linux/linux-3.2/tosa/defconfig   |    1 -
 6 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.2/akita/defconfig b/recipes-kernel/linux/linux-3.2/akita/defconfig
index 0cdbbc5..f2e32de 100644
--- a/recipes-kernel/linux/linux-3.2/akita/defconfig
+++ b/recipes-kernel/linux/linux-3.2/akita/defconfig
@@ -175,7 +175,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
diff --git a/recipes-kernel/linux/linux-3.2/c7x0/defconfig b/recipes-kernel/linux/linux-3.2/c7x0/defconfig
index 527e01c..20d4399 100644
--- a/recipes-kernel/linux/linux-3.2/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-3.2/c7x0/defconfig
@@ -164,7 +164,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_I2C_PXA=y
 CONFIG_SPI_PXA2XX=y
diff --git a/recipes-kernel/linux/linux-3.2/collie/defconfig b/recipes-kernel/linux/linux-3.2/collie/defconfig
index be1d0c7..0bc9633 100644
--- a/recipes-kernel/linux/linux-3.2/collie/defconfig
+++ b/recipes-kernel/linux/linux-3.2/collie/defconfig
@@ -171,7 +171,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_SA1100=y
 CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_SPI=y
 CONFIG_GPIO_SYSFS=y
diff --git a/recipes-kernel/linux/linux-3.2/poodle/defconfig b/recipes-kernel/linux/linux-3.2/poodle/defconfig
index 44f7067..27729af 100644
--- a/recipes-kernel/linux/linux-3.2/poodle/defconfig
+++ b/recipes-kernel/linux/linux-3.2/poodle/defconfig
@@ -163,7 +163,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_I2C_PXA=y
 CONFIG_SPI=y
diff --git a/recipes-kernel/linux/linux-3.2/spitz/defconfig b/recipes-kernel/linux/linux-3.2/spitz/defconfig
index 0cdbbc5..f2e32de 100644
--- a/recipes-kernel/linux/linux-3.2/spitz/defconfig
+++ b/recipes-kernel/linux/linux-3.2/spitz/defconfig
@@ -175,7 +175,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
diff --git a/recipes-kernel/linux/linux-3.2/tosa/defconfig b/recipes-kernel/linux/linux-3.2/tosa/defconfig
index f4255b5..8ce424b 100644
--- a/recipes-kernel/linux/linux-3.2/tosa/defconfig
+++ b/recipes-kernel/linux/linux-3.2/tosa/defconfig
@@ -176,7 +176,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_I2C=y
 CONFIG_I2C_PXA=y
 CONFIG_SPI=y
-- 
1.7.3.4



