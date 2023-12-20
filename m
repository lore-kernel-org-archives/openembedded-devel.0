Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF07C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 21:13:43 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.32432.1703106820239729146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 13:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7b6f4ee4f7fso30782039f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 13:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703106819; x=1703711619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgYPrcy7XTPq2G1pYc6dytuHdTNgHcDL1CMo+RRn4SU=;
        b=MZrAEQAgcbpNhPK8T21EWHxl78vKdJ8bJHOToFjCUv0mA7WRVogmcxPPrxctyvoJZe
         ltHdzXeqBr0k5Kyjw5++l5R26gEogfO+PvJpXOXkL6powERXpJeyVcs8TVj8ACMJ0kJU
         dg2nzNgnzgtRglOddHI4xv4sCXZ+Wyodn/fcX7d6iyjZ9GUmIzagA5aXWhBOZPJdAsW2
         9og7cop5BPPFQuazRih/9nFU76+qVjIaW4Yk2RFT/p4lkSsIK1BylhT3ZjIoxvRW1Lg4
         z859OLofOY0pKDVPYGCtLD/P8y041Pg0FHmixtV1IzZnX96Ues4TuJ3tCNgjNgP4R+Jx
         mJTw==
X-Gm-Message-State: AOJu0YzI4YEAva11IM9J19we0PRndQ4hsRSrDEL2kxipGvIH7QTMii9N
	9vIa8NzRL8YHJfnXNWE5aABj1Cy15S7WqQ==
X-Google-Smtp-Source: AGHT+IGtkDbWy7nnTNZKHuFjWZmR4czvlQAlRsT6g+7KHaoQ5kDkXmOszGeKXZFZY9WzOWXq+vzlCA==
X-Received: by 2002:a05:6e02:1d94:b0:35f:b387:40ab with SMTP id h20-20020a056e021d9400b0035fb38740abmr2609664ila.1.1703106818961;
        Wed, 20 Dec 2023 13:13:38 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l19-20020a056e020e5300b0035f72c470adsm100823ilk.15.2023.12.20.13.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 13:13:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-alembic: update to version 1.13.1
Date: Wed, 20 Dec 2023 21:13:26 +0000
Message-Id: <20231220211326.3610507-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 21:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107674

Misc bug fixes for typing, versioning, and environment.

See https://alembic.sqlalchemy.org/en/latest/changelog.html

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-alembic_1.13.0.bb => python3-alembic_1.13.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.13.0.bb => python3-alembic_1.13.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.13.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
index 865dd017c..2a9ac2c5d 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ab4b3b94d2e1e5f81e34be8a9b7b7575fc9dd5398fccb0bef351ec9b14872623"
+SRC_URI[sha256sum] = "4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


