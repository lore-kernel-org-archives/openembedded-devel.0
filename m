Return-Path: <marcel@ziswiler.com>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81EF977238
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 22:15:34 +0000 (UTC)
Received: from marcel-pc.toradex.int.net ([84.227.37.153]) by
	mrelay.perfora.net (mreueus002 [74.208.5.2]) with ESMTPA (Nemesis) id
	0MJlXG-1cJSBz42L6-00186O; Fri, 23 Dec 2016 23:15:24 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2016 23:15:14 +0100
Message-Id: <20161223221514.29547-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.9.3
X-Provags-ID: V03:K0:k71j/ZTfnBcOsbTZdVGg4TrNPSYFyi7ULr1QX/hjkeW40Dwcrvx
	LiD0gMcymIF9oCxLhmQJ2k2HvATMD7HOHX0H598WXYy9Cse3XiPZGs1oczOx/mi0Pf2TnG8
	Vk2/VR32Vn1gO+p0gOmVPioPG1w1k1aH7B59q0IAmUtxrBxQh8CA6l3YioMgYjsxa18mMwY
	AugreYxX/md7+M8mawQsQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:rofOcMGmHFU=:AYjTMSJEEuLKXX0idgK/jK
	xg5VvTsCzXtEYv4zgskYz2pp2iXcHkh+B9hbocNZEaz0gVYRkJxh7AZx6CoBhlonFbtAvquBw
	4kxD4kow31P44QaPvGSYJ0UztljOELfMkogn2wyTIZIRGYve9j6pbAyPI7NDbgtulIhJRXx9s
	c2QQULTdCWgHET/yLyloxrLvztvIXSzsHBxtovyyTmwIw+6pCFlS+nxGSjsLMkZyVvV1V14cE
	yC7uhaXY5ZE9ZZVjDMKqEVypP6gAjo8BgPDaxvEZTNfvOWvGtA4I2q2wAbE2VBn1G9wz2inpf
	ajBVO2/s2Ar63GQbLpuz8yCCOXfbdmiY9ssfqmHXO6xXWCzPKeFQWkYAKhXFE9ddwqdkKdJQn
	blwgnKvRrIZx8NVyhxEHwHZnKdkj2smggq9Bvxuv9+GE5HvZ6HrykbmBU+I15zRts0ArAmyq0
	cV6FWk7Jdd3Q4leSrPZXO0F8BeyhEmdwkrJCDWpK6dz5ecPjwqUnUu6DTN6cAFiUsLX4UiFaq
	rkZ8gSUHvi50zsxY/M5pU/XpRGA7kIWA63SDnG47TlkjHfdkGCPZ1KwyOEN3BntyUQy1LBQbI
	p25j5+Y7Na2yKk5g9WZY3dVVfHcGMW4JaUv259sLC8u+hEN0WvnOtvJas71hOMzKPJXvdMhK9
	E/+Z97CZxZD9Oz8JX43wWrCZbq6SnCGFi4Y54RSjn3PXpNVKMBDEqnmRtNpU1kFWGKF0=
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Denys Dmytriyenko <denys@ti.com>, Lauren Post <lauren.post@freescale.com>
Subject: [PATCH] linuxptp: fix cross compilation not using host headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2016 22:15:34 -0000

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Previously my morty build failed as follows:

| arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb -mfpu=neon  -mfloat-abi
=hard --sysroot=/data/build/oe_core-V2.7/build/tmp-glibc/sysroots/apalis-tk1-mai
nline -Wall -DVER=1.6  -D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -I/
lib/modules/4.8.13/build/usr/include -DHAVE_ONESTEP_SYNC  -D_GNU_SOURCE -DHAVE_C
LOCK_ADJTIME -DHAVE_ONESTEP_SYNC -O2 -pipe -g -feliminate-unused-debug-types -fd
ebug-prefix-map=/data/build/oe_core-V2.7/build/tmp-glibc/work/armv7at2hf-neon-an
gstrom-linux-gnueabi/linuxptp/1.6-r0=/usr/src/debug/linuxptp/1.6-r0 -fdebug-pref
ix-map=/data/build/oe_core-V2.7/build/tmp-glibc/sysroots/x86_64-linux= -fdebug-p
refix-map=/data/build/oe_core-V2.7/build/tmp-glibc/sysroots/apalis-tk1-mainline=
   -c -o msg.o msg.c
| {standard input}: Assembler messages:
| {standard input}:39: Error: bad instruction `bswapq r0'
| <builtin>: recipe for target 'msg.o' failed
| make: *** [msg.o] Error 1

As it tried using the kernel headers from my Fedora 23 build server
located at /lib/modules/4.8.13/build/usr/include.

Fix this by no longer calling the incdefs.sh shell script from the
makefile.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 .../linuxptp/no-incdefs-using-host-headers.patch   | 29 ++++++++++++++++++++++
 .../recipes-connectivity/linuxptp/linuxptp_1.6.bb  |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
new file mode 100644
index 0000000..02dbb23
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
@@ -0,0 +1,29 @@
+From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
+From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
+Date: Fri, 23 Dec 2016 18:12:29 +0100
+Subject: [PATCH] linuxptp: no incdefs using host headers
+
+Avoid using host headers via incdefs.sh shell script.
+
+Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
+---
+
+ makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makefile b/makefile
+index 8cdbd15..85174b8 100644
+--- a/makefile
++++ b/makefile
+@@ -33,7 +33,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
+ SRC	= $(OBJECTS:.o=.c)
+ DEPEND	= $(OBJECTS:.o=.d)
+ srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
+-incdefs := $(shell $(srcdir)/incdefs.sh)
++#incdefs := $(shell $(srcdir)/incdefs.sh)
+ version := $(shell $(srcdir)/version.sh $(srcdir))
+ VPATH	= $(srcdir)
+ 
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
index 0939d17..2e28644 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
@@ -3,13 +3,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
-           file://build-Allow-CC-and-prefix-to-be-overriden.patch"
+           file://build-Allow-CC-and-prefix-to-be-overriden.patch \
+           file://no-incdefs-using-host-headers.patch"
 
 SRC_URI[md5sum] = "6aa15d83f5a35f1fd076ba9adc4e7285"
 SRC_URI[sha256sum] = "e7fd16a9f235b059be527bd512e86f0c1d9f2e7c36736e6d6d9727a4427ac14c"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
-    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
+    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
 
 do_install () {
     install -d ${D}/${bindir}
-- 
2.9.3


