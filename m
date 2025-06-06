Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B714DC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:58:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.35606.1749221914159626780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnm58kTL;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e3c6b88dbso15951707b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221913; x=1749826713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBcBbyH15ZxCViOOICDqw/7YYVZ0HCzhxVrf5n8iiUw=;
        b=fnm58kTLCJCzrdBCMaK1kcs3GJ5b2yeQfkBiMMhYT2EFHl4JkJPoGALU5LsNn5BEwL
         /JqrvCvTvKBbOkc6cJZnOjTDzW4+Q0H7WkRH5fV9NoAwrLT5XQDrsRvSkUwtGjykIPQN
         TzorOUX6Jk4c+2NZRrbB6u58DJtMaG+rniyrz7P96PVvJbTG2NOBTGokhyrJEFGlfOpV
         mBPzly+KJcTvIewNQHWlegcnJa39iQ4Xs8yXa0jiJ6oi4z5ks3ZRUefIfkXybcw6x98E
         Pwq4CUIiDDg2e+68O1FCGLsDsKMfB3ZOz8E2k1hulhAI7brIzurQC+cpCty3A9KgbIQo
         /ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221913; x=1749826713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBcBbyH15ZxCViOOICDqw/7YYVZ0HCzhxVrf5n8iiUw=;
        b=Xb/iQ+oLkBTQMAgh/uv24kWirH+SEkPHUUQoWblMCVpuYPlbD92Fa2yawP7QmezCEh
         LCSChp3vvWcAepaJqBoGE6Nnrb8YE+u6kxAKS8oGdyL/Mt+Dxe0976Rh5biw1i+27C1R
         ySQ6TXYWVDSkHuv4CcNMLJhH6csTm8DucRFULo7nDJqCiM9CGq8L71YpQ10jHG5y2M0Z
         wAwqKgJCt2AxcmnXQku12zkcvHtBL0ygLqWZhvXw6G8r16n1kTzqwsgI2SHTrcDeFP2I
         17ccQHv7WUx25v9Tn+tRvdPEvkImDw8gQ8rmkk0iXWOnrVtfOLoS0laibqDTdU0iDWLv
         7Cgg==
X-Gm-Message-State: AOJu0YyIlKOWznym2HW8SENL/8dOH8KWI0KYLkk3333S8TTQ7fN8zHZx
	7cQTjE/8LoV5pY9i9GeKs+LP7IP3cE8pAaDMqGx55v6OYt7/P7ewNxLMAOyxP48v
X-Gm-Gg: ASbGncub6dpB9HJFmFc6doxePpqxmHb2nGLGNmdM+WP8dnwr+TR63ov+IUbivPki71A
	zLGBRZ7xWYZCG9izV+l6Ql6OGotYXalaPoMAd17FvgyWpGHGiAIMrBTAdjZS0uR4VWVehoddIQJ
	n/6LpuLHhjb7mfpcLJzje67v48/g+rFYYOOX/tVlSUX2yFCLNrZOBfD0C3661p72KUk5G0pZEDY
	IukBW+1yUo5jWKh80J2fpYp2fQlKJKkMN+w5+8e+uk7Co555wk690IcyVWT6+bfZ0zTQusU4PRM
	ojqU6qxthrZVl8X+2SaA/LfxtPo9gRDq8vA5xd7jqW3MRat+7UuntzVQKLnP6zCvgdj3Rw27ORm
	v1qFMmGaIC6wnInXcNEyo
X-Google-Smtp-Source: AGHT+IEWQgnSFRO5nsQMEjVqtj+as53CP2wa4VbqAikXTScHM9k9OnDEmNxvDS0CzvoVdgW9GJY1gg==
X-Received: by 2002:a05:690c:360e:b0:70c:a57c:94ba with SMTP id 00721157ae682-710f76a31dcmr50790787b3.17.1749221912578;
        Fri, 06 Jun 2025 07:58:32 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e80dfsm2831417b3.62.2025.06.06.07.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:58:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/6] xfce4-pulseaudio-plugin: upgrade 0.4.8 -> 0.4.9
Date: Fri,  6 Jun 2025 10:58:03 -0400
Message-ID: <20250606145805.164173-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606145805.164173-1-schonm@gmail.com>
References: <20250606145805.164173-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117768

  Drop 0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch
  It is already integrated in this version.
    https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/commit/35d5172d514e1fb1bdb6718041d0e8c0f70eae3b

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/tags/xfce4-pulseaudio-plugin-0.4.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ow_activate-signature-in-libwindowin.patch | 25 -------------------
 ....8.bb => xfce4-pulseaudio-plugin_0.4.9.bb} |  4 +--
 2 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.8.bb => xfce4-pulseaudio-plugin_0.4.9.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch
deleted file mode 100644
index 301cda7246..0000000000
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 37d718444bc7e6039fb6abf2360b032a91ddc512 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Mon, 7 Oct 2024 09:57:59 +0200
-Subject: [PATCH] Use new xfw_window_activate() signature in libwindowing
- 4.19.6
-
-Upstream-Status: Backport [https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/merge_requests/63]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- panel-plugin/pulseaudio-mpris-player.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/panel-plugin/pulseaudio-mpris-player.c b/panel-plugin/pulseaudio-mpris-player.c
-index 1694b3f..b4582c5 100644
---- a/panel-plugin/pulseaudio-mpris-player.c
-+++ b/panel-plugin/pulseaudio-mpris-player.c
-@@ -291,7 +291,7 @@ pulseaudio_mpris_player_raise_wnck (PulseaudioMprisPlayer *player)
-     {
-       if (g_strcmp0 (player->player_label, xfw_window_get_name (lp->data)) == 0)
-         {
--          xfw_window_activate (lp->data, g_get_monotonic_time () / 1000, NULL);
-+          xfw_window_activate (lp->data, NULL, g_get_monotonic_time () / 1000, NULL);
-           break;
-         }
-     }
diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.9.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.9.bb
index 2cb33604c7..1729ebfb29 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.9.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Pulseaudio mixer for the xfce panel"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5eac6bb0d6ec0dc655e417781d4015f"
 
@@ -8,8 +9,7 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-SRC_URI += "file://0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch"
-SRC_URI[sha256sum] = "bd742b207c39c221e91c57c9c9be2839eb802d1b1ee01a02b7427cd02d3f0348"
+SRC_URI[sha256sum] = "a0807615fb2848d0361b7e4568a44f26d189fda48011c7ba074986c8bfddc99a"
 
 PACKAGECONFIG ??= "libnotify"
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.43.0


