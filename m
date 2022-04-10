Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8372BC352A1
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.21607.1649623244433018687
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=uX1uhWKG;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id d40so15848132lfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Er8n1vRhAayQkQjfYU2loUTlLo+FiSJpwM57gcToXy8=;
        b=uX1uhWKG72VlC+NxmmWFdjqkDaigiba9rjzf750Xb6ek89bel4CUm80DZ6W8F6SDiM
         XI2gsknt5C64EJ3+Sa8gz5oyXSkILSpLj0mpp2+MbySw5et8+4SmniQS48miRyzmSz0h
         B7V0PNnfmWsgsjc9aPWDrplOt/S9zdmu4JtGpKcjdDNcUmCfrhGtwqd4oZmNJGaUv9TB
         P1SDPdsoL0k8/Mz2XVQ+co+FoAUJ1GQ4tMU2CCIwQGaeqSv1aKAJAAguQl6Vr3UjQioz
         diAxgtYLnWxKe5g7S2ry+5+FoQIESkHWWiB26b60YlwWDP4HjFTj3PhnhPPTHILOJ1h2
         TxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Er8n1vRhAayQkQjfYU2loUTlLo+FiSJpwM57gcToXy8=;
        b=i0LPc8C9c5Rmet++Isdzwrzn5bpqKmJPpJd/t6SFp+DPee2ucDl1DBtf4aXWpTYra7
         /PreRZaoIBWtGEhNVW8e75P0Pe5l6HPlvEWFK10ue07xSIQSms6USDGG5hRtGEO86aFw
         bCnSlGp68MaM6QcUnM+Ir82IdTwU8eH4+PmyM9Y7GbA/LilpDnv6skstRMPHUVqgm4PI
         rx96Mdke81xD55JXbg9I6MYmwmo2dZmibM0xbmBTjEzk0n3rpAF70ju68NHuNe8+16Mu
         EHShxV2jILMlS8OAbkHr8yzT6NX6wZ0/LvH5+lwf2ybz4qi1TFbDmLYCdoo7YOWll7pa
         s3cA==
X-Gm-Message-State: AOAM531QLvL2uVD1nY6owOR526fe/IUMwL1U5xGamkco6VTLkzJe0EiU
	3iwEyYf1qu8s+BB5AiM+dMTw2w3vj6emJGgS
X-Google-Smtp-Source: 
 ABdhPJzCxf31bNbwSxiRUXvQ//eOkx0E9am9Y2V8yFWtUpLo6owYZdbKQnCUoJxwAfDuCOETsJmJYA==
X-Received: by 2002:ac2:4250:0:b0:44a:ff88:3795 with SMTP id
 m16-20020ac24250000000b0044aff883795mr19567581lfl.384.1649623242327;
        Sun, 10 Apr 2022 13:40:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 o7-20020a05651c050700b0024b4aa635c3sm1035537ljp.124.2022.04.10.13.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-twitter: update to 4.8.0
Date: Sun, 10 Apr 2022 22:40:40 +0200
Message-Id: <20220410204040.4043660-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96511

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-twitter_4.4.0.bb => python3-twitter_4.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.4.0.bb => python3-twitter_4.8.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.4.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twitter_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
index 2305e89af..247b4e584 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "8d4b4520271b796fa7efc4c5d5ef3228af4d79f6a4d3ace3900b2778ed8f6f1c"
+SRC_URI[sha256sum] = "8ba5774ac1663b09e5fce1b030daf076f2c9b3ddbf2e7e7ea0bae762e3b1fe3e"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.25.1


