Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5A61F7F3F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 15:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KkTw6XcZz3J
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 17:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567180261;
	bh=7pXmtcgaUNimlbLi7ebhrKaUbNBX3Rym2OMCTFij77Q=;
	h=From:To:Subject:Date:From;
	b=r7uL3U8A1oLItPqShBEQxXdzrGboZmFvmB9FR13NAAMg5bjF94SKoAztFeXlFtzmf
	+s/v9bRZsC6bdjTBbWim9siTlC1IrwMOdu5bmdy8OHGwmKh6jJCNoUcZDyCu5EUXS/
	/Jaos0P80AkrINHuLJR0K/NYVAD2mbljQb+aVL9Hbxm6mvjGkan3W7bcCPexVoSJFB
	sidK06D75zLQvHPuBBGaBqqDUc9Bq/NXmDUGyPIaUhXIUMDf1LP+k/kAzzqEpgbETY
	YNbWfGhy4NiorG2G8OHKh3lNanrtgoTw/50bR7ywRtVYDdl7S+oYMWLVszRA5ssYTW
	Bx2F8Y7QXreHwD5hqFd8LI2u/iSUufqi4Porr/2xMdy22ypKkpyNnUVIvB3w2VvgUj
	9ucHw64JHWs0J5AjlWaNLJuBXXZsguox8lB+LZ1I9WSE9mNzJG0mmtHuBAWjhJtEn/
	MCZWUs/HNT31RtL/KiX0Tn6Jso7rHuyBk37Q23OlFQLAdOZnWAPADIEmWvYhJFDmc0
	epOlZrDXw+g9uYbKoLP4eeIww8WBqATQyUNOmzJALqC1lLdmr503ZxHOSX9v7fTVLz
	quJOAwgXSAasevwZwvLe9AeW31IzHTO4tFf0sY2q417arDe/72GBmt5/qz8Vrp8vJu
	xlaNIzEIP3oggGbRVRb8uw/0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2019 18:50:58 +0300
Message-Id: <20190830155059.21044-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-openembedded][PATCH] Remove LICENSE = "MIT" from packagegroups and images
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
X-List-Received-Date: Fri, 30 Aug 2019 15:51:00 -0000

This is the default in the packagegroup and image classes.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb  | 2 --
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb        | 2 --
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb         | 2 --
 .../recipes-devtools/packagegroups/packagegroup-sdk-target.bb   | 2 --
 .../packagegroups/packagegroup-xfce-multimedia.bb               | 2 --
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb  | 2 --
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb    | 2 --
 7 files changed, 14 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 2573eb481..9a686f366 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -1,7 +1,5 @@
 SUMMARY = "Initramfs image for kexecboot kernel"
 DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit image
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 54b59ccb7..2da9118af 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -2,8 +2,6 @@
 # Please communicate your use cases and suggestions to the mailinglist(s)
 
 SUMMARY = "Basic task to get a device online"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r13"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index 3ae7a49fe..b5e7b99cc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -1,6 +1,4 @@
 SUMMARY = "Basic task to get a device booting"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r58"
 
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 53fc159c8..4bd9a1255 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -1,6 +1,4 @@
 SUMMARY = "Packages required for a target (on-device) SDK"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r1"
 
diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index 19a6e2b04..c30c79907 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -1,6 +1,4 @@
 SUMMARY = "All packages multimedia packages available for XFCE"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit packagegroup
 
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 140de416b..daee73eb3 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -1,7 +1,5 @@
 SUMMARY = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 PR = "r5"
 
 inherit packagegroup distro_features_check
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index a22a2e07c..527f81f1f 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -1,7 +1,5 @@
 SUMMARY = "All packages for full XFCE installation"
 SECTION = "x11/wm"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r10"
 
-- 
2.17.1


