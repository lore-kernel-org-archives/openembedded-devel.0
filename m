Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlRjR-0003qE-3n
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:21:58 +0200
Received: by qwi2 with SMTP id 2so1340669qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:21:33 -0700 (PDT)
Received: by 10.224.60.205 with SMTP id q13mr4607584qah.338.1282072893037;
	Tue, 17 Aug 2010 12:21:33 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r36sm9127282qcs.15.2010.08.17.12.21.30
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 12:21:31 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 14:21:26 -0500
Message-Id: <1282072886-11562-3-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
References: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>
	<1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-demo-image: add packages used at ESC
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
X-List-Received-Date: Tue, 17 Aug 2010 19:21:58 -0000

* nodejs and linuxtag-ics don't seem to have cross-compiling recipes to create them.
* esc-node-demo requries nodejs

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-demo-image.bb |  101 ++++++++++++++++++++++++++++++
 1 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/recipes/images/beagleboard-demo-image.bb b/recipes/images/beagleboard-demo-image.bb
index d83281c..5d36dea 100644
--- a/recipes/images/beagleboard-demo-image.bb
+++ b/recipes/images/beagleboard-demo-image.bb
@@ -6,6 +6,7 @@ XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-input-mouse \
            xf86-video-fbdev \
+           xf86-video-sisusb \
            xf86-input-keyboard \
 "
 
@@ -20,10 +21,110 @@ IMAGE_INSTALL = "\
     ${ANGSTROM_EXTRA_INSTALL} \
     task-beagleboard-demo \
     ${SPLASH} \
+    bash \
+    gstreamer-ti \
+    libgles-omap3-x11wsegl \
+    shadow \
+    bash \
+    psplash-angstrom \
+    task-base-extended \
+    angstrom-task-gnome \
+    ti-dsplink-examples \
+    ti-codec-engine-examples \
+    ti-dmai-apps \
+    gstreamer-ti \
+    libgles-omap3-x11wsegl \
+    bc-cube-fb \
+    bc-cube-x11 \
+    mplayer \
+    omapfbplay \
+    cpufrequtils \
+    htop \
+    powertop \
+    ntpdate \
+    libgles-omap3-rawdemos \
+    libgles-omap3-x11demos \
+    abiword \
+    gnumeric \
+    epiphany \
+    memtester \
+    kernel-modules \
+    epiphany \
+    midori \
+    firefox \
+    gnome-mplayer \
+    gecko-mediaplayer-firefox-hack \
+    gpe-scap \
+    gst-plugin-gles \
+    alsa-utils \
+    alsa-utils-alsamixer \
+    alsa-utils-aplay \
+    alsa-utils-amixer \
+    alsa-utils-aconnect \
+    alsa-utils-iecset \
+    alsa-utils-speakertest \
+    alsa-utils-aseqnet \
+    alsa-utils-aseqdump \
+    alsa-utils-alsaconf \
+    alsa-utils-alsactl \
+    ti-msp430-chronos-apps \
+    git \
+    vim \
+    screen \
+    dosfstools \
+    omap-dss-doc \
+    gedit \
+    lsof \
+    matrix-gui \
+    matrix-tui \
+    am-benchmarks \
+    am-sysinfo \
+    e2fsprogs \
+    e2fsprogs-mke2fs \
+    nano \
+    qt4-demos \
+    qt4-plugin-imageformat-jpeg \
+    qt4-plugin-imageformat-svg \
+    qt-x11-qvfb \
+    qt4-embedded-demos \
+    qt4-embedded-plugin-gfxdriver-gfxvnc \
+    qt4-embedded-plugin-gfxdriver-gfxtransformed \
+    qt4-embedded \
+    qt4-embedded-fonts \
+    qt4-embedded-plugin-imageformat-svg \
+    qt4-embedded-plugin-imageformat-jpeg \
+    arora \
+    arora-e \
+    task-native-sdk \
+    task-qte-toolchain-target \
+    qt4-x11-free-gles-dev \
+    u-boot-mkimage \
+    picodlp-control \
+    x-load \
+    u-boot \
+    angstrom-uboot-scripts \
+    x11vnc \
+    evtest \
+    gstd \
+    qmake2 \
+    matrix-gui-autostart \
+    esc-gst \
+    esc-media \
+#    nodejs \
+#    esc-node-demo \
+    mtd-utils \
+    i2c-tools \
+    beagleboard-test-scripts \
+    cpuburn-neon \
+    sox \
+    devmem2 \
     "
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
+IMAGE_LOGIN_MANAGER = "shadow"
+IMAGE_SPLASH = "psplash-angstrom"
+
 #zap root password for release images
 ROOTFS_POSTPROCESS_COMMAND += 'install_linguas; ${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
 
-- 
1.5.6.4



