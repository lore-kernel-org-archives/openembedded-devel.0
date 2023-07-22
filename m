Return-Path: <rfried.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF00BC001B0
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:51:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11472.1690051899689747498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CV2CzCvP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so28275745e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690051898; x=1690656698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc8ObZKkQSNKJzgZpQcxSWtW/2G2IJ+0uhOvcRTfwyo=;
        b=CV2CzCvPQpjHTVAd5wCXENVMwjDIsZLSk0oNi0Dxre7Erpi2aTKgVhjzkGyY/oary6
         xZVyiQyfu4mdTi0pS0bcBSmBSNUYvWRFbXkYYPa8dmd/NDy7Cmg+HAi0NF1kXg4c4fRk
         KQf6W9Gy5au/oCbXSfoSU3I0vSC6SYGJzyVVGOxviJrHvTsY7RgHO7O0JoeIqGj/85Fz
         EO9IeWbemFX+RyzQ/P5SA0Y4+YRt0AzbhQ93iQJETmXDlZf/MAcg5K/5AIbioTB9xQD4
         ygO+KJtTuT/XxH+gjxnMXW4KWbjImTJO4qS9aAP9R+87Se0Kzi03PahQraaqOo6ne2KJ
         BWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690051898; x=1690656698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tc8ObZKkQSNKJzgZpQcxSWtW/2G2IJ+0uhOvcRTfwyo=;
        b=KZzQ12iDMEs45tiaVzoZ9DVtf+PDV/A6yHD8CQ5P8uLseCjT6zSCND8deqe1v6zrlL
         USUdZ2Q+dfgkG8jTN70n8p8dgM+vCn1MyTVUjH8d7V67Ld9sYGeeAxv+0yXZSNEt3Uv5
         TgHs6Vuqqe/giLY/v7GRHqW3i0zUgaML4EQLbY6HmS3wmW/2lr2cZE92cm7cg0ulvUvY
         nrRqU/83BvRbZ5Cp9e7btQYmeTfsoKsfU/m5C8GDBsXZwqFNV+viEsH/MrW1RsPLK6Jc
         0SXlMAC3Z9r6vDBPTY7T0NsqKG/QKpZEx8sG/pHKlbMGQYRezMLMt47Rrn3tMedHDLw0
         FeXw==
X-Gm-Message-State: ABy/qLYdFuApO1RLgHUrn8KycZQZx0KyjG8tOQzT6BeuyVl7ZwFiHms1
	RGYmvplGiYAYWP6LWm+EXR4wCS4r1oDVlQ==
X-Google-Smtp-Source: APBJJlFVX4XCCmYkndyIKrtHMXbePp8JVbTVz8LLsR3trbr5EzrM6wQNn1KgQuHJVKn3qT8T39DRnw==
X-Received: by 2002:a1c:770f:0:b0:3f5:fff8:d4f3 with SMTP id t15-20020a1c770f000000b003f5fff8d4f3mr4204915wmi.7.1690051897687;
        Sat, 22 Jul 2023 11:51:37 -0700 (PDT)
Received: from localhost.localdomain ([147.235.53.124])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d6845000000b0031435731dfasm7598257wrw.35.2023.07.22.11.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:51:37 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH] bitwise: Upgrade 0.43 -> 0.50
Date: Sun, 23 Jul 2023 00:51:33 +0300
Message-ID: <20230722215133.4387-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 18:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103987

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../bitwise/{bitwise_0.43.bb => bitwise_0.50.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/bitwise/{bitwise_0.43.bb => bitwise_0.50.bb} (91%)

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
similarity index 91%
rename from meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
rename to meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
index 3a9943916..5cd20c5b1 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitw
            file://run-ptest \
            file://ptest.out.expected \
            "
-SRC_URI[sha256sum] = "f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb"
+SRC_URI[sha256sum] = "806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1cae97e"
 
 UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
 
-- 
2.41.0


