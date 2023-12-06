Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D37C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:46:27 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.30689.1701866784245047187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hiywIH9M;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ca0f21e48cso34471341fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 04:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701866782; x=1702471582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+QvqcotHEfk18SNbPjLnZG5bPa9fT+6nmjO4p9ZoYE=;
        b=hiywIH9MieteZcO7KbW6gfHX33XcwzsARGMBzYFVo6Sd94G1GqyKQNzm109hINU8vj
         PU9NyqZKKliREmIuDTvuNueOqviQ4xEOHgGpM5z+h9JNnjLV+jNNH5Ln40bI4v0Sjyk/
         dixuJBX0RhatAsm4IOwaCbppYfcLsR7VAk62Ti0pM0LE9b3lYLmcd2ns1bfMXOxu7RLK
         v9wco6Iuxu+MJU0DU/GGnUgLP4KS1Uw6SpHfcsgLIY22JqnDBVQGrRNUIy07cW6l6vHh
         o6PxbNyVYdOB7ZjsaSzFt9/iyZ3xiPIGkjnjvQCzVyrvUo/nE6zeo6jxYFaDiWM07BWk
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701866782; x=1702471582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+QvqcotHEfk18SNbPjLnZG5bPa9fT+6nmjO4p9ZoYE=;
        b=BpxUdc7JAHH/QpqXljv0SFIBL5yAFQ2dFe2qbaXddIEJ3UwsZX7+99nnVohjmejh5m
         MT6aK2GOlUdD5Gzi1CfG9KmSjrkMOmJMS54AKKI9INNKRJxdxkHL9W7vE6HMIFW30NB6
         ETQNH1ELPOvUGKsgbG5Zcdqkx0nXGlrrOMzKEh9T/LFI9mZh3NGgTaBPSbMresa52jmU
         BrujIo6DZK3aDN7LyOBcaUEz94PAbjcJ3rkxG/f44Wn5iPwQMhqmnCzHNZgJv669hjiB
         EJzhc+S/rA1IYoNY+CZrsQyBN29K4BoXPKDbaB86zFLSExG6AFupX47YujCGNDXmbrqk
         N5cA==
X-Gm-Message-State: AOJu0YzagSoWPbFwmGZCLdija1MlYk2lwqHYpLwzksTy7pYBnVI27Cga
	JsN6rZtoKGg+ENp0YvRck8SSqm2tSlacsQ==
X-Google-Smtp-Source: AGHT+IEfX7VuEDVJfa7mFoCUQUfLjNTCff4IkfV8IIi0HUMcrdNcuS4FJ+ELhHSSisAuyFCMe1HPuw==
X-Received: by 2002:a2e:9e02:0:b0:2ca:4d2:568 with SMTP id e2-20020a2e9e02000000b002ca04d20568mr558330ljk.23.1701866781712;
        Wed, 06 Dec 2023 04:46:21 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id fw15-20020a170906c94f00b009fca9484a62sm4937263ejb.200.2023.12.06.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:46:21 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xsetroot: upgrade 1.1.2 -> 1.1.3
Date: Wed,  6 Dec 2023 15:46:18 +0300
Message-Id: <20231206124618.293151-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107246

Changelog:

* gitlab CI: stop requiring Signed-off-by in commits
* Handle -Wsign-compare warnings
* Variable scope reductions as recommended by cppcheck
* Build xz tarballs instead of bzip2
* CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb} (72%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
similarity index 72%
rename from meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
index a9a8acf05..f909c4f79 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
 DEPENDS += "xbitmaps libxcursor"
 
-SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
-SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
+SRC_URI_EXT = "gz"
+SRC_URI[sha256sum] = "80dbb0d02807e89294a042298b8a62f9aa0c3a94d89244ccbc35e4cf80fcaaba"
-- 
2.25.1


