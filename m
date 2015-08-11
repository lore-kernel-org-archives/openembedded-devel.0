Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACB8768A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:25 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so182967357wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=VstwPyJcpc6w6gYAqabBqT081kbpOf63D6kGJA+d7ag=;
	b=t2ubjYJxbt/v33/yCpGE/pWqj0wYw1OQnomRo1vZ6fM76cI3w0q2JH/74EgWxx1sU0
	+0TfywytMc+0o4LxV2qph45cenjVoujUmoo3Z/rhd8Y8FuHfmknko0WmguHIwNaw5Oh1
	Xg/7wQ9xO6MrTelimT53g38dbRjG/4HBcWyQS0zcLH9dXT5tx/ZJnyZgybtXZ8KHqUSC
	Fx8lhukZGIqk6M2IAB910lST8xClVJITafK811m+rk7la4XjxBLPHYaqtO0+xKjReHSG
	f+zOSwNq2RWZ/VBffows3r3/DBdnQ+oiAbdTWlvcJjM65LajmphVP+nhY3t5U6hIEK6w
	334g==
X-Received: by 10.194.203.138 with SMTP id kq10mr56797345wjc.124.1439279904993;
	Tue, 11 Aug 2015 00:58:24 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:37 +0200
Message-Id: <1439279859-1815-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/17] network-manager-applet: update to 1.0.4
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...port-for-AP-mode-setting-for-wifi-sharing.patch | 28 ++++++++++++----------
 ...et_1.0.2.bb => network-manager-applet_1.0.4.bb} |  4 ++--
 2 files changed, 18 insertions(+), 14 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.0.2.bb => network-manager-applet_1.0.4.bb} (89%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
index d0506b2..db7878e 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch
@@ -8,11 +8,11 @@ Upstream-Status: Pending [1]
 [1] https://bugzilla.gnome.org/show_bug.cgi?id=734589
 ---
  src/connection-editor/ce-page-wifi.ui |  3 +++
- src/connection-editor/page-wifi.c     | 46 ++++++++++++++++++++---------------
- 2 files changed, 30 insertions(+), 19 deletions(-)
+ src/connection-editor/page-wifi.c     | 48 ++++++++++++++++++++---------------
+ 2 files changed, 31 insertions(+), 20 deletions(-)
 
 diff --git a/src/connection-editor/ce-page-wifi.ui b/src/connection-editor/ce-page-wifi.ui
-index e2e544b..b8b27c1 100644
+index a7b8f20..0bd9130 100644
 --- a/src/connection-editor/ce-page-wifi.ui
 +++ b/src/connection-editor/ce-page-wifi.ui
 @@ -50,6 +50,9 @@
@@ -26,11 +26,11 @@ index e2e544b..b8b27c1 100644
    </object>
    <object class="GtkTable" id="WifiPage">
 diff --git a/src/connection-editor/page-wifi.c b/src/connection-editor/page-wifi.c
-index d0a5617..17db2fa 100644
+index 8a25c64..e4b4df1 100644
 --- a/src/connection-editor/page-wifi.c
 +++ b/src/connection-editor/page-wifi.c
-@@ -59,6 +59,12 @@ typedef struct {
- 	gboolean disposed;
+@@ -58,6 +58,12 @@ typedef struct {
+ 	int last_channel;
  } CEPageWifiPrivate;
  
 +enum {
@@ -42,7 +42,7 @@ index d0a5617..17db2fa 100644
  static void
  wifi_private_init (CEPageWifi *self)
  {
-@@ -244,22 +250,16 @@ mode_combo_changed_cb (GtkComboBox *combo,
+@@ -245,23 +251,17 @@ mode_combo_changed_cb (GtkComboBox *combo,
  	CEPageWifiPrivate *priv = CE_PAGE_WIFI_GET_PRIVATE (self);
  	CEPage *parent = CE_PAGE (self);
  	GtkWidget *widget_band_label, *widget_chan_label, *widget_bssid_label;
@@ -65,11 +65,13 @@ index d0a5617..17db2fa 100644
  	widget_bssid_label = GTK_WIDGET (gtk_builder_get_object (parent->builder, "wifi_bssid_label"));
  
 -	if (adhoc) {
+-		/* For Ad-Hoc show Band and Channel */
 +	if (WIFI_MODE_ADHOC == wifi_mode || WIFI_MODE_AP == wifi_mode) {
- 		/* For Ad-Hoc show Band and Channel */
++		/* For Ad-Hoc/AP show Band and Channel */
  		gtk_widget_show (widget_band_label);
  		gtk_widget_show (GTK_WIDGET (priv->band));
-@@ -283,12 +283,13 @@ mode_combo_changed_cb (GtkComboBox *combo,
+ 		gtk_widget_show (widget_chan_label);
+@@ -284,12 +284,13 @@ mode_combo_changed_cb (GtkComboBox *combo,
  		gtk_widget_show (GTK_WIDGET (priv->bssid));
  	}
  
@@ -104,14 +106,15 @@ index d0a5617..17db2fa 100644
  	mode_combo_changed_cb (priv->mode, self);
  	g_signal_connect (priv->mode, "changed", G_CALLBACK (mode_combo_changed_cb), self);
  	g_free (mode);
-@@ -510,14 +514,18 @@ ui_to_setting (CEPageWifi *self)
+@@ -506,6 +510,7 @@ ui_to_setting (CEPageWifi *self)
  	GByteArray *bssid = NULL;
  	GByteArray *device_mac = NULL;
  	GByteArray *cloned_mac = NULL;
 +	gint wifi_mode;
+ 	char *ifname = NULL;
  	const char *mode;
  	const char *band;
- 	GtkWidget *entry;
+@@ -516,8 +521,11 @@ ui_to_setting (CEPageWifi *self)
  
  	ssid = ce_page_wifi_get_ssid (self);
  
@@ -125,4 +128,5 @@ index d0a5617..17db2fa 100644
  		mode = "infrastructure";
  
 -- 
-1.9.1
+2.1.0
+
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.2.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
similarity index 89%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.2.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
index 210b5b2..d5e106c 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.2.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.4.bb
@@ -12,8 +12,8 @@ SRC_URI += " \
     file://0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
     file://0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch \
 "
-SRC_URI[archive.md5sum] = "5b2a8baa6b038b3e55e5444ff321e80d"
-SRC_URI[archive.sha256sum] = "760af85b43fa5bcf74b96f899a6d4c1d5e9445e5eb63088c49e5164bbf88d9a9"
+SRC_URI[archive.md5sum] = "7fc2ed3f0c46ed41ddabe99d51513b1c"
+SRC_URI[archive.sha256sum] = "2cc26f03d0011d2a067bd5205dc0c17d5aa0470020a8c36d319ae10e5728af72"
 
 PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth,gnome-bluetooth"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1,--without-modem-manager-1,modemmanager"
-- 
2.1.0


