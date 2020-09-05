Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.3144.1599324983218263119
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=agChb8W+;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 67so5911641pgd.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GvPRuJ8jQxB+2BilsYOj2q0P7PqCdu6oAo8KxXYcNGM=;
        b=agChb8W+t9k5sWik5DEpR5u4OiLbL/p7pm3JcYTYVNnP3Kfh2ZUnORapEWYYkEhcHu
         4IpKBrs+sZrMI5VY4y0v4y9Fv73XeE7+BkdtdneYiPf4ZWWZDUUc072uZ1LvZbmLs3o7
         fVTy+Duw6O+/S+i6oYkmOR/mLFv8seY2YvjfwG7yEioGvnMz987Tn15BET04yT5HUgDw
         tdGbq/Tho2A0zhzgvxaRy1Sb+73JxowHOWATwy8B9dP/VeoT4t8u/yHWcnFlq3TVxf8U
         PLGTUOLH0mOSs3RZE45QlUhlXHeWTS1ecpwfRSuCuT3u9QQ/LLimdBbwQmLeFtIl9gRH
         cmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GvPRuJ8jQxB+2BilsYOj2q0P7PqCdu6oAo8KxXYcNGM=;
        b=hIMp/5flqBJppoXsC0q7TmSmzYHu5xdDmXGnq50Py1VmqQLqoPke08c4vWDSjcNWzi
         EQ8V5iuMymn2nib0lBmTERDQhGMMBk+QN8SgxzNIkLMROeB3DThViRYxEP/wjkB51JUC
         9tGFratw2FZDV8dJ2ZFdR1PxXM8fwbh6twqnnvaOr43/HPn5++kZO1F3O6+INWLO9Oh0
         1wYRb04tTZIDtv3oWFYlXoRVJVqQE6+7GNhBCr6/jePKHgGFvRdU7/963R3SVF2BPj48
         gBJyQgknip6Pn20SgJL0XKhRGaISygvveIKFpUFAX5alEV0pbuapAMv+UZCYkj5HQF1O
         ReEg==
X-Gm-Message-State: AOAM5303qeRt2ghmQ406MaYVxBYXcgL1FojcCVMm0fvl8nU5N9cmU1DD
	AZusfOO9B+SweifOJN0zmvSHy1J+GGs=
X-Google-Smtp-Source: ABdhPJzShg0tv6WFy4rLAdVXCyooiOl3Ri7s4/OngfcQuVhxLugYZJAoMiHOVvIOZhaKAydQXQ5veQ==
X-Received: by 2002:a65:615a:: with SMTP id o26mr2331289pgv.54.1599324982598;
        Sat, 05 Sep 2020 09:56:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 18/20] gnome-settings-daemon: Backport 3.36 fix for building without wayland
Date: Sat,  5 Sep 2020 09:56:01 -0700
Message-Id: <a6adc08626ec33dc1fc37316654988e51685a266.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

/usr/src/debug/gnome-settings-daemon/3.34.2-r0/build/../gnome-settings-daemon-3.34.2/plugins/wacom/gsd-wacom-manager.c:195: undefined reference to `gdk_wayland_device_get_node_path'

Signed-off-by: Adrian Bunk <bunk@stusta.de>
[AK: hand applied]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...gins-wacom-Fix-build-without-WAYLAND.patch | 27 +++++++++++++++++++
 .../gnome-settings-daemon_3.34.2.bb           |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch b/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-plugins-wacom-Fix-build-without-WAYLAND.patch
new file mode 100644
index 0000000000..d84fa984e5
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
index 0b6865d293..e2fbcb401d 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
@@ -31,6 +31,8 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 SRC_URI[archive.md5sum] = "493332fa0f36645188468fed41c0060b"
 SRC_URI[archive.sha256sum] = "9fbae67e217e53b99e4f9e7d392c91ffbe31253941c9b136ef09c2d9db7ad7ed"
 
+SRC_URI += "file://0001-plugins-wacom-Fix-build-without-WAYLAND.patch"
+
 # allow cross build mixed with build of native tools
 do_write_config_append() {
     cat >${WORKDIR}/meson.native <<EOF
-- 
2.17.1

