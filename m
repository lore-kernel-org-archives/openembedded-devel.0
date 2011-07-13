Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qh3cr-0004Fu-9e
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 19:53:33 +0200
Received: (qmail invoked by alias); 13 Jul 2011 17:49:34 -0000
Received: from p5B0A2C48.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.44.72]
	by mail.gmx.net (mp038) with SMTP; 13 Jul 2011 19:49:34 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+tDbc+5YytlbaGlQG+X5FMovmBaFfd2VLmBB3zGr
	evFsKlFeouGksO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2011 19:51:33 +0200
Message-Id: <1310579493-2905-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] linux-imx-git/mx28evk/defconfig: Enable CONFIG_I2C_CHARDEV so that kernel-module-i2c-dev is built
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
X-List-Received-Date: Wed, 13 Jul 2011 17:53:33 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/linux/linux-imx-git/mx28evk/defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-imx-git/mx28evk/defconfig b/recipes/linux/linux-imx-git/mx28evk/defconfig
index 0d01c03..db418cf 100644
--- a/recipes/linux/linux-imx-git/mx28evk/defconfig
+++ b/recipes/linux/linux-imx-git/mx28evk/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.35.3
-# Mon Dec  6 17:17:47 2010
+# Wed Jul 13 18:48:59 2011
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -1001,7 +1001,7 @@ CONFIG_MAX_RAW_DEVS=8192
 CONFIG_I2C=y
 CONFIG_I2C_BOARDINFO=y
 CONFIG_I2C_COMPAT=y
-# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_HELPER_AUTO=y
 
 #
-- 
1.7.4.4



