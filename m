Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWV4-0001lM-6L
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:16:30 +0200
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 15983EAAD8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:42:30 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj1YAH6Dz01T4zkqPGdsb2JhbACJH5x1CwEBAQE3MshLgzSCZQSQEY53
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="11311160"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb3.telenor.se with ESMTP; 15 May 2011 09:42:30 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:42:28 +0200
Message-Id: <1305445348-4101-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Update at91sam9 images
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
X-List-Received-Date: Sun, 15 May 2011 08:16:30 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/console-at91sam9-image.bb |   13 ++--
 recipes/images/x11-at91sam9-image.bb     |   46 ++++++++++++--
 recipes/images/x11-at91sam9m10-image.bb  |  102 ++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+), 12 deletions(-)
 create mode 100644 recipes/images/x11-at91sam9m10-image.bb

diff --git a/recipes/images/console-at91sam9-image.bb b/recipes/images/console-at91sam9-image.bb
index 8b066e2..7aae0fb 100644
--- a/recipes/images/console-at91sam9-image.bb
+++ b/recipes/images/console-at91sam9-image.bb
@@ -3,17 +3,16 @@
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 ANGSTROM_EXTRA_INSTALL += " \
-	alsa-utils-amixer \
+	usbview \
+	mplayer \
+	thttpd \
+	madplay \
 	alsa-utils-aplay \
-	dosfstools \
+	alsa-utils-amixer \
 	iperf \
-	madplay \
-	mplayer \
+	dosfstools \
 	mtd-utils \
 #	nbench-byte \
-	owl-wifi \
-	thttpd \
-	usbview \
 	"
 
 DEPENDS = "task-base-extended \
diff --git a/recipes/images/x11-at91sam9-image.bb b/recipes/images/x11-at91sam9-image.bb
index 3917873..d0ca0b6 100644
--- a/recipes/images/x11-at91sam9-image.bb
+++ b/recipes/images/x11-at91sam9-image.bb
@@ -1,13 +1,20 @@
 # Angstrom x11-gpe-image with additional apps included
 XSERVER = "xserver-xorg \
            xf86-input-evdev \
-           xf86-input-tslib \
-           xf86-video-fbdev "
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard \
+	   xinput-calibrator \
+	  "
+#           xf86-input-tslib \
+
 
 require x11-gpe-image.bb
 
 export IMAGE_BASENAME = "x11-at91sam9-image"
 
+# SPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
+
 DEPENDS = "task-base"
 
 IMAGE_INSTALL += "\
@@ -39,17 +46,46 @@ IMAGE_INSTALL += "\
 	fbv \
 	dosfstools \
 	mtd-utils \
-	gpe-mini-browser \
+#	gpe-mini-browser2 \
 	tslib-conf \
 	tslib-calibrate \
 	tslib-tests \
 	libstdc++ \
-	${IMAGE_EXTRA_INSTALL} \
+	nano \
 #	nbench-byte \
-#	pointercal \
+	pointercal \
+	gstreamer \
+	gst-plugins-base \
+	gst-plugins-good \
+	gst-plugins-bad \
+	gst-plugins-ugly \
+	gst-plugin-avi \
+	gst-plugin-mpegstream \
+	gst-plugin-qtdemux \
+	gst-plugin-mpegvideoparse \
+	gst-plugin-asf \
+	gst-plugin-alsa \
+	gst-plugin-ossaudio \
+	gst-plugin-audioresample \
+	gst-plugin-audioconvert \
+	gst-plugin-ximagesink \
+	gst-plugin-fbdevsink \
+	gst-plugin-faad \
+	gst-plugin-mad \    
+	gst-plugin-playbin \
+	gst-plugin-decodebin \
+	gst-plugin-typefindfunctions \
+	gst-ffmpeg \
+#	gst-plugin-on2-8170 \
+#	on2-8170-libs \
+	owl-wifi \
 	"
 
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
 # IMAGE_LINGUAS += " se no dk fi"
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
 ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
 ROOTFS_POSTPROCESS_COMMAND += "install_linguas; "
 
diff --git a/recipes/images/x11-at91sam9m10-image.bb b/recipes/images/x11-at91sam9m10-image.bb
new file mode 100644
index 0000000..416ae63
--- /dev/null
+++ b/recipes/images/x11-at91sam9m10-image.bb
@@ -0,0 +1,102 @@
+#Angstrom X11 at91sam9 image
+
+XSERVER ?= ""
+	
+ANGSTROM_EXTRA_INSTALL += " \
+	gpe-irc \
+	gpe-sketchbook \
+	gpe-filemanager \
+	gpe-tetris \
+	gpe-go \
+	gpe-calendar \
+	gpe-contacts \
+	gpe-edit \
+	gpe-gallery \
+	gpe-calculator \
+	gpe-clock \
+	gpe-terminal \
+	gpe-watch \
+	matchbox-panel-hacks \
+	gpe-scap \
+	gpe-windowlist \
+	gpe-mixer \
+	usbview \
+	mplayer \
+	thttpd \
+	madplay \
+	alsa-utils-aplay \
+	alsa-utils-amixer \
+	iperf \
+	dosfstools \
+	mtd-utils \
+#	nbench-byte \
+	gpe-mini-browser \
+	pointercal \
+	gstreamer \
+	gst-plugins-base \
+	gst-plugins-good \
+	gst-plugins-bad \
+	gst-plugins-ugly \
+	gst-plugin-avi \
+	gst-plugin-mpegstream \
+	gst-plugin-qtdemux \
+	gst-plugin-mpegvideoparse \
+	gst-plugin-asf \
+	gst-plugin-alsa \
+	gst-plugin-ossaudio \
+	gst-plugin-audioresample \
+	gst-plugin-audioconvert \
+	gst-plugin-ximagesink \
+	gst-plugin-fbdevsink \
+	gst-plugin-faad \
+	gst-plugin-mad \    
+	gst-plugin-playbin \
+	gst-plugin-decodebin \
+	gst-plugin-typefindfunctions \
+	gst-ffmpeg \
+	gst-plugin-on2-8170 \
+	on2-8170-libs \
+	owl-wifi \
+	"
+
+export IMAGE_BASENAME = "x11-at91sam9m10-image"
+
+DEPENDS = "task-base"
+IMAGE_INSTALL = "\
+    ${XSERVER} \
+    task-base-extended \
+    angstrom-x11-base-depends \
+    angstrom-gpe-task-base \
+    angstrom-gpe-task-settings \
+    ${ANGSTROM_EXTRA_INSTALL}"
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+at91sam9m10_rootfs_postprocess() {
+   curdir=$PWD
+   cd ${IMAGE_ROOTFS}
+
+   # add init script to cratee hantro modules /dev files
+   echo 'MAJOR=`cat /proc/devices |grep hx170|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
+   echo 'mknod /dev/hx170 c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
+   echo 'MAJOR=`cat /proc/devices |grep memalloc|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
+   echo 'mknod /dev/memalloc c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
+   chmod a+x  ${IMAGE_ROOTFS}/etc/init.d/hantro
+   cd ${IMAGE_ROOTFS}/etc/rc5.d
+   ln -s ../init.d/hantro S51hantro
+
+   # back on track
+   cd $curdir
+}
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
+
+#we dont need the kernel in the image
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
+
+#load sam9m10 vdec modules and create file descriptor at boot
+ROOTFS_POSTPROCESS_COMMAND += "at91sam9m10_rootfs_postprocess; "
+
+inherit image
-- 
1.7.4.1



