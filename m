Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FE6C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 15:34:09 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.87312.1701963245438788895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 07:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzKju+7B;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: zboszor@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ca0d14976aso11045911fa.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 07:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701963243; x=1702568043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+J6d006faMuVeoRFVWCIfe79d0zDv9WB7rq780pweuM=;
        b=GzKju+7B/WbYkFK3ImdK00Y/uvISIWCA4Wze7jXlnOSyFwAlogcYU0hZz8wnEcG9uK
         WR1p7j1Z+AHAWxqfsY2zr6ymnk6t2w2IXrKkm28bVIwIaeRHHBDM1e5JCrE831XI9cUq
         H1D0HtwclINK8yP9A2re7RiO+gupyi+4nHJs4umnE1VyAetcgrRRHDa+Fi77HB35l4JX
         Osk1rwa3JkOYtXTLgCBWOjvXj1/qWW0TtwZtEKGGI5n59N10DLebKdSMVqav+4UXqZWq
         WOxiHAZRJ0B44oqCtWZ/LjMmEiBnKxKX+99yS34bwqIajcAN/SqaLjq51ZNOKYL8Gy1/
         awSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701963243; x=1702568043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+J6d006faMuVeoRFVWCIfe79d0zDv9WB7rq780pweuM=;
        b=EMF+0k7on2jRL+M5M1GeTAxFb8rlJhkc9urth8h/J+Anq6ZMfMq+mI3vlA9gOiANYm
         zHngy3Gdkw48HgO6wemJLnCD1M0WKi2YZMW4huQNo6/zqy8JURg6ZL5P9bQpGat30piZ
         tjSLW60iYTBtyky26nYqd/rFddDjkH1Bjd5SvasmGP30tsL3U8NmIpbg0pO61RjLEhjO
         /CYzb3U1T2dwWY0hG4hAQunavesg8uqvCo9YKEAzzXXpbtyST7pGYylyLvibVMkxnZgs
         XFTwC0sI/lYBxmmtMP2Pz7ZZBvenvNATwsj7T0Gl1q/VT1HcDK9FVOWzukGdhGqoLvK9
         w8IA==
X-Gm-Message-State: AOJu0Yy4kB5eWO6wN14IJPIyi+S+B8agznHysATE+Ai+nS06QAfjmv9X
	Npc9VyHIbUZnv/IClH6VXT7qCzVKY4U=
X-Google-Smtp-Source: AGHT+IEwpFH5y0S53ACmMXLOlnoHm8zMnoCnlciK9dqqbcGjaqfWJ6SHvaH2D1IAMJ8/g8aRDiFykw==
X-Received: by 2002:a2e:740d:0:b0:2c9:fc6e:5832 with SMTP id p13-20020a2e740d000000b002c9fc6e5832mr1579662ljc.59.1701963243176;
        Thu, 07 Dec 2023 07:34:03 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906710700b00a1cd0794696sm965496ejj.53.2023.12.07.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:34:02 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH v2] mutter: Make gnome-desktop and libcanberra dependencies optional
Date: Thu,  7 Dec 2023 16:33:54 +0100
Message-ID: <20231207153354.273551-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107282

mutter may be used as a standalone compositor and even an X11 WM
without the complete GNOME desktop environment. Make this optional
and add the new control knob to PACKAGECONFIG by default.

The built-in sound player functionality depends on libcanberra
which is considered outdated. Make this optional.

Add the colord build dependency explicitly because mutter does
not build when PACKAGECONFIG = "gnome-desktop" is not used.

Add the gsettings-desktop-schemas runtime dependency explicitly,
so mutter may work without PACKAGECONFIG = "gnome-desktop".

This change allows mutter in kiosk-like scenarios.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_45.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
index 60347aa49..6093a0fe9 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
@@ -6,6 +6,7 @@ DEPENDS = " \
     xserver-xorg-cvt-native \
     wayland-native \
     virtual/libx11 \
+    colord \
     graphene \
     gtk4 \
     gdk-pixbuf \
@@ -13,8 +14,6 @@ DEPENDS = " \
     pango \
     gsettings-desktop-schemas \
     json-glib \
-    gnome-desktop \
-    gnome-settings-daemon \
     libei \
     libxtst \
     libxkbfile \
@@ -41,6 +40,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl glx', '', d)} \
     sm \
     startup-notification \
+    gnome-desktop \
 "
 
 EXTRA_OEMESON += " \
@@ -57,7 +57,9 @@ PACKAGECONFIG[libdisplay-info] = "-Dlibdisplay_info=true, -Dlibdisplay_info=fals
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
+PACKAGECONFIG[gnome-desktop] = "-Dlibgnome_desktop=true, -Dlibgnome_desktop=false, gnome-desktop gnome-settings-daemon"
 PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
+PACKAGECONFIG[sound-player] = "-Dsound_player=true, -Dsound_player=false, libcanberra"
 PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
 PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
 
@@ -102,5 +104,5 @@ FILES:${PN}-dev += " \
     ${libdir}/${MUTTER_API_NAME}/lib*.so \
 "
 
-RDEPENDS:${PN} += "zenity ${PN}-gsettings"
+RDEPENDS:${PN} += "zenity ${PN}-gsettings gsettings-desktop-schemas"
 
-- 
2.43.0


