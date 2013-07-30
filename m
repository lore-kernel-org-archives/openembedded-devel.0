Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0B36B451
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 12:49:03 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 05:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="275273307"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.217])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 05:49:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2013 13:48:54 +0100
Message-Id: <b212c471afae377f92a528f659a83a47d31389a9.1375188498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375188498.git.paul.eggleton@linux.intel.com>
References: <cover.1375188498.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1375188498.git.paul.eggleton@linux.intel.com>
References: <cover.1375188498.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/2] xinput-calibrator: remove
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
X-List-Received-Date: Tue, 30 Jul 2013 12:49:03 -0000

This is now part of OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../xinput-calibrator/xinput-calibrator.service    | 11 ------
 .../xinput-calibrator/xinput-calibrator_git.bb     | 42 ----------------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

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
1.8.1.2


