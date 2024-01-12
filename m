Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D884C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:12:06 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.7223.1705097522738862924
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7baa8097064so323708439f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097521; x=1705702321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UewG3auucda1yg8XryNw9JrRWvHig8xK7GTUUZkCIA=;
        b=hEiCEP0HZ9H9X65LL+zIdguOyBiIohXPxRL6vhZKkt0ID0sPLAWsTRxpkdErYFf01v
         DD7y6A2tETjj8H/uF2HcF3MPfvj5Wr0wccByMcWE7fvMkq4mci881eJrdH0cpJ3ShSXL
         /4EA+qgO3j3dBaJokGtmvF0RKShqVYxliZaZqJG40inWAZNecJtZeTFZ1VcO69y+A/h2
         L2JFvyYezO2ihFjr8ZQerHu5Mftl6dREd63GnFiqF2IV8ZMAs26QTFoy6wGy2HwlYXIR
         07fEAKP/km3bz3LHDLF8zpgzKSCBFYGxUiarr92MoQMkNcemuevKnYYIRqMbUaGZahri
         8W5g==
X-Gm-Message-State: AOJu0Yz+IGwdgT6sfg+yp9SDmSHu1BstEHQHwBExcFggb+nnGPqx94v8
	AtEs61Vk/2Mu715/xzlJaxAHs8/bhgychg==
X-Google-Smtp-Source: AGHT+IHnKSy+GPO96PwMJreQn1cdu3l6qDnh7O6orWBRPDiUqL47KCQE3pX+GRtNAbNEzqjpIjXoFw==
X-Received: by 2002:a6b:6504:0:b0:7bf:d4:5e88 with SMTP id z4-20020a6b6504000000b007bf00d45e88mr2529279iob.19.1705097521132;
        Fri, 12 Jan 2024 14:12:01 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id i3-20020a05663815c300b00468ed10d45esm1105141jat.154.2024.01.12.14.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:12:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-eth-hash: update to version 0.6.0
Date: Fri, 12 Jan 2024 22:11:55 +0000
Message-Id: <20240112221155.3038610-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108259

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-eth-hash_0.5.2.bb => python3-eth-hash_0.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.5.2.bb => python3-eth-hash_0.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.5.2.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
index 683d84761..77e656527 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "1b5f10eca7765cc385e1430eefc5ced6e2e463bb18d1365510e2e539c1a6fe4e"
+SRC_URI[sha256sum] = "ae72889e60db6acbb3872c288cfa02ed157f4c27630fcd7f9c8442302c31e478"
 
 inherit pypi setuptools3
 
-- 
2.34.1


