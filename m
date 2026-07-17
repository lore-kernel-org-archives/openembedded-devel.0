Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF64C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:41:28 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8036.1784270481157355520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sYiMOmNw;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4610467a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 23:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270480; x=1784875280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU1CTfZudARhVcA+EH8AX2A3xWvf8vwq/ppOpsC3Lbc=;
        b=sYiMOmNwEFEugBijBmhgV7qm1tasjEs2tifAQ0P1bE42byrpaj6l40yrs/i6iLH/lF
         Ph546JKC4JW84n91YVuiwYcuPvu8p8wy3kfinVh+srly+slGnUYfTO45q9tvbIsMmoiw
         YYeFDTqE4qZ/yD8qRHDnZa+O4IDibtXhiz18lxmqLM7aZNMp9gjW3Fqi8I3/S3aLxLel
         7pn3Wni0EsqzS0ULefXFfW2PIhF9l1Rj6QfgxKW5nmyr83sptkMXzI2A2pE0TQ07HU8g
         Tlp7cIeuZjkfmPVcYwL4q+8y8JzNeHp2wfAj6ImxoPRD2oWT1mUrGLlMg1VPf0f+ewOO
         8y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270480; x=1784875280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU1CTfZudARhVcA+EH8AX2A3xWvf8vwq/ppOpsC3Lbc=;
        b=c3DndKXrPQADsfocz1i1DctTPPIPqwxJZRuxplUrqGussKsJC0RMd1vJt+8NDPuoIG
         IqTgaTYOAwroDduDfJp4/u/wyG32cZnqxPxuoQmi6pstjWKOxbntIikTULIuqptQcK0Y
         /44XkWBEa9fMxWkAiDA+7K03rqm59rPLrgrSM3RVHeyl29/bfvVDJwpVv8BRzrHvIJaS
         gGsnR0sWaVeI3iQuMOKBOD+E5JmvXFOHDN1dsFEPMs5v0nISusUablwJzWIsjdO5lnmc
         tfoeDFZTfiBtjXwxZo0vasxTPG/zmqBHFnFQqg6C9zzB7VUTnhP9knq55l5/0Sy7tkhV
         yt0A==
X-Gm-Message-State: AOJu0YwkV3PjUv3BRjkR264x1UpgROox1bYHk31YLtOvLc2zIiLypUOo
	zkGCbQ/swqA8lobOoVfGKIxj5mdhsDTlatpWyRLM0zWAivg+KiLjmKCUX9fFcw==
X-Gm-Gg: AfdE7cnDNbk3wilVLvdHnS4imuumO0iEnlnPLkUnQR9yJgP5g+o30IZHvOpElxFvznO
	C0X7r9de/jM6N27k79g7gQI69NcEYYDjASrnlZm82MuIwazIaXPaJM8wstb7X5OEfA07OiG9XaP
	YpSO179t5SnqNFd2cEpCVfOv1Ohrbyg7mR2/tc3UL5me5nvnxf5y3I5oKVV19/FybEuH/HCd3ol
	TZd/MInkwFEJs1vy7/Hr9YSAyAI5FjzJxTSoXhY/CDkd19Eb7opVWkz5h/XPMLqDitnfIYM6h1v
	VeKHsg5fc2poh3gRqK7t6eRffZlWaJnfOG5Iv3mjWYfMHOhL9SZ0GpEbEXwTiMIZIUrUhe9kmZH
	QfNnLcKpyEMP1tD0J4709UQW4+LZYEBJ77TXVkXV7Xt55vk3SAae+W9CZ7hGspzHe9B3wpaugST
	VskQy6aA/dyg==
X-Received: by 2002:a17:90b:3dce:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38e4b5d3ec4mr1303928a91.38.1784270480437;
        Thu, 16 Jul 2026 23:41:20 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9c5fsm500239a91.10.2026.07.16.23.41.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 23:41:20 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [oe-devel][master][PATCH] wolfssl: upgrade 5.9.1 -> 5.9.2
Date: Fri, 17 Jul 2026 14:41:09 +0800
Message-ID: <20260717064109.50778-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 06:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128246

- Update SRCREV to v5.9.2-stable tag
- All security fixes from 5.9.2 release included

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 .../wolfssl/{wolfssl_5.9.1.bb => wolfssl_5.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.9.1.bb => wolfssl_5.9.2.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
index 2978ff1..9834c22 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"
+SRCREV = "a82476d144290bf6a786607a16c224acff63d882"
 
 
 inherit autotools ptest
-- 
2.55.0


