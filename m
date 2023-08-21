Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E725EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:03:04 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.9233.1692619374900596344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jYpcrAr0;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a3cae6e1eso777919b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692619374; x=1693224174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1Jc3opJbRqg9jOgVySI49aC6IZ69bLm7eARdgkLXuI=;
        b=jYpcrAr0nSJmsYzu5gf7xEqVIqvNHXaz4pE5UKXTAgq+L3ch01aegqNMtrk9wWfxZ6
         7ZphhYcbK6bezXD4Yy7J5vJFcrdDPC8bDMNEtD6uLDvKBp7dIg2uarH7cYbThFrNfHBs
         Odjh1pAU28kFEDRbB6yDAUQ5cPFHGYEvqzW73ZZ4n1EAo/bi3Xi1BsIIanDL8I5JHlLo
         QP/8nLP1B6vIC1NWGn1lRgwQYBYIfBtrV2uUzWEM+e1d9+G7DFwkPP8JD/Xp841b0v7x
         hazLM3AwWsVl37ZNva1y3wnwkOzaO3BLwl4meaIJ/J8lwSe9CYb7Li6Z5pKV+CxqF/u0
         R71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692619374; x=1693224174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1Jc3opJbRqg9jOgVySI49aC6IZ69bLm7eARdgkLXuI=;
        b=IPyxpdgItvWhaReh1sEb1k2/wvBzun/1uYlp8eOcsl4BbLOr2uu2o+ZwTDoFjhY6Or
         dr7ST+UeJ/mTVedOQCfIG4+mY4u6TORbLSvUrdVM1QON2HfuE0QrUHhBZf3cDz7yDcqU
         Mlxuj7ntz1FfPIo0lM0Uyg6DoYIzjFcMZnpl5SnxhOcQGLqNpP6l27q7z42HVV+RGPXL
         P9I7mNd4LXSYypi5mCI/Mk1MzT8rir8z56pP9muRuT0axe+jbtCyjoJqo7ERGy2ERhc3
         ePn2D/w6GSoDGjzh2eR51VCGsXi6jg6a6tfAFAn4TxzTrVS5kZMRyip8xa2o7XlueYtU
         Sy1w==
X-Gm-Message-State: AOJu0YwWWAA0Hx8zEIy3kX0dftvH1fkT+o46tRii8iQPpS8OQ7iV1FnG
	TNDJhADJM/WUvGN7aqjn7y1zZkb1ML5mNQ==
X-Google-Smtp-Source: AGHT+IHRqSUxNbChn5rBkS4Dm3MIYSy1U1SzfM8KWoNoi1ifbDXjao8cEJ+nmBWZSvKCgLYM5Vd/Fg==
X-Received: by 2002:a05:6a20:a12c:b0:136:ea0e:d23 with SMTP id q44-20020a056a20a12c00b00136ea0e0d23mr5087550pzk.11.1692619374122;
        Mon, 21 Aug 2023 05:02:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0068a0b8e4d5bsm3965542pfh.21.2023.08.21.05.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:02:53 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][kirkstone][PATCH] nlohmann-json: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 17:32:37 +0530
Message-Id: <20230821120237.74866-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 12:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104510

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
index 4fa2aacdf..7a1a7a9db 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 
 CVE_PRODUCT = "json-for-modern-cpp"
 
-SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
            "
 
 SRCREV = "4f8fba14066156b73f1189a2b8bd568bde5284c5"
-- 
2.25.1


