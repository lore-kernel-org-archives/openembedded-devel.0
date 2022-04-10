Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4395C47089
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.21319.1649623389932283070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=F2efGPff;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id 15so3005411ljw.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwJHM66x8ZntVvw9qumO7wk2aCMznv3/yNzk6taNfvc=;
        b=F2efGPffHtEat9M3gO7a2GeJ8opKrvtH5Sn4Ytx04KpmhsBjyInzRPByEy4B86hpBw
         gaDTuVZ5crqBT/dOa1AbCazLre5QdpXzfGWUqWR+oROElPQ8qEH2G1v+aF3CFBGEBiS7
         HM/ltDxn1M7wC1l5zoEQlMoDmyPpqJ7UE5sYTNjN39Ka0nhi0OH4nv1I6Pz+WlR6ShwD
         JoamSRwRv7eFHAgZwDUK672pOsS006Y9xGct7sZdZcbUOAmvetTYo7yA46qpb5b6/U+v
         63S/OAqkTxQVJrxcG5pLtYNyyt4ipPQFcnPEkwDlVlNBO0TjkUjG9dlPuME4nODRg3DN
         srLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwJHM66x8ZntVvw9qumO7wk2aCMznv3/yNzk6taNfvc=;
        b=em6bGfEGJdT3Eu6Y3Ifd+JD3k4FemQpeUczjWr1ifOVbC9jdhfkbbRDo+uArmwsMrV
         pFm72Il6OV3DtoJBcfAd/PbGy/B/tvL3eN8fnLwOFcwmt/1ewyF4euXOoIK/KG6aBTbR
         gtD8vKMnZwcPHJoKtCKTm/jIio0E/9zaivZqRtWCtI14QZl2RKA5auNLNER6+4sdbPux
         E7OPrqopeHpBzGHHvPQB2Nf4jQnoR2KRoRHzN4eU/+B+oL6mJGHkm4ULC57wh+V2jMbP
         4fjLgYmcjIkIHWpSN1pDf1Mq7evx6xU+gjDxi7NSHxK6EUmeH47NZByD8VyClhi6XKpC
         9myw==
X-Gm-Message-State: AOAM532EmKJ+PJqo6BY7YeyJ7FQYtsE9L1kCxn5cxThXhN9AJ4WmD4F3
	FMKMxfUj3oNVkOh3sAnZcSpxetfUxWqgvvRj
X-Google-Smtp-Source: 
 ABdhPJyz8xjpyJYTFNuLcV/Fwr4JoRnYp8vPGPZRZFjigfh3th/MzOEaMumsc2K8YrBG6OuxFGZoAQ==
X-Received: by 2002:a2e:9e43:0:b0:24b:3c6:3832 with SMTP id
 g3-20020a2e9e43000000b0024b03c63832mr17892703ljk.63.1649623387874;
        Sun, 10 Apr 2022 13:43:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 n23-20020a056512311700b0046b926fd343sm549418lfb.142.2022.04.10.13.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:43:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-jmespath: update to 1.0.0
Date: Sun, 10 Apr 2022 22:43:05 +0200
Message-Id: <20220410204305.4046078-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96522

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-jmespath_0.10.0.bb => python3-jmespath_1.0.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jmespath_0.10.0.bb => python3-jmespath_1.0.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb b/meta-python/recipes-devtools/python/python3-jmespath_1.0.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-jmespath_1.0.0.bb
index c395143cc..f454d6462 100644
--- a/meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jmespath_1.0.0.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2683790f5fabb41a3f75b70558799eb4"
 
-SRC_URI[md5sum] = "65bdcb5fa5bcf1cc710ffa508e78e408"
-SRC_URI[sha256sum] = "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
+SRC_URI[sha256sum] = "a490e280edd1f57d6de88636992d05b71e97d69a26a19f058ecf7d304474bf5e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


