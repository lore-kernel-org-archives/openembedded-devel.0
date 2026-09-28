Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23617C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:07 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47672.1790553840998738054
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XSQ4I5aW;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso10560765ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553840; x=1791158640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQQ6tyzDQpDW6KUgyTfdZBWFfgSKSOYP76TRpoRT2eo=;
        b=XSQ4I5aW6BEcDxUk6boXCrXeKY1YRg0guGKTiWdwbNP9xhlj96j822VhHUrQQJiOx0
         PDFL1bo6nNiapNXkKEa3RJEO3YxzENGLnryJDi3g3mzMdtIOTXF3kmsS+IJBjUAuIVC/
         shyqwqxgwt5LiSqGukuSK1A/7ny8lwOaWS8ewewgm0RsRjcgQiZOBhJmzv0+AeY1eXD7
         DLp3Tvmgp4nRcacR6irEHQo3oZzjs6itFzO3m660Nrlyd60BkeAoEEtQW6/mzOwiB8li
         UaXcPRFPtJQXjwJcNRkFprL14FvQvO8rwSXfOg7fBwUEUJztgfeL75qd6Z2fhZg53129
         lyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553840; x=1791158640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQQ6tyzDQpDW6KUgyTfdZBWFfgSKSOYP76TRpoRT2eo=;
        b=ISW62w7qUbKClWpnZl6kz7G5xSljt+pU3CiNC10CF4+ycj3DFkPIuPkrYPOor8RIYu
         n4/xZKfK5aTQQBbX/onbVusw07T2FK7CmtRkl9zCuOtSQmaRAeAhdisWhTUpY8TYjc/H
         75ID5B8hXtXljFPQhAO8r5/JpQ5nbyJ0546+ZguRpbPdHjhH4NTu0JcUJFxBVXGqSqaV
         F7K3dpAlD0Fjgk56DGaCnKF5ldN4XIJug1sZUe1FATnh8nW0J4/tc7vJCavpoGjxSXmg
         T31JmoGzChx4tsRCGrXd7oIeuOwwY4wr9f131plvkk5WoBv0WbllF3y7qNuaaaxKceA2
         wbaw==
X-Gm-Message-State: AFq9FYIzeGl4xNnqc6xku+nMcI6ii5BTRENURV1VNAxSrWH/8vZLetNV
	pYyxWh4f0k3erZo7AK3BMfRiO++bFUrm+2IS8G507hbIzjNSu/y8sgX4YvTcRg==
X-Gm-Gg: AYBFou2Tu1PdG7e3zXLZPHIbLNpIhA0ZrfXgDo2dnSY0oXjUGvO25gAow0bVPJwaVV9
	pNH4WzYCQig7+JuF3BYVii7pSsPPLxPSAaWsSi+Z6DKWlqvp9Oy0e74DCU8rD7EcQE6P93to4Ko
	ACpakqi4vt5Bm0TUe4JqeKlL0bQ8rc2F7FCnf/vSmypBNm2ecrxTSl1DRfTSV/kMf7Fd7dYgzDu
	li2fu96cOCL1TTQeIIN0d6g8RGZTfvm53DJcSCtJRJZKvs8Af6AqauEc+E9bSVbltujfQTCHTxH
	IO9T/xotp8tux6eO03/QUdCz1jp1lfjjwS+VOt8koRWaOtiiG3aagiW1iKRsY7eGm25dzeej534
	u54AtD4a2kBlHuFjJOZ/X2eQqSIhUZ4Qqavq1CacfnT4RBxn5qp9rn7v1zcCROWAGK2VZ8eco3k
	BqcT4kW99A0yeVm5uOUxVoH1662bDzcDWSlviTrf9REJW3VW6Ty6KBw64TgK/QxApdFs2n0yjBy
	+/M36X7rizbHpnLWfj5NsBPJsVZqQ2m7w==
X-Received: by 2002:a17:902:ebc8:b0:2df:8226:4930 with SMTP id d9443c01a7336-2df82264b0emr86253045ad.37.1790553840303;
        Sun, 27 Sep 2026 17:04:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 24/30] python3-parse: upgrade 1.22.1 -> 1.22.2
Date: Mon, 28 Sep 2026 13:02:56 +1300
Message-ID: <20260928000302.2528437-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130411

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/r1chardj0n3s/parse/releases/tag/1.22.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-parse_1.22.1.bb => python3-parse_1.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.22.1.bb => python3-parse_1.22.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.22.1.bb b/meta-python/recipes-devtools/python/python3-parse_1.22.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.22.1.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.22.2.bb
index 39719173be..75a9a7b9d5 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.22.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "d3a4740ec3da338e2b258b2d69741b731eadfddca59e24a14bc4ee5fce38c911"
+SRC_URI[sha256sum] = "8ff0b98202798b8cefa4f8fac06b670d6d00e5ec6ecbbacaf97ac0d0e93a54e6"
 
 SRC_URI += " \
     file://run-ptest \

