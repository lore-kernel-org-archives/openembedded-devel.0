Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier.martin@vista-silicon.com>) id 1Pn6VU-0001ln-6h
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:38:40 +0100
Received: by wwi17 with SMTP id 17so6659183wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:37:37 -0800 (PST)
Received: by 10.227.157.79 with SMTP id a15mr3690233wbx.157.1297244256999;
	Wed, 09 Feb 2011 01:37:36 -0800 (PST)
Received: from localhost.localdomain (58.50.18.95.dynamic.jazztel.es
	[95.18.50.58])
	by mx.google.com with ESMTPS id u9sm109430wbg.0.2011.02.09.01.37.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 01:37:36 -0800 (PST)
From: Javier Martin <javier.martin@vista-silicon.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Feb 2011 10:37:11 +0100
Message-Id: <1297244237-9508-2-git-send-email-javier.martin@vista-silicon.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
Subject: [PATCH 1/7] Add configuration file for Visstrim_M10 board.
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
X-List-Received-Date: Wed, 09 Feb 2011 09:38:40 -0000


Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 conf/machine/visstrim_m10.conf |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/visstrim_m10.conf

diff --git a/conf/machine/visstrim_m10.conf b/conf/machine/visstrim_m10.conf
new file mode 100644
index 0000000..2cce27d
--- /dev/null
+++ b/conf/machine/visstrim_m10.conf
@@ -0,0 +1,28 @@
+#@TYPE: Machine
+#@Name: Vista Silicon Visstrim M10
+#@DESCRIPTION: Machine configuration for Vista Silicon Visstrim M10
+
+TARGET_ARCH = "arm"
+
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "0xa0010000"
+UBOOT_LOADADDRESS = "0xa0010000"
+
+IMAGE_FSTYPES = "tar.gz squashfs"
+
+# Uncomment this for custom kernel from local git repository
+#PREFERRED_PROVIDER_virtual/kernel = "linux-visstrim-m10"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+
+MACHINE_FEATURES = "kernel26 apm alsa ext2 pcmcia usbhost usbgadget"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+#don't try to access tty1
+USE_VT = "0"
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttymxc0"
+
+# used by opie-collections.inc
+ROOT_FLASH_SIZE = "32"
-- 
1.7.0.4



