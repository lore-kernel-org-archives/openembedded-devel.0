Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2216973834
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 22:25:16 +0000 (UTC)
Received: by igkb16 with SMTP id b16so12850225igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1VBUHHQuiJ2KJN5CmmzO1RIl/Q13oFm9oRCbjUG6KCk=;
	b=V7SB5d3Y3+/uc5atYTgNYAYFzFo4z1r4Fh9rbSCybt5jgbd/6VeIh5goi+SNacJNO5
	lT+Z0sfgI1vHs8FZyQqmqdX4rY47HyDzi3A0ZKi+zhfC2CGh94TTVUJgjA6KT2H07rxw
	99XCJ1Cp1dFXRx5TRqRFM4ru0wRkj2Cr60wUjbUaS/X+bXq3K0RCkY74ztRrzlSsKHUW
	qyEZYGF9mgXxjCbNFgvhG5RLA1yKFWa1F96MmREVlZCVVGTcpgoRxCbMO2TW6r0RxdNv
	pFbofVNesQndVvOiq0f9RKA4J/QcQYN30KbuoeY7mieqygBRR067ahXgBGqXI9NV14kG
	P5iw==
X-Received: by 10.50.18.49 with SMTP id t17mr18442678igd.3.1425248717840;
	Sun, 01 Mar 2015 14:25:17 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id d6sm6852297ioe.44.2015.03.01.14.25.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Mar 2015 14:25:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2015 22:25:08 +0000
Message-Id: <1425248708-4076-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
References: <1425248708-4076-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/4] lirc: Add recipe for 0.9.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Mar 2015 22:25:17 -0000

There is a older version available at meta-guacamayo
but its not distro specific and many distros might need it
so meta-oe is right place for it.

Change-Id: Ic6b45dd652187d72a1e1bf4fb5adc8ed9c80e52a
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/lirc/lirc.inc         |  14 +
 .../recipes-connectivity/lirc/lirc/lirc.tmpfiles   |   1 +
 .../lirc/lirc/lirc_options.conf                    |  24 ++
 meta-oe/recipes-connectivity/lirc/lirc/lircd.conf  | 315 +++++++++++++++++++++
 meta-oe/recipes-connectivity/lirc/lirc/lircd.init  |  40 +++
 .../recipes-connectivity/lirc/lirc/lircd.service   |  20 ++
 .../recipes-connectivity/lirc/lirc/lircexec.init   |  37 +++
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |  66 +++++
 8 files changed, 517 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc.inc
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.conf
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.init
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.service
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircexec.init
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb

diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-connectivity/lirc/lirc.inc
new file mode 100644
index 0000000..9a10c32
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "LIRC is a package that allows you to decode and send infra-red signals of many commonly used remote controls."
+DESCRIPTION_append_lirc = " This package contains the lirc daemon, libraries and tools."
+DESCRIPTION_append_lirc-exec = " This package contains a daemon that runs programs on IR signals."
+DESCRIPTION_append_lirc-remotes = " This package contains some config files for remotes."
+DESCRIPTION_append_lirc-nslu2example = " This package contains a working config for RC5 remotes and a modified NSLU2."
+HOMEPAGE = "http://www.lirc.org"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+DEPENDS = "alsa-lib libftdi"
+PRIORITY = "optional"
+
+SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles b/meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles
new file mode 100644
index 0000000..0b80e2e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles
@@ -0,0 +1 @@
+d /run/lirc 0755 root root -
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf b/meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf
new file mode 100644
index 0000000..d8ddedd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf
@@ -0,0 +1,24 @@
+# These are the default options to lircd, if installed as
+# /etc/lirc/lirc_options.conf. See the lircd(8) and lircmd(8)
+# manpages for info on the different options.
+
+[lircd]
+nodaemon        = False
+permission      = 666
+driver          = default
+device          = /dev/lirc0
+output          = /var/run/lirc/lircd
+pidfile         = /var/run/lirc/lircd.pid
+plugindir       = /usr/lib/lirc/plugins
+allow-simulate  = No
+repeat-max      = 600
+#listen         = [address:]port
+#connect        = host[:port]
+#debug          = 5
+#uinput         = ...
+#release        = ...
+#logfile        = ...
+
+[lircmd]
+uinput          = False
+nodeamon        = False
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircd.conf b/meta-oe/recipes-connectivity/lirc/lirc/lircd.conf
new file mode 100644
index 0000000..29b03c7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/lircd.conf
@@ -0,0 +1,315 @@
+# contributed by angelo castello
+#
+# note: this config file has been deduced starting from the
+#       raw codes provided to run mode2 utility.
+#
+# brand: futarque
+
+begin remote
+  name  futarque
+  bits  8
+  flags SPACE_ENC|CONST_LENGTH
+  eps   30
+  aeps  100
+
+  header       8048  3898
+  one           555  1436
+  zero          555   439
+  gap		113123
+  ptrail        555
+  pre_data_bits   8
+  pre_data     0x54
+  pre		570  3890
+
+      begin codes
+          MUTE                     0x70
+          EXIT                     0xA8
+          POWER                    0xF0
+          CHANNEL_UP               0x50
+          CHANNEL_DOWN             0xD0
+          VOLUME_UP                0x30
+          VOLUME_DOWN              0xB0
+          OK                       0x98
+          FAVORITES                0x04
+          TEXT                     0x68
+          EPG                      0xC8
+          BACK                     0x48
+          MENU                     0x88
+          1                        0x00
+          2                        0x80
+          3                        0x40
+          4                        0xC0
+          5                        0x20
+          6                        0xA0
+          7                        0x60
+          8                        0xE0
+          9                        0x10
+          0                        0x90
+          PAUSE                    0x84
+          INFO                     0x38
+          RED                      0xE8
+          GREEN                    0x08
+          YELLOW                   0x28
+          BLUE                     0x78
+          UP                       0xD8
+          DOWN                     0xB8
+          REWIND                   0x44
+          FASTFORWARD              0x24
+          PLAYPAUSE                0xC4
+          STOP                     0x64
+          RECORD                   0xA4
+          AUDIO                    0xE4
+          TAPE                     0x14
+          DVD                      0x94
+          CAPITAL_A                0xF8
+          CAPITAL_B                0x54
+      end codes
+
+end remote
+
+# brand: STM PVR-1
+
+begin remote
+  name	stm_pvr_1
+  bits	16
+  flags SPACE_ENC|CONST_LENGTH
+  eps	30
+  aeps	150
+
+  header	9000  4500
+  one		 572  1700
+  zero		 572   572
+  ptrail	 572
+  repeat	9000  2200
+  pre_data_bits	  16
+  pre_data	0xFE
+  gap		100000
+
+      begin codes
+          POWER			0x00ff
+          FAVORITES		0x7887
+          MUTE			0x28d7
+          0			0x708F
+          1			0xc03f
+          2			0x40bf
+          3			0x807f
+          4			0xe01f
+          5			0x609f
+          6			0xa05f
+          7			0xd02f
+          8			0x50af
+          9			0x906f
+          INFO			0x38c7
+          SUBTITLE		0xe817
+          MENU			0x9867
+          EXIT			0x20df
+          EPG			0xa857
+          BACK			0x48b7
+          CURSOR_UP		0x58a7
+          CURSOR_DOWN		0xd827
+          CURSOR_LEFT		0x8877
+          CURSOR_RIGHT		0xb04f
+          OK			0x10ef
+          VOLUME_UP		0x22dd
+          VOLUME_DOWN		0x8a75
+          CHANNEL_UP		0x12ed
+          CHANNEL_DOWN		0x4ab5
+          TEXT			0xf00f
+          RADIO			0x926d
+          ZOOM			0x6897
+          AUDIO			0x08f7
+          RED			0x42bd
+          GREEN			0xa25d
+          YELLOW		0x827d
+          BLUE			0x02fd
+          CUSTOM0		0x52ad
+          CUSTOM1		0x30cf
+          PLAY			0x629d
+          PAUSE			0xb24d
+          PREVIOUS		0xc837
+          NEXT			0xf807
+          REWIND		0x32cd
+          FASTFORWARD		0x0af5
+          AUX			0x7a85
+          CUSTOM3		0xb847
+          PIP			0x3ac5
+          SWAP			0xba45
+      end codes
+
+end remote
+
+# brand: STM DTV-2
+
+begin remote
+
+  name		stm_dtv_2
+  flags	SHIFT_ENC|CONST_LENGTH
+  bits		13
+  aeps	150
+
+  one		850 850
+  zero		850 850
+  plead		850
+  gap		67800
+  toggle_bit	2
+
+  begin codes
+	POWER			0x100C
+	FAVORITES		0x1015
+	AUX			0x1038
+	1			0x1001
+	2			0x1002
+	3			0x1003
+	4			0x1004
+	5			0x1005
+	6			0x1006
+	7			0x1007
+	8			0x1008
+	9			0x1009
+	PERIOD			0x1024
+	0			0x103E
+	BACK			0x1023
+	MENU			0x1016
+	INFO			0x100F
+	EPG			0x101E
+	EXIT			0x1018
+	CURSOR_UP		0x1017
+	CURSOR_DOWN		0x101D
+	CURSOR_LEFT		0x1019
+	CURSOR_RIGHT		0x101B
+	OK			0x101A
+	VOLUME_UP		0x1010
+	VOLUME_DOWN		0x1011
+	CHANNEL_UP		0x1020
+	CHANNEL_DOWN		0x1021
+	TEXT			0x102E
+	SUBTITLE		0x103C
+	FREEZE			0x1014
+	ZOOM			0x102B
+	RED			0x1028
+	GREEN			0x102A
+	YELLOW			0x102F
+	BLUE			0x1030
+	CUSTOM10		0x1022
+	INTERNET		0x1027
+	CUSTOM11		0x102C
+	AUDIO			0x1025
+	RECORD			0x102D
+	PLAYPAUSE		0x1029
+	STOP			0x1026
+	CUSTOM1			0x101C
+	MUTE			0x100d
+	CUSTOM12		0x101F
+	PIP			0x100B
+	SWAP			0x100E
+  end codes
+
+end remote
+
+# brand:  Comcast
+# model no. of remote control: XR2
+# 32 bits for the pre-date (should be value 0x170F443E)
+# width between pre_bits and data: 12900 microseconds
+#
+# 24 bits for the data (key code)
+# To get key REPEAT, XOR 0x088 with KEY value
+# There are 8 post bits (both should be zero)
+#
+# Gap between keys: 8100 microseconds
+begin remote
+
+  name Xfinity-XR2
+  bits 24
+  flags XMP
+  eps            20
+  aeps          300
+
+  one             0   137
+  zero          250   710
+  ptrail        250
+  pre_data_bits   32
+  pre_data       0x170F443E
+  post_data_bits  8
+  post_data      0x0
+  pre           250 12921
+  gap          81698
+  toggle_bit_mask 0x0
+
+      begin codes
+          1                      0x1E0001
+          1_repeat               0x168001
+          2                      0x1D0002
+          2_repeat               0x158002
+          3                      0x1C0003
+          3_repeat               0x148003
+          4                      0x1B0004
+          4_repeat               0x138004
+          5                      0x1A0005
+          5_repeat               0x128005
+          6                      0x190006
+          6_repeat               0x118006
+          7                      0x180007
+          7_repeat               0x108007
+          8                      0x170008
+          8_repeat               0x1F8008
+          9                      0x160009
+          9_repeat               0x1E8009
+          0                      0x1F0000
+          0_repeat               0x178000
+          OK                     0x180025
+          OK_repeat              0x108025
+          POWER                  0x10000F
+          POWER_repeat           0x18800F
+          UP                     0x1C0021
+          UP_repeat              0x148021
+          DOWN                   0x1B0022
+          DOWN_repeat            0x138022
+          LEFT                   0x1A0023
+          LEFT_repeat            0x128023
+          RIGHT                  0x190024
+          RIGHT_repeat           0x118024
+          REWIND                 0x190033
+          REWIND_repeat          0x118033
+          PLAY                   0x1C0030
+          PLAY_repeat            0x148030
+          FASTFORWARD            0x180034
+          FASTFORWARD_repeat     0x108034
+          RECORD                 0x170035
+          RECORD_repeat          0x1F8035
+          REPLAY                 0x170053
+          REPLAY_repeat          0x1F8053
+          A                      0x190060
+          A_repeat               0x118060
+          B                      0x180061
+          B_repeat               0x108061
+          C                      0x170062
+          C_repeat               0x1F8062
+          D                      0x160063
+          D_repeat               0x1E8063
+          PAGE_UP                0x150028
+          PAGE_UP_repeat         0x1D8028
+          PAGE_DOWN              0x140029
+          PAGE_DOWN_repeat       0x1C8029
+          GUIDE                  0x160027
+          GUIDE_repeat           0x1E8027
+          MENU                   0x1D0020
+          MENU_repeat            0x158020
+          EXIT                   0x13002A
+          EXIT_repeat            0x1B802A
+          INFO                   0x170026
+          INFO_repeat            0x1F8026
+          LAST                   0x190051
+          LAST_repeat            0x118051
+          VOLUME_UP              0x15000A
+          VOLUME_UP_repeat       0x1D800A
+          CHANNEL_UP             0x12000D
+          CHANNEL_UP_repeat      0x1A800D
+          VOLUME_DOWN            0x14000B
+          VOLUME_DOWN_repeat     0x1C800B
+          CHANNEL_DOWN           0x11000E
+          CHANNEL_DOWN_repeat    0x19800E
+          MUTE                   0x13000C
+          MUTE_repeat            0x1B800D
+      end codes
+
+end remote
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircd.init b/meta-oe/recipes-connectivity/lirc/lirc/lircd.init
new file mode 100644
index 0000000..8b124af
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/lircd.init
@@ -0,0 +1,40 @@
+#! /bin/sh
+#
+# This is an init script for Familiar
+# Copy it to /etc/init.d/lircd and type
+# > update-rc.d lircd defaults 20
+#
+
+
+test -f /usr/sbin/lircd || exit 0
+test -f /etc/lircd.conf || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting lirc daemon: lircd"
+    start-stop-daemon --start --quiet --exec /usr/sbin/lircd -- --device=/dev/lirc0
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping lirc daemon: lircd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/lircd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec /usr/sbin/lircd
+    ;;
+  restart)
+    echo -n "Stopping lirc daemon: lircd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/lircd
+    sleep 1
+    echo -n "Starting lirc daemon: lircd"
+    start-stop-daemon --start --quiet --exec /usr/sbin/lircd -- --device=/dev/lirc0
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/lircd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
+
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircd.service b/meta-oe/recipes-connectivity/lirc/lirc/lircd.service
new file mode 100644
index 0000000..c866136
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/lircd.service
@@ -0,0 +1,20 @@
+[Unit]
+Description=LIRC Infrared Signal Decoder
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=/etc/lirc/lircd.conf
+PIDFile=/run/lirc/lircd.pid
+ExecStartPre=/bin/mkdir -p /run/lirc
+ExecStartPre=/bin/rm -f /dev/lircd
+ExecStartPre=/bin/rm -f /run/lirc/lircd
+ExecStartPre=/bin/ln -s /run/lirc/lircd /dev/lircd
+
+ExecStart=/usr/sbin/lircd --pidfile=/run/lirc/lircd.pid --device=/dev/lirc0
+
+ExecStopPost=/bin/rm -f /dev/lircd
+ExecStopPost=/bin/rm -fR /run/lirc
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircexec.init b/meta-oe/recipes-connectivity/lirc/lirc/lircexec.init
new file mode 100644
index 0000000..3a8c1a3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/lircexec.init
@@ -0,0 +1,37 @@
+#! /bin/sh
+#
+# This is an init script for Familiar
+# Copy it to /etc/init.d/lircexecd and type
+# > update-rc.d lircexecd defaults 20
+# It must be started after lircd (and it does alphabetically :-)
+# irexec reads /etc/lircrc by default
+
+
+test -f /usr/bin/irexec || exit 0
+test -f /etc/lircrc || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting lircexec daemon: irexec"
+    start-stop-daemon --start --quiet --exec /usr/bin/irexec -- --daemon
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping lircexec daemon: irexec"
+    start-stop-daemon --stop --quiet --exec /usr/bin/irexec
+    echo "."
+    ;;
+  restart|force-restart)
+    echo -n "Stopping lircexec daemon: irexec"
+    start-stop-daemon --stop --quiet --exec /usr/bin/irexec
+    sleep 1
+    echo -n "Starting lircexec daemon: irexec"
+    start-stop-daemon --start --quiet --exec /usr/bin/irexec -- --daemon
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/lircexec {start|stop|reload|restart|force-restart}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
new file mode 100644
index 0000000..24374c1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
@@ -0,0 +1,66 @@
+require lirc.inc
+
+SRC_URI += " \
+    file://lircd.service \
+    file://lircd.init \
+    file://lircexec.init \
+    file://lircd.conf \
+    file://lirc_options.conf \
+    file://lirc.tmpfiles \
+"
+#file://0001-Adaptation-for-STM-configuration.patch \
+#
+SRC_URI[md5sum] = "3afc84e79c0839823cc20e7a710dd06d"
+SRC_URI[sha256sum] = "4e3f948fcdee6dce009171143f0cb7cd7be48593dd58138db4101a41f651a1dd"
+
+SYSTEMD_PACKAGES = "lirc"
+SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service"
+SYSTEMD_AUTO_ENABLE_lirc = "enable"
+
+inherit autotools pkgconfig systemd pythonnative
+
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+#EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
+do_install_append() {
+    install -m 0755 -d ${D}${sysconfdir}
+    install -m 0755 -d ${D}${sysconfdir}/lirc
+    install -m 0755 -d ${D}${systemd_unitdir}/system
+    install -m 0755 -d ${D}${libdir}/tmpfiles.d
+    install -m 0644 ${WORKDIR}/lircd.conf ${D}${sysconfdir}/lirc/
+    install -m 0644 ${WORKDIR}/lirc_options.conf ${D}${sysconfdir}/lirc/
+    install -m 0644 ${WORKDIR}/lircd.service ${D}${systemd_unitdir}/system/
+    install -m 0755 ${WORKDIR}/lircexec.init ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
+    rm -rf ${D}${libdir}/lirc/plugins/*.la
+    rmdir ${D}/var/run/lirc ${D}/var/run
+}
+
+PACKAGES =+ "${PN}-contrib ${PN}-exec ${PN}-plugins ${PN}-python"
+
+RDEPENDS_${PN}-exec = "lirc"
+RDEPENDS_${PN}-python = "python"
+
+RRECOMMENDS_lirc = "lirc-exec"
+
+FILES_${PN}-plugins = "${libdir}/lirc/plugins/*.so ${datadir}/lirc/configs"
+FILES_${PN}-contrib = "${datadir}/lirc/contrib"
+FILES_${PN}-exec = "${bindir}/irexec ${sysconfdir}/lircexec"
+FILES_${PN} += "${systemd_unitdir}/system/lircexec.init"
+FILES_${PN} += "${systemd_unitdir}/system/lircd.service"
+FILES_${PN} += "${systemd_unitdir}/system/lircd.socket"
+FILES_${PN} += "${libdir}/tmpfiles.d/lirc.conf"
+FILES_${PN}-dbg += "${libdir}/lirc/plugins/.debug"
+FILES_${PN}-python += "${libdir}/python*/site-packages"
+
+
+INITSCRIPT_PACKAGES = "lirc lirc-exec"
+INITSCRIPT_NAME_lirc-exec = "lircexec"
+INITSCRIPT_PARAMS_lirc-exec = "defaults 21"
+
+# this is for distributions that don't use udev
+pkg_postinst_${PN}_append() {
+    if [ ! -c $D/dev/lirc -a ! -f /sbin/udevd ]; then mknod $D/dev/lirc c 61 0; fi
+}
-- 
2.1.4


