Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.93678.1597858604818806264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 10:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=GQpxirLT;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vdtb=b5=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BWw210xfKz4X
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 19:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597858601;
	bh=GyIfM/kM9aTr+GfoIh0Fm4iaa07NQQiSzyUZPRTQG1k=;
	h=From:To:Subject:Date:From;
	b=GQpxirLTZkg0zf2hFzK8oE+NO5XTZnXnc+pFeWI4TlYXk6F9neqjizhoJHLtZcWim
	 42T8EThY9pk9xautny8VI9nVIBzCn1CQdshCdI1ceieKBSugs9qNQdDrnH+0RDE3Vp
	 pLNPiCv01r8YcejFz3Kr3SwmnNFkfmjQOv3jQRsrcSyScUlBisBdFpJgm6mSIUbWVA
	 zmA0iEfGClCxfoKL2GfSLYYjiI1Y05InCXf0ml39gfGQALFE61Uv3jYUZzo2DzhceK
	 hysBudhJB5BvO+U3ZK01yL1sdSKztWs7dsXzIuFIHMQAK4b/nPjmu30J9jUmLT3L7t
	 VVqgZPefN3j0gMfBFIuvUFxyZkrslwDBBEMa613CoM3mhOiFl+EycC9XSFgIW3kvg0
	 egiPB3Kbv9ucv1Z3hM0/6wPiQkXkz+GhwNZh3R46OfmKf4eJPUooVylb5qtcKC8azX
	 t9EGhlXH/SybJZivk6siu+wS7zpXwEqDeD9psNjvyYEqDn0vYi/7O++Ce1U3Bl9t3s
	 gjIJuN1z2WCSrV0OrqSGx34Od26g2XgTJjngAUGlt6UOo5tBRK8ZXk67NrMFkPpcrP
	 0zB28wqmcUnzbAjgCTje90AtKq6piHwzVTNEDgssZnrtegQBahPA/1ddApRjxDUPqi
	 q0NElj48qj3jX86BHNYdQRE0=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][dunfell][PATCH] gnome-settings-daemon: Backport 3.36 fix for building without wayland
Date: Wed, 19 Aug 2020 20:36:39 +0300
Message-Id: <20200819173639.26172-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

/usr/src/debug/gnome-settings-daemon/3.34.2-r0/build/../gnome-settings-daemon-3.34.2/plugins/wacom/gsd-wacom-manager.c:195: undefined reference to `gdk_wayland_device_get_node_path'

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...gins-wacom-Fix-build-without-WAYLAND.patch | 27 +++++++++++++++++++
 .../gnome-settings-daemon_3.34.2.bb           |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch b/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch
new file mode 100644
index 000000000..d84fa984e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch
@@ -0,0 +1,27 @@
+From ec6982cc8b3fccc35dbd5df3c4e22ab94709c66d Mon Sep 17 00:00:00 2001
+From: Vlad Banea <vlb@xiphos.ca>
+Date: Tue, 31 Dec 2019 15:35:41 -0500
+Subject: plugins/wacom: Fix build without WAYLAND
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ plugins/wacom/gsd-wacom-manager.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/wacom/gsd-wacom-manager.c b/plugins/wacom/gsd-wacom-manager.c
+index e1c8eaa7..92fd96c3 100644
+--- a/plugins/wacom/gsd-wacom-manager.c
++++ b/plugins/wacom/gsd-wacom-manager.c
+@@ -190,7 +190,7 @@ gsd_wacom_manager_class_init (GsdWacomManagerClass *klass)
+ static gchar *
+ get_device_path (GdkDevice *device)
+ {
+-#ifdef HAVE_WAYLAND
++#if HAVE_WAYLAND
+         if (gnome_settings_is_wayland ())
+                 return g_strdup (gdk_wayland_device_get_node_path (device));
+         else
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
index db422c57c..57912bab9 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
@@ -31,6 +31,8 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 SRC_URI[archive.md5sum] = "493332fa0f36645188468fed41c0060b"
 SRC_URI[archive.sha256sum] = "9fbae67e217e53b99e4f9e7d392c91ffbe31253941c9b136ef09c2d9db7ad7ed"
 
+SRC_URI += "file://0001-plugins-wacom-Fix-build-without-WAYLAND.patch"
+
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
 # allow cross build mixed with build of native tools
-- 
2.17.1

