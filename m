Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BEDC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:43:14 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.34225.1703112188472444007
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b7a9f90f34so8258739f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703112187; x=1703716987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsfPxmcCROPso4jQrCGIJEklDtPL/eePVAlF85VPmjg=;
        b=HVqdMc6GfmpDuYyzMBd3q1mk+SdbEqJmbuZBM2bq2aCNht7WyI7dddvQsNLQc/FZ0X
         /P4le3yDmg09wgRoDm/B/QDFsqDI/w5/RLC0UrFWH4vVXzBOT3C4wPclkBM6ip6VBYY6
         baEZIBpDHWMrRgEbR4h5EUVuf7va0ONKOb/baK/MgFPTm3AQ3AYUlUpM17CaRFP/aYSg
         niOAcvQWNh1FBxm/Y34CFRWSUFvB81TxEJZHHU0q9yBdEsBkAVZd8wxKyLJBp7yMo8Tk
         Zhag7oFeWAK03fv4X3x6bh5npiVy58DEKO3YKMa9v+0ueV9F6k9nKG6T3fvs8nmaAgJN
         ayZw==
X-Gm-Message-State: AOJu0YwogtcFFUPr2KmkMWqJlHJ753/zswrxT1pYJoU7nTuNib5PhwaW
	bpOR8z1gNE1Yo7hElu2WwXAKOQ2llXe1Hg==
X-Google-Smtp-Source: AGHT+IHGS6keKz1MrQpxyQDmKa3qNYCVkgDFH5XnjH0urEn4Sl7eB6M/aMsas8Hz7J62h7C7JxDu/Q==
X-Received: by 2002:a05:6e02:188d:b0:35f:7859:cd4 with SMTP id o13-20020a056e02188d00b0035f78590cd4mr12582711ilu.65.1703112186702;
        Wed, 20 Dec 2023 14:43:06 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id o11-20020a056e02092b00b0035f87a79ec0sm138284ilt.61.2023.12.20.14.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:43:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-isort: update to version 5.13.2
Date: Wed, 20 Dec 2023 22:42:58 +0000
Message-Id: <20231220224258.3816313-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107685

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-isort_5.13.1.bb => python3-isort_5.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.13.1.bb => python3-isort_5.13.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.13.1.bb b/meta-python/recipes-devtools/python/python3-isort_5.13.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-isort_5.13.1.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.13.2.bb
index f8deaae08..60d44181c 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.13.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "aaed790b463e8703fb1eddb831dfa8e8616bacde2c083bd557ef73c8189b7263"
+SRC_URI[sha256sum] = "48fdfcb9face5d58a4f6dde2e72a1fb8dcaf8ab26f95ab49fab84c2ddefb0109"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


