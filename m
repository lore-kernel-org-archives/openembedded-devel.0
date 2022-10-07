Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C98C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 21:21:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.156.1665177678456379960
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 14:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mm9mVvbA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id j7so8981393wrr.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/ViOxITOBxt74EpMFW9FAzbYsnMilzRKiqpPAp8wsc=;
        b=Mm9mVvbAB0r3wYeQjzXPdIiuB3IuqLYT3Qzk2XAoJ5URU7Sx8LSFXa+Sy7E/JvvHl9
         5FubgnewjI2HUb49+tK/2R8wrTMqyGhs6wGR7yCu3vU6wLNjxT1r+cy885JO8LRoEFtM
         nzKv3YwD/v+v/O7LWyajVoXvAuQ0n5J9lqaFo0LqaWGtwwDcSDenQpa+518jN4bnL1Fj
         /ZQmfnL1JUA+9y+7OgyS265cbn8qX4/IwEzpMznegnrmy7OjDxyd1L1aWBhTAwuCArfz
         p9RG0EnqSczvCwdbWnrqhBbhFNRWMnpOqaisjdecN5UkU6MC2QvqBU6NUDQ0W1uvoy3c
         ywKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/ViOxITOBxt74EpMFW9FAzbYsnMilzRKiqpPAp8wsc=;
        b=s1zISSP/kDVjACEeTyBVB6btFKLgNP9LnLms0RLJtrWSYqmHuIYgGh8ZMqGomOiZ9/
         q4jA24SpQldHQ2Ve4T7hjmY6GYjzUIN/dNT2kJHzwWHrdkubd1Da3jkACWtQkeEAfqUh
         PgL5IjU3zYfv+0MFYowmUSJD82H2y/xb3oVSjK0HQh+I0whz89Rdk41NG2t70B3u5mqq
         Is8nMONPV40sgNlN5wPIe52A3Ur9u7zlj/+99E/9Ph0OUPMUPzzo4uI7l3a+v0IuWosF
         9ImWCXd9C1NV+FSJEzKZCMnXvkFwqZs43Rdgzszw0gKwXx7DV1wXKjMMwbDKaNl3sM64
         i0cA==
X-Gm-Message-State: ACrzQf0t5/3yy6U9FKHyXCn9/wcaW1zWMs4wdoN70CIovPzPvY78ko/W
	r8PccTEQU8WZUqzFwBCSDEZ4XyExoCAOsg==
X-Google-Smtp-Source: 
 AMsMyM4fqSAurTwdTTelsuufPauVOqSsc/PZiWxjDi0DzqhJOEtfs026svuAmkz9wbcghPsJqjXTPw==
X-Received: by 2002:a5d:46c6:0:b0:22e:4b9a:3f02 with SMTP id
 g6-20020a5d46c6000000b0022e4b9a3f02mr4495895wrs.516.1665177676506;
        Fri, 07 Oct 2022 14:21:16 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 u11-20020adfdb8b000000b0022cc5c03d07sm2959954wri.53.2022.10.07.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 14:21:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] re2: fix branch name from master to main
Date: Fri,  7 Oct 2022 23:21:12 +0200
Message-Id: <20221007212112.2413148-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Oct 2022 21:21:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99090

re2 $ git branch -a --contains 166dbbeb3b0ab7e733b278e8f42a84f6882b8a25
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/re2/re2_2020.11.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/re2/re2_2020.11.01.bb b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
index 698fe7e497..5ec1c6b5ab 100644
--- a/meta-oe/recipes-support/re2/re2_2020.11.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
 
 SRCREV = "166dbbeb3b0ab7e733b278e8f42a84f6882b8a25"
 
-SRC_URI = "git://github.com/google/re2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.38.0


