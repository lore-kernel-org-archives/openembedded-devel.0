Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S5QQZ-00016V-G0
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 00:37:52 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650770D5ED; Thu, 8 Mar 2012 00:29:16 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 00:29:03 +0100
Message-Id: <1331162943-4863-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
References: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-git: remove CONFIG_RAMOOPS=y from spitz defconfig
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
X-List-Received-Date: Wed, 07 Mar 2012 23:37:52 -0000

* this was enabled by mistake, nonsense on Zaurus

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux/spitz/defconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux/spitz/defconfig b/recipes-kernel/linux/linux/spitz/defconfig
index dd1c0f5..4370819 100644
--- a/recipes-kernel/linux/linux/spitz/defconfig
+++ b/recipes-kernel/linux/linux/spitz/defconfig
@@ -181,7 +181,6 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-CONFIG_RAMOOPS=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
-- 
1.7.3.4



