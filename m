Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A03C352B6
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.21477.1649623325544693482
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=yA1NvwZr;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id q189so1241488ljb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jfh3y2Fyob7CbMI5JdBVpyI+1W5eUqzrO0JOn7UcMMQ=;
        b=yA1NvwZrKJrdWz8AJmRJ+AGxk4Dfe/sKaW78Pozbemlu0SKxx9PSft5NtJ0GFCwcaH
         00PHFjXZ2nYRNvhNVeAes2UEOyuCxnSluF3Zan4wKT8IMip00Xi7pb/Gp32T4E9o45Zw
         /Of29Qoeunwut5r77jKBY6BCetMlY1Q5Bl5F2hFwkudMnsQmR+ZnGcgwU5TEyDknpsL6
         e6JRZW8vc0wvoc6c+HQ3bjvgeQ7oNF1M34vLCvI3M2fwzdLNFCWQnlNGCdzCqpNfzgop
         +tQbgT6mqtQsGVXIjnXv3KxKaStJvVVIglSC5L7B8iP/MjyTVIJsGG3YIIlBIdz7O1U8
         ps/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jfh3y2Fyob7CbMI5JdBVpyI+1W5eUqzrO0JOn7UcMMQ=;
        b=aMrjOXADv+V6qmPV/7TWfquPAKlh3ss5CMjHPJjApvzxDQWw9VMzRTARxyc5ksWokE
         D5iImLIw5P/k/fyscT1L1kDZFcM5zmNREIB4jY+FvcS30K3fyEBFZmeXamsKv8J0urh+
         AOCYoy+geN3QuIxYtLTMNmnAk06k6RdQjUVa5rBP8fcoRrhKbX/MhRVqrMmZNGi44jB2
         iPo2iG/FXgBSfl6N+OHYHuSsmfThx9kcCnMspen2i5V/fC+SCgXhrfX6AQgyjRWr54FA
         lB3oBcZSRZcfA+lzN8eoDN4+cGtOUFSB1fB64gtaOE6Bw15cL7k+wtCQFdALgJCIYb/p
         UL2Q==
X-Gm-Message-State: AOAM533x3WAieKWi+Lh5Br6E5DjWN4Y8wu00IOzkyrit5OIQ+ZnynQTW
	9cadQTRev1XUltFOvbabTnay+YhZyxczV7yy
X-Google-Smtp-Source: 
 ABdhPJy9PxNxfZxmoVWK94ez5aiTQbr9HeadZANFBNv/LVg1PyiWNTqWqOZFjRLbY3F10DKXS7CSRw==
X-Received: by 2002:a05:651c:311:b0:246:1250:d6f with SMTP id
 a17-20020a05651c031100b0024612500d6fmr17582052ljp.455.1649623323409;
        Sun, 10 Apr 2022 13:42:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a0565120a8400b00450abeb42b3sm2076645lfu.235.2022.04.10.13.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:42:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pycurl: update to 7.45.1
Date: Sun, 10 Apr 2022 22:42:01 +0200
Message-Id: <20220410204201.4045023-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96518

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pycurl_7.44.1.bb => python3-pycurl_7.45.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.44.1.bb => python3-pycurl_7.45.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
index c9b3b7187..407c26484 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
@@ -9,10 +9,10 @@ HOMEPAGE = "http://pycurl.io/"
 
 LICENSE = "LGPL-2.0-only | MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING-MIT;md5=75f131c591546fd1277ca49c9a81ab1b \
+                    file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "5bcef4d988b74b99653602101e17d8401338d596b9234d263c728a0c3df003e8"
+SRC_URI[sha256sum] = "a863ad18ff478f5545924057887cdae422e1b2746e41674615f687498ea5b88a"
 
 DEPENDS = "curl"
 
-- 
2.25.1


