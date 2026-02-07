Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341DFEE0AE0
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3908.1770467013780999233
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/1rCDI+;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso30997955e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467012; x=1771071812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cVMEO7JrdlJ6x827r4P7KvI2QE2zYKKjE1DHdej97A=;
        b=Y/1rCDI+bXKQTPeJkp8y+LS6ljib1R3rKq3vNXMACI7CZmaBasF1HwNO4qWlcYTpI8
         PjnxGSViDlcYl/kxoI0b+i4uJG7ktmgd1g8Clw/wWmgvCBgcXODOuQTPsh2LwEu6bYAr
         9HINrEcojkNHcJh5l7JJJ5pa2Qlft3w9dysxhCGHTON9V7fQ0gSTvHqRFJitGYs547S8
         EbVILW73aSak09R0m7IHl75ipr0AVIt5ocoYaldApV52B+HhFPh6eTsTChmEUj4FzsR8
         iGNCPy7H3EVCP5ZlrcvsgN83uPN0ChDNG6qmvs4mYz/th4hdVh3UV2g5sMHQdRUARzec
         NU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467012; x=1771071812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+cVMEO7JrdlJ6x827r4P7KvI2QE2zYKKjE1DHdej97A=;
        b=I9bwfPpQxqJmknrsfAZ+kdNOYaWgRHEz+GZKmvuNTCxsJQB2m3gQN07j6vNnPCxi79
         LsWTXds8Cg7RBpI8kxphHVBkY9BiFV6Z3G0DY8cZ9Xla02BCESQIUxR8F9R/OJYqBOC8
         TTN8vAbdtkM9vFdIg73us3WAuVeeJtOpnhOiUbGe/6NEDrM8N9rcJl1+f+75NhdfToZr
         hVoffeOe56B7+FVCDZRkDzGKfxHuDUzO3KhEy+07QomGy+g/aYvj+fqYZStsm4SS23nZ
         fQOSUaz+E5WqGsWHlwf0uOzVGlYjDqLiHiHPrg4j/HTqnMc2iP2nvIrDq7dlV9+lVmKO
         WeBA==
X-Gm-Message-State: AOJu0Yz/i0Q4c069WAEvS2o44ckc0fNQsUffCbCshZtIZEk/VFfEPUvc
	LLa4SD1+2JJJD5e7rcLrO+mr6wt5FdjleVeptXG5luszDsixt/ddEeD995KhiA==
X-Gm-Gg: AZuq6aKCVqnUNqibUbhujfrT+ivqQOo5ILGIqk+tM2+LLW4Zn2eiKhWNs915+ID90CO
	KzzZLKQwY7kFrQ63mVW9IL5lGyl01u+71YuOpqXBWkmDyYkTQn3uARboUcICuJjNK6LF6pK1lib
	+LaotZbX8iqnKEVYwIZxGdn2CVxkE0+ppalabG9E0uOfjSLCAC1OF1EGmF4PRM1wz2ICy1ekx60
	vXfYNqwa/xJoJxUnSa2xrX3Pft58fyoYmDRn9E1TOWw3KAUQJ6wUN4b2TN031d6jYWtHpzZ/eSn
	Y1r2lsM/KwMduSkr3N4fIYaqCZRToi5/8wh6XSEIxhAKrntjxzQqXLHBvpD0TyQsD+2OElFZDiX
	4ZfttbVyIRxCoKq62k5pUKe9+UNo/6vBOSufHfNSFWDlCZIXRYRcoUiXTSHp4/iA8RhCLwezqTa
	3IvSiQBO/I
X-Received: by 2002:a05:600c:628d:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-48320216d31mr77009305e9.23.1770467012019;
        Sat, 07 Feb 2026 04:23:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 06/12] gdm: add missing json-glib dependency
Date: Sat,  7 Feb 2026 13:23:21 +0100
Message-ID: <20260207122327.664604-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124262

From: Peter Marko <peter.marko@siemens.com>

Fixes do_configure error:
| Run-time dependency json-glib-1.0 found: NO (tried pkgconfig)
|
| ../gdm-46.0/meson.build:64:12: ERROR: Dependency "json-glib-1.0" not found, tried pkgconfig

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97eaa95cf36ab224047650e5fea58cbbf5bac30d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_46.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_46.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_46.2.bb
index 97afd37304..d644f12cf9 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_46.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_46.2.bb
@@ -7,6 +7,7 @@ DEPENDS = " \
     audit \
     dconf-native \
     gtk+3 \
+    json-glib \
     keyutils \
     libcanberra \
     libgudev \

