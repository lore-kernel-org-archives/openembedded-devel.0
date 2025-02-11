Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975E2C0219D
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 13:25:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.12277.1739280341170909007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 05:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWMM0vy9;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38ddfee3ba9so1772768f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 05:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739280339; x=1739885139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QMK5KwfxyD8WMJq2qgeBBG2R/PnC10HcN41eigybn1I=;
        b=bWMM0vy9in3pf+sJcM9/vj3oDoeY26TUPpchGz3kkGJWxJpE9vw08onMS8WC0XxY/v
         gTo6iMpE5yh+bztvA0lLna7ULLTtG3s997FxyNn/jcDjFm6+AgsdJ8G2MvjSmmefAwNO
         MSAYPRA1NCn+UGhJch273rfgDa5u9Ei43coxXEbfTelj3WnI8o+y3FiFrucfdt7TbzHa
         8gFdEAfA1HC2dA77k8ykOyo1RMPhFqe+v3beahIWchjYq4AAK1g3AXBImZvFzSrr9M+T
         TY7XtRWcZ7SGPezyfUsjX5mffXa3Mrr/86qf6vCvMELvRKrlngNX6sSBYhrllb6j3UWQ
         4IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280339; x=1739885139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMK5KwfxyD8WMJq2qgeBBG2R/PnC10HcN41eigybn1I=;
        b=JNXu0OS4plxjYBrk6AscsIKxkIYwrBSRBorpjjSNVPll6dFLUEm78yBlmt9KAFI2qE
         gUcFAiSaShJKzU3lMRX6IZNLPh4eBh5Z0Moas+bc81WMFiBHvTF/IJdkfnCBEhW9g52+
         sVnq61Dw3zJEcUMhC2WcIqaJXOnJRChxRW9WQcClliVakGKT+MvBL61v8FPIns0WP5uV
         erOLa8tz4g9ii7WKuetGjd359j9dyme1IehTUvUqaCceM/cYmgala5ODczGgrmJyLM5a
         FDP14tSRWgI5ZGT2VpRRfF+wHjia8a8FZv/NuFAzKTaASC8nv6TUFh/byFJCFUv19kgy
         5I7A==
X-Gm-Message-State: AOJu0YyJhoeQHXlInTsiEYBkTdAiWYiBSnnDAFev8rooXLauSBY/RR+R
	RvFMEu2rMnQ3z2/9R0AWY8UhZcCuzQvJN3BN/JP6rm2Cs5dThA1KwJHIKQ==
X-Gm-Gg: ASbGncvU1qWs3I0QELcrFTCiYI1tilsGn7dRvJUbqgKwu3Mo7EC/jOzrdO+ou2mGhrY
	TVi0pL1B3PmB7Z/vcL+Umfc86H94yZgPlIruMSmNm3mFhFQ2o9cMIAyAg0+SeWUnvherM205qcR
	3yD6obkwynPTYhfllART70kIGXXC2I9YK6d14SheMJqZWdI5GOSXwCLtd0xZDfclsCgK2GHKXHY
	z0YpgjE28N4VFkSx4i+BjgLYOigGxFchY6gaK5wl/X7T+rnPeozPuS9SbyLYizSxATRt8kKbad+
	zKQHefd6/UIc71+YUJWEdN4fgV9GzoQ=
X-Google-Smtp-Source: AGHT+IEZEnEs8iRwREl/fBLbzibg+yiuvDpVDORplnCJV9u0Kr53TiYrUDtHNDGsgHUFx1vwz4dDTQ==
X-Received: by 2002:a5d:59af:0:b0:38d:dfaa:57be with SMTP id ffacd0b85a97d-38ddfaa59bcmr6446332f8f.52.1739280339224;
        Tue, 11 Feb 2025 05:25:39 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4453sm209405745e9.31.2025.02.11.05.25.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:25:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] mutter: fix profiler PACKAGECONFIG
Date: Tue, 11 Feb 2025 14:25:37 +0100
Message-ID: <20250211132537.4080671-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 13:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115427

In case "profiler" PACKAGECONFIG is enabled, the build fails with
the following error:

| ninja: error: '/usr/share/dbus-1/interfaces/org.gnome.Sysprof3.Profiler.xml', needed by 'src/meta-dbus-sysprof3-profiler.c', >

meson.build script is looking explicitly for a required file using the
sysroot of the build system instead of ${RECIPE_SYSROOT}. To avoid this,
patch meson.build to prefix this path with ${RECIPE_SYSROOT}.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Dont-use-system-sysprof-dbus-folder.patch | 35 +++++++++++++++++++
 .../recipes-gnome/mutter/mutter_47.4.bb       |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch

diff --git a/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
new file mode 100644
index 000000000..2f09c3299
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
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
index 30301dac2..fe30aa60c 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
@@ -24,6 +24,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
+SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
+
 SRC_URI[archive.sha256sum] = "f531fc00e6ec6dbb570b3bf942b6490f7a93df91c4c267a918b4d2afe9211bda"
 
 # x11 is still manadatory - see meson.build

