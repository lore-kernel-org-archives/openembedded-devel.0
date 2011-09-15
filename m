Received: from linuxconsulting.iasi.rdsnet.ro ([86.124.49.29]
	helo=hall.linuxconsulting.ro) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <npavel@mini-box.com>) id 1R48AP-0001Zg-W6
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:23:34 +0200
Received: by hall.linuxconsulting.ro (Postfix, from userid 5001)
	id 72BF9442DA; Thu, 15 Sep 2011 12:10:47 +0300 (EEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	hall.linuxconsulting.ro
X-Spam-Level: 
X-Spam-Status: No, score=-104.4 required=4.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	USER_IN_WHITELIST autolearn=ham version=3.2.5
Received: from droids.linuxconsulting.ro (unknown [192.168.12.160])
	by hall.linuxconsulting.ro (Postfix) with ESMTP id B95DB442D9;
	Thu, 15 Sep 2011 12:10:28 +0300 (EEST)
From: Nicu Pavel <npavel@mini-box.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 12:12:11 +0300
Message-Id: <1316077931-7737-3-git-send-email-npavel@mini-box.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1316077931-7737-1-git-send-email-npavel@mini-box.com>
References: <1316077931-7737-1-git-send-email-npavel@mini-box.com>
Subject: [PATCH v2 2/2] Add machine configuration for picoSAM9G45 board
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
X-List-Received-Date: Thu, 15 Sep 2011 09:23:34 -0000

Add machine configuration for picoSAM9G45 board[1].
More information about this board and software support can be found at [2].

1. http://www.mini-box.com/pico-SAM9G45-X
2. http://arm.mini-box.com/index.php?title=Main_Page

Signed-off-by: Nicu Pavel <npavel@mini-box.com>
---
 conf/machine/picosam9.conf |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/picosam9.conf

diff --git a/conf/machine/picosam9.conf b/conf/machine/picosam9.conf
new file mode 100644
index 0000000..3d75627
--- /dev/null
+++ b/conf/machine/picosam9.conf
@@ -0,0 +1,17 @@
+#@TYPE: Machine
+#@Name: pico-SAM9G45 (http://www.mini-box.com/pico-SAM9G45-X)
+#@DESCRIPTION: Machine configuration for the picoSAM9G45 board with a at91sam9g45 processor
+
+# More information can be found here: 
+# http://arm.mini-box.com/index.php?title=Compiling_Angstrom_for_pico-SAM9G45
+# Images tested: base-image and x11-image
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/kernel = "picosam9"
+
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+
+MACHINE_FEATURES += "usbhost kernel26 apm vfat screen touchscreen ethernet wifi bluetooth"
+
+require conf/machine/include/tune-arm926ejs.inc
-- 
1.7.1



