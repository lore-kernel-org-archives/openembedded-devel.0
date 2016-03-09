Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 42F786FF80
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:09:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62868848"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:09:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:19 +0200
Message-Id: <67a642a0f42019b4fa0893d2dade47d02658b8a9.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/38] gnome-bluetooth: update to 3.18.2
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
X-List-Received-Date: Wed, 09 Mar 2016 15:09:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This also enable gobject introspection support.
Drop obsolete patches.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-bluetooth-input-Fix-compile-errors.patch  |  37 -------
 ...luetooth-client-use-valid-interface-names.patch | 122 ---------------------
 .../0003-Fix-build-with-libnotify-0.7.0.patch      |  47 --------
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |  38 -------
 .../gnome-bluetooth/gnome-bluetooth_3.18.2.bb      |  20 ++++
 5 files changed, 20 insertions(+), 244 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
deleted file mode 100644
index 0b0cf8b..0000000
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e3c789d6dca9a8a99b60b86e28d8119c55253c13 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 May 2013 08:37:03 -0700
-Subject: [PATCH] bluetooth-input: Fix compile errors
-
-XID is unsigned long type so %d will error out with -Wformat
-where format warnings are being treated at errors
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Unknown
----
- wizard/bluetooth-input.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/wizard/bluetooth-input.c b/wizard/bluetooth-input.c
-index b3fbdaf..d17e67c 100644
---- a/wizard/bluetooth-input.c
-+++ b/wizard/bluetooth-input.c
-@@ -190,12 +190,12 @@ bluetooth_input_check_for_devices (BluetoothInput *input)
- 		if (bluetooth_input_device_get_type (&device_info[i], &is_mouse, &is_keyboard) == FALSE)
- 			continue;
- 		if (is_mouse != FALSE) {
--			g_message ("has mouse: %s (id = %d)", device_info[i].name, device_info[i].id);
-+			g_message ("has mouse: %s (id = %lu)", device_info[i].name, device_info[i].id);
- 			has_mouse = TRUE;
- 			//break;
- 		}
- 		if (is_keyboard != FALSE) {
--			g_message ("has keyboard: %s (id = %d)", device_info[i].name, device_info[i].id);
-+			g_message ("has keyboard: %s (id = %lu)", device_info[i].name, device_info[i].id);
- 			has_keyboard = TRUE;
- 			//break;
- 		}
--- 
-1.7.9.5
-
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
deleted file mode 100644
index 99049a0..0000000
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 1555f85b222db0d536efe277d31b57b2a8b938f4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 12 Feb 2015 01:19:41 +0100
-Subject: [PATCH] bluetooth-client: use valid interface names
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate[version unmaintained upstream]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- lib/bluetooth-client.c   | 12 ++++++------
- lib/bluetooth-client.xml |  6 +++---
- lib/test-agent.c         |  2 +-
- 3 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/lib/bluetooth-client.c b/lib/bluetooth-client.c
-index d62d56d..02e194c 100644
---- a/lib/bluetooth-client.c
-+++ b/lib/bluetooth-client.c
-@@ -721,7 +721,7 @@ static void add_device(DBusGProxy *adapter, GtkTreeIter *parent,
- 						BLUEZ_DEVICE_INTERFACE, path);
- 
- 		if (device != NULL)
--			device_get_properties(device, &hash, NULL);
-+			org_bluez_device_get_properties(device, &hash, NULL);
- 	} else
- 		device = NULL;
- 
-@@ -945,7 +945,7 @@ static void adapter_added(DBusGProxy *manager,
- 	adapter = dbus_g_proxy_new_from_proxy(manager,
- 					BLUEZ_ADAPTER_INTERFACE, path);
- 
--	adapter_get_properties(adapter, &hash, NULL);
-+	org_bluez_adapter_get_properties(adapter, &hash, NULL);
- 	if (hash != NULL) {
- 		value = g_hash_table_lookup(hash, "Address");
- 		address = value ? g_value_get_string(value) : NULL;
-@@ -1178,7 +1178,7 @@ static void bluetooth_client_init(BluetoothClient *client)
- 	dbus_g_proxy_connect_signal(priv->manager, "DefaultAdapterChanged",
- 			G_CALLBACK(default_adapter_changed), client, NULL);
- 
--	manager_list_adapters(priv->manager, &array, NULL);
-+	org_bluez_manager_list_adapters(priv->manager, &array, NULL);
- 	if (array != NULL) {
- 		int i;
- 
-@@ -1189,7 +1189,7 @@ static void bluetooth_client_init(BluetoothClient *client)
- 		}
- 	}
- 
--	manager_default_adapter(priv->manager, &default_path, NULL);
-+	org_bluez_manager_default_adapter(priv->manager, &default_path, NULL);
- 	if (default_path != NULL) {
- 		default_adapter_changed(priv->manager, default_path, client);
- 		g_free(default_path);
-@@ -1541,7 +1541,7 @@ gboolean bluetooth_client_start_discovery(BluetoothClient *client)
- 	if (adapter == NULL)
- 		return FALSE;
- 
--	adapter_start_discovery(adapter, NULL);
-+	org_bluez_adapter_start_discovery(adapter, NULL);
- 
- 	g_object_unref(adapter);
- 
-@@ -1568,7 +1568,7 @@ gboolean bluetooth_client_stop_discovery(BluetoothClient *client)
- 	if (adapter == NULL)
- 		return FALSE;
- 
--	adapter_stop_discovery(adapter, NULL);
-+	org_bluez_adapter_stop_discovery(adapter, NULL);
- 
- 	g_object_unref(adapter);
- 
-diff --git a/lib/bluetooth-client.xml b/lib/bluetooth-client.xml
-index 2326277..38c7fb0 100644
---- a/lib/bluetooth-client.xml
-+++ b/lib/bluetooth-client.xml
-@@ -1,7 +1,7 @@
- <?xml version="1.0" encoding="UTF-8" ?>
- 
- <node name="/">
--  <interface name="manager">
-+  <interface name="org.bluez.manager">
-     <method name="DefaultAdapter">
-       <arg type="o" direction="out"/>
-     </method>
-@@ -16,7 +16,7 @@
-     </method>
-   </interface>
- 
--  <interface name="adapter">
-+  <interface name="org.bluez.adapter">
-     <method name="GetProperties">
-       <arg type="a{sv}" direction="out"/>
-     </method>
-@@ -44,7 +44,7 @@
-     </method>
-   </interface>
- 
--  <interface name="device">
-+  <interface name="org.bluez.device">
-     <method name="GetProperties">
-       <arg type="a{sv}" direction="out"/>
-     </method>
-diff --git a/lib/test-agent.c b/lib/test-agent.c
-index 8d60da6..83464eb 100644
---- a/lib/test-agent.c
-+++ b/lib/test-agent.c
-@@ -40,7 +40,7 @@ static gboolean agent_pincode(DBusGMethodInvocation *context,
- 	GValue *value;
- 	const gchar *address, *name;
- 
--	device_get_properties(device, &hash, NULL);
-+	org_bluez_device_get_properties(device, &hash, NULL);
- 
- 	if (hash != NULL) {
- 		value = g_hash_table_lookup(hash, "Address");
--- 
-1.9.3
-
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
deleted file mode 100644
index 118ef93..0000000
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 08a5b66d709781c0c596108278979a11b26331d5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 30 Aug 2015 12:14:53 +0200
-Subject: [PATCH] Fix build with libnotify >= 0.7.0
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport [1]
-
-[1] https://github.com/GNOME/gnome-bluetooth/commit/9f256799cc6b8367b2466f35b82f1d07076a950e
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- applet/notify.c | 2 +-
- configure.ac    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/applet/notify.c b/applet/notify.c
-index d2a4f51..cb01dfc 100644
---- a/applet/notify.c
-+++ b/applet/notify.c
-@@ -71,7 +71,7 @@ void show_notification(const gchar *summary, const gchar *message,
- 		notify_notification_close(notify, NULL);
- 	}
- 
--	notify = notify_notification_new(summary, message, icon_name, NULL);
-+	notify = notify_notification_new(summary, message, icon_name);
- 
- 	notify_notification_set_timeout(notify, timeout);
- 
-diff --git a/configure.ac b/configure.ac
-index 8bbce4e..98ec86e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,7 +71,7 @@ AM_CONDITIONAL([ICON_UPDATE], [test -n "$UPDATE_ICON_CACHE"])
- GTK_REQUIRED=2.19.1
- GLIB_REQUIRED=2.25.7
- DBUS_GLIB_REQUIRED=0.74
--NOTIFY_REQUIRED=0.4.3
-+NOTIFY_REQUIRED=0.7.0
- NAUTILUS_SENDTO_REQUIRED=2.31.7
- 
- dnl Requires for the properties window
--- 
-2.1.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
deleted file mode 100644
index f2128d8..0000000
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "GNOME bluetooth manager"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-"
-
-PR = "r1"
-
-SECTION = "x11/gnome"
-DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify libgnome-keyring virtual/libx11 libxi intltool-native"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
-
-inherit gnomebase gtk-icon-cache
-
-SRC_URI += " \
-    file://0001-bluetooth-input-Fix-compile-errors.patch \
-    file://0002-bluetooth-client-use-valid-interface-names.patch \
-    file://0003-Fix-build-with-libnotify-0.7.0.patch \
-"
-SRC_URI[archive.md5sum] = "f129686fe46c4c98eb70a0cc85d59cae"
-SRC_URI[archive.sha256sum] = "57b1f06c96a1b85e1c19ff919d708cc38e95edae658881ed99968c325839a973"
-GNOME_COMPRESS_TYPE="bz2"
-
-# No 'nautilus-sendto' recipe in meta-gnome yet
-EXTRA_OECONF += "--enable-nautilus-sendto=no"
-
-# No native docbook XSL stylesheets recipe in OE yet
-do_configure_prepend() {
-    sed -i s/help// ${S}/Makefile.am
-}
-
-do_configure_append() {
-    sed -i 's,func_fatal_error "error: cannot install,echo "bogus message about,' ${HOST_SYS}-libtool
-}
-
-RRECOMMENDS_${PN} += "obexd obex-data-server"
-
-FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
new file mode 100644
index 0000000..77e9a15
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "GNOME bluetooth manager"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+"
+
+SECTION = "x11/gnome"
+
+# systemd is needed because it has a necessary version of libudev
+# Effectively this means that systemd must be in DISTRO_FEATURES
+DEPENDS = "systemd gtk+3 libnotify libcanberra"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+
+inherit gnomebase gtk-icon-cache distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
+SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
+
+FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
-- 
2.7.0


