Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D62E80A82
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:39:45 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.10767.1695789578823403195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4195035800fso16071371cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695789577; x=1696394377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHFmidl7KzhP079tdttMwvUMXY50A+Zmp5dtylFvNQo=;
        b=XliZ/hFIaQj2jjC3WNfkHyXif+NvxwJsEXQ8dUid+CYH4soob9A4wjL8LhZGazCVEY
         xMuRbgRo6M94aZbZ/cetfMjq8H+A8y0P46neBOXCaid6R0IARLXqE89Q244ZbwLLFtob
         /K17e8i8RR2I7/emlrxUyzk5Iw3LGK3O4zIz6pj7mD2/Mjtx4ILtaBikpeib6lmqzrdf
         s2O6+ytZRMkAvEswXt0VMtT30FuBp/ZTI+6On84ej9WJZ8QFTyalf0MHEL0A9oKQAFX+
         Nmn1w9o72tqa+AVilEuRQaQBdjYm0NQ8o5AByBjAjpBfiWPR+pQMN2YAjfWFMNH4S87H
         PPKw==
X-Gm-Message-State: AOJu0YwvrAx4UinjAxwLol3G9WBStGda2Vd9SBJULYW0tBIYNqywMlRH
	Ku7vDTGeoly98enmTd6badMHnKFuEG/Wdg==
X-Google-Smtp-Source: AGHT+IE2j8OPGQMx2Qx2j+/D9KGw9opa3fG4Ek17MHVf0caqZXlU186uodmhEWo1d/1KBYM1aP0mUg==
X-Received: by 2002:a05:622a:104d:b0:412:132d:3e62 with SMTP id f13-20020a05622a104d00b00412132d3e62mr1184023qte.5.1695789577486;
        Tue, 26 Sep 2023 21:39:37 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l11-20020ac84ccb000000b004181441cb2dsm2531392qtv.34.2023.09.26.21.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:39:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-redis: update version 5.0.0 -> 5.0.1
Date: Wed, 27 Sep 2023 04:39:24 +0000
Message-Id: <20230927043924.1678476-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105159

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-redis_5.0.0.bb => python3-redis_5.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.0.0.bb => python3-redis_5.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.0.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-redis_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.0.1.bb
index f04e04bbe..2c473c03e 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
-SRC_URI[sha256sum] = "5cea6c0d335c9a7332a460ed8729ceabb4d0c489c7285b0a86dbbf8a017bd120"
+SRC_URI[sha256sum] = "0dab495cd5753069d3bc650a0dde8a8f9edde16fc5691b689a566eda58100d0f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


