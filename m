Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDC873FA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:28 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so61428094wgq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=WU7O7RQOKn4lr7Y4rxw1SFlSLO4EiNJ6cFggbcxlK+s=;
	b=m1uH9gHUjAXQeRoOb1ylCe2g9q3y8SUt5hcT4YJxwqgpVo6cpJL3UfmKcIYrpvvswB
	3ArKFk+cIBg+fX14mKu5AXyRyasE2U2Kri3Mg+hULrPxTJAfI6ubtU+hT1S9XBbol9PO
	hTNbGUxXNhf6x4pJKJaEu3sGitGRY8HAHpBVuMO34crrb+xcMIKyLJ+L1fkT6qUBzIYE
	ppNupdf4ZaQoWRD4I4LP7zpDMO88SZz9X4Cz87yQFftal46gQ5aaUUECxonFa3SU65sV
	rZcWNiyl22UsO3ndV64VANAsvW7HlbIMYXAvQ/mnF4HQgLeCD3iB03OZSK3N//p69Y2Z
	OBnQ==
X-Received: by 10.180.105.227 with SMTP id gp3mr5422123wib.56.1435235790098;
	Thu, 25 Jun 2015 05:36:30 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:50 +0200
Message-Id: <1435235754-7339-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] network-manager-applet: update to 1.0.2
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
X-List-Received-Date: Thu, 25 Jun 2015 12:36:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

note that 1.x only supports gtk3

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ort-for-AP-mode-setting-for-wifi-sharing.patch} |  0
 ...ses-and-properties-which-are-not-supporte.patch | 41 ----------------------
 ...or-network-sharing-if-device-supports-it.patch} |  2 +-
 ...0.9.8.10.bb => network-manager-applet_1.0.2.bb} | 16 +++------
 4 files changed, 6 insertions(+), 53 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/files/{0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch => 0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch} (100%)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
 rename meta-gnome/recipes-connectivity/network-manager-applet/files/{0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch => 0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch} (97%)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_0.9.8.10.bb => network-manager-applet_1.0.2.bb} (67%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
similarity index 100%
rename from meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
rename to meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
deleted file mode 100644
index 4bd0e4f..0000000
--- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c7d75ce38fa392c04c39a75e7b7e068666a7b1e7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 8 Apr 2014 15:22:54 +0200
-Subject: [PATCH] remove classes and properties which are not supported by gtk+
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-unsupported classes caused nm-connection editor to crash
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/connection-editor/ce-page-general.ui | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/connection-editor/ce-page-general.ui b/src/connection-editor/ce-page-general.ui
-index b05f0df..049432b 100644
---- a/src/connection-editor/ce-page-general.ui
-+++ b/src/connection-editor/ce-page-general.ui
-@@ -37,8 +37,6 @@
-       <object class="GtkComboBox" id="dependent_vpn_combo">
-         <property name="visible">True</property>
-         <property name="can_focus">False</property>
--        <property name="margin_left">26</property>
--        <property name="margin_bottom">12</property>
-         <property name="model">dependent_vpn_model</property>
-         <child>
-           <object class="GtkCellRendererText" id="renderer1"/>
-@@ -59,7 +57,6 @@
-         <property name="visible">True</property>
-         <property name="can_focus">True</property>
-         <property name="receives_default">False</property>
--        <property name="margin_bottom">12</property>
-         <property name="use_underline">True</property>
-         <property name="xalign">0</property>
-         <property name="draw_indicator">True</property>
--- 
-1.8.3.1
-
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
similarity index 97%
rename from meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
rename to meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
index e215646..4e3d7e2 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
@@ -28,7 +28,7 @@ index 3532caa..ca72c96 100644
 +			g_object_unref (*device);
 +		}
 +
- 		if (priv->adhoc_create) {
+ 		if (priv->operation == OP_CREATE_ADHOC) {
  			NMSettingIP4Config *s_ip4;
  
 -			g_object_set (s_wireless, NM_SETTING_WIRELESS_MODE, "adhoc", NULL);
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.2.bb
similarity index 67%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.2.bb
index 72c9ae6..210b5b2 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.2.bb
@@ -2,24 +2,18 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
+DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
 
 inherit gnomebase gsettings gtk-icon-cache
 
 GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += " \
-    file://0001-remove-classes-and-properties-which-are-not-supporte.patch \
-    file://0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
-    file://0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch \
-"
-SRC_URI[archive.md5sum] = "5148348c139229c6a753f815f3f11e1c"
-SRC_URI[archive.sha256sum] = "46fee9a1e667d1826e6a94bb6bd2e6bdbde535fc995e534542f5f7e8b8dae0cb"
-
-# GTK2.x mode
-EXTRA_OECONF += " \
-    --with-gtkver=2 \
+    file://0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
+    file://0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch \
 "
+SRC_URI[archive.md5sum] = "5b2a8baa6b038b3e55e5444ff321e80d"
+SRC_URI[archive.sha256sum] = "760af85b43fa5bcf74b96f899a6d4c1d5e9445e5eb63088c49e5164bbf88d9a9"
 
 PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth,gnome-bluetooth"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1,--without-modem-manager-1,modemmanager"
-- 
1.9.3


