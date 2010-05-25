Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGo1n-0004iu-5Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 08:54:16 +0200
Received: by pwi5 with SMTP id 5so556439pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=zbL/0GGlgYRN09mwbe0sVj+0sv+CkdDL7FaVeXtynoo=;
	b=pHa9vb8Tm8z0G0rpXHL20ghWJ8eR7iLN9gaS6KLLOE/G84AAYdYLqAQ8lb1RH+WDOS
	20iqI1CGfX95OairBZ0vxO4ObXmZQ7ZxxCfqtNJ4dEzDFx1dc0Tl1hSsoIAtMnRde5CX
	3XddNBfNF0Cozd6yW1MAdJJ3KiprJNAl+nm3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=L1RiGF8SK1aWNcpG5OP/GPT6IsilEtpuHA6AUCWH4SbBiirMxI9+Km1GTeF9RVdK99
	MRROJ23A9TKMxTs81JkThXxr4KSK/J0Q46zgDBlR7eq4o03ZB+yvfRcS2FWt32DTrpuM
	5yEOt8EjiBBN2mfq2mIphSjmzuej+kiTO4GqA=
Received: by 10.114.188.30 with SMTP id l30mr5797908waf.134.1274770207526;
	Mon, 24 May 2010 23:50:07 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d16sm45144679wam.12.2010.05.24.23.50.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 May 2010 23:50:06 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 May 2010 23:49:57 -0700
Message-Id: <1274770197-13394-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils
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
X-List-Received-Date: Tue, 25 May 2010 06:54:16 -0000

From: Khem Raj <raj.khem@gmail.com>

* Main purpose of the patch was to fix the problem where udev-utils was
  needed to be in root file system just to get udevadm binary. So this
  binary is moved into udev package instead.

* Use INC_PR

* Use udev.inc in all recipes.

* All udev recipes built udev_151 and udev_124 runs fine too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/udev/udev-static_124.bb |   20 ++++++++-----
 recipes/udev/udev.inc           |   28 +++++++++---------
 recipes/udev/udev_092.bb        |   23 +++++++--------
 recipes/udev/udev_097.bb        |   15 +++++-----
 recipes/udev/udev_100.bb        |   21 +++++++-------
 recipes/udev/udev_118.bb        |   13 ++++-----
 recipes/udev/udev_124.bb        |   34 +++++++++++-----------
 recipes/udev/udev_141.bb        |   58 +++++++-------------------------------
 recipes/udev/udev_151.bb        |   43 ++++++++---------------------
 9 files changed, 100 insertions(+), 155 deletions(-)

diff --git a/recipes/udev/udev-static_124.bb b/recipes/udev/udev-static_124.bb
index 1ea088a..3f07f5a 100644
--- a/recipes/udev/udev-static_124.bb
+++ b/recipes/udev/udev-static_124.bb
@@ -1,15 +1,19 @@
 DESCRIPTION = "Static version of udev for devices with an old (e.g. <2.6.27) kernel"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://noasmlinkage.patch;patch=1 \
-	   file://flags.patch;patch=1 \
-	   file://vol_id_ld.patch;patch=1 \
-	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
-	   file://libvolume-id-soname.patch;patch=1 \
-	   file://mtd-exclude-persistent.patch;patch=1 \
+require udev.inc
+
+SRC_URI += "file://noasmlinkage.patch;patch=1 \
+	    file://flags.patch;patch=1 \
+	    file://vol_id_ld.patch;patch=1 \
+	    file://udevtrigger_add_devname_filtering.patch;patch=1 \
+	    file://libvolume-id-soname.patch;patch=1 \
+	    file://mtd-exclude-persistent.patch;patch=1 \
 	   "
 
-require udev.inc
+
+PR = "${INC_PR}.0"
+
+LD = "${CC}"
 
 S = "${WORKDIR}/udev-${PV}"
 
diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
index 14d10b4..943fdfc 100644
--- a/recipes/udev/udev.inc
+++ b/recipes/udev/udev.inc
@@ -1,8 +1,9 @@
 DESCRIPTION ?= "udev is a program which dynamically creates and removes device nodes from \
 /dev/. It responds to /sbin/hotplug device events and requires a 2.6 kernel."
+
 LICENSE = "GPLv2+"
 
-SRC_URI += " \
+SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://udev.rules \
 	   file://devfs-udev.rules \
 	   file://links.conf \
@@ -12,6 +13,8 @@ SRC_URI += " \
 	   file://local.rules \
            file://init"
 
+INC_PR = "r26"
+
 inherit update-rc.d autotools pkgconfig
 
 PARALLEL_MAKE = ""
@@ -19,18 +22,19 @@ UDEV_DEVFS_RULES ?= "0"
 PKG_libvolume-id-dev = "libvolume-id-dev"
 
 INITSCRIPT_NAME = "udev"
-INITSCRIPT_PARAMS = "start 04 S ."
+INITSCRIPT_PARAMS = "start 03 S ."
 
 export CROSS = "${TARGET_PREFIX}"
 export HOSTCC = "${BUILD_CC}"
 export udevdir ?= "/dev"
+# Put stuff in /lib and /sbin
+export bindir := "${base_bindir}"
+export sbindir := "${base_sbindir}"
 export usrbindir := "${bindir}"
 export usrsbindir := "${sbindir}"
-export etcdir = "${sysconfdir}"
-LD = "${CC}"
-bindir = "/bin"
-sbindir = "/sbin"
+export etcdir := "${sysconfdir}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
 UDEV_EXTRAS = "<override me>"
 EXTRA_OEMAKE = "-e \
 		'EXTRAS=${UDEV_EXTRAS}' \
@@ -56,17 +60,13 @@ do_install () {
 
 	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
 	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
-}
-
-do_stage () {
-	autotools_stage_all
-        install -m 0644 ${S}/extras/volume_id/lib/libvolume_id.h ${STAGING_INCDIR}
-        oe_libinstall -C extras/volume_id/lib -so libvolume_id ${STAGING_LIBDIR}
+        install -m 0644 ${S}/extras/volume_id/lib/libvolume_id.h ${D}${includedir}
+        oe_libinstall -C extras/volume_id/lib -so libvolume_id ${D}${libdir}
 }
 
 PACKAGES =+ "udev-utils libvolume-id libvolume-id-dev"
 FILES_libvolume-id-dev = "${includedir}/libvolume_id.h ${libdir}/libvolume_id.a ${libdir}/libvolume_id.so ${libdir}/pkgconfig/libvolume_id.pc"
-FILES_udev-utils = "${usrbindir}/udevinfo ${sbindir}/udevadm ${usrbindir}/udevtest"
+FILES_udev-utils = "${usrbindir}/udevinfo ${usrbindir}/udevtest"
 FILES_libvolume-id = "${base_libdir}/libvolume_id.so.*"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
+FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd ${sbindir}/udevadm"
 FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
diff --git a/recipes/udev/udev_092.bb b/recipes/udev/udev_092.bb
index 6e4d025..3ed05d1 100644
--- a/recipes/udev/udev_092.bb
+++ b/recipes/udev/udev_092.bb
@@ -3,21 +3,20 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
 
-PR = "r25"
-
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://noasmlinkage.patch;patch=1 \
-	   file://flags.patch;patch=1 \
-	   file://udevsynthesize.patch;patch=1 \
-	   file://udevsynthesize.sh \
-           file://arm_inotify_fix.patch;patch=1 \
-	   file://mtd-exclude-persistent.patch;patch=1 \
-	   file://mount.blacklist \
-	   "
-
 require udev.inc
 
-INITSCRIPT_PARAMS = "start 03 S ."
+LD = "${CC}"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://noasmlinkage.patch;patch=1 \
+	    file://flags.patch;patch=1 \
+	    file://udevsynthesize.patch;patch=1 \
+	    file://udevsynthesize.sh \
+            file://arm_inotify_fix.patch;patch=1 \
+	    file://mtd-exclude-persistent.patch;patch=1 \
+	    file://mount.blacklist \
+	   "
 
 FILES_${PN} += "${base_libdir}/udev/*"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
diff --git a/recipes/udev/udev_097.bb b/recipes/udev/udev_097.bb
index 4e49e4a..8757794 100644
--- a/recipes/udev/udev_097.bb
+++ b/recipes/udev/udev_097.bb
@@ -8,17 +8,16 @@ used to detect the type of a file system and read its metadata."
 DESCRIPTION_libvolume-id-dev = "libvolume_id development headers, \
 needed to link programs with libvolume_id."
 
-PR = "r13"
+require udev.inc
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://noasmlinkage.patch;patch=1 \
-	   file://flags.patch;patch=1 \
-	   file://mount.blacklist \
-	   "
+PR = "${INC_PR}.0"
 
-require udev.inc
+LD = "${CC}"
 
-INITSCRIPT_PARAMS = "start 03 S ."
+SRC_URI += "file://noasmlinkage.patch;patch=1 \
+	    file://flags.patch;patch=1 \
+	    file://mount.blacklist \
+	   "
 
 FILES_${PN} += "${base_libdir}/udev/*"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
diff --git a/recipes/udev/udev_100.bb b/recipes/udev/udev_100.bb
index b74ae69..7261483 100644
--- a/recipes/udev/udev_100.bb
+++ b/recipes/udev/udev_100.bb
@@ -9,19 +9,18 @@ used to detect the type of a file system and read its metadata."
 DESCRIPTION_libvolume-id-dev = "libvolume_id development headers, \
 needed to link programs with libvolume_id."
 
-PR = "r16"
-
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://noasmlinkage.patch;patch=1 \
-	   file://flags.patch;patch=1 \
-	   file://mtd-exclude-persistent.patch;patch=1 \
-	   file://mount.blacklist \
-	   file://mount.sh \
-	   "
-
 require udev.inc
 
-INITSCRIPT_PARAMS = "start 03 S ."
+PR = "${INC_PR}.0"
+
+LD = "${CC}"
+
+SRC_URI += "file://noasmlinkage.patch;patch=1 \
+	    file://flags.patch;patch=1 \
+	    file://mtd-exclude-persistent.patch;patch=1 \
+	    file://mount.blacklist \
+	    file://mount.sh \
+	   "
 
 FILES_${PN} += "${base_libdir}/udev/*"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
diff --git a/recipes/udev/udev_118.bb b/recipes/udev/udev_118.bb
index d4f6fe2..d2abd8f 100644
--- a/recipes/udev/udev_118.bb
+++ b/recipes/udev/udev_118.bb
@@ -3,12 +3,15 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
 
-PR = "r6"
+require udev.inc
+
+PR = "${INC_PR}.0"
+
+LD = "${CC}"
 
 DEFAULT_PREFERENCE = "-118"
 
-SRC_URI = "\
- http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI += "\
  file://flags.patch;patch=1 \
  file://vol_id_ld.patch;patch=1 \
  file://udevtrigger_add_devname_filtering.patch;patch=1 \
@@ -17,10 +20,6 @@ SRC_URI = "\
 "
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-require udev.inc
-
-INITSCRIPT_PARAMS = "start 03 S ."
-
 FILES_${PN} += "${base_libdir}/udev/*"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
 UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/volume_id/"
diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index ed40594..bdbe5e0 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -2,28 +2,28 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 /dev/, handles hotplug events and loads drivers at boot time. It replaces \
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
-PR = "r19"
-
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://noasmlinkage.patch;patch=1 \
-	   file://flags.patch;patch=1 \
-	   file://vol_id_ld.patch;patch=1 \
-	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
-	   file://libvolume-id-soname.patch;patch=1 \
-	   file://mtd-exclude-persistent.patch;patch=1 \
-	   file://mount.blacklist \
-	   file://run.rules \
-	   file://default \
-	   file://local.rules \
+
+require udev.inc
+
+PR = "${INC_PR}.0"
+
+LD = "${CC}"
+
+SRC_URI += "file://noasmlinkage.patch;patch=1 \
+	    file://flags.patch;patch=1 \
+	    file://vol_id_ld.patch;patch=1 \
+	    file://udevtrigger_add_devname_filtering.patch;patch=1 \
+	    file://libvolume-id-soname.patch;patch=1 \
+	    file://mtd-exclude-persistent.patch;patch=1 \
+	    file://mount.blacklist \
+	    file://run.rules \
+	    file://default \
+	    file://local.rules \
 	   "
 
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
 PACKAGE_ARCH_h2200 = "h2200"
 
-require udev.inc
-
-INITSCRIPT_PARAMS = "start 03 S ."
-
 FILES_${PN} += "${base_libdir}/udev/*"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
 UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/volume_id/"
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 4be7ae5..27055be 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -1,33 +1,19 @@
 DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
 /dev/, handles hotplug events and loads drivers at boot time. It replaces \
 the hotplug package and requires a kernel not older than 2.6.12."
-LICENSE = "GPLv2+"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r21"
+require udev.inc
 
-# needed for init.d script
-RDEPENDS_${PN} += "udev-utils"
+PR = "${INC_PR}.0"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://mount.blacklist \
-	   file://run.rules \
+SRC_URI += "file://mount.blacklist \
+	    file://run.rules \
+	    file://default \
+	    file://cache \
 	   "
-SRC_URI += " \
-       file://udev.rules \
-       file://devfs-udev.rules \
-       file://links.conf \
-       file://permissions.rules \
-       file://mount.sh \
-       file://network.sh \
-       file://local.rules \
-       file://default \
-       file://init \
-       file://cache \
-"
-
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
 PACKAGE_ARCH_h2200 = "h2200"
 
@@ -39,26 +25,16 @@ SRC_URI_append_bug = " \
 
 PACKAGE_ARCH_bug = "bug"
 
-inherit update-rc.d autotools_stage
-
-# Put stuff in /lib and /sbin
-export sbindir="${base_sbindir}"
-export exec_prefix=""
 EXTRA_OECONF += " --with-udev-prefix= \
                   --with-libdir-name=${base_libdir} \
 "
 
-INITSCRIPT_NAME = "udev"
-INITSCRIPT_PARAMS = "start 03 S ."
+UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/volume_id/"
 
-PACKAGES =+ "udev-utils libvolume-id libvolume-id-dev"
-
-FILES_libvolume-id-dev = "${includedir}/libvolume_id.h ${libdir}/libvolume_id.a ${libdir}/libvolume_id.so ${libdir}/pkgconfig/libvolume_id.pc"
-FILES_udev-utils = "${usrbindir}/udevinfo ${sbindir}/udevadm ${usrbindir}/udevtest"
-FILES_libvolume-id = "${base_libdir}/libvolume_id.so.*"
+LEAD_SONAME = "libudev.so.0"
 
 RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
+FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd ${sbindir}/udevadm"
 FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
 # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
@@ -103,6 +79,8 @@ do_install () {
 
 	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
 	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+        oe_libinstall -C udev/lib -so libudev ${D}${libdir}
+        install ${S}/udev/lib/libudev.h ${D}${includedir}
 }
 
 do_install_append_h2200() {
@@ -132,19 +110,5 @@ if [ -d $D/lib/udev/rules.d ] ; then
 fi
 }
 
-do_stage_append() {
-        install -m 0644 ${S}/extras/volume_id/lib/libvolume_id.h ${STAGING_INCDIR}
-        oe_libinstall -C extras/volume_id/lib -so libvolume_id ${STAGING_LIBDIR}
-        oe_libinstall -C udev/lib -so libudev ${STAGING_LIBDIR}
-        # Since we change exec_prefix above, autotools_stage_all will not see the .pc files
-        # When we upgrade to 145 with the path bugs fixed we can drop all this (see poky)
-        install -d ${STAGING_DIR_TARGET}${prefix}${libdir}/pkgconfig/
-        install ${S}/extras/volume_id/lib/libvolume_id.pc ${STAGING_DIR_TARGET}${prefix}${libdir}/pkgconfig/
-        install ${S}/udev/lib/libudev.pc ${STAGING_DIR_TARGET}${prefix}${libdir}/pkgconfig/
-	install -d ${STAGING_DIR_TARGET}${prefix}${includedir}/
-        install ${S}/extras/volume_id/lib/libvolume_id.h ${STAGING_DIR_TARGET}${prefix}${includedir}/
-        install ${S}/udev/lib/libudev.h ${STAGING_DIR_TARGET}${prefix}${includedir}/
-}
-
 SRC_URI[md5sum] = "86382b7bbc64459e714c65a2a4e10916"
 SRC_URI[sha256sum] = "001be4a8963c48e7debc82c6078562d087a2979da63e558a5e3613c03725c377"
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index d7df81a..35b43b0 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
 /dev/, handles hotplug events and loads drivers at boot time. It replaces \
 the hotplug package and requires a kernel not older than 2.6.12."
-LICENSE = "GPLv2+"
 
-PR = "r9"
+require udev.inc
+
+PR = "${INC_PR}.0"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -11,25 +12,11 @@ DEFAULT_PREFERENCE = "-1"
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-# needed for init.d script
-RDEPENDS_${PN} += "udev-utils"
-
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-	   file://mount.blacklist \
-	   file://run.rules \
+SRC_URI += "file://mount.blacklist \
+	    file://run.rules \
+	    file://default \
+	    file://cache \
 	   "
-SRC_URI += " \
-       file://udev.rules \
-       file://devfs-udev.rules \
-       file://links.conf \
-       file://permissions.rules \
-       file://mount.sh \
-       file://network.sh \
-       file://local.rules \
-       file://default \
-       file://init \
-       file://cache \
-"
 
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
 PACKAGE_ARCH_h2200 = "h2200"
@@ -42,8 +29,6 @@ SRC_URI_append_bug = " \
 
 PACKAGE_ARCH_bug = "bug"
 
-inherit update-rc.d autotools
-
 EXTRA_OECONF += " --with-udev-prefix= \
                   --with-libdir-name=${base_libdir} \
                   --disable-introspection \
@@ -53,27 +38,23 @@ EXTRA_OECONF += " --with-udev-prefix= \
                   --sbindir=${base_sbindir} \
                   --libexecdir=${base_libdir}/udev \
                   --with-rootlibdir=${base_libdir} \
-"
+	        "
 
-INITSCRIPT_NAME = "udev"
-INITSCRIPT_PARAMS = "start 03 S ."
-
-PACKAGES =+ "libudev libgudev udev-utils"
+LEAD_SONAME = "libudev.so.0"
+PACKAGES =+ "libudev libgudev"
 
 FILES_libudev = "${libdir}/libudev.so.*"
 FILES_libgudev = "${libdir}/libgudev*.so.*"
 
-FILES_udev-utils = "${bindir}/udevinfo ${base_sbindir}/udevadm ${bindir}/udevtest"
-
 RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
 # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
 # is ${prefix}/lib64
 FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
+UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/volume_id/"
+
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}
-- 
1.7.0.4



