Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0A697ECC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:15:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6GEEdoZ019624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:14:49 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:14:28 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:30 -0400
Message-ID: <20190716141231.77957-15-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 14/15] xfce4-settings: 4.12.4 -> 4.13.7
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
X-List-Received-Date: Tue, 16 Jul 2019 14:15:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-settings from 4.12.4 to 4.13.7:
* update SRC_URI to re-use official tarball and not inherit xfce-git
* remove unneeded backport patch
* remove dependency gtk+ that gtk+3 is used now
* remove dependency dbus-glib which is replaced by gdbus
* clean DEPENDS that libxfce4util and xfconf are requried by libxfce4ui
  which is required by exo and garcon
* remove packageconfig datetime-setter

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...2-Fix-linking-to-dbus-glib-bug-13633.patch | 41 -------------------
 ...ttings_git.bb => xfce4-settings_4.13.7.bb} | 19 +++------
 2 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_git.bb => xfce4-settings_4.13.7.bb} (52%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
deleted file mode 100644
index 109b7b145..000000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b6e46e6a84e45f7bd954687be703987825a54c1e Mon Sep 17 00:00:00 2001
-From: Eric Koegel <eric.koegel@gmail.com>
-Date: Sun, 11 Jun 2017 11:38:26 +0300
-Subject: [PATCH] Fix linking to dbus-glib (bug #13633)
-
-With xfconf moving to GDBus nothing provides the libs for dbus-glib
-that xfce4-settings requires. This patch adds the libs back in until
-settings can be ported to GDBus.
-
-Signed-off-by: Sean Davis <smd.seandavis@gmail.com>
-
-Upstream-Status: Backport
----
- xfce4-settings-editor/Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/xfce4-settings-editor/Makefile.am b/xfce4-settings-editor/Makefile.am
-index 5964366..c2c7c4b 100644
---- a/xfce4-settings-editor/Makefile.am
-+++ b/xfce4-settings-editor/Makefile.am
-@@ -28,6 +28,7 @@ xfce4_settings_editor_CFLAGS = \
- 	$(LIBXFCE4UTIL_CFLAGS) \
- 	$(LIBXFCE4UI_CFLAGS) \
- 	$(XFCONF_CFLAGS) \
-+	$(DBUS_GLIB_CFLAGS) \
- 	$(PLATFORM_CFLAGS)
- 
- xfce4_settings_editor_LDFLAGS = \
-@@ -39,7 +40,8 @@ xfce4_settings_editor_LDADD = \
- 	$(DBUS_GLIB_LIBS) \
- 	$(LIBXFCE4UTIL_LIBS) \
- 	$(LIBXFCE4UI_LIBS) \
--	$(XFCONF_LIBS)
-+	$(XFCONF_LIBS) \
-+	$(DBUS_GLIB_LIBS)
- 
- desktopdir = $(datadir)/applications
- desktop_in_files = xfce4-settings-editor.desktop.in
--- 
-2.14.3
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
similarity index 52%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
index a4685aed3..e79b0ab0b 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
@@ -2,32 +2,23 @@ SUMMARY = "Xfce4 settings"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libxcursor libxklavier upower"
+DEPENDS = "exo exo-native garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
 
-inherit xfce xfce-git distro_features_check
+inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-# schnitzeltony git repo is the mainline repo
-# + datetime-setter - sent to mainline but strange response
-# + minor bugfixes - sent mainline but no response
-# + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
-SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.4 \
+SRC_URI += " \
     file://0001-xsettings.xml-Set-default-themes.patch \
-    file://0002-Fix-linking-to-dbus-glib-bug-13633.patch \
 "
-SRCREV = "75d7c9b15e5ccce12b0864d3659ae9b6de96e245"
-S = "${WORKDIR}/git"
-PV = "4.12.4+git${SRCPV}"
+SRC_URI[md5sum] = "ec0a3daa810bce57cf140317243eeb1d"
+SRC_URI[sha256sum] = "ac11391eee22cb5fbffe3342916bcf9805f29c722aca825c2f57d98dc167a065"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.contains('DISTRO_FEATURES','systemd','datetime-setter','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','alsa','sound-setter', bb.utils.contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
 "
-PACKAGECONFIG[datetime-setter] = "--enable-datetime-settings, --disable-datetime-settings,, tzdata"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
 PACKAGECONFIG[sound-setter] = "--enable-sound-settings, --disable-sound-settings, libcanberra, libcanberra-gtk2 sound-theme-freedesktop"
 
-- 
2.20.0


