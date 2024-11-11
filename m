Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539AFD3ABE9
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:21:21 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.66691.1731349280561720798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XW6OeGYC;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso3688820a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 10:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731349278; x=1731954078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHdHR9moNVrnm0BClPsbB9a3nRZp2YRSg7ZjO/3p/Ks=;
        b=XW6OeGYC7zs4zUueMA/ORg4w8GA8zyJzS1ZQ5xhJtwIr8CjpDJQPk2gaPy4RbdPEYQ
         D+gvkO6d8RgWTEULooPWlqwYJ6nWuMgZnS9rn+q1JcXnZKDHPQViKk3Kjkuqli/0G9d6
         w8W7pF+r27HxY4eYRxPo26erapQ5Ec3z7gpHGBz7qiKo+0EtduO8JZHB0JOBnO2eei3U
         fXyGuTpFfzoxTrhbPgDYA+4hM8GS/2kahEFrkr+l1915V3KQoFQovF7Ndt+qUKGW54bG
         JKs0w1OI3d3yQMy49fEQnpNWtwtMVPLvCigiqFfFxBgVAYO5WRDbwVX20JMYzjyKOL4o
         TOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349278; x=1731954078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHdHR9moNVrnm0BClPsbB9a3nRZp2YRSg7ZjO/3p/Ks=;
        b=WRU+PxqL1GGE3CGITHzw7zRZQcFGLDBq84DDwm3++mhjPpNA17p8+2kvRFjitiK/RV
         gtdjQE0vOHlhD1S6HIadQv4zAB80ZjNIn98PS3LDhqBud4p1Si7UO6aUaLokHtPIAMGE
         S4zsg9hDMabTVod4r7p+NiBeu+dz4mJ5HYPjz+t9iYGUMSZ4sTUHXkwkHUebXc3BPRyf
         ZsC1hWCA6nzymjFoHZZaVEO/cC16alUBPD8sp159v1dWQ1D8KyEmqFrxPAAkNUXbWaCG
         CvJgbp+z6Ielqsjs68AZ1hKPCFmyTDxvjIRnhMVG/t2z6f2mfB1Za3/D2dKfbBVnVD87
         h1DA==
X-Gm-Message-State: AOJu0Yy6aYssS6UyrBLYaW6sQXlLubVBseYlouG6MF0dbCWMnUXYUMl0
	kgIRJk0f7sntb/hUO9FmZEyY1NfV9ES0SrsG96qz2BR4mdlNfhPBJpB4Aw==
X-Google-Smtp-Source: AGHT+IGvGCwqNTowWYsT7+BMC4zpZMiV4HrtvHrhEtSfDlV4RITNyz0wqzJQx8zxR0EmRYuLy7vplA==
X-Received: by 2002:a05:6402:354b:b0:5ca:8b9:6e06 with SMTP id 4fb4d7f45d1cf-5cf0a311112mr18010743a12.12.1731349278111;
        Mon, 11 Nov 2024 10:21:18 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c7ce0asm5131383a12.85.2024.11.11.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:21:17 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-yarl: upgrade 1.15.1 -> 1.17.1
Date: Mon, 11 Nov 2024 18:21:01 +0000
Message-ID: <20241111182100.1738050-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113789

Changelogs:
- https://github.com/aio-libs/yarl/releases/tag/v1.17.1
- https://github.com/aio-libs/yarl/releases/tag/v1.17.0
- https://github.com/aio-libs/yarl/releases/tag/v1.16.0
- https://github.com/aio-libs/yarl/releases/tag/v1.15.5
- https://github.com/aio-libs/yarl/releases/tag/v1.15.4
- https://github.com/aio-libs/yarl/releases/tag/v1.15.3
- https://github.com/aio-libs/yarl/releases/tag/v1.15.2

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/{python3-yarl_1.15.1.bb => python3-yarl_1.17.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.15.1.bb => python3-yarl_1.17.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
index 475c71bba..deafc23af 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "02e1c9e36528de270c22c06aac6a5a1de8cc870fafefb5e90e5b35cb8985d0b2"
+SRC_URI[sha256sum] = "067a63fcfda82da6b198fa73079b1ca40b7c9b7994995b6ee38acda728b64d47"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


