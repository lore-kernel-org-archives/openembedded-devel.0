Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnGDY-00078T-WD
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 21:28:37 +0200
Received: by qwa26 with SMTP id 26so1597317qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 12:28:08 -0700 (PDT)
Received: by 10.229.251.197 with SMTP id mt5mr2909183qcb.131.1282505288735;
	Sun, 22 Aug 2010 12:28:08 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r36sm6061038qcs.15.2010.08.22.12.28.06
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Aug 2010 12:28:07 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 14:28:05 -0500
Message-Id: <1282505285-5897-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-demo-image: update for xM demo shipped with board
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
X-List-Received-Date: Sun, 22 Aug 2010 19:28:37 -0000

* add packages used at ESC
* nodejs and linuxtag-ics don't seem to have cross-compiling recipes to create them
* esc-node-demo requries nodejs, so removed
* add ti-xgxperf-qt-x11
* removed e-wm
* removed Qt embedded toolchain
* added some qt4-x11 toolchain
* fixed dependency from jalimo-beagleboard-demo-image
* qt4-tools-sdk and task-sdk-host don't produce target installs
* removed gpe, because it conflicted with gtk

* added some more packages

* remove qmake2 and qt4-tools since they aren't building

* don't waste time building UBIFS or ext2.gz

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-demo-image.bb        |   30 -----
 recipes/images/beagleboard-demo-image_0.bb      |   30 +++++
 recipes/images/beagleboard-demo-image_1.bb      |   39 +++++++
 recipes/images/jalimo-beagleboard-demo-image.bb |    2 +-
 recipes/tasks/task-beagleboard-demo.bb          |   54 ---------
 recipes/tasks/task-beagleboard-demo_0.bb        |   54 +++++++++
 recipes/tasks/task-beagleboard-demo_1.bb        |  139 +++++++++++++++++++++++
 7 files changed, 263 insertions(+), 85 deletions(-)
 delete mode 100644 recipes/images/beagleboard-demo-image.bb
 create mode 100644 recipes/images/beagleboard-demo-image_0.bb
 create mode 100644 recipes/images/beagleboard-demo-image_1.bb
 delete mode 100644 recipes/tasks/task-beagleboard-demo.bb
 create mode 100644 recipes/tasks/task-beagleboard-demo_0.bb
 create mode 100644 recipes/tasks/task-beagleboard-demo_1.bb

diff --git a/recipes/images/beagleboard-demo-image.bb b/recipes/images/beagleboard-demo-image.bb
deleted file mode 100644
index d83281c..0000000
--- a/recipes/images/beagleboard-demo-image.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-# Demo image for beagleboard
-
-IMAGE_LINGUAS = "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in ta-in"
-
-XSERVER ?= "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-fbdev \
-           xf86-input-keyboard \
-"
-
-ANGSTROM_EXTRA_INSTALL ?= ""
-SPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
-
-export IMAGE_BASENAME = "Beagleboard-demo-image"
-
-DEPENDS = "task-base"
-IMAGE_INSTALL = "\
-    ${XSERVER} \
-    ${ANGSTROM_EXTRA_INSTALL} \
-    task-beagleboard-demo \
-    ${SPLASH} \
-    "
-
-IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
-
-#zap root password for release images
-ROOTFS_POSTPROCESS_COMMAND += 'install_linguas; ${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
-
-inherit image
diff --git a/recipes/images/beagleboard-demo-image_0.bb b/recipes/images/beagleboard-demo-image_0.bb
new file mode 100644
index 0000000..d83281c
--- /dev/null
+++ b/recipes/images/beagleboard-demo-image_0.bb
@@ -0,0 +1,30 @@
+# Demo image for beagleboard
+
+IMAGE_LINGUAS = "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in ta-in"
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard \
+"
+
+ANGSTROM_EXTRA_INSTALL ?= ""
+SPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
+
+export IMAGE_BASENAME = "Beagleboard-demo-image"
+
+DEPENDS = "task-base"
+IMAGE_INSTALL = "\
+    ${XSERVER} \
+    ${ANGSTROM_EXTRA_INSTALL} \
+    task-beagleboard-demo \
+    ${SPLASH} \
+    "
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += 'install_linguas; ${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+
+inherit image
diff --git a/recipes/images/beagleboard-demo-image_1.bb b/recipes/images/beagleboard-demo-image_1.bb
new file mode 100644
index 0000000..8277eb6
--- /dev/null
+++ b/recipes/images/beagleboard-demo-image_1.bb
@@ -0,0 +1,39 @@
+# Demo image for beagleboard
+DESCRIPTION = "Image used for shipping with the BeagleBoard-xM as a demo"
+
+IMAGE_LINGUAS = "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in ta-in"
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-video-sisusb \
+           xf86-input-keyboard \
+"
+
+ANGSTROM_EXTRA_INSTALL ?= ""
+
+export IMAGE_BASENAME = "Beagleboard-demo-image"
+
+DEPENDS = "task-base"
+IMAGE_INSTALL = "\
+  task-base-extended \
+  task-beagleboard-demo \
+  angstrom-task-gnome \
+  ${XSERVER} \
+  ${ANGSTROM_EXTRA_INSTALL} \
+  ${IMAGE_SPLASH} \
+  "
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+IMAGE_LOGIN_MANAGER = "shadow"
+IMAGE_SPLASH = "psplash-angstrom"
+
+EXTRA_IMAGEDEPENDS += "x-load u-boot virtual/kernel"
+IMAGE_FSTYPES = "tar.bz2"
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += 'install_linguas; ${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+
+inherit image
diff --git a/recipes/images/jalimo-beagleboard-demo-image.bb b/recipes/images/jalimo-beagleboard-demo-image.bb
index c1f9e19..a7ef04a 100644
--- a/recipes/images/jalimo-beagleboard-demo-image.bb
+++ b/recipes/images/jalimo-beagleboard-demo-image.bb
@@ -1,6 +1,6 @@
 # Extended Beagleboard demo image containing Jalimo stuff.
 
-require beagleboard-demo-image.bb
+require beagleboard-demo-image_0.bb
 
 IMAGE_INSTALL += "\
     phoneme-advanced-foundation \
diff --git a/recipes/tasks/task-beagleboard-demo.bb b/recipes/tasks/task-beagleboard-demo.bb
deleted file mode 100644
index e0177e2..0000000
--- a/recipes/tasks/task-beagleboard-demo.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-DESCRIPTION = "Task for Beagleboard-demo-image"
-
-PR = "r16"
-
-inherit task 
-
-ECONFIG ?= "places e-wm-config-angstrom e-wm-config-angstrom-widescreen e-wm-config-default"
-EMENU ?= "e-wm-menu"
-
-RDEPENDS_${PN} = "\
-    task-proper-tools \
-    task-base-extended \
-    angstrom-x11-base-depends \
-    angstrom-gpe-task-base \
-    angstrom-gpe-task-settings \
-    angstrom-zeroconf-audio \
-    angstrom-led-config \ 
-    gpe-scap \
-    mime-support e-wm ${ECONFIG} ${EMENU} \
-    xterm xmms \
-    firefox midori \
-    gecko-mediaplayer-firefox-hack \
-    hicolor-icon-theme gnome-icon-theme \
-    jaaa nmap iperf gnuplot \
-    abiword-meta \
-    gnumeric \
-    gimp \
-    powertop oprofile \
-    pidgin \
-#    irssi \
-    mplayer \
-    gnome-games \
-    stalonetray \
-	synergy \
-	x11vnc angstrom-x11vnc-xinit \
-	angstrom-gnome-icon-theme-enable \
-	openssh-scp openssh-ssh \
-	picodlp-control \
-	network-manager-applet \
-	gnome-bluetooth \
-"
-
-# Install all kernel modules
-RRECOMMENDS_${PN} += " \
-	kernel-modules \
-    rt73-firmware \
-	zd1211-firmware \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-RRECOMMENDS_${PN}_append_armv7a = " \
-	gnash gnash-browser-plugin \
-	omapfbplay"
-
diff --git a/recipes/tasks/task-beagleboard-demo_0.bb b/recipes/tasks/task-beagleboard-demo_0.bb
new file mode 100644
index 0000000..e0177e2
--- /dev/null
+++ b/recipes/tasks/task-beagleboard-demo_0.bb
@@ -0,0 +1,54 @@
+DESCRIPTION = "Task for Beagleboard-demo-image"
+
+PR = "r16"
+
+inherit task 
+
+ECONFIG ?= "places e-wm-config-angstrom e-wm-config-angstrom-widescreen e-wm-config-default"
+EMENU ?= "e-wm-menu"
+
+RDEPENDS_${PN} = "\
+    task-proper-tools \
+    task-base-extended \
+    angstrom-x11-base-depends \
+    angstrom-gpe-task-base \
+    angstrom-gpe-task-settings \
+    angstrom-zeroconf-audio \
+    angstrom-led-config \ 
+    gpe-scap \
+    mime-support e-wm ${ECONFIG} ${EMENU} \
+    xterm xmms \
+    firefox midori \
+    gecko-mediaplayer-firefox-hack \
+    hicolor-icon-theme gnome-icon-theme \
+    jaaa nmap iperf gnuplot \
+    abiword-meta \
+    gnumeric \
+    gimp \
+    powertop oprofile \
+    pidgin \
+#    irssi \
+    mplayer \
+    gnome-games \
+    stalonetray \
+	synergy \
+	x11vnc angstrom-x11vnc-xinit \
+	angstrom-gnome-icon-theme-enable \
+	openssh-scp openssh-ssh \
+	picodlp-control \
+	network-manager-applet \
+	gnome-bluetooth \
+"
+
+# Install all kernel modules
+RRECOMMENDS_${PN} += " \
+	kernel-modules \
+    rt73-firmware \
+	zd1211-firmware \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+RRECOMMENDS_${PN}_append_armv7a = " \
+	gnash gnash-browser-plugin \
+	omapfbplay"
+
diff --git a/recipes/tasks/task-beagleboard-demo_1.bb b/recipes/tasks/task-beagleboard-demo_1.bb
new file mode 100644
index 0000000..4f5bdd6
--- /dev/null
+++ b/recipes/tasks/task-beagleboard-demo_1.bb
@@ -0,0 +1,139 @@
+DESCRIPTION = "Task for Beagleboard-demo-image"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    bash \
+    gstreamer-ti \
+    libgles-omap3-x11wsegl \
+    shadow \
+    psplash-angstrom \
+    task-base-extended \
+    angstrom-task-gnome \
+    ti-dsplink-examples \
+    ti-codec-engine-examples \
+    ti-dmai-apps \
+    ti-xgxperf-qt-x11 \
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
+    abiword-meta \
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
+    arora \
+    arora-e \
+    task-native-sdk \
+    qt4-x11-free-gles-dev \
+    u-boot-mkimage \
+    picodlp-control \
+    x-load \
+    u-boot \
+    angstrom-uboot-scripts \
+    x11vnc \
+    evtest \
+    gstd \
+    qt4-tools \
+#    qmake2 \
+#    qt4-tools-sdk \
+#    task-sdk-host \
+    matrix-gui-autostart \
+    esc-gst \
+    esc-media \
+    mtd-utils \
+    i2c-tools \
+    beagleboard-test-scripts \
+    cpuburn-neon \
+    sox \
+    devmem2 \
+    pidgin \
+    gimp \
+    xterm \
+    xmms \
+    task-proper-tools \
+    angstrom-x11-base-depends \
+#    angstrom-zeroconf-audio \
+    angstrom-led-config \
+    mime-support \
+    hicolor-icon-theme \
+    gnome-icon-theme \
+    jaaa \
+    nmap \
+    iperf \
+    gnuplot \
+    oprofile \
+    gnome-games \
+    stalonetray \
+    synergy \
+    angstrom-x11vnc-xinit \
+    angstrom-gnome-icon-theme-enable \
+    openssh-scp \
+    openssh-ssh \
+    network-manager-applet \
+    gnome-bluetooth \
+#    nodejs \
+    esc-node-demo \
+"
+
+# Install all kernel modules
+RRECOMMENDS_${PN} += " \
+    kernel-modules \
+    rt73-firmware \
+    zd1211-firmware \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+RRECOMMENDS_${PN}_append_armv7a = " \
+    gnash \
+    gnash-browser-plugin \
+    omapfbplay \
+"
+
-- 
1.5.6.4



