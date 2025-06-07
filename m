Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47959C61CE7
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 13:04:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.18025.1749301432888257437
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jun 2025 06:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xkz+eoVm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45305c280a3so562265e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749301431; x=1749906231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ql2+Wj2uxs4AtfF9Rmr63DoWP8tRe0BYZ14W5qosM/s=;
        b=Xkz+eoVmRl553B1ZZ1wCe2f2MLYF7HtlOjEMRvFpYazOLODZuC2exkHaDY3L1DqrGL
         GexgH+JOANPOBQDABKvmGl9xLslAkPdGp7wa72dqgALU2WHloBnoI7HyuTsvuO6bI49j
         nfRA/4hUS9Tl2kpeUeL5gEb6298JVA82GSPVZTf9FB+Szx7bVgpdpZDHqGeOdDXTUids
         mcjLZecaD+1zrRWf3Lp1hp5hwi76n+/pLWXax0mryU7yiddQ5L78yRFWEC/DDI9bnzU4
         9ooZyfOZYjGdk7c4gfx8g3U/4Vzxl6n4HnvNU11g4ob2vPfgtMCvb+4Y0d8SzZUqY/U+
         rAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749301431; x=1749906231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ql2+Wj2uxs4AtfF9Rmr63DoWP8tRe0BYZ14W5qosM/s=;
        b=spmM75zwyo4hM2l+yLF4j124amYt2bKuzxo/rBq0toCSg9ZmJd1dCZ08/gQnVD+6kJ
         gPFxnDfNddyetVsOhQTyRAYOtw7Fecz5wT+DBc6Fyn5Nov7El2x8M8cIQ3tcWArgCGJu
         bzIGdUXQYTsS7g6OkAl2sr6etdUW5PGWVR1CV32IiZHxSrgwVr/DSqBTWv7Mm1mu2WbH
         1DTrUfHvBESlzkJEX4DwkzM41o44tiW+bZ4Prt+jlAY/YRKqdWmq5J8YfMMB/nVABjkN
         qC/I1GFEVFn5tPgCOaDwPu6p573fQL6FC/mIJq4IOnq6x+JEp4Reh1TEb6Gn1cJM1XKU
         6g/g==
X-Gm-Message-State: AOJu0YzwLOADiAWG5eQPjHRzZl/gFG5LAa3qwXvDjoixnTfyJH4VeohR
	uf6/aI1OvxZrb403/Jy9qVUCFKdg7hag2bX1jcSD34+oO9Am6nclyj4z1eMwZQ==
X-Gm-Gg: ASbGncsQhEv2PFD74aG1NszcouLJEuvTBJDdpOJjPlPD2C+3oFuGhG9X0SBXsC52TV8
	QOpiaTazglkWFrGr8VzQoPcjt/mwmCMjJvI5kl8RtbN6Pym4x//X6DtZrN53yfvbLyDMnZMv6l6
	+OEOtFIcv18Y1RAYK3shn5ddvxTknsBcxrDuiDki9C6mIwU39bbyGH+HNmsXKQ/OTuL+5S87bvs
	dwVcv+9uXqZCm9O0IRFbraLu193YXLFEbsN9J7hdF0UWDmE0zQoqar2FDlvVJwR+ugEBK33C6Es
	6xPHNyNKuMyZ+l9RHuji2llhptrUTEXQO3D5eCLvxb81ls8iUMhc7mEvrbuy33BYz85Dr8PWNJy
	bAugHS57U9Vk=
X-Google-Smtp-Source: AGHT+IHPdSr9/HOe9bf00RUTmBuGFuGDTzaMauGKmWOoCYVE2dpwPxEti/KES7ojHbp0MNj5tywOUg==
X-Received: by 2002:a05:6000:2503:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a5319b17c0mr6192220f8f.5.1749301430495;
        Sat, 07 Jun 2025 06:03:50 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229da18sm4639086f8f.19.2025.06.07.06.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 06:03:49 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-twisted: upgrade 24.11.0 -> 25.5.0
Date: Sat,  7 Jun 2025 13:03:40 +0000
Message-ID: <20250607130340.70124-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 13:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117771

LIC_FILES_CHKSUM is updated. The year in the copyright header was changed for 2025.

Added a PACKAGECONFIG for a new optional runtime dependency python3-wsproto which
is required for the new twisted.web.websockets module.

Changes:
https://github.com/twisted/twisted/compare/twisted-24.11.0...twisted-25.5.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...thon3-twisted_24.11.0.bb => python3-twisted_25.5.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_24.11.0.bb => python3-twisted_25.5.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.11.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-twisted_24.11.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 6f2894e886..4685829ee3 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -4,9 +4,9 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of p
 HOMEPAGE = "https://twisted.org"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5316a448a61a38d722c291f78d915d11"
 
-SRC_URI[sha256sum] = "695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5"
+SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
 
 inherit pypi python_hatchling
 
@@ -42,6 +42,10 @@ RDEPENDS:${PN} = "\
     ${PN}-zsh \
 "
 
+# Optional dependencies
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[websocket] = ",,,python3-wsproto"
+
 RDEPENDS:${PN}-core = "python3-asyncio \
                        python3-attrs \
                        python3-automat \
-- 
2.43.0


