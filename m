Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4536E731CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:10:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so7383845wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 02:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/60haoDivftEFveAEJDf+QpGH4CsWgUKOHcBT09Jpug=;
	b=ITX+Vi7MxWayNfhx2eNbJ0+++LU3ikKKVGjMPgHTetozxd2JcH980GUQshH8nuIAfA
	5EAzv/a4OO3yqt4Jvqs9c/a1vmWw+9pVnDEWJbKm2shLdcusSnzTaAENXgJg3KChSvOh
	w0b4+XKPFkScfaU/5nm+bQr91rQQuHIYhmVLh/WouH7wx9jDWOE/GbD1TZM/2VbKOQ/D
	DceGeDqLROFhpJxH2dGe0nNfttZhbHCuISetszuTTfjuXB/gDcVOmWKsZA5uoiU+FqyE
	wytHT6JYLBfExUIr70QVgVvOp7Xy0VfldGO4ZogtktHzv1WNu3oID7Ge7eALkd+aSosJ
	zQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/60haoDivftEFveAEJDf+QpGH4CsWgUKOHcBT09Jpug=;
	b=TcsrHh9899ZTJUCeiHgzYqGzf7LSqrRlgIAWG7+GoyS+q82e/xPirmv9mB7Qkk+SVr
	WSVazrDTwDsnZvp2bCGdbOzII4ttOemx/Cn/nqyqZAZt+x8d1tKgWpzZGA92hxlE0l/9
	HBDkMSC+MpGhGIHXowtK7D3SGAY7yUmxaxnZOTnTS7+r5nsR+qay822jt7BGYc5NnOza
	+lDLI5zoWvYFKwrJIDXZ6CLfdOMiCjyBEFH0D0sg+Q6BFAD0iDXF+kj9W6XK7lK6mD79
	XiWaGHCNVqhUbkfUCobeo8rPiGykLplvMOB2ZjUJPzXdpjXeaFMpdJ86YfBuykI2ECrq
	cYGQ==
X-Gm-Message-State: AD7BkJJqnsbLRPP7RncJJ8qRlFQK65+oxL93y9JdIGBogAadLRVIZz9y+W4rHBmTmHl65g==
X-Received: by 10.28.136.211 with SMTP id k202mr2404506wmd.93.1456740645307;
	Mon, 29 Feb 2016 02:10:45 -0800 (PST)
Received: from localhost.localdomain
	(ip-95-222-156-232.hsi15.unitymediagroup.de. [95.222.156.232])
	by smtp.googlemail.com with ESMTPSA id
	di1sm25083313wjc.3.2016.02.29.02.10.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 02:10:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Feb 2016 11:10:10 +0100
Message-Id: <1456740611-32120-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/2] network-manager-applet: update to 1.0.10
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
X-List-Received-Date: Mon, 29 Feb 2016 10:10:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hotspot (Host-AP) was implemented in 1.0.8 so our patches are no more required.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...port-for-AP-mode-setting-for-wifi-sharing.patch | 132 ---------------------
 ...for-network-sharing-if-device-supports-it.patch |  48 --------
 ...t_1.0.4.bb => network-manager-applet_1.0.10.bb} |  11 +-
 3 files changed, 4 insertions(+), 187 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.0.4.bb => network-manager-applet_1.0.10.bb} (74%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
deleted file mode 100644
index db7878e..0000000
--- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From d789ef88a8806887bf1160bfa5d3d9eb47b6216c Mon Sep 17 00:00:00 2001
-From: "Marius B. Kotsbak" <marius@kotsbak.com>
-Date: Mon, 11 Aug 2014 22:11:52 +0200
-Subject: [PATCH] Add support for AP mode setting for wifi sharing.
-
-Upstream-Status: Pending [1]
-
-[1] https://bugzilla.gnome.org/show_bug.cgi?id=734589
----
- src/connection-editor/ce-page-wifi.ui |  3 +++
- src/connection-editor/page-wifi.c     | 48 ++++++++++++++++++++---------------
- 2 files changed, 31 insertions(+), 20 deletions(-)
-
-diff --git a/src/connection-editor/ce-page-wifi.ui b/src/connection-editor/ce-page-wifi.ui
-index a7b8f20..0bd9130 100644
---- a/src/connection-editor/ce-page-wifi.ui
-+++ b/src/connection-editor/ce-page-wifi.ui
-@@ -50,6 +50,9 @@
-       <row>
-         <col id="0" translatable="yes">Ad-hoc</col>
-       </row>
-+      <row>
-+        <col id="0" translatable="yes">Shared AP</col>
-+      </row>
-     </data>
-   </object>
-   <object class="GtkTable" id="WifiPage">
-diff --git a/src/connection-editor/page-wifi.c b/src/connection-editor/page-wifi.c
-index 8a25c64..e4b4df1 100644
---- a/src/connection-editor/page-wifi.c
-+++ b/src/connection-editor/page-wifi.c
-@@ -58,6 +58,12 @@ typedef struct {
- 	int last_channel;
- } CEPageWifiPrivate;
- 
-+enum {
-+	WIFI_MODE_INFRASTRUCTURE,
-+	WIFI_MODE_ADHOC,
-+	WIFI_MODE_AP
-+};
-+
- static void
- wifi_private_init (CEPageWifi *self)
- {
-@@ -245,23 +251,17 @@ mode_combo_changed_cb (GtkComboBox *combo,
- 	CEPageWifiPrivate *priv = CE_PAGE_WIFI_GET_PRIVATE (self);
- 	CEPage *parent = CE_PAGE (self);
- 	GtkWidget *widget_band_label, *widget_chan_label, *widget_bssid_label;
--	gboolean adhoc;
-+	gint wifi_mode;
-+	gboolean shared_wifi;
- 
-- 	switch (gtk_combo_box_get_active (GTK_COMBO_BOX (combo))) {
-- 	case 1: /* adhoc */
--		adhoc = TRUE;
-- 		break;
-- 	default: /* infrastructure */
--		adhoc = FALSE;
-- 		break;
-- 	}
-+	wifi_mode = gtk_combo_box_get_active (GTK_COMBO_BOX (combo));
- 
- 	widget_band_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_band_label"));
- 	widget_chan_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_channel_label"));
- 	widget_bssid_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_bssid_label"));
- 
--	if (adhoc) {
--		/* For Ad-Hoc show Band and Channel */
-+	if (WIFI_MODE_ADHOC == wifi_mode || WIFI_MODE_AP == wifi_mode) {
-+		/* For Ad-Hoc/AP show Band and Channel */
- 		gtk_widget_show (widget_band_label);
- 		gtk_widget_show (GTK_WIDGET (priv->band));
- 		gtk_widget_show (widget_chan_label);
-@@ -284,12 +284,13 @@ mode_combo_changed_cb (GtkComboBox *combo,
- 		gtk_widget_show (GTK_WIDGET (priv->bssid));
- 	}
- 
--	gtk_widget_set_sensitive (widget_band_label, adhoc);
--	gtk_widget_set_sensitive (GTK_WIDGET (priv->band), adhoc);
--	gtk_widget_set_sensitive (widget_chan_label, adhoc);
--	gtk_widget_set_sensitive (GTK_WIDGET (priv->channel), adhoc);
--	gtk_widget_set_sensitive (widget_bssid_label, !adhoc);
--	gtk_widget_set_sensitive (GTK_WIDGET (priv->bssid), !adhoc);
-+	shared_wifi = wifi_mode != WIFI_MODE_INFRASTRUCTURE;
-+	gtk_widget_set_sensitive (widget_band_label, shared_wifi);
-+	gtk_widget_set_sensitive (GTK_WIDGET (priv->band), shared_wifi);
-+	gtk_widget_set_sensitive (widget_chan_label, shared_wifi);
-+	gtk_widget_set_sensitive (GTK_WIDGET (priv->channel), shared_wifi);
-+	gtk_widget_set_sensitive (widget_bssid_label, !shared_wifi);
-+	gtk_widget_set_sensitive (GTK_WIDGET (priv->bssid), !shared_wifi);
- 
- 	ce_page_changed (CE_PAGE (self));
- }
-@@ -348,9 +349,12 @@ populate_ui (CEPageWifi *self)
- 		g_byte_array_free (ssid, TRUE);
- 
- 	/* Default to Infrastructure */
--	gtk_combo_box_set_active (priv->mode, 0);
-+	gtk_combo_box_set_active (priv->mode, WIFI_MODE_INFRASTRUCTURE);
- 	if (mode && !strcmp (mode, "adhoc"))
--		gtk_combo_box_set_active (priv->mode, 1);
-+		gtk_combo_box_set_active (priv->mode, WIFI_MODE_ADHOC);
-+	else if (mode && !strcmp (mode, "ap"))
-+		gtk_combo_box_set_active (priv->mode, WIFI_MODE_AP);
-+
- 	mode_combo_changed_cb (priv->mode, self);
- 	g_signal_connect (priv->mode, "changed", G_CALLBACK (mode_combo_changed_cb), self);
- 	g_free (mode);
-@@ -506,6 +510,7 @@ ui_to_setting (CEPageWifi *self)
- 	GByteArray *bssid = NULL;
- 	GByteArray *device_mac = NULL;
- 	GByteArray *cloned_mac = NULL;
-+	gint wifi_mode;
- 	char *ifname = NULL;
- 	const char *mode;
- 	const char *band;
-@@ -516,8 +521,11 @@ ui_to_setting (CEPageWifi *self)
- 
- 	ssid = ce_page_wifi_get_ssid (self);
- 
--	if (gtk_combo_box_get_active (priv->mode) == 1)
-+	wifi_mode = gtk_combo_box_get_active (priv->mode);
-+	if (WIFI_MODE_ADHOC == wifi_mode)
- 		mode = "adhoc";
-+	else if (WIFI_MODE_AP == wifi_mode)
-+		mode = "ap";
- 	else
- 		mode = "infrastructure";
- 
--- 
-2.1.0
-
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
deleted file mode 100644
index 4e3d7e2..0000000
--- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 7343b16113e378d04e40012abfe5bd96ca776968 Mon Sep 17 00:00:00 2001
-From: "Marius B. Kotsbak" <marius@kotsbak.com>
-Date: Tue, 12 Aug 2014 11:15:20 +0200
-Subject: [PATCH 2/2] Use AP mode for network sharing if device supports it.
-
-Logic taken from similar functionality in gnome-control-center.
-
-Upstream-Status: Backport [1]
-
-[1] https://bug734589.bugzilla-attachments.gnome.org/attachment.cgi?id=283165
----
- src/libnm-gtk/nm-wifi-dialog.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/src/libnm-gtk/nm-wifi-dialog.c b/src/libnm-gtk/nm-wifi-dialog.c
-index 3532caa..ca72c96 100644
---- a/src/libnm-gtk/nm-wifi-dialog.c
-+++ b/src/libnm-gtk/nm-wifi-dialog.c
-@@ -1226,10 +1226,26 @@ nma_wifi_dialog_get_connection (NMAWifiDialog *self,
- 		s_wireless = (NMSettingWireless *) nm_setting_wireless_new ();
- 		g_object_set (s_wireless, NM_SETTING_WIRELESS_SSID, validate_dialog_ssid (self), NULL);
- 
-+		/* Fill device */
-+		if (device) {
-+			combo = GTK_WIDGET (gtk_builder_get_object (priv->builder, "device_combo"));
-+			gtk_combo_box_get_active_iter (GTK_COMBO_BOX (combo), &iter);
-+			gtk_tree_model_get (priv->device_model, &iter, D_DEV_COLUMN, device, -1);
-+			g_object_unref (*device);
-+		}
-+
- 		if (priv->operation == OP_CREATE_ADHOC) {
- 			NMSettingIP4Config *s_ip4;
- 
--			g_object_set (s_wireless, NM_SETTING_WIRELESS_MODE, "adhoc", NULL);
-+			const char *mode;
-+
-+			/* Use real AP mode if the device supports it */
-+			if (device && nm_device_wifi_get_capabilities (NM_DEVICE_WIFI (*device)) & NM_WIFI_DEVICE_CAP_AP)
-+				mode = NM_SETTING_WIRELESS_MODE_AP;
-+			else
-+				mode = NM_SETTING_WIRELESS_MODE_ADHOC;
-+
-+			g_object_set (s_wireless, NM_SETTING_WIRELESS_MODE, mode, NULL);
- 
- 			s_ip4 = (NMSettingIP4Config *) nm_setting_ip4_config_new ();
- 			g_object_set (s_ip4, NM_SETTING_IP4_CONFIG_METHOD, NM_SETTING_IP4_CONFIG_METHOD_SHARED, NULL);
--- 
-1.8.3.1
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
similarity index 74%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
index e83ebb8..33662d3 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
@@ -2,18 +2,14 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib gconf libgnome-keyring iso-codes"
+DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib gconf libgnome-keyring iso-codes nss"
 
 inherit gnomebase gsettings gtk-icon-cache
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI += " \
-    file://0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
-    file://0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch \
-"
-SRC_URI[archive.md5sum] = "7fc2ed3f0c46ed41ddabe99d51513b1c"
-SRC_URI[archive.sha256sum] = "2cc26f03d0011d2a067bd5205dc0c17d5aa0470020a8c36d319ae10e5728af72"
+SRC_URI[archive.md5sum] = "86b17e1bf1a37c649874883b587c6db6"
+SRC_URI[archive.sha256sum] = "b045ac3eaa68ccbbefe91510ad67b4002a7e09d1e5ce1c4bf9a67619bd2cf0eb"
 
 PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth,gnome-bluetooth"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1,--without-modem-manager-1,modemmanager"
@@ -29,6 +25,7 @@ do_configure_append() {
 RDEPENDS_${PN} =+ "networkmanager"
 
 FILES_${PN} += " \
+    ${datadir}/appdata \
     ${datadir}/nm-applet/ \
     ${datadir}/libnm-gtk/wifi.ui \
 "
-- 
2.5.0


