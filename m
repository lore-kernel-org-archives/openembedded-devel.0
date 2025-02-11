Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9212DC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 17:08:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.4777.1739293701458912424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 09:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqpIg0zY;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43618283d48so40836355e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 09:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739293700; x=1739898500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvQYMoX4BO+Bn272q+4uj+0wRHjvoEfYPaKAzWSgwKs=;
        b=lqpIg0zY3sQYK/+3Hj2EoG6xE7qtHilWz/mibFPxp9F9yauxkSZqpvZngJlkWFVSXg
         Lpjf4W3rH03rO+XN4XY0ODYz38WIud/amM2BVeZcxDZ6myyVCjJscQHojHpLX/6jBRT7
         GtpG4InvaydWpBUmQ1Vbwp6ECR2LxFxLr0K7YGnRBRyI1ayesrFmIBBfF2xCDDutpHdy
         ZgQsvFPAix+IXZkoR3sHUGFVZ0jhJizVbX3LZHl2+J4Fac+IDgP/nEFOW2yjBGp4zBvV
         XQwyUZ/piDXOt0GK38RiiykO56MnweKVEIUSnyHexa/ApUm8CzmTldkdVq/f/aVyR0oX
         AtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293700; x=1739898500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvQYMoX4BO+Bn272q+4uj+0wRHjvoEfYPaKAzWSgwKs=;
        b=u369GJHZQywFRQ5hBgmmAGPDR1h3AhXO1ru6OCM+9j+jAiuyZmt7sfouuhCAG6N4jf
         V2XcuynhnhHXn42tzftUBKqI8GwqwlM2x7A4TdeRJ/a93bBfZbjMPsLRRwWhATuew5pq
         e+NWtCobly9/zGZa2mUQ7R7p3AsGwkfv4puPwpSTn84zCf9BLy5QVKDoOTHrXe9Jx6FF
         3IauTcG0wFVBSqPHE1/hdvSt8yoTkI/IZSaSaXF/guU8pLZCu2pCYd6phUiST4L7gF10
         jP/hjGY9l/wQj+nMYgCSK2eTaquulg8tPUsJOI92dN4Jc2nV3Wh0luZ4pHNLAbl9Nf9I
         9ltw==
X-Gm-Message-State: AOJu0YzZzxomBAc2Z/le/dqvGRptoQber1CQpcby1V8ayK0+tWA4Vo23
	INrReGPwgsaVhTxp2DjEquTBFhxAA3K/uocdxQToTNbSFhDX8Wq52zxNPA==
X-Gm-Gg: ASbGncupfpycFJ9pIooS89QrEaCnbAEoVwS4+DKNsgApB8hocRW/RiWJ9AZ454o2wdL
	5Kn/WtGH9EyPV5Y+7DJfvGRAWCMlTtpyu5WDQi8gatLBq0r/epO+sLX7aL/W11idJoOTnTkenNn
	R+FOb+mQclvmPA1xth1hphXiBrHTeqq5QxScB4w+wAUQFV+6X/aAd+LvXx3LS6FPm5fhCzJ3jp+
	1pRIzQYyHopl75DSGT/W6YLNc4Me5Uw0upGRl0BH2SUMx7qJO+XrxmrIg6bqUsYTjYvoZwuu5sh
	ynQX6m3gOdgxJFGdPwQlF7ouoi2l7fA=
X-Google-Smtp-Source: AGHT+IHIXiP3pzwRVmi3XbnvULA2jBfZHac3WMoY9Dz92XC3mTtbEuKjr2gSYUZcvpfaWTkGfQROwQ==
X-Received: by 2002:a5d:47c4:0:b0:38d:d8c0:1f87 with SMTP id ffacd0b85a97d-38de419487fmr4432710f8f.30.1739293699434;
        Tue, 11 Feb 2025 09:08:19 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439429c0790sm73379135e9.2.2025.02.11.09.08.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:08:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v3] mutter: fix profiler PACKAGECONFIG
Date: Tue, 11 Feb 2025 18:08:17 +0100
Message-ID: <20250211170817.229239-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 17:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115432

In case "profiler" PACKAGECONFIG is enabled, the build fails with
the following error:

| ninja: error: '/usr/share/dbus-1/interfaces/org.gnome.Sysprof3.Profiler.xml', needed by 'src/meta-dbus-sysprof3-profiler.c', missing and no known rule to make it

meson.build script is looking explicitly for a required file using the
sysroot of the build system instead of ${RECIPE_SYSROOT}. To avoid this,
patch meson.build to prefix this path with ${RECIPE_SYSROOT}.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Dont-use-system-sysprof-dbus-folder.patch | 35 +++++++++++++++++++
 .../recipes-gnome/mutter/mutter_47.5.bb       |  2 ++
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
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb b/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
index 6a351ea279..ca28a679cd 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
@@ -26,6 +26,8 @@ inherit gnomebase gsettings gobject-introspection gettext features_check
 
 SRC_URI[archive.sha256sum] = "6551a33ce887e68415b13952af6d6b430e95306f9297adc8c111953e995c515b"
 
+SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
+
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
 

