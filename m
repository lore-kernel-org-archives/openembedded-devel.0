Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A9BC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:09:16 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.2361.1706904551912186549
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-58e256505f7so1387423eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706904550; x=1707509350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4F4ceAhMLCMg896WqvVoZoUJ9R4oi16N/N5jPmhKCw=;
        b=qytsFurUlqFAY9b3zUHJ4LU3AhMzYBrgWfv98Wpw+hAbH+1L281/j0C6jWn0701rgc
         rgreRcOKcgRmRjY0/yIWJnF0JlWRvzMFEWIuLfA4157Xm8i88ztcIn5YMlJalcOweLjq
         KmjMdURUGPt8v+xjlRVevlI/MUb7j7FHkt4H6U2pqdFxDm+XT9Kh2rNkXVp3t6C2Lqv+
         OaGcTeoL88aBNqDdw9rv7TCAm01/9zK5Xrl76MZfR4ZS2O14QPS/IwBc77Cg1KlAqOkT
         oAxKtv3FjYiJN3eFUA8sdD0kRdOxtcTlX8b43WzMk/mdE5yvjeo8j2sI70JwbAqwDrJd
         hMQg==
X-Gm-Message-State: AOJu0YwFPHeBUNa2H68kbhaU+w8KDYI0Nb+vd/ldeEhL8MYxuBpbqoC7
	ZvOmO3NWvE1HtRtf8CP/u/lOm8rzz3tRA5P3to86ZdNlY74HEUmpgzD4Gl5tJoNDlQ==
X-Google-Smtp-Source: AGHT+IGlqqm8DBHSX3wkLe2eCB5zNcl5HNJ+3CKCXX6L4SxsL9EWIoj4/jRzFndDqSgDyu8m9834Bg==
X-Received: by 2002:a4a:3556:0:b0:59c:a7d9:cb2b with SMTP id w22-20020a4a3556000000b0059ca7d9cb2bmr665081oog.0.1706904550225;
        Fri, 02 Feb 2024 12:09:10 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ny6-20020a056214398600b00681785c95e0sm1109758qvb.46.2024.02.02.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:09:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/3] python3-google-api-core: update to version 2.16.1
Date: Fri,  2 Feb 2024 20:08:59 +0000
Message-Id: <20240202200901.1570392-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108539

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...gle-api-core_2.15.0.bb => python3-google-api-core_2.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.15.0.bb => python3-google-api-core_2.16.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.15.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.16.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.16.1.bb
index 7ce2ad7ad..6c2511885 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.16.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "abc978a72658f14a2df1e5e12532effe40f94f868f6e23d95133bd6abcca35ca"
+SRC_URI[sha256sum] = "7f668ffa3d5b9f3c6930407e5f5d691c05a376050a5a5fd772b9dc32e70a0c30"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


