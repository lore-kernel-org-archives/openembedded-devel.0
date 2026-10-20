Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8985.1792456226415169535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 17:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kh1qBWW4;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so4573339eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 17:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456226; x=1793061026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KE72+aAwlXuXw+iE9EZfyt6L/a7/zE+qAkJnNkpGgk=;
        b=Kh1qBWW4kIPmU5sAyWwbpBntfOChEspC4E3SSbI1+VunwjKB5PalovtvzyqKZ7iKAE
         8rVRdGFwIopBlDSgXcJ+aRxfgXQ6iPvR2NDjMYWwPItV+5fvRo9uaicStIcOYkpSbARV
         Dbv+Opbobpa0lz//P0nOIJQVwCokYXSAcOGHhCQttJM3rcANwJnNZ4gBz9XPffrkXaQM
         4lkPIYidZ7JlviAdUldxCO4pSWie7BtU1sgR5ZatuwtL9NY4Hw05518VNDYSrlMWiAZw
         czCqfpwPxI4mEp7fFXYZB6ovZiTpLYRdaY+Fy+BjNVxEetr5ojUo5C/+Yo3rdT/lE9WA
         yR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456226; x=1793061026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KE72+aAwlXuXw+iE9EZfyt6L/a7/zE+qAkJnNkpGgk=;
        b=e4DnnNQZSetTv9cg3CBvibRnrBqBpDj2QxOyfPX0/A48vuTCLzxUmojbH5lZTvfB8M
         LivxorVMljaB7zLdMo8bG8TGnMq8uZit1QuDc5wkDBC6xQ6wImcjiIkF75d5QklCs5+V
         uJVVjGlYnfX8VO+ZxylIjq0XNo6uamFlDs6Vx3QG9pEVJpz/9fFj7bF7x5RKy5VPKcEp
         cKAk91gx30wU55r/YTJzUPgREgxUcL/6yUPMavtTrsIIgrZrHplaJZJez4ohxGwEgxFd
         +7Co0zX5acCVnQyJ7pk6ACbx6k9H5kXo3o1tnpCAKsLJJJH+plt/nc0wIejhtqxqqrNb
         iAcA==
X-Gm-Message-State: AFq9FYKmb+kVmAjbUOAAvKc3PiFRqjdmC2hUcWTiuMRPuv0cigWnITIo
	RVUaNRNr3jYVk2CJ/lp+n4ScMlo7NB0pvnN/QabPhDC44HKewH4vrG2r3xBKr1FSTDI=
X-Gm-Gg: AYBFou17bdte9bgkAJBbxJOw81I4V2YsZ6nqxtcfBpaghvHuhgCIZPHjNxoclrvqJCA
	5PufK30ZWAQy3qPTuNg5vP0ugi+rJfiurdSOtv565NgZYB2GXoS70KsY+LM1YqrndG/a4R7Xql5
	oXyKd3uyDX7sfGvjmzld8lbyieI5e3ssa3uvp/SIX6ovCLzfStcv0bgnbhDva3xY5ZtNO6xbPcr
	wuCbTc6xoToZ1hdshJCjXufAObd4mEZUnlL4s9jVgKqpST9Z7aMMXcuc8cJu/eWssgbbZoIfLPi
	lnK1WXeAItfmsV1uaH5sC74KFtIUTtjcFt7mf3k/tp7rFaWm9g/15phMSz+I91DbG2LyzsKvEVE
	Zra8dMG3RG/+Eu/arKIwStbmzC7HvVyasZ/zntu1h+POQ026SvOPptf4L8GjNZj9NTgd50BaW2X
	MYBix+cXUb2Wt+Xpu80JzUPbyNDfklzTfcBsvHHbU1IRwqq008e0lnqbkby9eLPFAQL0HZvJ4qu
	R/QdAGBmTi2lntzMhp5U2MEyhv3Ds3gnD7d6yqCrqWSVb1f63UYra3ReYyFlW1j21b/umpdKh2h
	a4oG6FL4QRtk/gzoWnQZ/kyQ3puuyEOb6434YNPuyxvivxmRgl6L6VsVxJsjnDrCx8sfTSx0Tlk
	+8IBrqUfBo8qTx01/GTOQjWZ1estuRHThZjWkcWceoh+peyy/WJ4dAFkdcqGo02tzuIvCORDjMz
	DxklfwQXgQ0RU6FvgHsmsgAvnNZ3/5pexypeaq5uL/fApIsoNs7dK6eFeV
X-Received: by 2002:a05:7300:e5c2:b0:352:4f11:8118 with SMTP id 5a478bee46e88-361a3813baamr13365903eec.40.1792456225538;
        Mon, 19 Oct 2026 17:30:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm35596579eec.13.2026.10.19.17.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:30:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 1/5] mutter: Fix build without remote desktop support
Date: Mon, 19 Oct 2026 17:30:18 -0700
Message-ID: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 00:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131147
Content-Type: text/plain; charset="utf-8"

The clipboard session is always built, as input capture uses it, but
the remote selection source it calls into was only built with
-Dremote_desktop=true, so libmutter failed to link with the default
PACKAGECONFIG:

  ld.lld: error: undefined symbol: meta_selection_source_remote_new

Build the remote selection source unconditionally.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ection-source-without-remote-desktop.patch | 42 +++++++++++++++++++
 .../recipes-gnome/mutter/mutter_51.0.bb       |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/mutter/files/0002-build-Build-remote-selection-source-without-remote-desktop.patch

diff --git a/meta-gnome/recipes-gnome/mutter/files/0002-build-Build-remote-selection-source-without-remote-desktop.patch b/meta-gnome/recipes-gnome/mutter/files/0002-build-Build-remote-selection-source-without-remote-desktop.patch
new file mode 100644
index 0000000000..094270536e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/files/0002-build-Build-remote-selection-source-without-remote-desktop.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 17:50:00 -0700
+Subject: [PATCH] build: Build remote selection source without remote desktop
+
+meta-clipboard-session.c is built unconditionally, as input capture
+uses it, but it calls into meta-selection-source-remote.c, which is only
+built with remote desktop support. Linking libmutter with
+-Dremote_desktop=false fails:
+
+  ld.lld: error: undefined symbol: meta_selection_source_remote_new
+
+The remote selection source has no remote desktop dependencies, so
+build it unconditionally as well.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -345,6 +345,8 @@
+   'core/meta-selection.c',
+   'core/meta-selection-source.c',
+   'core/meta-selection-source-memory.c',
++  'core/meta-selection-source-remote.c',
++  'core/meta-selection-source-remote.h',
+   'core/meta-session-manager.c',
+   'core/meta-session-state.c',
+   'core/meta-sound-player.c',
+@@ -470,8 +472,6 @@
+     'backends/meta-stream-window.h',
+     'backends/meta-stream.c',
+     'backends/meta-stream.h',
+-    'core/meta-selection-source-remote.c',
+-    'core/meta-selection-source-remote.h',
+   ]
+ endif
+
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
index 66a4666c55..4213e2cc06 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
@@ -35,7 +35,9 @@ DEPENDS = " \

 inherit gnomebase gsettings gobject-introspection gettext features_check

-SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
+SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch \
+            file://0002-build-Build-remote-selection-source-without-remote-desktop.patch \
+            "
 SRC_URI[archive.sha256sum] = "5d28f3ae225692428fcafb96500d673f34328b698b86960c9c1460d0b1d983b3"

 REQUIRED_DISTRO_FEATURES = "wayland polkit"
