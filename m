Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E5DF8FA91
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:06:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33928.1776784013904271484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iUUCRhfi;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba840146so41343205e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776784012; x=1777388812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGc8YucKloi83u8kAFoWObDjOgAiYen+hGO82W0TEoo=;
        b=iUUCRhfiqqwCaZZxJxGI+LZjzktS55I9kvxAHxoUMSLe9Yc8A9BPgZZ7CWVieLBzzb
         D4F0yuBmIimqc306Yak/XZERLel/ND46LSS1hKdIQvOxgsTwYxtrli7OBz9nyIgUlfeD
         LCaNUi3ddEx0GGQQNfhNt4k9nli3+yrLw4qQVPICJgVX2LVVr1oxNl1mvf/VFc/AlbCN
         +sPhfxA0DP65DmKBhi/x6nHgmGjvCthWF6FkL0Ex3PyW8BaNRB9thl2MEHezuZ9zZpXh
         E+bP0Pk1iQn1HZ8ChuU7hKWUny325joOty4gSd1yseUUZsyS4ct4ctEqd/Yf1Sex67ep
         GdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776784012; x=1777388812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGc8YucKloi83u8kAFoWObDjOgAiYen+hGO82W0TEoo=;
        b=D8rdKe2KtmFiYc/aHCZwTDyrjvk78ws2g1Y7Er6G8OSaO6pkbnUwnkBlBrJWlW86bY
         7/wreR4vDNwMgkBpG4XK1Y7rYxqvBUE3mvsfKZsTiFMp0hA1w3xvpZzxFjhWBF2IVKSW
         ixPMzEUNIqu8X5qVBIn4A3IXJIx4AshcrDJeAJxIN9Msjn4UrCPEulSibGe8dMZUIGe4
         GC7G3rusCRhKV+Z0d1hmFyran0xL7uj33oRsnEC+pyA4sqLwK9PcP5+vNMhEYFhguj9+
         K/5I9fPI1mpDwGT5ETcz3a1ZNjcC5G6vQp0zEd1iyV1CV1BMEaTr3B/9Hc4LghBJp7B5
         0peg==
X-Gm-Message-State: AOJu0Ywo3K4SP9KgvaakBxvSsnRsLa/oSK1Efn/eKHSjvF2RrrgC1jCN
	lDdduHjwIwX+i07HyRKckKE2DwQfa4GjuFWPLeMb8KayPUFg5KsOL7rIpsrErA==
X-Gm-Gg: AeBDies4ANqCUVXyG8gzgxwI+XrU4EeZ0CEEjahLiVCf5l9gs/fpwnts7m8cxdN0sxC
	/NjS87tP+Vu78TbtGJvPnYte4/ueFQLw5w85VfC7Qnj7db9hwTumGAg+qNhjgKPUXhYcfIWaJq1
	A72BJbzLZNW49+oCh5eeM03RwnZekKJIvXgDVEP3YHgs7rDTjvLhPrxE5XoOLs8efwKXeWsysjQ
	Z4EZVeKHQInGN3N+TcXvWesdmZJei45EsnxcNnVfjafdAgtvb0b4/pfJH8A8nMcKcvCqjuhG3hZ
	NBV0xAiXvva+Ye6XTWCJkULbDuXUojPzELPpeEh8JR8PeyRlFzVKXIHl+FvgH0Y6wgN7ZTNFcjM
	MhF7Ga5N3D8/Yr31HZ7ua9MgbXcVC+7i650ACKgujaTVSSciLFGgJZ3HbGk16gg4DvNrU2t6AGW
	0ZLUW5jeOja7MK4CDvifkxaBFfBAkYhvdVwrOMav4fOa1wCIqefvvcBU+ZVj9WbqeeAHOO7NUrm
	f7BirlqjY4g2LUOLsoTnt6FkxA=
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr213993575e9.1.1776784011675;
        Tue, 21 Apr 2026 08:06:51 -0700 (PDT)
Received: from toster.lan ([185.228.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cc84a1bsm64024535e9.0.2026.04.21.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:06:51 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH] opensc: shippe missed installed file
Date: Tue, 21 Apr 2026 16:06:42 +0100
Message-ID: <20260421150642.1317635-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 15:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126532

Fix packing of missed installed file:

| ERROR: opensc-0.27.1-r0 do_package: QA Issue: opensc: Files/directories were installed but not shipped in any package:
|   /usr/share/p11-kit
|   /usr/share/p11-kit/modules
|   /usr/share/p11-kit/modules/opensc.module
| Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
| opensc: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta-oe/recipes-support/opensc/opensc_0.27.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
index 91e738e0a0..d659fd1bee 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 FILES:${PN} += "\
     ${libdir}/opensc-pkcs11.so \
     ${libdir}/pkcs11-spy.so \
+    ${datadir}/p11-kit/modules/opensc.module \
 "
 FILES:${PN}-dev += "\
     ${libdir}/onepin-opensc-pkcs11.so \
-- 
2.53.0


