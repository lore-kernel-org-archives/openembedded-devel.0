Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0A0C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:17:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.32290.1701872254608155312
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 06:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y60qnIin;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so9004799a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 06:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701872252; x=1702477052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9T3ozTMVp3pESfz5SdAMSpnCdCOHNJH6HDi1BewH1M=;
        b=Y60qnIinTitgBTVE2NsdO5ddi9//nieydCvECbLbDWofaJJWtTRu2DNxfmH5B0YYNN
         HZ/SBXoI97I1js+nUGwJ9878ciQF2Do71mWDETWv6UfQJLQV87DWPkFbDdVpFP+uRn1n
         Vj4dFATkUpYIknhMIOnX9lDxHSYl6gqjwc3thTsBj2Zoo46gaBUvWQKHayRed2S7viTs
         h7YmXHz+0haGGPKbGGeZj+3JcQU0HlBdn649E7nHwGSgZSN4GrTdh0H6aLiOcwKCH/J9
         BDDNlL9nBGxnjZm3BDA6i9GVIYAkVTxEPv54ZH7CwrYBvUl4P0WsnvEBVAX3HPHCVlOV
         tlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872252; x=1702477052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9T3ozTMVp3pESfz5SdAMSpnCdCOHNJH6HDi1BewH1M=;
        b=RAk1NZ4Xb9RKdOOLJvnZOKNYtAhrMZCpPVPOEfDMWuHhsWQ7p6eEvzPSc8Ova12vjA
         jyOVWxgvUrnjkEPsmHEtW+z6j/4WyzGKaNdJ2I/E4nj4i+Rh+YhdDOWn6KP3HkEDQgbG
         Dz6YJQ+tFJY2pVDtNZ+eRCUJZubOB5ZmEjgtDX/DLyGe1+xLUa0WvkvDFX1aHTlgSIJv
         wup0bc65O2T/KeHJl7U8ONeGTj5H4Pb7TBbBAGOeY784X8W9DVCxH7G4q8E8PrFPDAU6
         RwJfvLugvBZPJ3iDhRftN5gkS7a4C3L/ur1rzaS9PgtaFSYAZQ3AME88QkDg5l6abwgA
         4qhA==
X-Gm-Message-State: AOJu0Yxcn6m/dbvZpW/ztXzm8ifeGo9kv2FetFratit0Fttf2Ym6egIH
	+XJK63OFU7pr21BjfA09TQAOru5IeDEKHQ==
X-Google-Smtp-Source: AGHT+IHiTPWx26YoOzRg1tlzpHsjS3M0esd6VBOA7Cgw+Tx+VBzNqItxFQv7BL7ZVcSwKS6NATYJaQ==
X-Received: by 2002:a50:cc9d:0:b0:54c:a689:2d8c with SMTP id q29-20020a50cc9d000000b0054ca6892d8cmr800748edi.69.1701872252178;
        Wed, 06 Dec 2023 06:17:32 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id t17-20020aa7d4d1000000b0054cacb41abasm12908edr.60.2023.12.06.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:17:31 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] sessreg: upgrade 1.1.2 -> 1.1.3
Date: Wed,  6 Dec 2023 17:17:27 +0300
Message-Id: <20231206141727.390133-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 14:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107254

Changelog:

* Fix -Wstringop-truncation warnings in safe_strncpy()
* gitlab CI: stop requiring Signed-off-by in commits
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test
* Fix spelling/wording issues

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{sessreg_1.1.2.bb => sessreg_1.1.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{sessreg_1.1.2.bb => sessreg_1.1.3.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.3.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/sessreg_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-app/sessreg_1.1.3.bb
index d4e9597bd..33ab22cde 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.3.bb
@@ -4,8 +4,8 @@ SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
 SRC_URI += "file://0001-Makefile.am-Error-Fix.patch"
-SRC_URI[md5sum] = "92be564d4be7d8aa7b5024057b715210"
-SRC_URI[sha256sum] = "dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "022acd5de8077dddc4f919961f79e102ecd5f3228a333681af5cd0e7344facc2"
 
 CFLAGS:append:libc-musl = " -D_WTMPX_FILE=WTMP_FILE -D_PATH_WTMPX=_PATH_WTMP -D_UTMPX_FILE=UTMP_FILE -D_PATH_UTMPX=_PATH_UTMP "
 
-- 
2.25.1


