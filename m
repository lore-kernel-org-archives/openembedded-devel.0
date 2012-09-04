Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8tdo-0001zF-7g
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Sep 2012 15:58:08 +0200
Received: by bkcik5 with SMTP id ik5so3294833bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DsRL0iYdCHXtgk8haJoO74gAkkJfsIPWCsJl/GdHgB4=;
	b=hiVyLzCHaGulaf6KjfYC0GiPhrRTUAKWtHJEsh1Go7S+pcpV1yGQkiJwJIQu1rRF4O
	SF/ucJuHRdIPpTHgPc01KhyaP0lJkLLOv6xnismKdYRGX+Qgq08sSQdNPYbpeew+2dEd
	0zhEK2LyITP1vEE9Pc0dRX1biDqL4H3JpdEDm1P3lTcG57HnecGHOe4DbyE9sJQ3AQ65
	ELbh6tnEXDHJpvSaTd8DkgKWcS0CEHFvGR29bwtJ4fqlCF8EbtxavndSNS0SYy8jGKa3
	fbQvzaelGAQdmJK1avA9finGp7Yj4eEb11PIeyMkJDlE5nAIejT4cXVEzLPnFvJnSKXO
	uSgA==
Received: by 10.204.129.23 with SMTP id m23mr8369082bks.28.1346766346398;
	Tue, 04 Sep 2012 06:45:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm10452602bkm.10.2012.09.04.06.45.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 06:45:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2012 15:44:58 +0200
Message-Id: <1346766298-25410-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1346766298-25410-1-git-send-email-Martin.Jansa@gmail.com>
References: <1346766298-25410-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] packagegroup: add RPROVIDES/RREPLACES/RCONFLICTS and bump PR to get some upgrade path
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
X-List-Received-Date: Tue, 04 Sep 2012 13:58:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-efl-sdk.bb          |  5 +++++
 .../packagegroup-efl-standalone-sdk-target.bb      |  5 +++++
 .../packagegroups/packagegroup-x11-illume.bb       |  5 ++++-
 .../packagegroups/packagegroup-basic.bb            |  5 ++++-
 .../packagegroups/packagegroup-boot.bb             |  6 +++++-
 .../packagegroups/packagegroup-cli-tools.bb        |  9 ++++++++-
 .../packagegroups/packagegroup-x11-server_1.0.bb   |  6 ++++--
 .../packagegroups/packagegroup-x11_1.0.bb          |  9 ++++++++-
 .../packagegroups/packagegroup-sdk-target.bb       |  6 +++++-
 .../packagegroups/packagegroup-fonts-truetype.bb   | 22 +++++++++++++++++-----
 .../packagegroups/packagegroup-xfce-base.bb        |  6 +++++-
 .../packagegroups/packagegroup-xfce-extended.bb    |  6 +++++-
 12 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index bfaf5d4..0906ef5 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -5,10 +5,15 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 ALLOW_EMPTY = "1"
 
+PR = "r1"
+
 require packagegroup-efl-sdk.inc
 
 PACKAGES = "${PN}"
 
+RPROVIDES_${PN} += "task-efl-sdk"
+RREPLACES_${PN} += "task-efl-sdk"
+RCONFLICTS_${PN} += "task-efl-sdk"
 RDEPENDS_${PN} = "\
     packagegroup-core-sdk \
     ${SDK-EFL} \
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index 21d1540..ea4b751 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -5,10 +5,15 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 ALLOW_EMPTY = "1"
 
+PR = "r1"
+
 require packagegroup-efl-sdk.inc
 
 PACKAGES = "${PN} ${PN}-dbg"
 
+RPROVIDES_${PN} += "task-efl-standalone-sdk-target"
+RREPLACES_${PN} += "task-efl-standalone-sdk-target"
+RCONFLICTS_${PN} += "task-efl-standalone-sdk-target"
 RDEPENDS_${PN} = "\
     packagegroup-core-standalone-sdk-target \
     ${SDK-EFL} \
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index 30cb090..d5cb48c 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${TOPDIR}/meta-openembedded/meta-efl/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r2"
+PR = "r3"
 
 # WORK IN PROGRESS
 
@@ -13,6 +13,9 @@ inherit packagegroup allarch
 ETHEME ?= "e-wm-theme-default"
 ECONFIG ?= "e-wm-config-illume2"
 
+RPROVIDES_${PN} += "task-x11-illume"
+RREPLACES_${PN} += "task-x11-illume"
+RCONFLICTS_${PN} += "task-x11-illume"
 RDEPENDS_${PN} = "\
   packagegroup-x11-server \
   packagegroup-x11-utils \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index e46afc2..493ef5e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Basic task to get a device online"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -23,6 +23,9 @@ MACHINE_EXTRA_RRECOMMENDS ?= ""
 #
 TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"
 
+RPROVIDES_${PN} += "task-basic"
+RREPLACES_${PN} += "task-basic"
+RCONFLICTS_${PN} += "task-basic"
 #
 # The section below is designed to match with packagegroup-boot, but doesn't depend on it to allow for more freedom 
 # when writing image recipes.
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index ac31118..1d6ae9e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r57"
+PR = "r58"
 
 inherit packagegroup
 
@@ -19,6 +19,10 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 # Make sure we build the kernel
 DEPENDS = "virtual/kernel"
 
+RPROVIDES_${PN} += "task-boot"
+RREPLACES_${PN} += "task-boot"
+RCONFLICTS_${PN} += "task-boot"
+
 #
 # minimal set of packages - needed to boot
 #
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index 0ab3703..07fb056 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -4,12 +4,19 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r19"
+PR = "r20"
 
 inherit packagegroup allarch
 
 PACKAGES += "${PN}-debug"
 
+RPROVIDES_${PN} += "task-cli-tools"
+RPROVIDES_${PN}-debug += "task-cli-tools-debug"
+RREPLACES_${PN} += "task-cli-tools"
+RREPLACES_${PN}-debug += "task-cli-tools-debug"
+RCONFLICTS_${PN} += "task-cli-tools"
+RCONFLICTS_${PN}-debug += "task-cli-tools-debug"
+
 RDEPENDS_${PN} = "\
   dbus-daemon-proxy \
   dosfstools \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
index def5d43..6ad755c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
@@ -1,12 +1,14 @@
 DESCRIPTION = "Task for an image with Xserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
 # for backwards compatibility
-RPROVIDES_${PN} += "packagegroup-xserver"
+RPROVIDES_${PN} += "packagegroup-xserver task-x11-server task-xserver"
+RREPLACES_${PN} += "packagegroup-xserver task-x11-server task-xserver"
+RCONFLICTS_${PN} += "packagegroup-xserver task-x11-server task-xserver"
 
 XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
index 93eab95..50ae968 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r11"
+PR = "r12"
 
 inherit packagegroup allarch
 
@@ -19,6 +19,13 @@ VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
 # elsa or xserver-nodm-init(-systemd)
 VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
+RPROVIDES_${PN} += "task-x11"
+RPROVIDES_${PN}-utils += "task-x11-utils"
+RREPLACES_${PN} += "task-x11"
+RREPLACES_${PN}-utils += "task-x11-utils"
+RCONFLICTS_${PN} += "task-x11"
+RCONFLICTS_${PN}-utils += "task-x11-utils"
+
 RDEPENDS_${PN}-utils = "\
   ${VIRTUAL-RUNTIME_xserver_common} \
   ${VIRTUAL-RUNTIME_graphical_init_manager} \
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 3ad9b55..b9e5a29 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -2,9 +2,13 @@ DESCRIPTION = "Packages required for a target (on-device) SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
+PR = "r1"
+
 inherit packagegroup allarch
 
-RPROVIDES_${PN} = "packagegroup-native-sdk"
+RPROVIDES_${PN} += "packagegroup-native-sdk task-sdk-target task-native-sdk"
+RREPLACES_${PN} += "packagegroup-native-sdk task-sdk-target task-native-sdk"
+RCONFLICTS_${PN} += "packagegroup-native-sdk task-sdk-target task-native-sdk"
 RDEPENDS_${PN} = "gcc-symlinks g++-symlinks cpp cpp-symlinks \
                   binutils-symlinks \
                   perl-modules \
diff --git a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
index 816a67f..76126fc 100644
--- a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
@@ -3,7 +3,7 @@ SECTION = "fonts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r1"
+PR = "r2"
 
 inherit packagegroup allarch
 
@@ -12,14 +12,26 @@ PACKAGES += "\
   ${PN}-chinese \
   ${PN}-japanese \
 "
+RPROVIDES_${PN} += "task-fonts-truetype"
+RPROVIDES_${PN}-core += "task-fonts-truetype-core"
+RPROVIDES_${PN}-chinese += "task-fonts-truetype-chinese"
+RPROVIDES_${PN}-japanese += "task-fonts-truetype-japanese"
+RREPLACES_${PN} += "task-fonts-truetype"
+RREPLACES_${PN}-core += "task-fonts-truetype-core"
+RREPLACES_${PN}-chinese += "task-fonts-truetype-chinese"
+RREPLACES_${PN}-japanese += "task-fonts-truetype-japanese"
+RCONFLICTS_${PN} += "task-fonts-truetype"
+RCONFLICTS_${PN}-core += "task-fonts-truetype-core"
+RCONFLICTS_${PN}-chinese += "task-fonts-truetype-chinese"
+RCONFLICTS_${PN}-japanese += "task-fonts-truetype-japanese"
 
-RRECOMMENDS_packagegroup-fonts-truetype = "\
+RRECOMMENDS_${PN} = "\
   ${PN}-core \
   ${PN}-chinese \
   ${PN}-japanese \
 "
 
-RDEPENDS_packagegroup-fonts-truetype-core = "\
+RDEPENDS_${PN}-core = "\
   fontconfig-utils \
   \
   ttf-dejavu-common \
@@ -28,12 +40,12 @@ RDEPENDS_packagegroup-fonts-truetype-core = "\
 "
 #  ttf-dejavu-serif \
 
-RDEPENDS_packagegroup-fonts-truetype-chinese = "\
+RDEPENDS_${PN}-chinese = "\
   ${PN}-core \
   ttf-arphic-uming \
 "
 
-RDEPENDS_packagegroup-fonts-truetype-japanese = "\
+RDEPENDS_${PN}-japanese = "\
   ${PN}-core \
   ttf-sazanami-gothic \
   ttf-sazanami-mincho \
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 7627576..41e1d4a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -2,10 +2,14 @@ DESCRIPTION = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
+RPROVIDES_${PN} += "task-xfce-base"
+RREPLACES_${PN} += "task-xfce-base"
+RCONFLICTS_${PN} += "task-xfce-base"
+
 RDEPENDS_${PN} = " \
     xfwm4 \
     xfwm4-theme-default \
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 469a2b7..ebe2dc7 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,10 +3,14 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
+RPROVIDES_${PN} += "task-xfce-extended"
+RREPLACES_${PN} += "task-xfce-extended"
+RCONFLICTS_${PN} += "task-xfce-extended"
+
 # mandatory
 RDEPENDS_${PN} = " \
     packagegroup-xfce-base \
-- 
1.7.12



