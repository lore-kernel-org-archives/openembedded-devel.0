Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA4EC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:18:29 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.2717.1706897903374117087
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dbcebaf9a9so1398989a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 10:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897902; x=1707502702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX+Y2Rl4Pkw2JDl9qBs20IemPQ2hfZtraGsJ7gZQkT4=;
        b=IxNheqkH+jcak2nU1yRPOCq385fSD3xh1N3qUc3JssQN4Ycz6qS8KO5GJ6eeF/aF2Z
         rjUJJEpbDjJT42iopGD3HVyhtsQSqzQ1bW2YP1N2Gso69qhaw/igQh40PrlCTkHtx+rl
         d6zwU2Fczk5scCSbyX4LtoFKNNaJauFs+Xo597YQ5gpdIFtJ89yfAFVZz1QbFFBJScdr
         ts3eGzjRufQZLdqHQcJFuvTl8MmOYmTo8EBu0LJRUx+esW8KWvmy561mdOihT5ZPK1WC
         wVt+ifhSgbuTOdhJH83jUAuT8YdcpEnlTNVudh7c5KiMP37/fgbQS16mc5BbHWvrQAx7
         +N9w==
X-Gm-Message-State: AOJu0Yw2y1/UsDYd+uKEqk4xNveIP8G74TifoePDhCJPxyDSWa7EuRMj
	REcVjWu3xB4PkJOlkBB3GOadLUiTh3xpb/UWiEAUe+2UjtNIcbH0/P7eJy4dNrHCVA==
X-Google-Smtp-Source: AGHT+IGrODPlxqnrnBzRaHULwssZtTIFIqRlWOSzjMuNoD8p7SgAqvcuqpQJ1Qn0R5PrDR2Z88DmHw==
X-Received: by 2002:a9d:7686:0:b0:6dd:ca7d:b4eb with SMTP id j6-20020a9d7686000000b006ddca7db4ebmr8510477otl.0.1706897902219;
        Fri, 02 Feb 2024 10:18:22 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id e17-20020a056830201100b006e123b1ffe5sm470776otp.15.2024.02.02.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:18:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pymisp: update to version 2.4.184
Date: Fri,  2 Feb 2024 18:17:59 +0000
Message-Id: <20240202181759.1543747-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 18:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108535

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pymisp_2.4.183.bb => python3-pymisp_2.4.184.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.183.bb => python3-pymisp_2.4.184.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.183.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.183.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
index dec818699..b0e62bae2 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.183.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "00abe5592f07bb1cd41ca803f9b0b8b2b70474004a779be53cd215280fd625b3"
+SRC_URI[sha256sum] = "fbd9089c867a63144562932862474910696ab57f4786a4b7c1a0b28ba204c0ae"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


