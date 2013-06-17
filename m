Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9F638608C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:25:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2013 05:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,880,1363158000"; d="scan'208";a="354689985"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2013 05:25:54 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 15:25:42 +0300
Message-Id: <c63af05fc8ff6fa8ae15fcacbaa2c0200aa8c562.1371471466.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371471466.git.laurentiu.palcu@intel.com>
References: <cover.1371471466.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1371471466.git.laurentiu.palcu@intel.com>
References: <cover.1371471466.git.laurentiu.palcu@intel.com>
Subject: [meta-oe][PATCH 1/1] xinput-calibrator: move it to oe-core
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
X-List-Received-Date: Mon, 17 Jun 2013 12:25:55 -0000

Apparently, people needing xinput-calibrate to calibrate their touch devices
need to also pull the meta-openembedded layer. Moving this to oe-core
would make people's life easier.

[YOCTO #4416]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../pointercal-xinput/pointercal.xinput            |    1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   19 ---------
 .../xinput-calibrator/xinput-calibrator.service    |   11 -----
 .../xinput-calibrator/xinput-calibrator_git.bb     |   42 --------------------
 4 files changed, 73 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
deleted file mode 100644
index 9633fc5..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
+++ /dev/null
@@ -1 +0,0 @@
-# replace with valid machine specific pointercal.xinput
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
deleted file mode 100644
index bfb952f..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r4"
-
-SRC_URI = "file://pointercal.xinput"
-S = "${WORKDIR}"
-
-do_install() {
-    # Only install file if it has a contents
-    if [ -s ${S}/pointercal.xinput ]; then
-        install -d ${D}${sysconfdir}/
-        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
-    fi
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
deleted file mode 100644
index 2301876..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Loads xinput calibration data
-ConditionPathExists=/etc/pointercal.xinput
-Requires=display-manager.service
-After=display-manager.service
-
-[Service]
-ExecStart=/usr/bin/xinput_calibrator_once.sh
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
deleted file mode 100644
index 640aef1..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "A generic touchscreen calibration program for X.Org"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
-LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
-DEPENDS = "virtual/libx11 libxi"
-
-PV = "0.7.5+git${SRCPV}"
-PR = "r6"
-
-inherit autotools systemd
-
-SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
-           file://xinput-calibrator.service"
-
-S = "${WORKDIR}/git"
-
-# force native X11 ui as we don't have gtk+ in DEPENDS
-EXTRA_OECONF += "--with-gui=x11"
-
-do_install_append() {
-    install -d ${D}${bindir}
-    install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-
-    install -d ${D}${sysconfdir}/xdg/autostart
-    sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
-    install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
-
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
-    fi
-}
-
-FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput xterm"
-RRECOMMENDS_${PN} = "pointercal-xinput"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
-- 
1.7.9.5


