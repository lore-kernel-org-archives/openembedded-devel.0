Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2F5470100
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 09:13:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8F9DA52026079
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 02:13:17 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 15 Sep 2017 02:13:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Sep 2017 17:12:13 +0800
Message-ID: <20170915091213.20123-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] recipes: fix invalid license file
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
X-List-Received-Date: Fri, 15 Sep 2017 09:13:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use '${COMMON_LICENSE_DIR}/MIT' for MIT License to fix the warning:

| WARNING: packagegroup-xfce-base-1.0-r5 do_populate_lic:
  ${COREBASE}/LICENSE is not a valid license file, please use
  '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in LIC_FILES_CHKSUM.
  This will become an error in the future

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb               | 2 +-
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb | 2 +-
 .../recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb  | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb                | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb                 | 2 +-
 meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb       | 2 +-
 meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb           | 2 +-
 meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb            | 2 +-
 meta-oe/recipes-extended/zram/zram_0.1.bb                               | 2 +-
 .../recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb    | 2 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb          | 2 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb      | 2 +-
 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb                    | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index 085955c13..804ec3235 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Configuration files for kexecboot"
 DESCRIPTION = "Default icon and boot.cfg for kexecboot linux-as-bootloader."
 SECTION = "base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "file://icon.xpm"
 
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
index 039abe14f..88f1abf68 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
@@ -6,7 +6,7 @@ DEPENDS_UGLY="${@'gst-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') e
 DEPENDS_BAD="${@'gst-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
 DEPENDS = "gstreamer gst-plugins-base gst-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 0ede5e57b..317f9728b 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SUMMARY = "Set of Bluetooth related tools for inclusion in images"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index a53fa69de..b12183b3a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "Basic task to get a device online"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r13"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index a542ae420..3ae7a49fe 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Basic task to get a device booting"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r58"
 
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 14e75dc7a..1be7f6aff 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Packages required for a target (on-device) SDK"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r1"
 
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
index eced4b6de..934a53e5c 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Create usergroup datetime. All members off this group are allowed set date/time/timezone via system dbus"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 require polkit-group-rule.inc
 
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
index 551ed3eb8..66a73eaaf 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Create usergroup network. All members off this group are allowed to modify networkmanager settings"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 require polkit-group-rule.inc
 
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index e07f570d1..dfd75e71c 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit update-rc.d systemd
 
diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index d3e31fe42..19a6e2b04 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -1,6 +1,6 @@
 SUMMARY = "All packages multimedia packages available for XFCE"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index e2f238c04..140de416b 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -1,7 +1,7 @@
 SUMMARY = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r5"
 
 inherit packagegroup distro_features_check
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index c07188f6e..cc231b4bd 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -1,7 +1,7 @@
 SUMMARY = "All packages for full XFCE installation"
 SECTION = "x11/wm"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r10"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb b/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
index 03bd205a2..c79197445 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Meta package adding machine name to known hosts"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 ALLOW_EMPTY_${PN} = "1"
 
-- 
2.11.0


