Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5A96373428
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:38 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so11678383wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=NNGijPT+7eOViabmMVIwiPkyqEPaOinsrWzSPLiusd8=;
	b=Dmk5GSmVCJvV+6PUokgs8+0cV5XjPHdyHGL+fHEmCj/bXKnm/BL7LuO8p41W4H2UnL
	MQEjbuoiyjiyAGHmdv6BStLspMQPyNnEGReKaMYZ5nr3+eWMyXpvceix/uV11R7tteFY
	mLmi2lhv4cb5vCM/aIibooZ+3/GXx8EIZsyMg5zZiPH0hPOjLXeYCkr/35SnLoYnGCPt
	s4+oLbB8im/7MTTBgxM2w0ggxlzvxGX4DU+Yvm040nIekPKZWkQxeOM37ZfFxet7yg2o
	FQvp1NvalXF0EDdKxz8GUymaSWqowPiPUToZfQYD2q1X6SZYwBcst0yICjhUeULWmrX6
	E5zA==
X-Received: by 10.194.216.138 with SMTP id oq10mr15188003wjc.133.1423810959706;
	Thu, 12 Feb 2015 23:02:39 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:58 +0100
Message-Id: <1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 18/19] gnome-bluetooth: fix build by using a valid dbus interface + unblacklist
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...luetooth-client-use-valid-interface-names.patch | 122 +++++++++++++++++++++
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |   8 +-
 2 files changed, 126 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
new file mode 100644
index 0000000..99049a0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
@@ -0,0 +1,122 @@
+From 1555f85b222db0d536efe277d31b57b2a8b938f4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 12 Feb 2015 01:19:41 +0100
+Subject: [PATCH] bluetooth-client: use valid interface names
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate[version unmaintained upstream]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ lib/bluetooth-client.c   | 12 ++++++------
+ lib/bluetooth-client.xml |  6 +++---
+ lib/test-agent.c         |  2 +-
+ 3 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/lib/bluetooth-client.c b/lib/bluetooth-client.c
+index d62d56d..02e194c 100644
+--- a/lib/bluetooth-client.c
++++ b/lib/bluetooth-client.c
+@@ -721,7 +721,7 @@ static void add_device(DBusGProxy *adapter, GtkTreeIter *parent,
+ 						BLUEZ_DEVICE_INTERFACE, path);
+ 
+ 		if (device != NULL)
+-			device_get_properties(device, &hash, NULL);
++			org_bluez_device_get_properties(device, &hash, NULL);
+ 	} else
+ 		device = NULL;
+ 
+@@ -945,7 +945,7 @@ static void adapter_added(DBusGProxy *manager,
+ 	adapter = dbus_g_proxy_new_from_proxy(manager,
+ 					BLUEZ_ADAPTER_INTERFACE, path);
+ 
+-	adapter_get_properties(adapter, &hash, NULL);
++	org_bluez_adapter_get_properties(adapter, &hash, NULL);
+ 	if (hash != NULL) {
+ 		value = g_hash_table_lookup(hash, "Address");
+ 		address = value ? g_value_get_string(value) : NULL;
+@@ -1178,7 +1178,7 @@ static void bluetooth_client_init(BluetoothClient *client)
+ 	dbus_g_proxy_connect_signal(priv->manager, "DefaultAdapterChanged",
+ 			G_CALLBACK(default_adapter_changed), client, NULL);
+ 
+-	manager_list_adapters(priv->manager, &array, NULL);
++	org_bluez_manager_list_adapters(priv->manager, &array, NULL);
+ 	if (array != NULL) {
+ 		int i;
+ 
+@@ -1189,7 +1189,7 @@ static void bluetooth_client_init(BluetoothClient *client)
+ 		}
+ 	}
+ 
+-	manager_default_adapter(priv->manager, &default_path, NULL);
++	org_bluez_manager_default_adapter(priv->manager, &default_path, NULL);
+ 	if (default_path != NULL) {
+ 		default_adapter_changed(priv->manager, default_path, client);
+ 		g_free(default_path);
+@@ -1541,7 +1541,7 @@ gboolean bluetooth_client_start_discovery(BluetoothClient *client)
+ 	if (adapter == NULL)
+ 		return FALSE;
+ 
+-	adapter_start_discovery(adapter, NULL);
++	org_bluez_adapter_start_discovery(adapter, NULL);
+ 
+ 	g_object_unref(adapter);
+ 
+@@ -1568,7 +1568,7 @@ gboolean bluetooth_client_stop_discovery(BluetoothClient *client)
+ 	if (adapter == NULL)
+ 		return FALSE;
+ 
+-	adapter_stop_discovery(adapter, NULL);
++	org_bluez_adapter_stop_discovery(adapter, NULL);
+ 
+ 	g_object_unref(adapter);
+ 
+diff --git a/lib/bluetooth-client.xml b/lib/bluetooth-client.xml
+index 2326277..38c7fb0 100644
+--- a/lib/bluetooth-client.xml
++++ b/lib/bluetooth-client.xml
+@@ -1,7 +1,7 @@
+ <?xml version="1.0" encoding="UTF-8" ?>
+ 
+ <node name="/">
+-  <interface name="manager">
++  <interface name="org.bluez.manager">
+     <method name="DefaultAdapter">
+       <arg type="o" direction="out"/>
+     </method>
+@@ -16,7 +16,7 @@
+     </method>
+   </interface>
+ 
+-  <interface name="adapter">
++  <interface name="org.bluez.adapter">
+     <method name="GetProperties">
+       <arg type="a{sv}" direction="out"/>
+     </method>
+@@ -44,7 +44,7 @@
+     </method>
+   </interface>
+ 
+-  <interface name="device">
++  <interface name="org.bluez.device">
+     <method name="GetProperties">
+       <arg type="a{sv}" direction="out"/>
+     </method>
+diff --git a/lib/test-agent.c b/lib/test-agent.c
+index 8d60da6..83464eb 100644
+--- a/lib/test-agent.c
++++ b/lib/test-agent.c
+@@ -40,7 +40,7 @@ static gboolean agent_pincode(DBusGMethodInvocation *context,
+ 	GValue *value;
+ 	const gchar *address, *name;
+ 
+-	device_get_properties(device, &hash, NULL);
++	org_bluez_device_get_properties(device, &hash, NULL);
+ 
+ 	if (hash != NULL) {
+ 		value = g_hash_table_lookup(hash, "Address");
+-- 
+1.9.3
+
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index b9b7355..8711b8a 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -6,15 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 PR = "r1"
 
-PNBLACKLIST[gnome-bluetooth] ?= "dbus-binding-tool fails with: Unable to load gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-Bus interface name"
-
 SECTION = "x11/gnome"
 DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
 
 inherit gnomebase gtk-icon-cache
 
-SRC_URI += "file://0001-bluetooth-input-Fix-compile-errors.patch \
-           "
+SRC_URI += " \
+    file://0001-bluetooth-input-Fix-compile-errors.patch \
+    file://0002-bluetooth-client-use-valid-interface-names.patch \
+"
 SRC_URI[archive.md5sum] = "f129686fe46c4c98eb70a0cc85d59cae"
 SRC_URI[archive.sha256sum] = "57b1f06c96a1b85e1c19ff919d708cc38e95edae658881ed99968c325839a973"
 
-- 
1.9.3


