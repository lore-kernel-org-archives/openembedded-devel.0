Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260DAC28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 22:22:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.19288.1742077343505297689
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 15:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=taIqSARV;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so9239795e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 15:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742077341; x=1742682141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csJHm7hlR9Wa+BJ0BRZPsHbMM5FSzHJAEYbNgQTKRDY=;
        b=taIqSARV4AhR/2hx4USpEJFiGSoM2i9Xw4cisyjb0ockNSHCPIVGWbxP/WOG1AzWj8
         PfYQI8yU/EldqFGblFlHFuzJvifWGDSpxPZNb2hvx7xhBwvWGZ5jOeDh56AQVy42tl8F
         5A6tRSOE/EsAaf6BEL401YfVIkOFyz8KKtq1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742077341; x=1742682141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csJHm7hlR9Wa+BJ0BRZPsHbMM5FSzHJAEYbNgQTKRDY=;
        b=cJBmEoViql/EdAV1ZVaELFuc6sbWVy4ozM0mjklKHMiMl3AP/yxPLMrSg7UlFTbZG9
         lYf/XqSGKciSWJVjQA/0VCMyGchH21trOwx6Hfhs6HldI20AbZ37qacTEPaLJOeQgAV/
         qQxUI6ZoCj05moYhVuBBwWT8lJ5D8IqtR+kZt2ynFX8YVp3K+s73qchHHwVHgCRjn67W
         b4VtMtbnYjiaGF6AdYs6+8el4Cuy/0bPc4GuR1vYo9Z7Lf+nV8lQ0EZvtZO+bI/j9I/E
         yoFNKmoM5v9Ql2p5SrJITuOr06zm2b4S13PZW8iMLN9UO758zfJBYMn6V/5F4juAyzVd
         iBHQ==
X-Gm-Message-State: AOJu0Yw+DIWaHkJ2WzBLPQDtkH0/epT+2NoyFI97WKW9IrrjDOjHJEvG
	NqH1dElpy4aXcYxZ7vLzYxFWgLZ7pP7uisEH3/tjZfhMJX16u5H56ePwOpu+yrP5mK1Y4V/07Nc
	6
X-Gm-Gg: ASbGnctXF4OiKz+ica8kO8gp/7+EgqsXJEdiTrEr+8c2EVxzIOvoGJbNFBw3KiDhPm+
	oudYJ2sQrKTy094Ci8fgHwEX6IX4+8zV/Lai1Z+PEjRYf31X2TRdAy379LyVPK6F1CzQ856h4nP
	+dgXZGxa+mrIIow0vN178dmVfNorHkh1NbqRzmB4zfM2yckqs5P93195bkzVlIjqIqsxL+6gUfY
	KikQ/TebiRRyHnRkdhlA/6KB9zPuSVJBuvPxFiAWUh1KABljSTaQU6S1/nSeFD/Zqf1V8d4Wv10
	p6PWQDmmMiTjja2jsG9h/Zh7beQJ+8aerEOdgZcQ47OeCiMT3TizWW8M0C6FPwuCT3brEzDXiNe
	BRWT5mg4JEWgkpM4wJaUpD2xaNdO/0gs27TnGYHkZ3h5gr4ZqYkQ=
X-Google-Smtp-Source: AGHT+IFkTgi52r/6+RdSvi5A5kNNm7KD89gXQd+G8cysCIfDJLz5wO5im7iwbB+NwI+7v9lKRu5wpw==
X-Received: by 2002:a05:600c:4fd4:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43d1ec8e682mr81903515e9.18.1742077341185;
        Sat, 15 Mar 2025 15:22:21 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc3ee7sm60989165e9.19.2025.03.15.15.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:22:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-multimedia][PATCH] pipewire-media-session: Fix for incompatible-pointer-types build errors
Date: Sat, 15 Mar 2025 23:22:06 +0100
Message-Id: <20250315222206.2778609-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 22:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115997

From: Yoann Congal <yoann.congal@smile.fr>

Backport a fix from master branch to fix these errors:
| FAILED: src/pipewire-media-session.p/access-flatpak.c.o
| x86_64-poky-linux-gcc [...] -o src/pipewire-media-session.p/access-flatpak.c.o -c ../git/src/access-flatpak.c
| ../git/src/access-flatpak.c: In function 'object_update':
| ../git/src/access-flatpak.c:117:62: error: passing argument 1 of 'pw_client_update_permissions' from incompatible pointer type [-Wincompatible-pointer-types]
|   117 |                 pw_client_update_permissions(client->obj->obj.proxy,
|       |                                              ~~~~~~~~~~~~~~~~^~~~~~
|       |                                                              |
|       |                                                              struct pw_proxy *
| In file included from .../tmp/work/core2-64-poky-linux/pipewire-media-session/0.4.2/recipe-sysroot/usr/include/pipewire-0.3/pipewire/pipewire.h:15,
|                  from ../git/src/access-flatpak.c:35:
| .../tmp/work/core2-64-poky-linux/pipewire-media-session/0.4.2/recipe-sysroot/usr/include/pipewire-0.3/pipewire/client.h:191:71: note: expected 'struct pw_client *' but argument is of type 'struct pw_proxy *'
|   191 | PW_API_CLIENT_IMPL int pw_client_update_permissions(struct pw_client *object, uint32_t n_permissions,
|       |                                                     ~~~~~~~~~~~~~~~~~~^~~~~~

| FAILED: src/pipewire-media-session.p/default-routes.c.o
| x86_64-poky-linux-gcc [...] -o src/pipewire-media-session.p/default-routes.c.o -c ../git/src/default-routes.c
| ../git/src/default-routes.c: In function 'restore_route_params':
| ../git/src/default-routes.c:482:29: error: passing argument 1 of 'pw_device_set_param' from incompatible pointer type [-Wincompatible-pointer-types]
|   482 |         pw_device_set_param((struct pw_node*)dev->obj->obj.proxy,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             |
|       |                             struct pw_node *
| In file included from .../tmp/work/core2-64-poky-linux/pipewire-media-session/0.4.2/recipe-sysroot/usr/include/pipewire-0.3/pipewire/pipewire.h:18,
|                  from ../git/src/default-routes.c:43:
| .../tmp/work/core2-64-poky-linux/pipewire-media-session/0.4.2/recipe-sysroot/usr/include/pipewire-0.3/pipewire/device.h:179:62: note: expected 'struct pw_device *' but argument is of type 'struct pw_node *'
|   179 | PW_API_DEVICE_IMPL int pw_device_set_param(struct pw_device *object, uint32_t id, uint32_t flags,
|       |                                            ~~~~~~~~~~~~~~~~~~^~~~~~

| FAILED: src/pipewire-media-session.p/access-portal.c.o
| x86_64-poky-linux-gcc [...] -o src/pipewire-media-session.p/access-portal.c.o -c ../git/src/access-portal.c
| ../git/src/access-portal.c: In function 'set_global_permissions':
| ../git/src/access-portal.c:268:62: error: passing argument 1 of 'pw_client_update_permissions' from incompatible pointer type [-Wincompatible-pointer-types]
|   268 |                 pw_client_update_permissions(client->obj->obj.proxy,
|       |                                              ~~~~~~~~~~~~~~~~^~~~~~
|       |                                                              |
|       |                                                              struct pw_proxy *
| In file included from .../tmp/work/core2-64-poky-linux/pipewire-media-session/0.4.2/recipe-sysroot/usr/include/pipewire-0.3/pipewire/pipewire.h:15,
|                  from ../git/src/access-portal.c:39:
| .../tmp/work/core2-64-poky-linux/pipewire-media-session/0.4.2/recipe-sysroot/usr/include/pipewire-0.3/pipewire/client.h:191:71: note: expected 'struct pw_client *' but argument is of type 'struct pw_proxy *'
|   191 | PW_API_CLIENT_IMPL int pw_client_update_permissions(struct pw_client *object, uint32_t n_permissions,
|       |                                                     ~~~~~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-pass-right-types-to-methods.patch    | 53 +++++++++++++++++++
 .../pipewire/pipewire-media-session_0.4.2.bb  |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session/0001-pass-right-types-to-methods.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session/0001-pass-right-types-to-methods.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session/0001-pass-right-types-to-methods.patch
new file mode 100644
index 0000000000..e7a3e52617
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session/0001-pass-right-types-to-methods.patch
@@ -0,0 +1,53 @@
+From 97e0d7646c873ea3badfa604b3f084ed6208af97 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Tue, 26 Nov 2024 13:37:06 +0100
+Subject: [PATCH] pass right types to methods
+
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/media-session/-/commit/e6243381cf2b7d0d33707627b4186f5580908752]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ src/access-flatpak.c | 2 +-
+ src/access-portal.c  | 2 +-
+ src/default-routes.c | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/access-flatpak.c b/src/access-flatpak.c
+index afe780b2d..dd802d6eb 100644
+--- a/src/access-flatpak.c
++++ b/src/access-flatpak.c
+@@ -114,7 +114,7 @@ static void object_update(void *data)
+ 		pw_log_info("%p: flatpak client %d granted 0x%08x permissions"
+ 				, impl, client->id, perms);
+ 		permissions[0] = PW_PERMISSION_INIT(PW_ID_ANY, perms);
+-		pw_client_update_permissions(client->obj->obj.proxy,
++		pw_client_update_permissions((struct pw_client*)client->obj->obj.proxy,
+ 				1, permissions);
+ 		client->active = true;
+ 	}
+diff --git a/src/access-portal.c b/src/access-portal.c
+index 92d95a26b..4e3a9f52a 100644
+--- a/src/access-portal.c
++++ b/src/access-portal.c
+@@ -265,7 +265,7 @@ set_global_permissions(void *data, struct sm_object *object)
+ 		permissions[n_permissions++] =
+ 			PW_PERMISSION_INIT(object->id, allowed ? PW_PERM_ALL : 0);
+ 		pw_log_info("%p: object %d allowed:%d", impl, object->id, allowed);
+-		pw_client_update_permissions(client->obj->obj.proxy,
++		pw_client_update_permissions((struct pw_client*)client->obj->obj.proxy,
+ 				n_permissions, permissions);
+ 	}
+ 	return 0;
+diff --git a/src/default-routes.c b/src/default-routes.c
+index 5a842faf7..86f9e217b 100644
+--- a/src/default-routes.c
++++ b/src/default-routes.c
+@@ -479,7 +479,7 @@ static int restore_route_params(struct device *dev, const char *val, const struc
+ 	if (pw_log_level_enabled(SPA_LOG_LEVEL_DEBUG))
+ 		spa_debug_pod(2, NULL, param);
+ 
+-	pw_device_set_param((struct pw_node*)dev->obj->obj.proxy,
++	pw_device_set_param((struct pw_device*)dev->obj->obj.proxy,
+ 			SPA_PARAM_Route, 0, param);
+ 
+ 	sm_media_session_schedule_rescan(dev->impl->session);
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
index 8ae0624135..184ed45d2d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
@@ -10,7 +10,9 @@ DEPENDS = " \
 	dbus \
 "
 
-SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master \
+           file://0001-pass-right-types-to-methods.patch \
+           "
 
 S = "${WORKDIR}/git"
 SRCREV = "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"

