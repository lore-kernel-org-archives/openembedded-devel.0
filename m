Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D095CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33263.1792043082183263444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YzXYFg+y;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd9cbb661bso35500775ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043081; x=1792647881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v7wNuTsw1tO8TRt2bx8zyQzYcI3n3JSAyFpfDOt5gGU=;
        b=YzXYFg+yWiRU64jHxmqbttngaY/mTiDLOP8cqup/NEk+WmNU7WqmJWghw/pVz+fm2T
         F+x8daJa6Av4+bI+/o6H95E+ku+q8hbUBvQk3O8OQAFgd9tkxFYjbRWfCxdWW0vRBHMj
         yGmeIkOnipm+F5g4akqRxjevyuixo+pkKp9hA02LGk92BG9H2+flwXzjYALY9w4vJZV7
         7iH57Ux4zG6pQdegD5dSseVaZNcA6MGB49dJyKQ0h3lZv21uYXZoXXrcdmWkSwYfVtP1
         NwNasB4RAIsVKzuOr45d4oj+Xwqmbnc3AIF/E/h1VHQ4NzbqBC8/gdZwpLlJU+QYfqPm
         6vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043081; x=1792647881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v7wNuTsw1tO8TRt2bx8zyQzYcI3n3JSAyFpfDOt5gGU=;
        b=f94H8tdeSENcIggjL9WiUYxgJKzPsAGkTTsxjODWeXeD9f+GoSOr2p/NHKJYByPX+6
         /MZIDJ4KfZ9l72D8OOVpQmrjkQ/2Y9R6rcZA4YG+/CGdUqFqBVKg2OEhjmvW+3V6ffFX
         HrHCxeTGnxpz7iSLL6y36zmsRDALE3huEJwfHs8WVsdSC8UkQDkypH9Qs2Wj4YnVf0QC
         Vn+Rlh/xI21XU6nHxPRIox87mqZqtSPGLim5q2o17JANmj+RsA72IWkoQIaYCulUiaVc
         T8vAdul7c/ck5/O9xoI15aMMnpaQPYiX3os2fMUVyZnXUEBWuKG0S/tBrfqddCylunb3
         hbhQ==
X-Gm-Message-State: AFq9FYKD/qgoeig+ljCOd3IWoxCOY7cyb3jK5ue/t58hG4cJ2rBsoeG+
	q5k8ssS3RiR5QK2TSlLsqHiUONwa7gy89T9RuoTDdzSqY59/HOrsBCxGmfUFkg==
X-Gm-Gg: AYBFou35fT96YeGATJoFbSyfllAR6G8nWpYn+uBycRP4oVmA5YMoUAHKzRj7lzSVCet
	rIwBR+pMKcpTjSUNsI7Tj2brgsvPdkcpseLlOr4po4JaNfQENRi5LBnZD0As5wI+11NBzj8/K1S
	MVDIcyEVdfmrYKn56TVKub1hpx9S4U8Jn7TSOlDg6r4AWaYZ6Kk3SD2s4/jYZR1aOezQ0uajP+/
	U+Av8nzo24MAVIRlBqzjkVmLeFVF92jG8JACluOdS0Kx4I/5zI9RuaTs7Lp4JVyo6BpA+y18QHM
	1MoSmF5Jh5Peva2EHCmj/9BjfaJ5VJYVG2RHodfq7Y4+rzaGgIL1QIdtgD4t2Vbkq+s/NzlAfcy
	Axq/lrKcGJTqPW/1NyYeLp8o8cFafV+N/h2zv+5YKTxR+C7jhDQ96zJ361fwrUvu7u5E6Ldborf
	mdRHWD4m6LnMc/GA1wouQXRBFUpQ3in6uYyEF4fZnWKCSAS8U8Gt5s/y5l8QOyW7LsLepbmdrmb
	OIhtc4wwnSjCvTmo4W+83Q=
X-Received: by 2002:a17:902:f609:b0:2e9:5b4e:b8a1 with SMTP id d9443c01a7336-2e95b4f1282mr11315795ad.55.1792043081510;
        Wed, 14 Oct 2026 22:44:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 52/82] swagger-ui: upgrade 5.33.0 -> 5.33.1
Date: Thu, 15 Oct 2026 18:41:40 +1300
Message-ID: <41441be1cea37115153b9c8eabc6595649ac387d.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130972

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 50c590bebc5269b1aadce1d907466c0fee131619)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
index 45a3bb6d17..db2bb498a8 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "cfd4a6c3cbaeeb7c13a8bada7c754de42d78cd5b"
+SRCREV = "cac3d136b5e37bfbe3288c8591f6f4fcf9870599"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

