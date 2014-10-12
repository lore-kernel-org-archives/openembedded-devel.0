Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B229B7169F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 22:04:06 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id h11so2197207wiw.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PpUsFa+GDjqTw70v2BiUNLFlPnNK76aXmTnTyiK4+1c=;
	b=T2tk6R1wCxb9jdR8ioBpkai7S56VhZ7Z/ViJBdt3rGxCDL4z3gIq4o8atGmowYeycS
	oRoJ3XAXm7BJbqz/sNsBJUI1yYlaMIwKOZpQEE4fzzjsANDrz33sOsrR4wcTox2KnTLj
	/baYj7MTHgY/4p0pno8FzayE/W+C6GO/HGyplwDQrMNFNzPRxn8D+qETeU/QT9C3undI
	5Waphv3ZCmBxtwUPY6tnNcg357Ismh3Tw18mgb/4Qibv48LYuBUNyZq6n88rjv3kMxi+
	4nbQUP1+Ao7CbOE9fjNxluLuBJtLlTCJ6/r6UzDuXxbhgRgO3BiMIe7GsKx9BeGes2mF
	F0lA==
X-Received: by 10.180.100.6 with SMTP id eu6mr17131596wib.5.1413151447660;
	Sun, 12 Oct 2014 15:04:07 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host177-255-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.255.177])
	by mx.google.com with ESMTPSA id d3sm10158294wix.5.2014.10.12.15.04.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Oct 2014 15:04:07 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 00:04:03 +0200
Message-Id: <1413151443-22584-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] mininit: update SRC_URI and move to v. 2.0.2
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
X-List-Received-Date: Sun, 12 Oct 2014 22:04:08 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/mininit/mininit_2.0.2.bb | 36 ++++++++++++++++++++++++++++++++++++
 recipes-bsp/mininit/mininit_git.bb   | 36 ------------------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)
 create mode 100644 recipes-bsp/mininit/mininit_2.0.2.bb
 delete mode 100644 recipes-bsp/mininit/mininit_git.bb

diff --git a/recipes-bsp/mininit/mininit_2.0.2.bb b/recipes-bsp/mininit/mininit_2.0.2.bb
new file mode 100644
index 0000000..862849d
--- /dev/null
+++ b/recipes-bsp/mininit/mininit_2.0.2.bb
@@ -0,0 +1,36 @@
+SUMMARY = "mininit for romfs/squashfs loop images"
+DESCRIPTION = "mininit is a linux-as-bootloader implementation based on losetup."
+HOMEPAGE = "https://github.com/OpenDingux/mininit"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://license.txt;md5=a00f7cbb0dca244e8ae6aaa792217ecf"
+
+SRC_URI = "https://github.com/OpenDingux/mininit/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "13c6ad344c9f29e28267c37718926d83"
+SRC_URI[sha256sum] = "bdece10be16af57758e87d9be7d17a37deb7c42253966b7c06b334acea93992f"
+
+S = "${WORKDIR}/mininit-${PV}"
+
+LDFLAGS += '-static'
+
+do_compile () {
+        oe_runmake
+}
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 0755 mininit-initramfs ${D}${bindir}/mininit
+        install -d ${D}/dev
+        install -d ${D}/boot
+        install -d ${D}/root
+        install -d ${D}/proc
+        install -d ${D}/sys
+}
+
+FILES_${PN} += " ${bindir}/mininit-initramfs /init /dev /boot /root /proc /sys"
+
+pkg_postinst_${PN} () {
+        ln -sf ${bindir}/mininit $D/init
+}
+
+BBCLASSEXTEND = "klibc"
+
+COMPATIBLE_MACHINE = "(akita|c7x0|collie|gcw0|h1940|h3600|hx4700|poodle|spitz|tosa)"
diff --git a/recipes-bsp/mininit/mininit_git.bb b/recipes-bsp/mininit/mininit_git.bb
deleted file mode 100644
index a0439ae..0000000
--- a/recipes-bsp/mininit/mininit_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "mininit for romfs/squashfs loop images"
-DESCRIPTION = "mininit is a linux-as-bootloader implementation based on losetup."
-HOMEPAGE = "https://github.com/pcercuei/mininit"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://init.c;md5=305bd83abb9a5aac95d48b5efbc11d58"
-SRCREV = "51eaefcaea52a5dbc1addd21ba93154aa9c97d66"
-PV = "1.1.0"
-
-SRC_URI = "git://github.com/pcercuei/mininit.git"
-SRC_URI[md5sum] = "62509644735a4e599e3ed0229f283faa"
-SRC_URI[sha256sum] = "4d747b16c33ac64a7923a179947d5581b4e309b73a3c89824056e9c4f0749f18"
-
-S = "${WORKDIR}/git"
-
-do_compile () {
-        oe_runmake mininit
-}
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 0755 mininit ${D}${bindir}/
-        install -d ${D}/dev
-        install -d ${D}/boot
-        install -d ${D}/root
-        install -d ${D}/proc
-        install -d ${D}/sys
-}
-
-FILES_${PN} += " ${bindir}/mininit /init /dev /boot /root /proc /sys"
-
-pkg_postinst_${PN} () {
-        ln -sf ${bindir}/mininit $D/init
-}
-
-BBCLASSEXTEND = "klibc"
-
-COMPATIBLE_MACHINE = "(akita|c7x0|collie|gcw0|h1940|h3600|hx4700|poodle|spitz|tosa)"
-- 
1.9.1


