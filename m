Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0ECC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 12:13:49 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13375.1787487224874344446
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 05:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eG4JwXnz;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso27388375ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787487224; x=1788092024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ForOsCj82Ct/4MSB0rKBKRw2XBj1cMXMkNnX7//MiQ=;
        b=eG4JwXnzx1vO/M05oNYfupsomvms1UkMko1+G2rL6c91koe3wYqInAk9dA8o63illf
         7heW5e+u1EwhsHqnVm03KYkZedUBPW1vd39xlUk4lxoJZNlzaxAI4vQGX0fQWESEwuEL
         szF45OXVPHRTaB6UKf+ByEKt7LN0AGijqneAmekMeZ8X1LszWE3eVZUZjaaf1po5drVW
         2ZD6xlg4MVTBGNTfcX5b2bemU574ejboO1DMqbEuV75Y/if60oieWxq4XJvXwEzOQSOY
         qUrEs23P2t6BazkhlXheyqYbwTl6BsUqIE7sKMXD8ZjvIkzJMrHuPphvLswNIW1N+26P
         p/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787487224; x=1788092024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ForOsCj82Ct/4MSB0rKBKRw2XBj1cMXMkNnX7//MiQ=;
        b=I1brkR/lMxySm1fvS9rMYQb+toxUJiefoqVvMK1qGToiuJD0E3hchW327Sjq0UZWL0
         qx5zb5j8GNY/UeUC8NO10s12Q/47hbig+P70dn2fYfZb0qHCRf3E8aoZxQD+L+AkvAEx
         YyRpapVVeXUoz+TYeNgQUGG5/JKOoSmdwUv9vQmtz1aFzW4kJ4eCpIwFm47+cDpdFgoB
         OIpJ0HCZ5xiUT5Jjr2atFPbwJkMRhE0z759HC9Go7I+gIFbpUnmffHKdfvi2mngoMZiF
         r8H8bc5EuTw2r2pQrzge31qwTbUNZyRhcnhHUSjc5A8yqal23Hu331hhh/EjrCTVAdcm
         8BfQ==
X-Gm-Message-State: AFuF++mn7zR623jmIE63D6kEKiX9EcDC3MW+5Eo9SBYhrAbqsf1/acWs
	R54cRRPKIP8xKHmJTxlAIQAHZigj43WIP9CXKDF88o0mAa+f1iFnE46tg4STrg==
X-Gm-Gg: AR+sD11szztn5CKFNNKjX9ym2ge7LLUvlAdqD4UlWReiKUinKeGm3DmqzZn4OXnfEEx
	5J5oTM192EI/1y6PlmI/gHr1ZE79Y4+Ku5TGHMHwj7qEBjpf1STjnP7qjami/d9rhEcHVZ9yD1Y
	GRzLCEBYpuPuC4cuuCgxngBL69M72a16hhGYHYmCTjpgQnnIX0d8Ed2aGumv4z/Hd/u5+6NzK99
	IpO2jhI+rhBLuS1xvQkbZa/4MK9y/fa7QVg5+XFC8bQaO4WRBmRALlu4bW0+gO4dO2HGaVe4oMV
	miJQHAX4ALPxcQQ8Wxe3dIvdVaqoqRbiuQkYeba/iXnUYn7E49e0zM/hBelzFK/Zz+I9kysNEvM
	YEHqC8s5kT2AuuUQ3pvHDn13Dal/XFsNrQtVsfiAmyyVbJ0jpUIiFAkRQveL94BuqwdL4/gJ1uT
	f1aVJ8wX6ulcZ4cd1nJ5C7eubbHZv9TsbnQsRFtfPEAK6npM2vUjKSbkLBKIhs/wHRj9EyxCWZO
	Q==
X-Received: by 2002:a17:903:b4e:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d64ad9387dmr360835945ad.1.1787487224165;
        Sun, 23 Aug 2026 05:13:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm15590130eec.29.2026.08.23.05.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 05:13:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/1] swagger-ui: upgrade 5.32.13 -> 5.32.14
Date: Mon, 24 Aug 2026 00:13:36 +1200
Message-ID: <20260823121336.1850158-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 12:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129455

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.14

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.13.bb => swagger-ui_5.32.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.13.bb => swagger-ui_5.32.14.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
index 8916b7788e..5bb5a66021 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "2a33d7805eb5fff693952cebb9203ee113ab4663"
+SRCREV = "6e8ce248db64190e4113676aba996943c56f2491"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

