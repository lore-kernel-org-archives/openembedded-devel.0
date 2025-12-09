Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D52D3B985
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12064.1765298157517452886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 08:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0THjGy/;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42f9ece6387so449896f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765298156; x=1765902956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnfDUSzHFRoYlzWESTWobISInFZeJuwNk+l5lt1YL08=;
        b=O0THjGy/J2AXwIfnlvRysS6cXCLapdoeJpW6Xl9BhkjWMkaitBUJXJMlxS0IS1WYHL
         IEVxhmNK3vivBGYy2IKOaqKdn6VfHxZaqQtFhdOhPp0IccPMxnier2fZQlB41uebjNTL
         1zg1F4AyJcIvUPqYmHlCgZa8oefDs/HyUxqhem4EFkIINBhk52h/24KbTv7UneffJYnc
         lzvsQ3K3lacnfIoW/gDaBiV5CryFY2n0+16YK1Zzz0CiUNADV96uEGl9oa1VgANAUqA3
         T+ciuLMGTTGt2gFn7APcxZ/KVNmuMPO5fxXG1t2CvmyxoTEb57uvAWqQD/8ghgK9nOf0
         cHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298156; x=1765902956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GnfDUSzHFRoYlzWESTWobISInFZeJuwNk+l5lt1YL08=;
        b=V2MKo0WcyHKqbvwuOgTxXVobGDUrjxzERiwab6w4idSanl6AFgindhNddweFb8Khe/
         GOyPUperVCrAo3SKEWui69z9WjtPGzRSPKaNm4/S5BgIq8qAFcqfoWY01DbqJdLNSSpD
         G0ZnOEbH0C6OJ4TL0M6lTRWKFbe3rcQAQ1hVn/MAANgsAaanI/cNA1Y8JKonr6G583DI
         EI1PPMSM5yEEEa0U+DoUe9ZHqnr4bQzpdd6qUECkIqF1AJpeOJG5/mpIshfndD2DXfZD
         r/olD4qWa65f/KAi+BCf4LK+I5rqafj+S+LYJG0+dGZWCn+XCyW6EJPXCptADw18rDB4
         xseg==
X-Gm-Message-State: AOJu0YwiVF0rKo37DwKuXZqWMqhTirfK1kOvKCsRWjlnMXXCDwy+BZCF
	yYQryFUfdsp9pCn0gFbRkqOFKNJsQg6tpnEtklztgzcTyas3VQkAeFNNcpWeZw==
X-Gm-Gg: AY/fxX6ber2jMDhBS45Dz73yT0ZrNa4vwGUOXO2KAg/eOkG8Azyy6CEQNlISTbOpX3B
	MsiiTIfHMV8YWmY2vES+AcQpjTQGUoMxwUNYGgujzSFJ6huMAGR5YPQy22q+aBOANTMub+kUAYv
	3y+gmlG4fwVcUD+sjj6sZ7UZS1Hg1+QIgnaVjUy2Ge0OTnp7fynTvJ6kww7M5WvgAA/oLr9cUxG
	yV5xF1z/nhnnEIeMRQbPOP+9LGG1YOD5GYRPFJcbDJqtdf7IoCa4n50TOAnFKBqNCedpyAmDK/H
	qGRm0hcA6HaYa0EEQGxXnoGT+ez90KJn3Nw5ifLyohnIa/BwaHE8mC1RPWgdgZ1QTCgQQCKhLxY
	QDuswIPiZU4iJyTgvG4njlkSusV9/TFNqUB7RAsP8+Fs+lLfbgsGnjWSEeUeCuQH4K1xoeHBWfW
	zFXU4LaIAy
X-Google-Smtp-Source: AGHT+IFTdeZnaaBFI/AqaqR25bf1Yig6aoRNx4YXQ2mwP29h1muO+f6fIdf9J/toi7Zz0/SvVQ6TOA==
X-Received: by 2002:a05:6000:1446:b0:429:c774:dbfc with SMTP id ffacd0b85a97d-42f89f0b179mr13108891f8f.12.1765298155734;
        Tue, 09 Dec 2025 08:35:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm33030154f8f.17.2025.12.09.08.35.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:35:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/4] dleyna-core: drop recipe
Date: Tue,  9 Dec 2025 17:35:50 +0100
Message-ID: <20251209163552.1419590-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209163552.1419590-1-skandigraun@gmail.com>
References: <20251209163552.1419590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 16:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122468

The recipe has been disabled for over two years, due to the application
being an abandonware, and it fails to compile with new versions of its dependencies.

There are no signs from upstream that it would be revived (repository
has been archived 4 years ago).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dleyna/dleyna-core_0.6.0.bb               | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
deleted file mode 100644
index 4f743b16f6..0000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Utility functions for dLeyna libraries"
-DESCRIPTION = "dleyna-core is a library of utility functions that are used \
-by the higher level dLeyna libraries that communicate with DLNA devices, \
-e.g., dleyna-server. In brief, it provides APIs for logging, error, settings \
-and task management and an IPC asbstraction API."
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://libdleyna/core/core.c;endline=21;md5=68602998351825b0844aae34c684c54e"
-
-DEPENDS = "glib-2.0 gupnp"
-
-PV .= "+git"
-
-SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
-SRCREV = "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"
-
-inherit autotools pkgconfig
-
-SKIP_RECIPE[dleyna-core] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"

