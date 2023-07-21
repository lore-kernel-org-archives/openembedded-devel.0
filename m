Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA6CC04E69
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.15578.1689967533804053382
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ValhI7X0;
 spf=pass (domain: baylibre.com, ip: 209.85.167.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a36b30aa7bso1571512b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967532; x=1690572332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxHrFVZEXhfbew2QN1p/GSYA/z5QNZUQrwWE4RSnMYA=;
        b=ValhI7X0Ct6gKeEBepqxU7Db9H9i/VfnaAXk/VRsRV/6p52mVjQgEmjeAdoIxwY4Ha
         6ZL3WMBGyqEIP46KeeJuxCWqrCrQtXt1o9v1A78ex/vsOq/GtT8OJ5Ly10HgKiObcZei
         mdXCs28ySK/hFgGXJvIzT/KSmFXE6dv5bv1N0zs48Pmew1vBdzYTKAP5opEi0JhUq4i8
         YQIGF8aYow0pK+jKz8o7d2D1zuoImw1t3lEBRcthPeVmfiinvqjLSfpTbIaMhfs9SsCb
         V2C230QOrKzfezdW5iZC6o+5v5Zqx79thanIFnZDmy3hPM4LXFiRK3aIcee2vzkNbS2f
         VWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967532; x=1690572332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxHrFVZEXhfbew2QN1p/GSYA/z5QNZUQrwWE4RSnMYA=;
        b=aHdZ4QBZ9iioMfst6HKVx/Mq466IMCtMyni281KyDW/PbFt53YwCiff6rvWqPWLkjM
         fClHeuAALZYdPYqPtAji0TiU3PTi/Q5uO7DhxC5oaitwHpKQ5vTC0+JfIw80bBofs3FC
         1/T5Rj2ibentN9XtFoSApxvlh+mqgNuDx7TAzoVkky01lgx6Ng1NGOPhTQBWP7y2Fg9d
         3IOCwtG77XBRQqwzwPStEeF5Mo2vxY9jOsa+8OYq7Y75VLD+d8+F4DZVGL2voT2ppEMh
         Gz7hKP65Wz94fYv/TeL1SaHbPCQUWwQIODBZfhq4M4di9yXEo6D2iDB/38LPuDAKOLaN
         wUeg==
X-Gm-Message-State: ABy/qLYJc3EtIMJ7wJKvQ5AS0aZk0Pj5h0KL16Yxm8D4rqIIro5qX5zp
	iPuWQucLeZOyV0a1F2WxWwiQ2eYKsqoSd4jyuD0=
X-Google-Smtp-Source: APBJJlEJYDNEbhe7Jmq8mXikVQjODAJe1N2tE1/2TXAmi1lRnjCL7hC0+7JSJZVnw6SAVS02lZP5zg==
X-Received: by 2002:aca:f10:0:b0:3a1:d3f0:32ed with SMTP id 16-20020aca0f10000000b003a1d3f032edmr2937315oip.23.1689967532496;
        Fri, 21 Jul 2023 12:25:32 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:32 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/9] python3-binwalk: upgrade 2.3.3 -> 2.3.4
Date: Fri, 21 Jul 2023 15:25:23 -0400
Message-ID: <20230721192530.2515633-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103975

Changelog (https://github.com/ReFirmLabs/binwalk/releases/tag/v2.3.4):
- Merged patch to fix PFS directory traversal / code execution bug. Credit: Quentin Kaiser.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-binwalk_2.3.3.bb => python3-binwalk_2.3.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-binwalk_2.3.3.bb => python3-binwalk_2.3.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
index 1a55a3e4a1..0b7d97fccb 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65bbee055d3ea3bfc475f07aecf4de64"
 
 SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master"
 
-SRCREV = "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
+SRCREV = "cddfede795971045d99422bd7a9676c8803ec5ee"
 
 S = "${WORKDIR}/git"
 
-- 
2.41.0


