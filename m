Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5luz-0000zU-V3
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 23:34:42 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 23:26:01 +0100
Message-Id: <1331245561-21771-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] bzip2: bump PR of all recipes depending on bzip2
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
X-List-Received-Date: Thu, 08 Mar 2012 22:34:42 -0000

* Commit e27af1f273e9a7348dd8f5542df9206acd9210f3 of OE-core
  split bzip2 into binary and library packages.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |    2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb  |    2 +-
 meta-oe/recipes-multimedia/xbmc/xbmc_git.bb        |    2 +-
 .../imagemagick/imagemagick_6.7.5.bb               |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.3.bb       |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index c09c8be..0b39f1b 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -13,7 +13,7 @@ DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
-PR = "r0"
+PR = "r1"
 
 inherit gnome
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
index bd770ae..20331bd 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
-PR = "r2"
+PR = "r3"
 
 SECTION = "libs"
 
diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
index 2c922e7..7f27ca6 100644
--- a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
+++ b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2d
 SRCREV = "f38655f1b565926846c1e17e0e7801c811037b1f"
 
 PV = "11.0"
-PR = "r10"
+PR = "r11"
 PR_append = "+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
index 1869a41..b0af84b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r1"
+PR = "r2"
 
 PATCHSET = "6"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
diff --git a/meta-oe/recipes-support/opencv/opencv_2.3.bb b/meta-oe/recipes-support/opencv/opencv_2.3.bb
index fdb56a9..0534c27 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "svn://code.ros.org/svn/opencv/tags/2.3.1;module=opencv;proto=https \
 SRCREV = "7198"
 
 PV = "2.3.1"
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/opencv"
 
-- 
1.7.5.4



