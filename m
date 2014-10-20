Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 19BD26AC1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:27:58 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so7120249wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=RJAAoOrSHtkVagfu8fardC8KOZjT9Eb/R5YfEnVjx+U=;
	b=RRUaBPfnGaPiyk5gfXg8CGMt+7hOzV0HUI42+JBcIgwdnDvnNFITsa0Ln9vkODmSPp
	dTB5lyEvJXG7QfrLDTK6rDA5NwnC5LTIZdWQZ6uX2Jta0lxpdfB0nXpvAFbBV7zHbPEP
	P+8meCO4QlpC9YPZePXSVxwN5qDw8dNnwdnFEA7RY7zVmEdlIX0HPdQDv141vJ0Dxc2+
	LjWOn/x8L+p7IMMe4cJnMOPZBIDpBkgtmASJWPcnhJIPPK0Ko+4EOtaJstQVkCeQmg2S
	9zF09vltbtzlqsynVF0Uct0jwWr6tr6/DRnbIxzWsZlp4IY65MrwEi9FmgGxLkFytGkt
	GENQ==
X-Received: by 10.194.57.210 with SMTP id k18mr4641586wjq.110.1413811678222;
	Mon, 20 Oct 2014 06:27:58 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	fm10sm9621757wib.21.2014.10.20.06.27.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 06:27:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 15:27:46 +0200
Message-Id: <1413811666-20325-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] network-manager-applet: add basic AP support
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
X-List-Received-Date: Mon, 20 Oct 2014 13:28:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested with gumstix overo as access point and connected windows pc and android
smartphone.

Note that there are are some settings available for AP which do not make sense - see
[1] for further details.

[1] https://bugzilla.gnome.org/show_bug.cgi?id=734589#c6

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...port-for-AP-mode-setting-for-wifi-sharing.patch | 128 +++++++++++++++++++++
 ...for-network-sharing-if-device-supports-it.patch |  48 ++++++++
 .../network-manager-applet_0.9.8.10.bb             |   2 +
 3 files changed, 178 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
new file mode 100644
index 0000000..d0506b2
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
@@ -0,0 +1,128 @@
+From d789ef88a8806887bf1160bfa5d3d9eb47b6216c Mon Sep 17 00:00:00 2001
+From: "Marius B. Kotsbak" <marius@kotsbak.com>
+Date: Mon, 11 Aug 2014 22:11:52 +0200
+Subject: [PATCH] Add support for AP mode setting for wifi sharing.
+
+Upstream-Status: Pending [1]
+
+[1] https://bugzilla.gnome.org/show_bug.cgi?id=734589
+---
+ src/connection-editor/ce-page-wifi.ui |  3 +++
+ src/connection-editor/page-wifi.c     | 46 ++++++++++++++++++++---------------
+ 2 files changed, 30 insertions(+), 19 deletions(-)
+
+diff --git a/src/connection-editor/ce-page-wifi.ui b/src/connection-editor/ce-page-wifi.ui
+index e2e544b..b8b27c1 100644
+--- a/src/connection-editor/ce-page-wifi.ui
++++ b/src/connection-editor/ce-page-wifi.ui
+@@ -50,6 +50,9 @@
+       <row>
+         <col id="0" translatable="yes">Ad-hoc</col>
+       </row>
++      <row>
++        <col id="0" translatable="yes">Shared AP</col>
++      </row>
+     </data>
+   </object>
+   <object class="GtkTable" id="WifiPage">
+diff --git a/src/connection-editor/page-wifi.c b/src/connection-editor/page-wifi.c
+index d0a5617..17db2fa 100644
+--- a/src/connection-editor/page-wifi.c
++++ b/src/connection-editor/page-wifi.c
+@@ -59,6 +59,12 @@ typedef struct {
+ 	gboolean disposed;
+ } CEPageWifiPrivate;
+ 
++enum {
++	WIFI_MODE_INFRASTRUCTURE,
++	WIFI_MODE_ADHOC,
++	WIFI_MODE_AP
++};
++
+ static void
+ wifi_private_init (CEPageWifi *self)
+ {
+@@ -244,22 +250,16 @@ mode_combo_changed_cb (GtkComboBox *combo,
+ 	CEPageWifiPrivate *priv = CE_PAGE_WIFI_GET_PRIVATE (self);
+ 	CEPage *parent = CE_PAGE (self);
+ 	GtkWidget *widget_band_label, *widget_chan_label, *widget_bssid_label;
+-	gboolean adhoc;
++	gint wifi_mode;
++	gboolean shared_wifi;
+ 
+- 	switch (gtk_combo_box_get_active (GTK_COMBO_BOX (combo))) {
+- 	case 1: /* adhoc */
+-		adhoc = TRUE;
+- 		break;
+- 	default: /* infrastructure */
+-		adhoc = FALSE;
+- 		break;
+- 	}
++	wifi_mode = gtk_combo_box_get_active (GTK_COMBO_BOX (combo));
+ 
+ 	widget_band_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_band_label"));
+ 	widget_chan_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_channel_label"));
+ 	widget_bssid_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_bssid_label"));
+ 
+-	if (adhoc) {
++	if (WIFI_MODE_ADHOC == wifi_mode || WIFI_MODE_AP == wifi_mode) {
+ 		/* For Ad-Hoc show Band and Channel */
+ 		gtk_widget_show (widget_band_label);
+ 		gtk_widget_show (GTK_WIDGET (priv->band));
+@@ -283,12 +283,13 @@ mode_combo_changed_cb (GtkComboBox *combo,
+ 		gtk_widget_show (GTK_WIDGET (priv->bssid));
+ 	}
+ 
+-	gtk_widget_set_sensitive (widget_band_label, adhoc);
+-	gtk_widget_set_sensitive (GTK_WIDGET (priv->band), adhoc);
+-	gtk_widget_set_sensitive (widget_chan_label, adhoc);
+-	gtk_widget_set_sensitive (GTK_WIDGET (priv->channel), adhoc);
+-	gtk_widget_set_sensitive (widget_bssid_label, !adhoc);
+-	gtk_widget_set_sensitive (GTK_WIDGET (priv->bssid), !adhoc);
++	shared_wifi = wifi_mode != WIFI_MODE_INFRASTRUCTURE;
++	gtk_widget_set_sensitive (widget_band_label, shared_wifi);
++	gtk_widget_set_sensitive (GTK_WIDGET (priv->band), shared_wifi);
++	gtk_widget_set_sensitive (widget_chan_label, shared_wifi);
++	gtk_widget_set_sensitive (GTK_WIDGET (priv->channel), shared_wifi);
++	gtk_widget_set_sensitive (widget_bssid_label, !shared_wifi);
++	gtk_widget_set_sensitive (GTK_WIDGET (priv->bssid), !shared_wifi);
+ 
+ 	ce_page_changed (CE_PAGE (self));
+ }
+@@ -348,9 +349,12 @@ populate_ui (CEPageWifi *self)
+ 		g_byte_array_free (ssid, TRUE);
+ 
+ 	/* Default to Infrastructure */
+-	gtk_combo_box_set_active (priv->mode, 0);
++	gtk_combo_box_set_active (priv->mode, WIFI_MODE_INFRASTRUCTURE);
+ 	if (mode && !strcmp (mode, "adhoc"))
+-		gtk_combo_box_set_active (priv->mode, 1);
++		gtk_combo_box_set_active (priv->mode, WIFI_MODE_ADHOC);
++	else if (mode && !strcmp (mode, "ap"))
++		gtk_combo_box_set_active (priv->mode, WIFI_MODE_AP);
++
+ 	mode_combo_changed_cb (priv->mode, self);
+ 	g_signal_connect (priv->mode, "changed", G_CALLBACK (mode_combo_changed_cb), self);
+ 	g_free (mode);
+@@ -510,14 +514,18 @@ ui_to_setting (CEPageWifi *self)
+ 	GByteArray *bssid = NULL;
+ 	GByteArray *device_mac = NULL;
+ 	GByteArray *cloned_mac = NULL;
++	gint wifi_mode;
+ 	const char *mode;
+ 	const char *band;
+ 	GtkWidget *entry;
+ 
+ 	ssid = ce_page_wifi_get_ssid (self);
+ 
+-	if (gtk_combo_box_get_active (priv->mode) == 1)
++	wifi_mode = gtk_combo_box_get_active (priv->mode);
++	if (WIFI_MODE_ADHOC == wifi_mode)
+ 		mode = "adhoc";
++	else if (WIFI_MODE_AP == wifi_mode)
++		mode = "ap";
+ 	else
+ 		mode = "infrastructure";
+ 
+-- 
+1.9.1
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
new file mode 100644
index 0000000..e215646
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch
@@ -0,0 +1,48 @@
+From 7343b16113e378d04e40012abfe5bd96ca776968 Mon Sep 17 00:00:00 2001
+From: "Marius B. Kotsbak" <marius@kotsbak.com>
+Date: Tue, 12 Aug 2014 11:15:20 +0200
+Subject: [PATCH 2/2] Use AP mode for network sharing if device supports it.
+
+Logic taken from similar functionality in gnome-control-center.
+
+Upstream-Status: Backport [1]
+
+[1] https://bug734589.bugzilla-attachments.gnome.org/attachment.cgi?id=283165
+---
+ src/libnm-gtk/nm-wifi-dialog.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/libnm-gtk/nm-wifi-dialog.c b/src/libnm-gtk/nm-wifi-dialog.c
+index 3532caa..ca72c96 100644
+--- a/src/libnm-gtk/nm-wifi-dialog.c
++++ b/src/libnm-gtk/nm-wifi-dialog.c
+@@ -1226,10 +1226,26 @@ nma_wifi_dialog_get_connection (NMAWifiDialog *self,
+ 		s_wireless = (NMSettingWireless *) nm_setting_wireless_new ();
+ 		g_object_set (s_wireless, NM_SETTING_WIRELESS_SSID, validate_dialog_ssid (self), NULL);
+ 
++		/* Fill device */
++		if (device) {
++			combo = GTK_WIDGET (gtk_builder_get_object (priv->builder, "device_combo"));
++			gtk_combo_box_get_active_iter (GTK_COMBO_BOX (combo), &iter);
++			gtk_tree_model_get (priv->device_model, &iter, D_DEV_COLUMN, device, -1);
++			g_object_unref (*device);
++		}
++
+ 		if (priv->adhoc_create) {
+ 			NMSettingIP4Config *s_ip4;
+ 
+-			g_object_set (s_wireless, NM_SETTING_WIRELESS_MODE, "adhoc", NULL);
++			const char *mode;
++
++			/* Use real AP mode if the device supports it */
++			if (device && nm_device_wifi_get_capabilities (NM_DEVICE_WIFI (*device)) & NM_WIFI_DEVICE_CAP_AP)
++				mode = NM_SETTING_WIRELESS_MODE_AP;
++			else
++				mode = NM_SETTING_WIRELESS_MODE_ADHOC;
++
++			g_object_set (s_wireless, NM_SETTING_WIRELESS_MODE, mode, NULL);
+ 
+ 			s_ip4 = (NMSettingIP4Config *) nm_setting_ip4_config_new ();
+ 			g_object_set (s_ip4, NM_SETTING_IP4_CONFIG_METHOD, NM_SETTING_IP4_CONFIG_METHOD_SHARED, NULL);
+-- 
+1.8.3.1
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index ca05866..663c38c 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -10,6 +10,8 @@ GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += " \
     file://0001-remove-classes-and-properties-which-are-not-supporte.patch \
+    file://0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
+    file://0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch \
 "
 SRC_URI[archive.md5sum] = "5148348c139229c6a753f815f3f11e1c"
 SRC_URI[archive.sha256sum] = "46fee9a1e667d1826e6a94bb6bd2e6bdbde535fc995e534542f5f7e8b8dae0cb"
-- 
1.8.3.1


