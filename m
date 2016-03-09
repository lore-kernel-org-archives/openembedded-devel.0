Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 723FF6018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62868970"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:26 +0200
Message-Id: <b95f9b69eee4f7eed16e5abd574eba18f7f74f68.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/38] tracker: fix gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:03 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 41501df..c52d95e 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -8,11 +8,10 @@ HOMEPAGE = "http://projects.gnome.org/tracker/"
 
 PR = "r7"
 
-inherit autotools pkgconfig gnomebase gettext gsettings systemd
+inherit autotools pkgconfig gnomebase gettext gsettings systemd gobject-introspection
 
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
-- 
2.7.0


