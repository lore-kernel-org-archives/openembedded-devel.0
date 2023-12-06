Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E00C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 11:49:57 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.29736.1701863386916289505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 03:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGKZ9XgS;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54c5d041c23so6655038a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 03:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701863385; x=1702468185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXhzvpvtVcMV9vYyvGDo2+NduEaTKIY6MwyvpPELXVY=;
        b=XGKZ9XgSw+x/z5/Urah+hVa3Z7/Q90XqqO2pURRvsAytXRirdRMOZ5wzkAP7zWWwpl
         uIh829cZ+tEClB0Hh9ZKOb2BZ+Ckps0lPUXA5N+7zUiFt3O0hTWd3JL9ROAZTbAguxvg
         aWhYVWerbBDHI1EYfHG681Hp8Wu3gNsT4xbIsCp1A2cuztIEIdTyif/txVkduRt0lOKn
         XBrzfSrFr44r8weA72SnB28jUoHk9Vzv1a2+dbaVqqiX4OfEixlz1jdqXQBqBEDwB8sL
         dytDr/V65JfTaMaluM/d1TFPWtZGuZHYl2fWM3ta/B4teRUPGzGtLhqRFouJCDILqODf
         ZGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701863385; x=1702468185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXhzvpvtVcMV9vYyvGDo2+NduEaTKIY6MwyvpPELXVY=;
        b=XpeHOhCgccYxEKC1NsKA4OY092QmyjbYEPw6oWE+aVUIuTs1sYTesTgB+TJhCj0W8P
         81RC+CL4+dd1qD24W+icNUo+frP3/pRPfGRaOQ6LYWFjbElcWIazbGGd1ZmVycnjdmvM
         VB9EKmtkmC8XFkEmxMpuT3lHgFG5qS3X7mcDOdWaKtPXw9+NR77Ct0nqL8VEMnvJb7d4
         9zeyBbVFj4BTfRZvNM3pFY0b9hiICkUef9DUrtP1oXfBLl+SRQtyWsvxZctaPLLVTyTA
         fQmybMH2fwXCSCp3UKCSJ0Ds2IWk++Zb7/eFSOUf0nqJfIIQLxB0krzIwS1fQB80B2sR
         ru6w==
X-Gm-Message-State: AOJu0Yy9BYp6ldyCN9G/BkgiZ4FopLAQR1gN78HMJZwkO3WzsGCBK9Bb
	Tck51DKyorevXRqX7OtedXNwTL4jveY=
X-Google-Smtp-Source: AGHT+IFbONQclwJOf0Cfy9CVu4npSd4zTgnOsmqxbfp1TtLAooxWPfAoCljpv2XVU+6jcDyXF7AbDw==
X-Received: by 2002:a50:c292:0:b0:54b:67a7:efe5 with SMTP id o18-20020a50c292000000b0054b67a7efe5mr274473edf.1.1701863384794;
        Wed, 06 Dec 2023 03:49:44 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id u14-20020a05640207ce00b0054cac2a0715sm2302687edy.93.2023.12.06.03.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:49:44 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH] mutter: Make gnome-desktop and libcanberra dependencies optional
Date: Wed,  6 Dec 2023 12:49:41 +0100
Message-ID: <20231206114941.183121-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 11:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107240

mutter may be used as a standalone compositor and even an X11 WM
without the complete GNOME desktop environment. Make this optional
and add the new control knob to PACKAGECONFIG by default.

The built-in sound player functionality depends on libcanberra
which is considered outdated. Make this optional.

Add the colord build dependency explicitly because mutter does
not build when PACKAGECONFIG = "gnome-desktop" is not used.

This change allows mutter in kiosk-like scenarios.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_45.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
index 60347aa49..41c3a6526 100644
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
 
-- 
2.43.0


