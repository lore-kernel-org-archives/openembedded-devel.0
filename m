Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C59C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:00:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.21067.1738335646393623671
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 07:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhIDFul6;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso13260695e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738335645; x=1738940445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsH/a+sAUkoNlJytmRbUiKIOA63fRQcoGqKfGStFWLo=;
        b=FhIDFul65L5woR2aUuV2phRuvciLIIUkAfYm0goEHbXJdE6Hi721dNdebjVZzzBsyc
         B4UNZT+KAx2wLaG8migA9YIeC5ozgVQnFw1X/LYtu/nILbWlpP55lIeJJcyvyXSTTTZV
         wA26Kak0bdn+mq68rhE1Xs39zePGUkRroqif3qBHywC/4wQ+3LgeDxT+zat1t43LXpVl
         X8rDbMLi7gATncAVwFVNJYJHrOMWYz30tfkc6QjVWj4UxMvpzZjVXBhgSGJe3jkh/U4e
         4irBCAV0pqW7gKstgCSZLMLAs+Rg55p5+JhRk4IC5IALUJ6vQZ3Lp+3pSFcyvObWmv37
         /s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738335645; x=1738940445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsH/a+sAUkoNlJytmRbUiKIOA63fRQcoGqKfGStFWLo=;
        b=svwWu8dOziMKz4bKLW9A2DhX4Ig3XW5GwFDAw5+u1iJxJZw3lTJ5wbVxckVjFclP0o
         nJY5oeWRQlgJDqAEpIBJktCRV8kkhc540MS/KFj1h7VwRbElklH9w1cp8AfhCpAua2U2
         Z+Og9tcQER9gYVpZQV08mFbK3PSLRgaU5gzwUqz50Y1LJZCnIQIiDtGWRtRQl8yTEj6/
         d48mxeDWRiIvKyjSviBZnldC5GjENXAEj9bF72Buo/DSxqC3eSxcgdW5mZYxvU12BExI
         4WwDVRWs3ZKz0Hq9yyNFE3N5WyJJYKHecsxUuAPcEPdvaG+6UzcSYyLLBbr7+RsmIBeF
         Gyaw==
X-Gm-Message-State: AOJu0YwQ0AHtNeB4nagSYNKonEiR5GCeU3fk3cPt21rgwWkWgSdAJKXu
	Z4j9savpSyRLy5VJsj3stmc3mqkZIs4rtg4lCOUaDTW+MTJgp1xeJ+0Kxest
X-Gm-Gg: ASbGncuS6OLc5Jw3Lh4mjwcGpv8xMI8vpg+sHSxU+5mCxwscdjsHHjP8xr+4O8nOaOL
	ylvFiIEbKvGZnVV/6YyY6Kue9n1dPN7mMBUDiBvgr0uGJ4Zd9X4Oc6Fr7UcPgkM3/SPGEdIPWaW
	vlCd4dPbV5dsWO+yIGHPN6eH7s0/Zpoyl8D+pgdbRKH93IICrHeUeUATHAUVy74SIt12CH07+Ph
	H83eKBS4EeQ+p17CrnLqaGR+ICj0HyEzwhqCX1xtbVOotcnBGQLVRfuDCD6HHiqUiiTztKpJ0EG
	x5qiudgk+3W6W2TnyuCEwHSGZusMohU=
X-Google-Smtp-Source: AGHT+IGcy2E/b90+0B/Y/Lb8cmEFbhilOIHWvqsJ1pXBUUvO5TiEbd3Barwz+tGJufgKnDusBDax8Q==
X-Received: by 2002:a05:600c:83c6:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-438e170e7b5mr69063425e9.15.1738335644067;
        Fri, 31 Jan 2025 07:00:44 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ecc9bsm4825646f8f.2.2025.01.31.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:00:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-multimedia][PATCH] pipewire-0.2: drop old version of recipe
Date: Fri, 31 Jan 2025 16:00:32 +0100
Message-ID: <20250131150032.311085-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 15:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115198

pipewire-0.2 (which is a pre-pandemic version of pipewire) has been
kept around[1] to satisfy the dependencies of mutter (< 3.36).
Mutter has been updated to a version that doesn't require
this old pipewire more than 3 years ago[2].

There is a much more newer version of pipewire recipe available
in the same folder, and it seems there aren't further recipes depending on
this old version.

[1]: https://github.com/openembedded/meta-openembedded/commit/5200e029ea4f853f83b0c0884af5f6d9626b78ea
[2]: https://github.com/openembedded/meta-openembedded/commit/7cd570b486074d5876eae9fd48232694939a3e64

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...n-idle-Include-time.h-for-struct-tim.patch | 43 ------------
 .../pipewire/pipewire-0.2_git.bb              | 66 -------------------
 2 files changed, 109 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch
deleted file mode 100644
index ce381a78b..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2/0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b1d911fdab4a583f276d18395037d90bfc305109 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 May 2024 18:12:23 -0700
-Subject: [PATCH] module-suspend-on-idle: Include time.h for struct timespec
- decl
-
-This is flagged as error with gcc-14 on musl targets
-
-In file included from ../git/src/pipewire/loop.h:27,
-                 from ../git/src/pipewire/core.h:44,
-                 from ../git/src/modules/module-suspend-on-idle.c:26:
-../git/spa/include/spa/support/loop.h:184:37: warning: 'struct timespec' declared inside parameter list will not be visible outside of this definition or declaration
-  184 |                              struct timespec *value,
-      |                                     ^~~~~~~~
-../git/src/modules/module-suspend-on-idle.c: In function 'node_state_changed':
-../git/src/modules/module-suspend-on-idle.c:110:69: error: passing argument 2 of 'main_loop->utils->update_timer' from incompatible pointer type [-Wincompatible-pointer-types]
-  110 |                 pw_loop_update_timer(main_loop, info->idle_timeout, &value, NULL, false);
-      |                                                                     ^~~~~~
-      |                                                                     |
-      |                                                                     struct timespec *
-
-Upstream-Status: Inappropriate [Fixed in latest pipewire differently]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/modules/module-suspend-on-idle.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/modules/module-suspend-on-idle.c b/src/modules/module-suspend-on-idle.c
-index e5c1fcb30..4dba3be71 100644
---- a/src/modules/module-suspend-on-idle.c
-+++ b/src/modules/module-suspend-on-idle.c
-@@ -20,6 +20,7 @@
- #include <string.h>
- #include <stdio.h>
- #include <errno.h>
-+#include <time.h>
- 
- #include "config.h"
- 
--- 
-2.45.1
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
deleted file mode 100644
index 7c8afd3d5..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY = "Multimedia processing server for Linux"
-HOMEPAGE = "https://pipewire.org"
-SECTION = "multimedia"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=d8153c6e65986f862a0550ca74a3ed73 \
-    file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-"
-DEPENDS = "alsa-lib dbus udev"
-SRCREV = "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
-PV = "0.2.7"
-
-SRC_URI = "git://github.com/PipeWire/pipewire;branch=master;protocol=https \
-           file://0001-module-suspend-on-idle-Include-time.h-for-struct-tim.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit meson pkgconfig systemd manpages
-
-PACKAGECONFIG ??= "\
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-    gstreamer \
-"
-
-PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
-PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
-
-PACKAGES =+ "\
-    ${PN}-spa-plugins \
-    ${PN}-alsa \
-    ${PN}-config \
-    gstreamer1.0-${PN} \
-    lib${PN} \
-    lib${PN}-modules \
-"
-
-RDEPENDS:lib${PN} += "lib${PN}-modules ${PN}-spa-plugins"
-
-FILES:${PN} = "\
-    ${sysconfdir}/pipewire/pipewire.conf \
-    ${bindir}/pipewire* \
-    ${systemd_user_unitdir}/* \
-"
-FILES:lib${PN} = "\
-    ${libdir}/libpipewire-*.so.* \
-"
-FILES:lib${PN}-modules = "\
-    ${libdir}/pipewire-*/* \
-"
-FILES:${PN}-spa-plugins = "\
-    ${bindir}/spa-* \
-    ${libdir}/spa/* \
-"
-FILES:${PN}-alsa = "\
-    ${libdir}/alsa-lib/* \
-    ${datadir}/alsa/alsa.conf.d/50-pipewire.conf \
-"
-FILES:gstreamer1.0-${PN} = "\
-    ${libdir}/gstreamer-1.0/* \
-"
-
-CONFFILES:${PN} = "\
-    ${sysconfdir}/pipewire/pipewire.conf \
-"

