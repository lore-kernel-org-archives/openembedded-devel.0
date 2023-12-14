Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8814C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 00:31:13 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.10203.1702513869090717086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 16:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b70139d54cso278103039f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 16:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702513867; x=1703118667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXsc6W9E9dIJn49qlCG/HbK29lfrBwiAPY81YlppAys=;
        b=iqEhjVmcdijNvdNY12lDpRy84drFe0tj04CWMFpAwZ0DAffrg7Qe5teNmVYeeG6Cc4
         Xp/bsqBfL03I42kjHfutr89YbpdzFH/aOaTfhTuHpxOPRNuFgGLXoFghHxEs7LyH8RJn
         6ABbOS0xvVwjjZffFzfP7caUhHxnxU2HpyoejfiNcVJw0YzakVw7DMabW8PSdtzK0rgg
         1atPyQyhOq/QfWNWjLSIyKR4eKyXTNtO0iyEKk5sk0HBnIbuBq8qm+poaEF001DWF25G
         ItAZv+yoPeXzzgrRKIptr5v+Cw9OXsya7Q3De1tLFo21SkkmdsxKyMeWr3m/HueA++Vp
         nMHA==
X-Gm-Message-State: AOJu0Yz6G7j0vlh2kLsYiHM/7zYOIGPC0DENc3AnDskjvvCEjTa2pwTx
	lYsvvwb5ZYKZb6cL/0vJ0mWSE8xEiZEXWg==
X-Google-Smtp-Source: AGHT+IG2SnapzPWtkoG06+F80EErTI9d7uMgVmLfY9BWRIxXruWL1kP836/AVfH5F+cKde5XnInE5Q==
X-Received: by 2002:a05:6602:599:b0:7b6:fc90:c3d8 with SMTP id v25-20020a056602059900b007b6fc90c3d8mr7743125iox.38.1702513867499;
        Wed, 13 Dec 2023 16:31:07 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l22-20020a05663814d600b0046960c0a3a2sm2391391jak.136.2023.12.13.16.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:31:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-gnupg: update to 0.5.2
Date: Thu, 14 Dec 2023 00:30:56 +0000
Message-Id: <20231214003056.1163424-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 00:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107404

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-gnupg_0.5.1.bb => python3-gnupg_0.5.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.1.bb => python3-gnupg_0.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.1.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.2.bb
index 7510625db..b69e2c465 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "5674bad4e93876c0b0d3197e314d7f942d39018bf31e2b833f6788a6813c3fb8"
+SRC_URI[sha256sum] = "01d8013931c9fa3f45824bbea7054c03d6e11f258a72e7e086e168dbcb91854c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


