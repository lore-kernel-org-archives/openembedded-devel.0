Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A00C3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 13:54:17 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web11.36925.1721915648815506370
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jul 2024 06:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=FextFZg3;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5rl2hJn8dRqTfjqVzh+uDAmJCwEW2VyL3d/qt2HIbW0=; b=FextFZg3au9TDPfonqmWECbeOy
	/FSAFOLyiG0im0THCdBs4VCW+8+CCqLhjYPTN9NwG5s4pM2XLf2zJ0cTM0MvuVLUYTxv4phulrUwt
	tST3ipQLd/5g8uuUmD6jXAb89741D7i9XpvPlHl1zeqcjJpREk+miw91S2W70uZCeAzAKZ7why0K6
	FPSVlc21HeWIcoyeQhB0G5I44foVQNHTaxzf/8tludJqRbpsBS4tM7oFOaH3dXcxshX5OkU6+Y0Ks
	kvlwK8+YLct0brObHaQ+9CI59oM0a0wh2SQtckBGCCAeoN4w8LER7Xzm7fEuZS3YlLSxBByoZ2U/6
	NXJfkpyg==;
Received: from 141.90.219.87.dynamic.jazztel.es ([87.219.90.141] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sWyv0-001wLz-06
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 15:54:06 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] sysprof: upgrade 3.44.0 -> 3.48.0
Date: Thu, 25 Jul 2024 15:54:05 +0200
Message-Id: <20240725135405.303969-1-clopez@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 13:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111436

* 3.48.0 is currently the last stable version
* The GUI now uses GTK4 instead of GTK3
* A new CLI program sysprof-agent is now available
* libsysprof can be built without polkit support

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 ...libunwind-instead-of-libunwind-gener.patch | 12 +++----
 ...oke-the-commands-to-update-the-icon-.patch | 32 +++++++++++++++++++
 .../{sysprof_3.44.0.bb => sysprof_3.48.0.bb}  | 19 +++++++----
 3 files changed, 50 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_3.44.0.bb => sysprof_3.48.0.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
index dc702a0e37..1082fe4ffc 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch
@@ -13,15 +13,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 2835782..0fdb39a 100644
+index 3d3d8b5..4a1963d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -81,7 +81,7 @@ config_h.set10('HAVE_POLKIT_AGENT', polkit_agent_dep.found())
- config_h.set10('HAVE_POLKIT', polkit_dep.found())
- 
+@@ -96,7 +96,7 @@ config_h.set10('HAVE_POLKIT', polkit_dep.found())
  if get_option('libunwind')
--  libunwind_dep = dependency('libunwind-generic')
-+  libunwind_dep = dependency('libunwind')
+   # Force libunwind usage if it's specified to avoid back compiles
+   # and backtrace() showing up in builds
+-  libunwind_dep = dependency('libunwind-generic', required: true)
++  libunwind_dep = dependency('libunwind', required: true)
    config_h.set('ENABLE_LIBUNWIND', libunwind_dep.found())
    config_h.set('HAVE_UNW_SET_CACHE_SIZE', libunwind_dep.found() and cc.has_header_symbol('libunwind.h', 'unw_set_cache_size', dependencies: [libunwind_dep]))
  endif
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
new file mode 100644
index 0000000000..998c20c657
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch
@@ -0,0 +1,32 @@
+From 9ad120283f4b61b97da67f18a95bb3b4f1e8a3b9 Mon Sep 17 00:00:00 2001
+From: Carlos Alberto Lopez Perez <clopez@igalia.com>
+Date: Wed, 24 Jul 2024 15:51:05 +0100
+Subject: [PATCH] meson: Do not invoke the commands to update the icon caches
+ when cross-building
+
+This does not have any useful efect when cross-building and it requires
+the cross-builder environment to have gtk4-native built in order to invoke
+gtk-update-icon-cache program.
+
+Upstream-Status: Pending
+Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3d3d8b5..da622f1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -250,7 +250,7 @@ configure_file(
+   configuration: config_h
+ )
+ 
+-if get_option('gtk') and gnome.found()
++if get_option('gtk') and gnome.found() and not meson.is_cross_build()
+   gnome.post_install(
+       gtk_update_icon_cache: true,
+     update_desktop_database: true
+-- 
+2.39.2
+
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb
index 3523bad3e2..bf4ee7a73e 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb
@@ -14,19 +14,24 @@ DEPENDS += " \
     json-glib \
 "
 
-SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch"
-SRC_URI[archive.sha256sum] = "ab5d9f5b71973b3088d58a1bfdf1dc23c39a02f5fce4e5e9c73e034b178b005b"
+SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch \
+            file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch "
+SRC_URI[archive.sha256sum] = "07d9081a66cf2fb52753f48ff2b85ada75c60ff1bc1af1bd14d8aeb627972168"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'sysprofd libsysprof', '', d)} \
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'sysprofd', '', d)} \
                   ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
-                  libunwind"
+                  agent \
+                  libsysprof \
+                  libunwind \
+                  "
 # nongnu libunwind needs porting to RV32
 PACKAGECONFIG:remove:riscv32 = "libunwind"
 
-PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
-PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
-PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
+PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk4 libadwaita"
+PACKAGECONFIG[sysprofd] = "-Dsysprofd=bundled,-Dsysprofd=none,polkit"
+PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,json-glib"
 PACKAGECONFIG[libunwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
+PACKAGECONFIG[agent] = "-Dagent=true,-Dagent=false,"
 
 EXTRA_OEMESON += "-Dsystemdunitdir=${systemd_unitdir}/system"
 
-- 
2.39.2


