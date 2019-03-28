Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB7765CE9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 18:24:09 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id o25so4596816wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1bopUrcr13RX9Q3n/yT2vStKvgYuX1N7kmyebR5R1ys=;
	b=KLy0+hDqhd07ZY/VaIVxQs4ofKEZ2jBpxvLMcr4colmoHK5USX7AN1uKGirIDoyV0U
	KXK8LAMn9HBqJZWPpFBZitFAF2NHZLgtt6oM7rUIUYcilAAeBs1Wps/a8xcG7GmpDrqn
	mIWIioVQxoDNZiDyC7dEWMmq4uniVRlEwaTmIuScUweFRx2SicbBbbyl0jLpn6ddWIMO
	EquNrx94W2VkZhM/Uo+QDwWTfcMsp9JjYHRZIJfoYg2cLFqAsTyQvwPfv0yAUWx6ArhQ
	C8g6/x9qkWJfguQmPGqdmdmfAn1reuFNSFxxRnHsmwbnfCtMlJZQBY+0Nz5DluWFpHzU
	pwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1bopUrcr13RX9Q3n/yT2vStKvgYuX1N7kmyebR5R1ys=;
	b=Cx9NqhJTy21LreEVIUUD9nrjsZ2KeQJQ08MeF30K8KSiTsoJIrLggiFm3xXb0+L/76
	hDM17PYqh7ak/S7e7AoE97FiNMr5GIvE55isc44PDociYjLwNN1As/uPV+JDceidOqlw
	Gqo4PJGXbMofMX+ilehHQbjrmSw4UbbAPgnfNKBCPPqo05YG+hvqYdd1xEumJL/3wSIg
	ucV7xPcCd3abSCmtgMCF/xZlKqj5r/I4HnzU9raUJpbqPAv2btCIdYvq6SYJ04A5A6M9
	zMk1nYGe0kxzGbcyNlqUR09ff7w5CY9m87mlicEjGUwRRUbTyCJkLVvDerjcyYTrSv/H
	bYdw==
X-Gm-Message-State: APjAAAVupO9RSoEpGjeZc6a/Uned4MnuKHz1sPHdhFwr37gpXRbfr2fx
	tsL3fmoltCzr9KgllxhjIqrbDbQd
X-Google-Smtp-Source: APXvYqxMXGioijkcky+YtOlmuHUZrJ4NAID0srvV+PbyNdlcSUZkSsRFJKGo5iE+dLl8xfepXaMB6w==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr933859wmc.124.1553797450307;
	Thu, 28 Mar 2019 11:24:10 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	k4sm18179799wro.33.2019.03.28.11.24.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 11:24:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Mar 2019 19:23:52 +0100
Message-Id: <20190328182352.29039-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] gnome-system-monitor: upgrade 3.26.0 -> 3.32.0
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
X-List-Received-Date: Thu, 28 Mar 2019 18:24:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove libwnck3 from DEPENDS. meson_options.txt has an option 'wnck' disabled
by default and with a desciption 'enable wnck support, this will likely make
system-monitor segfault' which does not sound promising.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

V1 -> V2
* Add PACKAGECONFIG for systemd
* polkit is not a build dependeny
* remove libwnck3 from DEPENDS and explain why

 ...-build-help-we-do-not-have-yelp-yet.patch} | 32 ++++++++++---------
 ...26.0.bb => gnome-system-monitor_3.32.0.bb} | 25 +++++++--------
 2 files changed, 29 insertions(+), 28 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{files/0001-help-remove-YELP-macro.patch => gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch} (38%)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.26.0.bb => gnome-system-monitor_3.32.0.bb} (39%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
similarity index 38%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
index 57b60a0d5..f2e720e9e 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
@@ -1,7 +1,7 @@
-From 4a3ee8b46d25b3d310448bfa4446e15a686fc685 Mon Sep 17 00:00:00 2001
+From c6649fdcfb2f44807089741557f8e527ab9751e4 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 23 Mar 2018 13:50:18 +0100
-Subject: [PATCH] help: remove YELP macro
+Date: Sun, 24 Mar 2019 02:46:07 +0100
+Subject: [PATCH] Do not build help - we do not have yelp yet
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -10,19 +10,21 @@ Upstream-Status: Inappropriate [embedded-specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- help/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
 
-diff --git a/help/Makefile.am b/help/Makefile.am
-index c5cd0d3..4b83adf 100644
---- a/help/Makefile.am
-+++ b/help/Makefile.am
-@@ -1,5 +1,3 @@
--@YELP_HELP_RULES@
--
- HELP_ID = gnome-system-monitor
+diff --git a/meson.build b/meson.build
+index d60ced7..6a0ab4b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -183,7 +183,6 @@ subdir('data')
+ subdir('po')
+ subdir('scripts')
+ subdir('src')
+-subdir('help')
  
- HELP_FILES = \
+ 
+ message('\n'.join(['',
 -- 
-2.14.3
+2.20.1
 
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
similarity index 39%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
index 9b6ce17ca..c2432a322 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
@@ -3,32 +3,31 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = " \
-    intltool-native \
+    itstool-native \
     gnome-common-native \
+    libxml2-native \
     glib-2.0-native \
     gtkmm3 \
     libgtop \
     librsvg \
-    libwnck3 \
 "
 
-inherit gnomebase distro_features_check
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gtk-icon-cache distro_features_check gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "fcd59867c07f8c4853b1e28d60cbc037"
-SRC_URI[archive.sha256sum] = "f848a8c2ca5e164cf09d3a205dd49e4e4bf4b60d43b0969c10443eb519d0e6b3"
-SRC_URI += "file://0001-help-remove-YELP-macro.patch"
+SRC_URI[archive.md5sum] = "6c2c5c5bf8f15d3e6985faacbd3055dd"
+SRC_URI[archive.sha256sum] = "af00c4a42dd1db17d9abe88edb11c7751b20982db1a8a2a467bab206fd8a77e3"
+SRC_URI += "file://0001-Do-not-build-help-we-do-not-have-yelp-yet.patch"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
 
 RRECOMMENDS_${PN} = "adwaita-icon-theme"
 
 FILES_${PN} += " \
-    ${datadir}/icons \
     ${datadir}/dbus-1 \
-    ${datadir}/gnome/autostart \
-"
-
-FILES_${PN}-doc += " \
-    ${datadir}/omf \
-    ${datadir}/gnome/help \
+    ${datadir}/metainfo \
 "
-- 
2.20.1


