Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14C3877344
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676937"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:50 +0200
Message-Id: <a6251a68aec9415e6c46845fece5f9742abf89e7.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/34] tracker: fix gobject introspection
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index d84978d..840db4e 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -12,7 +12,6 @@ inherit autotools pkgconfig gnomebase gettext gsettings systemd
 
 VER_DIR = "${@gnome_verdir("${PV}")}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
-           file://0005-Fix-missing-gobject-introspection-checks.patch \
            file://enable-sqlite-crosscompile.patch \
 	   file://fix-removable-media-detection.patch \
            file://90tracker \
@@ -35,6 +34,10 @@ EXTRA_OECONF += "--disable-miner-thunderbird --disable-miner-firefox \
 
 LEAD_SONAME = "libtrackerclient.so.0"
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/src/libtracker-sparql-backend/.libs:${B}/src/libtracker-data/.libs:${B}/src/libtracker-common/.libs"
+}
+
 do_install_append() {
     cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
 #   install -d ${D}/${sysconfdir}/X11/Xsession.d/
@@ -54,6 +57,7 @@ PACKAGES =+ "${PN}-tests ${PN}-vala ${PN}-nautilus-extension"
 FILES_${PN} += "${datadir}/dbus-1/ \
                 ${libdir}/tracker-${VER_DIR}/*.so.* \
                 ${libdir}/tracker-${VER_DIR}/extract-modules/*.so \
+                ${libdir}/tracker-${VER_DIR}/writeback-modules/*.so \
                 ${datadir}/icons/hicolor/*/apps/tracker.* \
                 ${libdir}/nautilus/extensions-2.0/*.la \
                 ${datadir}/glib-2.0/schemas/* \
@@ -64,7 +68,6 @@ FILES_${PN} += "${datadir}/dbus-1/ \
 
 FILES_${PN}-dev += "${libdir}/tracker-${VER_DIR}/*.la \
                     ${libdir}/tracker-${VER_DIR}/*.so \
-                    ${libdir}/tracker-${VER_DIR}/*/*.so \
                     ${libdir}/tracker-${VER_DIR}/*/*.la \
                     ${libdir}/tracker-${VER_DIR}/extract-modules/*.la"
 
-- 
2.7.0


