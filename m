Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59F-0003Bt-JS
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:13 +0200
Received: (qmail 32239 invoked by uid 813007); 1 Jul 2009 18:55:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:03 +0200
Message-Id: <1246474518-16737-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 105/125] at2440evb.conf: Add AT2440EVB machine config.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:13 -0000

From: Ramax Lo <ramaxlo@gmail.com>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/machine/at2440evb.conf |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/at2440evb.conf

diff --git a/conf/machine/at2440evb.conf b/conf/machine/at2440evb.conf
new file mode 100644
index 0000000..f3fa5ed
--- /dev/null
+++ b/conf/machine/at2440evb.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@Name: Avantech AT2440EVB Dev Board
+#@DESCRIPTION: Machine configuration for Avantech AT2440EVB Dev Board
+
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttySAC0"
+
+IMAGE_FSTYPES = "tar.gz"
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "30008000"
+
+MACHINE_FEATURES = "kernel26 screen touchscreen"
+
+require conf/machine/include/tune-arm920t.inc
-- 
1.6.3.1





