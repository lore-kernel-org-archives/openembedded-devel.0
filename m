Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A54EC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.584.1642801161475420283
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YMpUS00J;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id f17so1989144wrx.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yfFhM0rbkPP+kLPzf8VeELwvEA8Rkh0jp3oSXOUHCGY=;
        b=YMpUS00JrOtMX7WddP5zZSS6SgfDAS1YXPLeyZ06MLDHr6ZWYUZKhFnEsTRtqq98ne
         qLlW+g2nGE//I2hwTuWI0DL/R+lJcgLfczJyTdmVdqosIaQxDw3ev+n8xApVJnUOxNLc
         8J30VU2+JlnuY1PrgYCnn6+RxjhYnZng7fWPlsT/v3SZ/SQYUW3q542iopAWUyIpZi1X
         gvw/n41AtuzFk0WUcKZhOdjzH45Va7W7IzvlFDW9I2lua7bm5TfBtrUp0qqJVmwFiqwr
         4X+IMRvViCYCS2dxjJAjyEl3KQ609Dr/hdfbDvmfEgp4i22vQPTOWt3o+I2LVthHDL8K
         YO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yfFhM0rbkPP+kLPzf8VeELwvEA8Rkh0jp3oSXOUHCGY=;
        b=w/MxrzJvM4s1jYdHNgxvwiTdYNNGy2SOQ2rYIoQFaG0LVvhSagGyzY8+yxASYnbtzv
         2W/7s1tNQt5DiABUulKMwDgPZq9MguEr4rxfnk1GLKQtkskJ/wiz39KqjM8qgrwSQCXH
         Q69hYlrNxXIcIaxgx+6Wd7CCyy5SVk18xs0PqGFMD4/EdgTk+lEm5g2P7F806WxcpIIg
         VWSt6rIhirfMaC4eX2YJCLoIxShdTXoZtaAFI5w9mhaKP9aF0JBOdZRPK6qtU4gpdEg9
         9KlUXc0X8FwJoCEjnL8xIGGMJn7GbSm9hou5MkuP4ceUB9u9FkixNulZa6r3thSKvl4m
         5HkQ==
X-Gm-Message-State: AOAM5314AUotwqBw7Y5W9XgAL94h/2ROQBk60IRjjaipUVoKR+jLN0PV
	Ygk2o4VC7UAm+bWIu9sHccbOSdwetK0=
X-Google-Smtp-Source: 
 ABdhPJxDwBlhaVj2ZwPAr215WeOwG1698e3T+43SnyQShPxSo1vxqNL99gu9OAuaJeskXpkpCYkHLg==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr5308430wrf.578.1642801159997;
        Fri, 21 Jan 2022 13:39:19 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/19] gnome-control-center: add a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:55 +0100
Message-Id: <20220121213858.762625-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94994

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-unused-argument-for-i18n.merge_file.patch | 504 ++++++++++++++++++
 .../gnome-control-center_41.2.bb              |   1 +
 2 files changed, 505 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-meson-drop-unused-argument-for-i18n.merge_file.patch

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-meson-drop-unused-argument-for-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-meson-drop-unused-argument-for-i18n.merge_file.patch
new file mode 100644
index 000000000..7a1180e68
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-meson-drop-unused-argument-for-i18n.merge_file.patch
@@ -0,0 +1,504 @@
+From 90715329c277f21537eb5af86d8f222c4a2abd24 Mon Sep 17 00:00:00 2001
+From: Jan Beich <jbeich@FreeBSD.org>
+Date: Fri, 7 Jan 2022 01:53:52 +0000
+Subject: [PATCH] meson: drop unused argument for i18n.merge_file()
+
+Ignored in Meson < 0.60.0, deprecated since 0.60.1 and fatal since 0.61.0.
+
+panels/applications/meson.build:10:5: ERROR: Function does not take positional arguments.
+panels/background/meson.build:10:5: ERROR: Function does not take positional arguments.
+panels/camera/meson.build:10:5: ERROR: Function does not take positional arguments.
+[...]
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ panels/applications/meson.build                   | 1 -
+ panels/background/meson.build                     | 1 -
+ panels/bluetooth/meson.build                      | 1 -
+ panels/camera/meson.build                         | 1 -
+ panels/color/meson.build                          | 1 -
+ panels/datetime/meson.build                       | 2 --
+ panels/default-apps/meson.build                   | 1 -
+ panels/diagnostics/meson.build                    | 1 -
+ panels/display/meson.build                        | 1 -
+ panels/info-overview/meson.build                  | 1 -
+ panels/keyboard/meson.build                       | 2 --
+ panels/location/meson.build                       | 1 -
+ panels/lock/meson.build                           | 1 -
+ panels/microphone/meson.build                     | 1 -
+ panels/mouse/meson.build                          | 1 -
+ panels/multitasking/meson.build                   | 1 -
+ panels/network/meson.build                        | 1 -
+ panels/notifications/meson.build                  | 1 -
+ panels/online-accounts/meson.build                | 1 -
+ panels/power/meson.build                          | 1 -
+ panels/printers/meson.build                       | 1 -
+ panels/region/meson.build                         | 1 -
+ panels/removable-media/meson.build                | 1 -
+ panels/search/meson.build                         | 1 -
+ panels/sharing/meson.build                        | 2 --
+ panels/sound/meson.build                          | 1 -
+ panels/thunderbolt/meson.build                    | 1 -
+ panels/universal-access/meson.build               | 1 -
+ panels/usage/meson.build                          | 1 -
+ panels/user-accounts/meson.build                  | 2 --
+ panels/wacom/meson.build                          | 1 -
+ panels/wwan/meson.build                           | 1 -
+ shell/appdata/meson.build                         | 1 -
+ shell/meson.build                                 | 1 -
+ tests/interactive-panels/applications/meson.build | 1 -
+ 35 files changed, 39 deletions(-)
+
+diff --git a/panels/applications/meson.build b/panels/applications/meson.build
+index d511bf6..bd4fd64 100644
+--- a/panels/applications/meson.build
++++ b/panels/applications/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-       desktop,
+          type : 'desktop',
+         input : desktop_in,
+        output : desktop,
+diff --git a/panels/background/meson.build b/panels/background/meson.build
+index 730cf54..1f231b9 100644
+--- a/panels/background/meson.build
++++ b/panels/background/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/bluetooth/meson.build b/panels/bluetooth/meson.build
+index c3fce74..4bed812 100644
+--- a/panels/bluetooth/meson.build
++++ b/panels/bluetooth/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/camera/meson.build b/panels/camera/meson.build
+index 4f26118..bf2e727 100644
+--- a/panels/camera/meson.build
++++ b/panels/camera/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/color/meson.build b/panels/color/meson.build
+index 742caf6..bb038cd 100644
+--- a/panels/color/meson.build
++++ b/panels/color/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
+index 6568394..9bbdc7c 100644
+--- a/panels/datetime/meson.build
++++ b/panels/datetime/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+@@ -20,7 +19,6 @@ i18n.merge_file(
+ polkit = 'org.gnome.controlcenter.@0@.policy'.format(cappletname)
+ 
+ i18n.merge_file(
+-  polkit,
+   input: polkit + '.in',
+   output: polkit,
+   po_dir: po_dir,
+diff --git a/panels/default-apps/meson.build b/panels/default-apps/meson.build
+index 6855006..2a24321 100644
+--- a/panels/default-apps/meson.build
++++ b/panels/default-apps/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/diagnostics/meson.build b/panels/diagnostics/meson.build
+index fac9b4c..2f25c21 100644
+--- a/panels/diagnostics/meson.build
++++ b/panels/diagnostics/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/display/meson.build b/panels/display/meson.build
+index 12f35cc..57bdfcf 100644
+--- a/panels/display/meson.build
++++ b/panels/display/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/info-overview/meson.build b/panels/info-overview/meson.build
+index 2fe10b3..aa81c48 100644
+--- a/panels/info-overview/meson.build
++++ b/panels/info-overview/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/keyboard/meson.build b/panels/keyboard/meson.build
+index a2ae026..ae71c94 100644
+--- a/panels/keyboard/meson.build
++++ b/panels/keyboard/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+@@ -45,7 +44,6 @@ xml_files = [
+ 
+ foreach file: xml_files
+   i18n.merge_file(
+-    file,
+     input: file + '.in',
+     output: file,
+     po_dir: po_dir,
+diff --git a/panels/location/meson.build b/panels/location/meson.build
+index bfc6e82..f4c835d 100644
+--- a/panels/location/meson.build
++++ b/panels/location/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/lock/meson.build b/panels/lock/meson.build
+index 0661af4..18dbfb2 100644
+--- a/panels/lock/meson.build
++++ b/panels/lock/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/microphone/meson.build b/panels/microphone/meson.build
+index e0847a4..bc7f73a 100644
+--- a/panels/microphone/meson.build
++++ b/panels/microphone/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/mouse/meson.build b/panels/mouse/meson.build
+index 357aaae..7b46097 100644
+--- a/panels/mouse/meson.build
++++ b/panels/mouse/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/multitasking/meson.build b/panels/multitasking/meson.build
+index 772b638..53fd0d8 100644
+--- a/panels/multitasking/meson.build
++++ b/panels/multitasking/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/network/meson.build b/panels/network/meson.build
+index d7cd6e4..43a5690 100644
+--- a/panels/network/meson.build
++++ b/panels/network/meson.build
+@@ -25,7 +25,6 @@ foreach name: panel_names
+   )
+ 
+   i18n.merge_file(
+-    desktop,
+     type: 'desktop',
+     input: desktop_in,
+     output: desktop,
+diff --git a/panels/notifications/meson.build b/panels/notifications/meson.build
+index df70261..1b04b24 100644
+--- a/panels/notifications/meson.build
++++ b/panels/notifications/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/online-accounts/meson.build b/panels/online-accounts/meson.build
+index 82f1d56..6870977 100644
+--- a/panels/online-accounts/meson.build
++++ b/panels/online-accounts/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/power/meson.build b/panels/power/meson.build
+index 0e3ea1d..1cafe2a 100644
+--- a/panels/power/meson.build
++++ b/panels/power/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/printers/meson.build b/panels/printers/meson.build
+index ccce64c..042c67a 100644
+--- a/panels/printers/meson.build
++++ b/panels/printers/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/region/meson.build b/panels/region/meson.build
+index 68b7f00..27bc5ff 100644
+--- a/panels/region/meson.build
++++ b/panels/region/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/removable-media/meson.build b/panels/removable-media/meson.build
+index b51799a..fc07c48 100644
+--- a/panels/removable-media/meson.build
++++ b/panels/removable-media/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/search/meson.build b/panels/search/meson.build
+index 39b076b..a4dd79d 100644
+--- a/panels/search/meson.build
++++ b/panels/search/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/sharing/meson.build b/panels/sharing/meson.build
+index b3803bc..49dbb06 100644
+--- a/panels/sharing/meson.build
++++ b/panels/sharing/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+@@ -29,7 +28,6 @@ polkit_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  polkit,
+   input: polkit_in,
+   output: polkit,
+   po_dir: po_dir,
+diff --git a/panels/sound/meson.build b/panels/sound/meson.build
+index fa0f128..18f75dd 100644
+--- a/panels/sound/meson.build
++++ b/panels/sound/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/thunderbolt/meson.build b/panels/thunderbolt/meson.build
+index 53aa9b4..38ef294 100644
+--- a/panels/thunderbolt/meson.build
++++ b/panels/thunderbolt/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/universal-access/meson.build b/panels/universal-access/meson.build
+index 5e225fe..d845e70 100644
+--- a/panels/universal-access/meson.build
++++ b/panels/universal-access/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/usage/meson.build b/panels/usage/meson.build
+index 74f720e..6047ce0 100644
+--- a/panels/usage/meson.build
++++ b/panels/usage/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+diff --git a/panels/user-accounts/meson.build b/panels/user-accounts/meson.build
+index b8ee9d9..fa56aae 100644
+--- a/panels/user-accounts/meson.build
++++ b/panels/user-accounts/meson.build
+@@ -8,7 +8,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
+@@ -85,7 +84,6 @@ meson.add_install_script('sh', '-c',
+ polkit = 'org.gnome.controlcenter.@0@.policy'.format(cappletname)
+ 
+ i18n.merge_file(
+-  polkit,
+   input: polkit + '.in',
+   output: polkit,
+   po_dir: po_dir,
+diff --git a/panels/wacom/meson.build b/panels/wacom/meson.build
+index 5f62220..88a9137 100644
+--- a/panels/wacom/meson.build
++++ b/panels/wacom/meson.build
+@@ -30,7 +30,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-       desktop,
+          type : 'desktop',
+         input : desktop_in,
+        output : desktop,
+diff --git a/panels/wwan/meson.build b/panels/wwan/meson.build
+index 8c1b02f..2ab238a 100644
+--- a/panels/wwan/meson.build
++++ b/panels/wwan/meson.build
+@@ -11,7 +11,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-       desktop,
+          type : 'desktop',
+         input : desktop_in,
+        output : desktop,
+diff --git a/shell/appdata/meson.build b/shell/appdata/meson.build
+index 3b36171..fdb8279 100644
+--- a/shell/appdata/meson.build
++++ b/shell/appdata/meson.build
+@@ -1,7 +1,6 @@
+ appdata = 'gnome-control-center.appdata.xml'
+ 
+ i18n.merge_file(
+-  appdata,
+   input: appdata + '.in',
+   output: appdata,
+   po_dir: po_dir,
+diff --git a/shell/meson.build b/shell/meson.build
+index 89b9659..4667804 100644
+--- a/shell/meson.build
++++ b/shell/meson.build
+@@ -23,7 +23,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-       desktop,
+          type : 'desktop',
+         input : desktop_in,
+        output : desktop,
+diff --git a/tests/interactive-panels/applications/meson.build b/tests/interactive-panels/applications/meson.build
+index 2657f95..82eed4d 100644
+--- a/tests/interactive-panels/applications/meson.build
++++ b/tests/interactive-panels/applications/meson.build
+@@ -12,7 +12,6 @@ desktop_files = [
+ 
+ foreach desktop_file : desktop_files
+   i18n.merge_file(
+-              desktop,
+                 type : 'desktop',
+                input : 'gtp-@0@.desktop.in'.format(desktop_file),
+               output : 'gnome-@0@-panel.desktop'.format(desktop_file),
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb
index 7ed3afd37..f2b95edd0 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb
@@ -33,6 +33,7 @@ REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
 SRC_URI[archive.sha256sum] = "8271fc6b33ec2418a578304dd3e57d665f0d7cc706a99a97be419848618fe248"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
+SRC_URI += "  file://0001-meson-drop-unused-argument-for-i18n.merge_file.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
-- 
2.20.1


