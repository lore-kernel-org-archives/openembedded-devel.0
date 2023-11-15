Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D1CC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 06:21:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.7555.1700029312083324064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 22:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMUIlo0w;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9f27af23441so64905566b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 22:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700029310; x=1700634110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bUhGrS745n/U7Eg+WKjQ+SBgdwwErxUGfh6UgqNEJo=;
        b=WMUIlo0wnViJWccmkHLYlKXt6k1rsiv5XL5ChUBWIsK2ohezzjFQHvIidBvBpZnWx1
         J9x1NC06UxrecAnDMPr+sucwdeOKnkFQZiz/2OW8avOLr5vuhtafIw6ikU9+AhYOmnDx
         pGwGkZQ8zAueK+PcjjpYE5Yd4D1xQ3FOGagVIYhlJKTJ7nwmG/dJdPwDc7zUJFsN84IH
         1dLOVon7wFzhnECUaIzBttBGcu/m5Y9dIxvt3J86hgR8btHam/FUYxwdpg+Lyfo6YX+/
         J9qvO6BunDiQ6tR/JIHOHLgYUc7doVKWjzUvgDucNeMKHFKJ1w/oHcVNCXzX+RvsA1ul
         +cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700029310; x=1700634110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bUhGrS745n/U7Eg+WKjQ+SBgdwwErxUGfh6UgqNEJo=;
        b=AnwM7ODpl4jfMiccekGg9+fb71Tq0blabfhLOx/cr3BkeX8MIGL66U/DzZrFcOaC63
         DaRx6/iPx3ff545DDIa79SD9wdFBaxN/3cuH0GthCymAudq+xoDifY4acEL6k1jJj+bw
         RMRo5CwpiKcXVNTGgDa+kK+s0Ktn7jUurp5/vhxxrizLAMCBH0BSzIi845ZpZ5J3bvrR
         Qh9DS6AzYZQT9M/MxOKwBkg+J5GVkLeqCizznMHNCjU7iOw+Yiw680JEslsDW58Ugyvy
         c4EBis0wvs7DM+SwZGuAcFX6Kj6+QRDIK/vEVRm8Oh8jUN6lr7z7cZsOKHTe26IsEMm4
         2/JQ==
X-Gm-Message-State: AOJu0YzHXy5oiblrpa2Kj24d/8eYrlUQuiXjc4vvQJwHxC1arKXULoJk
	uuqOXJ0fj7LLV/Cx8lm1A9FVW/0vwQgvPg==
X-Google-Smtp-Source: AGHT+IFZuHCZVY08FUd7wMeRKxOvqiFhgafrKzpoRhhAIHvE0mRjSQbWP1UbiVXa4ZipnSpaLxt4bw==
X-Received: by 2002:a17:906:dfc6:b0:9ae:5270:46d5 with SMTP id jt6-20020a170906dfc600b009ae527046d5mr8132342ejc.73.1700029309913;
        Tue, 14 Nov 2023 22:21:49 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id qk16-20020a170906d9d000b0099297782aa9sm6485821ejb.49.2023.11.14.22.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 22:21:49 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][master][PATCHv3] fuse-exfat: Dropped md5sum
Date: Wed, 15 Nov 2023 09:21:20 +0300
Message-Id: <20231115062120.47939-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 06:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106732

We do not need md5sum anymore.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
index 2f5b1a333..48e3d7af5 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
@@ -16,7 +16,6 @@ RRECOMMENDS:${PN} = "util-linux-mount"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "765bf2484d48e5c253d0d8cb8de4f8c0"
 SRC_URI[sha256sum] = "a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20b2c8bbe6edb3001e"
 
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.25.1


