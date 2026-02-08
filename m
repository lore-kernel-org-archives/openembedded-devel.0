Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB046EF06E2
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26622.1770562308198911451
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TvFM6Zwa;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee0291921so19994455e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562306; x=1771167106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ec8mkVvBoJaNuZrvPbi27CTJiGIsTEORpF1J13dtQ7o=;
        b=TvFM6ZwaoooY53y/yMe/I5O3CuIKWtHNTGYgVr15q8v0NqmiF44BuXZzL/QSfZzbod
         EeMZFXr/5TfMZWr0OVSA3PDf0+DjahLj9Lcsx5VSekGxi0L5zWNGvJMfUVImGE8KEP5p
         wb839tEEl8CtNfJefDCKQeHx013nuri0sl2znIKn9xj0Pf6mMBBlWRQTtWIT6AYKqd8i
         h61xRZfhQjAzG46A6uaIZbTMwEG6a9L3TIoIN/mZs7o2E7MkLkcj+OCAZvtTAg+uPxMk
         a9tBGeAQVFsmNX17jndyWp+Gayx1WWCdaSv06OB7vxMTvbhj2gzw29TNbeiNfhpeOXi5
         ERhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562306; x=1771167106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ec8mkVvBoJaNuZrvPbi27CTJiGIsTEORpF1J13dtQ7o=;
        b=mmq0E4wNOAfWXaJq8IbWshdaYstk9ygByufzQi1Dfo4M1eeDH6TTXy8Q3JLJZ56L3i
         G+Lf66YsioN30VRJwkpffwRr7zlr4TBcb3EcQn+5xmuKlYBmdOxqy36mrLiJCV6ZgbQ+
         VOMOPnAWScE5AumMjru1DaammQxTz6MSWZcMWSTe7GH1R7xQt02sU7o6AgVv/aBvQeaJ
         wdm8QfXak3dvRGaTkjQ4sf4iQBnzErnIdrKFHLg+YHKlvL5Tq7q/oGN1oB3L5j+rsnhO
         nZbp1szUga3KW4m8f6UeXV24I1NvzLDeXL9RLj2VcDdOdEbvB4eGRx8SztNHvXP1694Q
         fCeQ==
X-Gm-Message-State: AOJu0YwYInK3Yi/0Bjzoubqb1BODHAQLXvuKYMiaMEdeRAWEWbaGVyyy
	feOjbqPHP7sVp2LYpjL2Z2FHYSQL6S5ESALt37pYlA8Xx4WI9icpP4zNcYcsfw==
X-Gm-Gg: AZuq6aJzmw2zCadflQEJalQwsDEQ+eUOe00PHD7HnomU+G/6sHmBXkdakL7lOi7+hRw
	jpKes6tEZmcAjWAJV42BiRIpc8Eau/mTEeaNFepCZ4ccyv0eas0DjfpnKaenXxaHNL9V4b+XjSS
	PT3XaxpccoIGWG0oBfdgmaKdSXAsgSRdr9I/BUd86z8K17wZ827/cEWBZx66D08L/mJyMlKqGCX
	OQ0vf57dkf/AqBoVUrbTZ564U5IBredWNL2nggQ026uoFpTxdFOaYEf7K14YSBa2ueWVTodHKWX
	Irw+oUasFccEHWF3ubPV6sfVr3PsgBzSoUeMlqpBkKHPNRr5RG6fPOQxPeTlmeHSdvoRY63FjBq
	2JJAlaUKtOQ4yWypTB2jn4T6Sckogyq0Ft4lMbgftDnYUs1a0AuYglboq3dwHZK2xk2dhpNnZZb
	QuaRLBvM0h4IPGsZ0rmxI=
X-Received: by 2002:a05:600c:8b45:b0:480:68ed:1e73 with SMTP id 5b1f17b1804b1-483202277d5mr127969615e9.36.1770562306468;
        Sun, 08 Feb 2026 06:51:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 02/10] mutter: fix profiler PACKAGECONFIG
Date: Sun,  8 Feb 2026 15:51:35 +0100
Message-ID: <20260208145143.20464-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124275

In case "profiler" PACKAGECONFIG is enabled, the build fails with
the following error:

| ninja: error: '/usr/share/dbus-1/interfaces/org.gnome.Sysprof3.Profiler.xml', needed by 'src/meta-dbus-sysprof3-profiler.c', missing and no known rule to make it

meson.build script is looking explicitly for a required file using the
sysroot of the build system instead of ${RECIPE_SYSROOT}. To avoid this,
patch meson.build to prefix this path with ${RECIPE_SYSROOT}.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ead8f7b3273965f383ec4999bb38e87ba37daf61)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Dont-use-system-sysprof-dbus-folder.patch | 35 +++++++++++++++++++
 .../recipes-gnome/mutter/mutter_46.9.bb       |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch

diff --git a/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
new file mode 100644
index 0000000000..2f09c32997
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
@@ -0,0 +1,35 @@
+From 790177e2a89aa0710b570d595223bdb511241c56 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 11 Feb 2025 13:39:54 +0100
+Subject: [PATCH] Don't use system sysprof dbus folder
+
+In case Mutter is built with profiler support, it requires
+org.gnome.Sysprof3.Profiler.xml file to be available - however
+the meson build file is trying to access it on the build machine's
+system ($datadir/dbus-1/interfaces) instead of searching for it
+in the $RECIPE_SYSROOT.
+
+To ensure that it looks for this file in the correct folder, prefix
+the search path with the value of the sys_root property, which is set 
+in the meson.cross file (by meson.bbclass).
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+Upstream-Status: Inappropriate [oe-specific: only related to cross-compiling]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 551cb23..5199be6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -446,7 +446,7 @@ if have_profiler
+ 
+   if libsysprof_capture_dep.type_name() == 'pkgconfig'
+     sysprof_dep = dependency('sysprof-6', 'sysprof-4')
+-    sysprof_dbus_interfaces_dir = sysprof_dep.get_variable('datadir') / 'dbus-1' / 'interfaces'
++    sysprof_dbus_interfaces_dir = meson.get_external_property('sys_root') + sysprof_dep.get_variable('datadir') / 'dbus-1' / 'interfaces'
+   else
+     sysprof_dbus_interfaces_dir = mutter_srcdir / 'subprojects' / 'sysprof' / 'src'
+   endif
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_46.9.bb b/meta-gnome/recipes-gnome/mutter/mutter_46.9.bb
index 0cf5d4146f..4d55cd5574 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_46.9.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_46.9.bb
@@ -26,6 +26,8 @@ inherit gnomebase gsettings gobject-introspection gettext features_check
 
 SRC_URI[archive.sha256sum] = "b5071ff62fc060d3eb39c95fd54ff1accd4600756d7205f747a24d71e0ea6429"
 
+SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
+
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
 

