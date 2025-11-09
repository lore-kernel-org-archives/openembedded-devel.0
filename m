Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC357CCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27283.1762704022989490607
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GFAIwN9s;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so5615555e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704021; x=1763308821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/KHzCXsnSWjNh5zprtiYQEWcxgFzcRInIcRJgyv11k=;
        b=GFAIwN9s2Qc25FuacRera3YTEkoubdCqpLPLxcxZsmVyLZhVJtfBz/aanM/ci0v4V7
         oZPbB355odQKcoC74ARVj2O73mFbCQhxE/s+J6Ss0Ndvk4sl+XQt+xPZX/0wDFLoPACZ
         k3dEPTxkf0xhY7j0IHk8NMhWfdonE/eROe2Cu925rDABpkFzJYxy8ndxM0vinl+fKdNF
         1DWfO5baNpH7JZtw4waSRnKdfWqsm8FN1Z8KXr3FHkyS4dKOTY00c0K7bd5YfbclLQI2
         ipC5B8fA0hwb9aNf6g8OOqEZWfEPPsd5vZrkKRMPnSaCwJ6SUlkgm9p2bbEV0mFEAVCI
         AqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704021; x=1763308821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/KHzCXsnSWjNh5zprtiYQEWcxgFzcRInIcRJgyv11k=;
        b=Drv//BMhL8KnCqKuNOJk3BOXWYJDLRuxYZiTKSGdShhgRmY1ItLMpa5O8n68vBjbHB
         XsI9+enxW6deNVUuT0ZWrvHsrRctcQ7VlBSt1Q7iH5sTSvUhF0Msr4Y8f/z04jh2HHk0
         K0VfsyhptIwRRTp4vdIhNxTMvo3/Vslns1y9irGQ4v0/d2xP6XmmftcgwcwT3r7/j/Pe
         QwZqOYEKfym97gxZ6usUlPGDDDhVRngu3uCkbAhHHunSEVKzvYvQPPUvuNpKpnnfncYQ
         7++kPyM9Nq6InaGl5O7xf2prBTSwn6Yae0QQTgBZmgftbGKzKvKFAsj6QYE7Wa/m3kum
         Dhcg==
X-Gm-Message-State: AOJu0YyytvZV66QPP+xYBqGTvOWyGLEX9xhx4xaN7bO+UdwSoh2VTdhs
	QqTUzK+XktMbF3xcZznqM5CwduT9o4ErZlPAaz8yaH4sVAtldPx2K/BvEOIW4TlC
X-Gm-Gg: ASbGnctIsOQPpXoF1bnTkSa3EjYE9Yp+7I7W9FiaTY7whDhzcv5nikAAvSI0fMT9XKO
	JrqTxtbt6RSl1CqbKCL7CweZJCzojrIzoyFjX91nzrjWDLpsELrsWIu5oGouMP/0D/djb6bsV0D
	cZxcsfoFx+VZTDmoz2fOUNIVHdWIhgW4F/W6E9eBW+PWGUck5psIqVLuwN/ZfLvzGJEZn1QQBwH
	GofmZupmhYv9gQYmqUiWBfG5l+c6IPpl9e+dTNMERnpA1algqb3sm0C9J415ccVkhj4D14IUk9f
	dUK8ez4MSq9QndWwjyx0qfQaFI7ERyIu44johTCEAU06sPdtIcyo+iXs2+8n9ag4GieO90xKFyx
	RWXBSdDURW79OIqYmwaWoY6VWbc0Fec/7YmVNlMGfnPZsn3RM6zqV86ZeV8WMbsREPN1nCyxzaX
	j2X8YUFnN8
X-Google-Smtp-Source: AGHT+IGzE9O96tlAThEg5R7cyHj8ySYa0Z4XmE8F54Vr68pkGIkQBC9FeNMStRSOkVrlFTCeSMrV0Q==
X-Received: by 2002:a05:6000:2d0f:b0:42b:2e94:5a94 with SMTP id ffacd0b85a97d-42b2e945f7fmr3517218f8f.29.1762704021101;
        Sun, 09 Nov 2025 08:00:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 01/27] pyxdg: update SRC_URI
Date: Sun,  9 Nov 2025 16:59:53 +0100
Message-ID: <20251109160020.2522353-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121417

The previous repository was moved to freedesktop's gitlab instance,
and was causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
index 0c9599a49c..4af1858d42 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
 SRCREV = "1d23e483ae869ee9532aca43b133cc43f63626a3"
-SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/pyxdg.git;branch=master;protocol=https"
 
 inherit setuptools3
 

