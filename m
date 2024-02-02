Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E33AC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 17:42:59 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.1640.1706895775822099224
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 09:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-363ac28b375so4430215ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 09:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706895774; x=1707500574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIlERhbBaH+SBm+s0sPGEH4KdtBmU/lgHlFuSaBxarU=;
        b=HmZk4AvCOt9Dz9fAryc+Aeh0dLnjdEG1tDY1QFH0hH7cWJQZB5AXiqXvbgQOvl5C7R
         fg8iYzH14QeJ8O0bY0A6hGFSl4zRagbzx0W/mNQl0ziyVbHHBpJChA/ub2IXN68tcDIT
         rxmS2NNxwnnUP0gS9NJ+tOjmhlGgXoCBg9WyUV+563w2ptI6k3BFIH77v+zDVq4hffkJ
         kJD6kXL8bGmmUX+lGc/ANSov/HjQAUJRaRXQuaLiWrl+4LTjiEfGGCul9ggZ8L11NhGJ
         Inp5ixMb7ietvZq80y57UUKdJ/mIY9AdTyLmy2gsiEY7r8rmEPODxvA8arBT2WPHU0Ea
         3mfg==
X-Gm-Message-State: AOJu0YzlYheOMjb3ctk9gmxwUpaw8KXI9CIxiqlTGyg1Ef1HkOeoPOvi
	N84wSnzKZC24AjrkCy/NywwI1605kzUx7BsB2EN9p478jnIQbHpuyl9wJTOS106+Dg==
X-Google-Smtp-Source: AGHT+IGffRMrIgwsF5WF6p6GROKRfZI4mpUU6cgEaklGxuG/u4SwDKpiFBuuXZgUoONhqDzwuVB5UQ==
X-Received: by 2002:a05:6e02:180d:b0:363:aa92:c0b3 with SMTP id a13-20020a056e02180d00b00363aa92c0b3mr3685502ilv.31.1706895773793;
        Fri, 02 Feb 2024 09:42:53 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f6-20020a056e0204c600b003637902e9e1sm702850ils.38.2024.02.02.09.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 09:42:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-dill: update to version 0.3.8
Date: Fri,  2 Feb 2024 17:42:42 +0000
Message-Id: <20240202174242.1475745-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 17:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108533

Update license checksum for copyright year modification

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-dill_0.3.7.bb => python3-dill_0.3.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.3.7.bb => python3-dill_0.3.8.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
index 673964f3b..4ea5aa04a 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Serialize all of python"
 HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19de1f406e29e68f579e7e82e0758ce3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a41509b57cc475ed93f8cb1dbbfaeec1"
 
-SRC_URI[sha256sum] = "cc1c8b182eb3013e24bd475ff2e9295af86c1a38eb1aff128dac8962a9ce3c03"
+SRC_URI[sha256sum] = "3ebe3c479ad625c4553aca177444d89b486b1d84982eeacded644afc0cf797ca"
 
 inherit pypi setuptools3
 
-- 
2.34.1


