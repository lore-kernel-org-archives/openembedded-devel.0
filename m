Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA55C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.4280.1634339052076637946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=eJOWrgNk;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id r19so46632040lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YcCH55OCD8Z8LbVjwmJ96UE+y+ZH26RACrfBV9TyUu0=;
        b=eJOWrgNkxdLhuL+EY2J5aVwnEQHlpPq3Fwt7vlNI9sqBy5akNUOoMOUrYbD0yp/8+I
         3r+sir2X7uyU4GvqNxh+mqjLd8ayoin7byD6ScYl+p4n5YP+z19pKt3cY3JhEC0Vzt7q
         7X65US0f24CDvuRUgfoRH4t8oWs4c+y4fpLcdif/VbAH6Wf10BGpaNOWLUt9az1dk++l
         Nh6barM7/yYK/J8czVBEagDSO2N0GHBG3TPxsGFZFqnCF3cD/euAaLviogp4UEXsFMXt
         b1SQ2NLctqV5oV15L7kCVIxS/cMwLzCfTS/79HHZDrmOzOoWT1dkK1oyJdehwes0FXbJ
         0sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YcCH55OCD8Z8LbVjwmJ96UE+y+ZH26RACrfBV9TyUu0=;
        b=VUwtNZE9hG+GfiqUOouEjGRaWwyBdz0VpG+xrkh7uudzBRrNYaSo+IExeipl6S6iBs
         kJdJQlHOzRqyzOk3RAjWAVOQxi+WokEmJMku16IXDLk8DwUj8frdUckBFnD/ui0tk2IA
         +cV2ZFoKaGUQaixAxzog2TZtYNsLhUDCwMNxcwXRKaQcN9aZrQ5F26eAr1Nvmi3caq4J
         v7sBYXxyBszOyj5IT2lYiqaqnCuazNM1cKW3xHj3YA/SaBWe9onLCGpoq2zh93BHRV3Z
         I1/Lr8di78zOYIlR7AAITkZY5AHKoWxA/NXhMDHN2bA/+m4mthUwa9DDKctTqY6eeuZ5
         4iTg==
X-Gm-Message-State: AOAM530oonS7yI1MN+lcKK36GkjHjzIa0ZUfwJtrud0xa2wXMkjAVEmK
	x8htWAbvbotPIo2EaEf3FOEHktpa6CrmA2hM
X-Google-Smtp-Source: 
 ABdhPJwBBYPjrnE9agpBlSON+zNxeFdbTpjMxBehdocylVqG13cKZwbMfmZ7lwpomZ9IiWm0NGRmAA==
X-Received: by 2002:a05:6512:2117:: with SMTP id
 q23mr14136580lfr.657.1634339050144;
        Fri, 15 Oct 2021 16:04:10 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 q17sm712815lfr.270.2021.10.15.16.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-certifi: update to 2021.10.8
Date: Sat, 16 Oct 2021 01:04:08 +0200
Message-Id: <20211015230408.4166612-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93383

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-certifi_2021.5.30.bb => python3-certifi_2021.10.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2021.5.30.bb => python3-certifi_2021.10.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2021.5.30.bb b/meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-certifi_2021.5.30.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb
index ef2c66b14..4c376da89 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2021.5.30.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
 
-SRC_URI[sha256sum] = "2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee"
+SRC_URI[sha256sum] = "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
 
 inherit pypi setuptools3
 
-- 
2.25.1


