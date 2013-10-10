Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8406CE93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 21:26:29 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1468421eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1FjWLjSuQsimM0skiSVDSEeYy935uRfRgy6WsJv4uoc=;
	b=va4cGv2L9UsKARy6cmRSz72Y5C2y4HJ44rwCdWEK/ah2dU0c4isvYNTOTVB/bY7Od1
	LxEEf5FBend8TklFgOn29CqaYZqEYO3PLSYh0A5GgRtWKZS3WgehfZxaUDAzWT8wSZcX
	3SHPNdpFHjC+ak7KhOQPF7vZTlCY/9ibWshDlkfbnrpzlRoldweGn2/nIUBQYD93cB4o
	+s/PPippbekmHqNwJwRjaVdX3Q5DJhxc73I1BMHPiGAvvzNOK+6MgRPiozo2FHtkVLtN
	398KrdtRXika0TtLyaXcwxWOD+sKscItOuAWvefo8U5G/IrnI2GzEUFpD58vr+WDB630
	5XQw==
X-Received: by 10.15.10.5 with SMTP id f5mr14721eet.87.1381440391596;
	Thu, 10 Oct 2013 14:26:31 -0700 (PDT)
Received: from mizar.localdomain
	(host138-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.138])
	by mx.google.com with ESMTPSA id
	l49sm22010765eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 14:26:31 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 23:26:24 +0200
Message-Id: <1381440385-14152-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 1/2] kexecboot.inc: merge back in the main recipe
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
X-List-Received-Date: Thu, 10 Oct 2013 21:26:31 -0000

and process with oe-stylize.py

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc | 58 --------------------
 .../recipes-bsp/kexecboot/kexecboot_git.bb         | 62 +++++++++++++++++++++-
 2 files changed, 60 insertions(+), 60 deletions(-)
 delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
deleted file mode 100644
index 065e3c1..0000000
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-###########################
-# Configure options:
-#
-#  --enable-static-linking compile kexecboot as static executable [default=no]
-#  --enable-fbui           support framebuffer menu [default=yes]
-#  --enable-fbui-width     limit FB UI width to specified value [default=no]
-#  --enable-fbui-height    limit FB UI height to specified value [default=no]
-#  --enable-textui         support console text user interface [default=no]
-#  --enable-cfgfiles       support config files [default=yes]
-#  --enable-icons          support custom icons (depends on fbui) [default=yes]
-#  --enable-zaurus         compile Sharp Zaurus specific code [default=no]
-#  --enable-zimage         compile with zImage support [default=yes]
-#  --enable-uimage         compile with uImage support [default=no]
-#  --enable-machine-kernel look for machine-specific zImage kernel [default=no]
-#  --enable-devices-recreating
-#                          enable devices re-creating [default=yes]
-#  --enable-debug          enable debug output [default=no]
-#  --enable-host-debug     allow for non-destructive executing of kexecboot on
-#                            host system [default=no]
-#  --enable-numkeys        enable menu item selection by keys [0-9] [default=yes]
-#  --enable-bg-buffer      enable buffer for pre-drawed FB GUI background
-#
-#  --enable-timeout        allow to boot 1st kernel after timeout in seconds
-#                            [default=no]
-#  --enable-delay          specify delay before device scanning, allowing
-#                            initialization of old CF/SD cards [default=1]
-#  --enable-bpp            enable support of specified bpp modes
-#                            (all,32,24,18,16,4,2,1) [default=all]
-#  --enable-evdev-rate     change evdev (keyboard/mouse) repeat rate
-#                            in milliseconds e.g. "1000,250" [default=no]
-#  --with-kexec-binary     look for kexec binary at path
-#                            [default="/usr/sbin/kexec"]
-##########################
-SUMMARY = "kexecboot linux-as-bootloader"
-DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based on kexec."
-HOMEPAGE = "http://kexecboot.org"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-inherit autotools
-
-EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 kexecboot ${D}${bindir}/
-    install -d ${D}/proc
-    install -d ${D}/mnt
-    install -d ${D}/dev
-    install -d ${D}/sys
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev /sys"
-
-pkg_postinst_${PN} () {
-    ln -sf ${bindir}/kexecboot $D/init
-}
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index b52012e..7347ea5 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,9 +1,67 @@
+###########################
+# Configure options:
+#
+#  --enable-static-linking compile kexecboot as static executable [default=no]
+#  --enable-fbui           support framebuffer menu [default=yes]
+#  --enable-fbui-width     limit FB UI width to specified value [default=no]
+#  --enable-fbui-height    limit FB UI height to specified value [default=no]
+#  --enable-textui         support console text user interface [default=no]
+#  --enable-cfgfiles       support config files [default=yes]
+#  --enable-icons          support custom icons (depends on fbui) [default=yes]
+#  --enable-zaurus         compile Sharp Zaurus specific code [default=no]
+#  --enable-zimage         compile with zImage support [default=yes]
+#  --enable-uimage         compile with uImage support [default=no]
+#  --enable-machine-kernel look for machine-specific zImage kernel [default=no]
+#  --enable-devices-recreating
+#                          enable devices re-creating [default=yes]
+#  --enable-debug          enable debug output [default=no]
+#  --enable-host-debug     allow for non-destructive executing of kexecboot on
+#                            host system [default=no]
+#  --enable-numkeys        enable menu item selection by keys [0-9] [default=yes]
+#  --enable-bg-buffer      enable buffer for pre-drawed FB GUI background
+#
+#  --enable-timeout        allow to boot 1st kernel after timeout in seconds
+#                            [default=no]
+#  --enable-delay          specify delay before device scanning, allowing
+#                            initialization of old CF/SD cards [default=1]
+#  --enable-bpp            enable support of specified bpp modes
+#                            (all,32,24,18,16,4,2,1) [default=all]
+#  --enable-evdev-rate     change evdev (keyboard/mouse) repeat rate
+#                            in milliseconds e.g. "1000,250" [default=no]
+#  --with-kexec-binary     look for kexec binary at path
+#                            [default="/usr/sbin/kexec"]
+##########################
+SUMMARY = "kexecboot linux-as-bootloader"
+DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based on kexec."
+HOMEPAGE = "http://kexecboot.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
 PV = "0.5.9.1"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
+
 S = "${WORKDIR}/git"
 
-require kexecboot.inc
+inherit autotools
+
+EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 kexecboot ${D}${bindir}/
+    install -d ${D}/proc
+    install -d ${D}/mnt
+    install -d ${D}/dev
+    install -d ${D}/sys
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev /sys"
+
+pkg_postinst_${PN} () {
+    ln -sf ${bindir}/kexecboot $D/init
+}
 
 BBCLASSEXTEND = "klibc"
-- 
1.8.1.5


