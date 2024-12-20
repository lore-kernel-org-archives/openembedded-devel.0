Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE92E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 06:39:59 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.147223.1734676793208731288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 22:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NViCArRz;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-801c7e6518eso1028455a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 22:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734676792; x=1735281592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vpPYAq5qzmD1yiZx0gUL3wrcd5hXvclVQYuNJxLVskM=;
        b=NViCArRz7DAx6flIqwu8v1wD1nTtoJGKaMYU9vL2yB4L3ryWgVKxxNl/yCFoInQHo9
         8dbmZ7q4jlk1bJBX3rKcVgU2VsLltNg8SXm3zMWdECjtwqAYTdVjMARo0pK6xTN2iTTb
         k9YnZV3RoIXGLkRiphH6k7Z2bOD59V1xFOMR7rb+b+hhsj03t9YdZGiWxODfj7j0ToWf
         8XfWTq0+yll3Tp2uBGqZHSJhrQ/D6UP4ZkcP4ll/fjiBPac+1llPKAIvtgKcdQTkOl+1
         OaAe8en0upPPiKDpZe+wCdbVtr249DuuAD3vp3/iS/4u1WJXiM1GG5Bn11qS8iM8PK/a
         GbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734676792; x=1735281592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpPYAq5qzmD1yiZx0gUL3wrcd5hXvclVQYuNJxLVskM=;
        b=fLJcIXOtJXM1gHdGqqWkmf4gO3cZuJ76TYqPXzEHjS9a7dmyQ8z1fcaTZTjmzonVFR
         rwsgXHR0cty5wicoLqOtWGeTsieb5nhnT5cvuQ7r+0M6VYwQGnd8chDc2/nSs3jS4JP9
         TpM1xbrnrU+QGXtHcDSCc97oBlZCd+MwGUo8w78RGuIwNUVqabyWZBTG5SjvY2ECRavs
         EkrL23aoYUbtk6zbfEciy++hN2Uh+kNeSEA2zwJ7oT3Pt3E+jwDxLI9NEAoxuCwtpSS2
         UCy7GYftD2pEhRuYVO52InzdoqS0WL0SQomRnNjK9sUtFcSnGluJjFgKqxVfLkblUO7D
         9M/w==
X-Gm-Message-State: AOJu0YzG3+BVPsaMAWUzkbR1f0GpYPzN7KAC+sE+17uyDhf0Dx4cnaTm
	qH2rq08veWROHW5pwCymqYw6G5+A2XuoQi9BoA18SI57rMhQWsH5FccdJdvG
X-Gm-Gg: ASbGncueRfAdmhY7j1TZ9jz+aQJ0m2ynSYiuWsQP1OqKXhvFGJb/tOY6ANnywhyVjqA
	Dm09Bqf05xnihnno+B+fpEvQLy6CktaY9N7b40FbLXzsrB7/AAFE+nXOrxEJY9RI4Tq4DuAnz4V
	ndy13GJsC+dmdj3YARKIV8BlnlAVkZZh1EYuxrCZ64k8ldhZ6CqlZOSyqSg894BuP+8OafiWYts
	AL6xLXFwsGmjxuRMRMFrnnSCG+OJFWTdaeVZnncJBbsy/ju7N5vM8mv7g==
X-Google-Smtp-Source: AGHT+IHRUVL5Brg1Zbe/VfersRtl5qaMOeELmoueyRoFQg3cSgY2Bi3GmxPQh9pUQ+WGml7jYylRUw==
X-Received: by 2002:a05:6a20:430a:b0:1e0:d867:c880 with SMTP id adf61e73a8af0-1e5e082f91amr3132725637.42.1734676792200;
        Thu, 19 Dec 2024 22:39:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm2374419b3a.116.2024.12.19.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:39:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/2] xfce4-pulseaudio-plugin: Fix build with libwindowing 4.19.6
Date: Thu, 19 Dec 2024 22:39:48 -0800
Message-ID: <20241220063949.3205273-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 06:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114429

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ow_activate-signature-in-libwindowin.patch | 25 +++++++++++++++++++
 .../xfce4-pulseaudio-plugin_0.4.8.bb          |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch
new file mode 100644
index 0000000000..301cda7246
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin/0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch
@@ -0,0 +1,25 @@
+From 37d718444bc7e6039fb6abf2360b032a91ddc512 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 7 Oct 2024 09:57:59 +0200
+Subject: [PATCH] Use new xfw_window_activate() signature in libwindowing
+ 4.19.6
+
+Upstream-Status: Backport [https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/merge_requests/63]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ panel-plugin/pulseaudio-mpris-player.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/panel-plugin/pulseaudio-mpris-player.c b/panel-plugin/pulseaudio-mpris-player.c
+index 1694b3f..b4582c5 100644
+--- a/panel-plugin/pulseaudio-mpris-player.c
++++ b/panel-plugin/pulseaudio-mpris-player.c
+@@ -291,7 +291,7 @@ pulseaudio_mpris_player_raise_wnck (PulseaudioMprisPlayer *player)
+     {
+       if (g_strcmp0 (player->player_label, xfw_window_get_name (lp->data)) == 0)
+         {
+-          xfw_window_activate (lp->data, g_get_monotonic_time () / 1000, NULL);
++          xfw_window_activate (lp->data, NULL, g_get_monotonic_time () / 1000, NULL);
+           break;
+         }
+     }
diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
index c01b4966f0..2cb33604c7 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
@@ -8,6 +8,7 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "dbus-glib pulseaudio"
 
+SRC_URI += "file://0001-Use-new-xfw_window_activate-signature-in-libwindowin.patch"
 SRC_URI[sha256sum] = "bd742b207c39c221e91c57c9c9be2839eb802d1b1ee01a02b7427cd02d3f0348"
 
 PACKAGECONFIG ??= "libnotify"

