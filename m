Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C06EEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 11:52:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.9042.1692618768954091379
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 04:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=poGpKOe+;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c06f6f98c0so5521145ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692618768; x=1693223568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDi8ry0V9PHiNCYebx/thEUdCl9kD9XONrO6OHIuN8Y=;
        b=poGpKOe+BpD4Y6iKF1GyE2SsevPw6Ol6WBHEXIZpCrxLzrdCc0AyCkm1oGv8SeDwKQ
         Wy7vGINWIxGMIU3xP2YUWaV3l1adL9lKjSqUeX4DBQOyScjghDy8ZdBi5+YoRl22XusH
         RmgWJw4kT8gYxEE+V/whelR3JL7iGQw+OU4xSj/x2Vyw51pCznRz7cbhXvnRFeXPEmB8
         ezXKYbosUJkhOTAtDOumOxL9iRmjf0X55P7HmAmdoiHdDfjpEvbf9Pkrd6qvGcHwQuL2
         2E95nyPZFWg00ixHqd/7fKEuUajkM0/mtXGsBsYl94eGqnn2igKf2Sa4jUkOCqZxKnfv
         AgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692618768; x=1693223568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDi8ry0V9PHiNCYebx/thEUdCl9kD9XONrO6OHIuN8Y=;
        b=jW7H5OjdZuolHT6hOeiy1+py2qlAVcQlwsblXletW3AC9V77DUAsrTp/LcxtcCXVEa
         pR+0xShb/DnEkKkjR0TVRjYFD2LgLZprZiKsG1pzfCb3R4eFeS9ttwfeSlpXv2gofS66
         ENCmV6wKwAHCu5aNI5tUk+rPYwCHFVnCK1o2Y8ZvUHp45zFh4lED0kVCw07hInCxt0ct
         niJyb3V9u/mIQFNzGhhJjCtpEUn4ZJ2KdRDW9zhujlxffKzbfS61ZNv9CSWwxRyHQ5Qn
         dOoS3SMGwUZ+/ssapfpiMjpJ5xPE6ZsJYkN8SHTdjVuVQa1L1OWkv1Y7yBkPzPkIsv/V
         Jmug==
X-Gm-Message-State: AOJu0YxKFE5LLD2cmtmFmgyhN58HT2SJ58QwG0GsNQyJhToc070715q3
	ZLEqUMGbhB5YK+CRyR48TBgoFKcndITTug==
X-Google-Smtp-Source: AGHT+IFiuwUEXXiX9lkiboZI2RU9+p35tiAdmmycwhzUUJr/sEXx3BCiVpbdDOWIW2czAb/Z9R4phA==
X-Received: by 2002:a17:902:7891:b0:1b8:16c7:a786 with SMTP id q17-20020a170902789100b001b816c7a786mr6366776pll.4.1692618768252;
        Mon, 21 Aug 2023 04:52:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902cecc00b001b7f40a8959sm6865167plg.76.2023.08.21.04.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 04:52:47 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][dunfell][PATCH] nlohmann-json: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 17:22:24 +0530
Message-Id: <20230821115224.72283-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 11:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104508

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
index 2749f4497..a7ba46c8d 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f5f7c71504da070bcf4f090205ce1080"
 
-SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
            file://0001-Templatize-basic_json-ctor-from-json_ref.patch \
            file://0001-typo-fix.patch \
            "
-- 
2.25.1


