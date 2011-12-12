Received: from host39-232-static.225-95-b.business.telecomitalia.it
	([95.225.232.39] helo=cindy) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adriano@gmail.com>) id 1Ra54t-00031h-IV
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 13:33:55 +0100
Received: by cindy (Postfix, from userid 1000)
	id 2DCC25E23CA; Mon, 12 Dec 2011 13:26:44 +0100 (CET)
From: adrianopallavicino@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 13:26:32 +0100
Message-Id: <1323692792-24574-1-git-send-email-adrianopallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <adrianopallavicino@gmail.com>
References: <adrianopallavicino@gmail.com>
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [[v1]libtans1_1.17: fix sources URL and md5/sha sum] Added new local recepie for support of DSP on gumstix console image
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
X-List-Received-Date: Mon, 12 Dec 2011 12:33:55 -0000

From: Adriano Pallavicino <adriano.pallavicino@gmail.com>

---
 recipes/images/omap3-console-image-adri-dsp.bb |   85 ++++++++++++++++++++++++
 1 files changed, 85 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/omap3-console-image-adri-dsp.bb

diff --git a/recipes/images/omap3-console-image-adri-dsp.bb b/recipes/images/omap3-console-image-adri-dsp.bb
new file mode 100644
index 0000000..bf84839
--- /dev/null
+++ b/recipes/images/omap3-console-image-adri-dsp.bb
@@ -0,0 +1,85 @@
+# console image for omap3
+
+inherit image
+
+DEPENDS = "task-base"
+
+IMAGE_EXTRA_INSTALL ?= ""
+
+AUDIO_INSTALL = " \
+  alsa-utils \
+  alsa-utils-aplay \
+  alsa-utils-amixer \
+  angstrom-zeroconf-audio \
+ "
+
+TI_DSP_INSTALL = " \
+  task-gstreamer-ti \
+  ti-codec-engine \
+  ti-dmai \
+  ti-dspbios \
+  ti-dsplib \
+  ti-dsplink \
+  ti-dsplink-module \
+  ti-cmem-module \
+"
+
+BASE_INSTALL = " \
+  task-base-extended \
+ "
+
+FIRMWARE_INSTALL = " \
+#  linux-firmware \
+  libertas-sd-firmware \
+  rt73-firmware \
+  zd1211-firmware \
+ "
+
+GLES_INSTALL = " \
+#  libgles-omap3 \
+ "
+
+TOOLS_INSTALL = " \
+  bash \
+  bzip2 \
+  ckermit \
+  devmem2 \
+  dhcp-client \
+  dosfstools \
+  fbgrab \
+  fbset \
+  fbset-modes \
+  i2c-tools \
+#  ksymoops \
+  mkfs-jffs2 \
+  mtd-utils \
+  nano \
+  ntp ntpdate \
+  openssh-misc \
+  openssh-scp \
+  openssh-ssh \
+  omap3-writeprom \
+  procps \
+  socat \
+  strace \
+  sudo \
+  syslog-ng \
+  task-proper-tools \
+  u-boot-utils \
+ "
+
+IMAGE_INSTALL += " \
+  ${BASE_INSTALL} \
+  ${AUDIO_INSTALL} \
+  ${FIRMWARE_INSTALL} \
+  ${GLES_INSTALL} \
+  ${IMAGE_EXTRA_INSTALL} \
+  ${TOOLS_INSTALL} \
+  ${TI_DSP_INSTALL} \
+ "
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+#ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+
+
-- 
1.7.4.1



