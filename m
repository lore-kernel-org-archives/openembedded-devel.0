Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B58BC48285
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 11:38:16 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.16285.1706614691712649316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 03:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9HJL4xO;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a35ba5744e0so238153166b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706614690; x=1707219490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OyyxcFOVPr3fn03rXVkOkbgeJwitLI3vAsVCQd5d3D4=;
        b=N9HJL4xOR2zJdIlwBkH8s7ulGiBcgWBkqe5KvMkDj+efKItY9m34l09VZW0J+wPbvC
         7b/+Se9l9mt8xYMiX+q9NiCF6wsfhu3b+C8YMhkEJPar92q7dqwFHDamXWd/FRTIl3Mm
         UVFC7fII/em6dLtJLNRYr9O0673DAZei+1cdqvevDhruIIG4BgrnURLg8FQiFyWmNv6f
         kEpI8wwDf8d/gr+83TBMgO2o75j2n4XS6qSg4orAMAKVEIUvae4sOcdA+Zyjctvw5r2j
         gmkBWo13AKpwuXU/DcQEOl3H/yJLH21BpXZwL1r1BiADp1Yt07byFUE1izAB+sWVH98V
         SqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706614690; x=1707219490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyyxcFOVPr3fn03rXVkOkbgeJwitLI3vAsVCQd5d3D4=;
        b=vU+b34n8LzmhagfNCOwtYBzDUXgFGHgkRtAix8QU8C2yhTdFZFqlVrAOIVN+68WNKA
         e6blVwsHLJb8QV+oeV8YTj1Ww52iRSMdNncsrReTE1qvIkZR0QBPd8GcvLMQuEnP67vC
         XgEUlQE5ERuzwfgYA8SxJS5VGapLIhbRyYlFSH51cLDCI7cRR9bmLY6C8dTRuQbgNi55
         K+vtH1CMKog3AaW4gnZ/+2US33ugkJaMBMbVaJ+XPssK3dHTUEH8XVCqOKS/NRn5qtaM
         +Atjyq6+KjPs12bvwkLqLHy25rvUcpAUarDzTgEaOf+c8xviozRzpFJhZlrT8txG6N1r
         intA==
X-Gm-Message-State: AOJu0YxeNsL/B6vyibl7mYGBdAXLarqE0U5zQ/PDkxOTp1kQkwynP0jg
	4QzknhBW66LbCtEY3TiNyIG1DjnUbEHMMv85lCP8KsiiWn1AGGmqBhrh9ko+
X-Google-Smtp-Source: AGHT+IHxnxIu7zh017f5za0Ne3nEgi/VJcnGOJV2waL+m5gMt7SJC3/3QZdnyyMEtKEUKOOTWo8Slg==
X-Received: by 2002:a17:906:5f96:b0:a36:320:8a3c with SMTP id a22-20020a1709065f9600b00a3603208a3cmr1760087eju.73.1706614689904;
        Tue, 30 Jan 2024 03:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUDcA6VHdnaeFssW2TDxduoEFWw7M76UzWEdpcLcoFX18dNslWiRNMnpKJy16Qmpj7LDx4KNPEzVh0bXj4oE2YjI25oNPj/
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id sf5-20020a1709078a8500b00a353bfdd411sm3902745ejc.59.2024.01.30.03.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 03:38:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: leon.anavi@konsulko.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] python-jsonref: add missing Upstream-Status
Date: Tue, 30 Jan 2024 12:38:06 +0100
Message-ID: <20240130113806.1334310-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 11:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108494

* introduced in:
  https://git.openembedded.org/meta-openembedded/commit/?id=e34a29f12444cd31fb6e6c11712603897e24a6d5

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python-jsonref/files/migrate-to-pdm-backend.patch           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch b/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
index 805d9edce1..8f3d10c985 100644
--- a/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
+++ b/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Migrate to pdm-backend
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
+Upstream-Status: Pending
+
  pyproject.toml | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
-- 
2.43.0


