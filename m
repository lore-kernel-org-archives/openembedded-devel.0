Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8tcj-0001uO-Al
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Sep 2012 15:57:01 +0200
Received: by bkcik5 with SMTP id ik5so3294094bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3M4CoXTDclLXCOJAnTSYw6bvyZ/58dzh1v3yiOargf0=;
	b=oKB4oKshjEYnhThhv0BMQA9LKj2SQ9hfL71ljO/0Ll+Ae1z2QcXwmHwH9TG8EGgQb3
	GOnYviYYaWoP/wtDWl76ub2emwuqLQ3CnGsjb7Ysj/L/1CjtU6JVtz1drSXwmvJvw0Ha
	R+vqBOQ6zak0TnKzpciQ/e7LdGpCVKldjZN9Wazv0piHaWtGneuMLDPxosSmeQbejtI2
	1t7jZ88mE+XYcL1wG3Y54Lkiagp5Ors0D/9OSPgbQKLwl8EgovYI8YGb/GEPb4jL9GVC
	B6c2H6rYvKV3CUoG2X59p7s5xsYZ598kh+ze6zTTk4fFMbt1vdAx1LdFkAiV8Cssd4tt
	Vnew==
Received: by 10.204.156.73 with SMTP id v9mr8075149bkw.116.1346766279585;
	Tue, 04 Sep 2012 06:44:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm10449754bkv.14.2012.09.04.06.44.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 06:44:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2012 15:44:57 +0200
Message-Id: <1346766298-25410-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH 1/2] task*: rename to packagegroup to match oe-core
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
X-List-Received-Date: Tue, 04 Sep 2012 13:57:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-core/meta/meta-toolchain-efl.bb               |  2 +-
 .../task-efl-sdk.bb => packagegroups/packagegroup-efl-sdk.bb}  |  4 ++--
 .../packagegroup-efl-sdk.inc}                                  |  0
 .../packagegroup-efl-standalone-sdk-target.bb}                 |  4 ++--
 .../packagegroup-x11-illume.bb}                                |  6 +++---
 meta-oe/conf/layer.conf                                        |  2 +-
 .../task-basic.bb => packagegroups/packagegroup-basic.bb}      |  6 +++---
 .../{tasks/task-boot.bb => packagegroups/packagegroup-boot.bb} |  2 +-
 .../packagegroup-cli-tools.bb}                                 |  2 +-
 .../packagegroup-x11-server_1.0.bb}                            |  4 ++--
 .../task-x11_1.0.bb => packagegroups/packagegroup-x11_1.0.bb}  |  2 +-
 .../packagegroup-sdk-target.bb}                                |  4 ++--
 .../packagegroup-fonts-truetype.bb}                            | 10 +++++-----
 .../packagegroup-qte-toolchain-target.bbappend}                |  0
 .../packagegroup-basic.bbappend}                               |  0
 .../packagegroup-xfce-base.bb}                                 |  2 +-
 .../packagegroup-xfce-extended.bb}                             |  4 ++--
 17 files changed, 27 insertions(+), 27 deletions(-)
 rename meta-efl/recipes-efl/{tasks/task-efl-sdk.bb => packagegroups/packagegroup-efl-sdk.bb} (84%)
 rename meta-efl/recipes-efl/{tasks/task-efl-sdk.inc => packagegroups/packagegroup-efl-sdk.inc} (100%)
 rename meta-efl/recipes-efl/{tasks/task-efl-standalone-sdk-target.bb => packagegroups/packagegroup-efl-standalone-sdk-target.bb} (81%)
 rename meta-efl/recipes-efl/{tasks/task-x11-illume.bb => packagegroups/packagegroup-x11-illume.bb} (85%)
 rename meta-oe/recipes-core/{tasks/task-basic.bb => packagegroups/packagegroup-basic.bb} (89%)
 rename meta-oe/recipes-core/{tasks/task-boot.bb => packagegroups/packagegroup-boot.bb} (97%)
 rename meta-oe/recipes-core/{tasks/task-cli-tools.bb => packagegroups/packagegroup-cli-tools.bb} (96%)
 rename meta-oe/recipes-core/{tasks/task-x11-server_1.0.bb => packagegroups/packagegroup-x11-server_1.0.bb} (86%)
 rename meta-oe/recipes-core/{tasks/task-x11_1.0.bb => packagegroups/packagegroup-x11_1.0.bb} (95%)
 rename meta-oe/recipes-devtools/{tasks/task-sdk-target.bb => packagegroups/packagegroup-sdk-target.bb} (91%)
 rename meta-oe/recipes-graphics/{tasks/task-fonts-truetype.bb => packagegroups/packagegroup-fonts-truetype.bb} (72%)
 rename meta-oe/recipes-qt/{tasks/task-qte-toolchain-target.bbappend => packagegroups/packagegroup-qte-toolchain-target.bbappend} (100%)
 rename meta-systemd/meta-oe/recipes-core/{tasks/task-basic.bbappend => packagegroups/packagegroup-basic.bbappend} (100%)
 rename meta-xfce/recipes-xfce/{tasks/task-xfce-base.bb => packagegroups/packagegroup-xfce-base.bb} (97%)
 rename meta-xfce/recipes-xfce/{tasks/task-xfce-extended.bb => packagegroups/packagegroup-xfce-extended.bb} (95%)

diff --git a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb b/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
index 875d8f8..b7b7fca 100644
--- a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
+++ b/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
@@ -1,4 +1,4 @@
-TOOLCHAIN_TARGET_EFLTASK ?= "task-efl-standalone-sdk-target task-efl-standalone-sdk-target-dbg"
+TOOLCHAIN_TARGET_EFLTASK ?= "packagegroup-efl-standalone-sdk-target packagegroup-efl-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK = "${TOOLCHAIN_TARGET_EFLTASK}"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-efl-${DISTRO_VERSION}"
 require recipes-core/meta/meta-toolchain.bb
diff --git a/meta-efl/recipes-efl/tasks/task-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
similarity index 84%
rename from meta-efl/recipes-efl/tasks/task-efl-sdk.bb
rename to meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index 5c1a13a..bfaf5d4 100644
--- a/meta-efl/recipes-efl/tasks/task-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 ALLOW_EMPTY = "1"
 
-require task-efl-sdk.inc
+require packagegroup-efl-sdk.inc
 
 PACKAGES = "${PN}"
 
 RDEPENDS_${PN} = "\
-    task-core-sdk \
+    packagegroup-core-sdk \
     ${SDK-EFL} \
     ${SDK-EXTRAS}"
diff --git a/meta-efl/recipes-efl/tasks/task-efl-sdk.inc b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
similarity index 100%
rename from meta-efl/recipes-efl/tasks/task-efl-sdk.inc
rename to meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
diff --git a/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
similarity index 81%
rename from meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb
rename to meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index 95a66b9..21d1540 100644
--- a/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 ALLOW_EMPTY = "1"
 
-require task-efl-sdk.inc
+require packagegroup-efl-sdk.inc
 
 PACKAGES = "${PN} ${PN}-dbg"
 
 RDEPENDS_${PN} = "\
-    task-core-standalone-sdk-target \
+    packagegroup-core-standalone-sdk-target \
     ${SDK-EFL} \
     ${SDK-EXTRAS}"
diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
similarity index 85%
rename from meta-efl/recipes-efl/tasks/task-x11-illume.bb
rename to meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index 20cf2b8..30cb090 100644
--- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -7,15 +7,15 @@ PR = "r2"
 
 # WORK IN PROGRESS
 
-inherit task allarch
+inherit packagegroup allarch
 
 # Default theme and config
 ETHEME ?= "e-wm-theme-default"
 ECONFIG ?= "e-wm-config-illume2"
 
 RDEPENDS_${PN} = "\
-  task-x11-server \
-  task-x11-utils \
+  packagegroup-x11-server \
+  packagegroup-x11-utils \
   \
   e-wm \
   ${ECONFIG} \
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index dcacb32..8a529c8 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,7 +26,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal-xinput \
   mplayer-common \
-  task-x11-server \
+  packagegroup-x11-server \
   fbset-modes \
   gpsd-machine-conf \
 "
diff --git a/meta-oe/recipes-core/tasks/task-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
similarity index 89%
rename from meta-oe/recipes-core/tasks/task-basic.bb
rename to meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 47b09de..e46afc2 100644
--- a/meta-oe/recipes-core/tasks/task-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -1,4 +1,4 @@
-# This recipe is intended as a 'simpler' replacement for task-base.
+# This recipe is intended as a 'simpler' replacement for packagegroup-base.
 # Please communicate your use cases and suggestions to the mailinglist(s)
 
 DESCRIPTION = "Basic task to get a device online"
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PR = "r9"
 
-inherit task
+inherit packagegroup
 
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
@@ -24,7 +24,7 @@ MACHINE_EXTRA_RRECOMMENDS ?= ""
 TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"
 
 #
-# The section below is designed to match with task-boot, but doesn't depend on it to allow for more freedom 
+# The section below is designed to match with packagegroup-boot, but doesn't depend on it to allow for more freedom 
 # when writing image recipes.
 # It also avoids the choice between connman/networkmanager/ifupdown since that is an image feature, not a
 # distro feature.
diff --git a/meta-oe/recipes-core/tasks/task-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
similarity index 97%
rename from meta-oe/recipes-core/tasks/task-boot.bb
rename to meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index 6c27ffe..ac31118 100644
--- a/meta-oe/recipes-core/tasks/task-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PR = "r57"
 
-inherit task
+inherit packagegroup
 
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
diff --git a/meta-oe/recipes-core/tasks/task-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
similarity index 96%
rename from meta-oe/recipes-core/tasks/task-cli-tools.bb
rename to meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index a849978..0ab3703 100644
--- a/meta-oe/recipes-core/tasks/task-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PV = "1.0"
 PR = "r19"
 
-inherit task allarch
+inherit packagegroup allarch
 
 PACKAGES += "${PN}-debug"
 
diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
similarity index 86%
rename from meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
rename to meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
index 7e43d55..def5d43 100644
--- a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
@@ -3,10 +3,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 PR = "r9"
 
-inherit task
+inherit packagegroup
 
 # for backwards compatibility
-RPROVIDES_${PN} += "task-xserver"
+RPROVIDES_${PN} += "packagegroup-xserver"
 
 XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
similarity index 95%
rename from meta-oe/recipes-core/tasks/task-x11_1.0.bb
rename to meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
index 326e09f..93eab95 100644
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r11"
 
-inherit task allarch
+inherit packagegroup allarch
 
 PACKAGES += "${PN}-utils"
 
diff --git a/meta-oe/recipes-devtools/tasks/task-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
similarity index 91%
rename from meta-oe/recipes-devtools/tasks/task-sdk-target.bb
rename to meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 03141f2..3ad9b55 100644
--- a/meta-oe/recipes-devtools/tasks/task-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Packages required for a target (on-device) SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-inherit task allarch
+inherit packagegroup allarch
 
-RPROVIDES_${PN} = "task-native-sdk"
+RPROVIDES_${PN} = "packagegroup-native-sdk"
 RDEPENDS_${PN} = "gcc-symlinks g++-symlinks cpp cpp-symlinks \
                   binutils-symlinks \
                   perl-modules \
diff --git a/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
similarity index 72%
rename from meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
rename to meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
index 112e8cb..816a67f 100644
--- a/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PV = "1.0"
 PR = "r1"
 
-inherit task allarch
+inherit packagegroup allarch
 
 PACKAGES += "\
   ${PN}-core \
@@ -13,13 +13,13 @@ PACKAGES += "\
   ${PN}-japanese \
 "
 
-RRECOMMENDS_task-fonts-truetype = "\
+RRECOMMENDS_packagegroup-fonts-truetype = "\
   ${PN}-core \
   ${PN}-chinese \
   ${PN}-japanese \
 "
 
-RDEPENDS_task-fonts-truetype-core = "\
+RDEPENDS_packagegroup-fonts-truetype-core = "\
   fontconfig-utils \
   \
   ttf-dejavu-common \
@@ -28,12 +28,12 @@ RDEPENDS_task-fonts-truetype-core = "\
 "
 #  ttf-dejavu-serif \
 
-RDEPENDS_task-fonts-truetype-chinese = "\
+RDEPENDS_packagegroup-fonts-truetype-chinese = "\
   ${PN}-core \
   ttf-arphic-uming \
 "
 
-RDEPENDS_task-fonts-truetype-japanese = "\
+RDEPENDS_packagegroup-fonts-truetype-japanese = "\
   ${PN}-core \
   ttf-sazanami-gothic \
   ttf-sazanami-mincho \
diff --git a/meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend
rename to meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
diff --git a/meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend b/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
rename to meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
similarity index 97%
rename from meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
rename to meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index d9fcc30..7627576 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 PR = "r2"
 
-inherit task
+inherit packagegroup
 
 RDEPENDS_${PN} = " \
     xfwm4 \
diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
similarity index 95%
rename from meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
rename to meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 0c13a64..469a2b7 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PR = "r3"
 
-inherit task
+inherit packagegroup
 
 # mandatory
 RDEPENDS_${PN} = " \
-    task-xfce-base \
+    packagegroup-xfce-base \
 "
 
 # nice to have
-- 
1.7.12



