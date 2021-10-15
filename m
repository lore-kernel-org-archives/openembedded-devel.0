Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCCEC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.4356.1634339048301295674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=dFmR2LUk;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id u21so44619272lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZOKdd8boXaTSUlsPqd9vskVgzbBwkonz70BhX1P3yY=;
        b=dFmR2LUkaj2wbTTxBW0+dtyr3d6XGgIw38j5sKnYpDLIs1SNfpj+rnOQ2fW1FP+Jok
         rvwAalLtqEV49wrxI2wu782cNRworsc0vMYSntJ7zNml1qUz8Ufcd+rH43mcy8aH2ERn
         wVIMS8FPz/0EvrNqWAEasUtU27bUuCyTpWXRFlYMwzHU6GttP+SISEMSSgs5LvjYLiEq
         1m22zlizHIMaQV8tB9cSs1BK6xl/RuQ7ZbshcRh6W5mxUMT3zWN/27Qwx+4ieX74pzcm
         bM3mcsu7Pzy9rCuSDYebx4n6KwYs+yJ/3kwu2UVjAMA2c8nDcnvC5kHHJd/3uhpugjbN
         UFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZOKdd8boXaTSUlsPqd9vskVgzbBwkonz70BhX1P3yY=;
        b=z8NhTNjerC8sXLKpAhR7+dXbRdRcJiEhDOkuuheRTLZ/jMBOwmOjqRxLu3bvQUWfC9
         UwHyN/XdcuyOvFza7YKkW7aINaJ24ZpYmiWaY4oXp6dRr1P003Ki/d/3wDB+bT+x24vX
         3m8JjAXCpm3Ds5aqCMKFlwWIi769Z9OMB1yGcaLW7WP2qYdYarCIM0FfFJQNCcycF4o0
         xha9NAkGSX7/WHDfxXUvkz6ZwgSW2GSPo7vyEkeBov6JEuHgpVNj57wD4R8Jmxj4dFbK
         BVsn/94YX8tkIPUhUZSythov/Ksvv9S44Ct22YGjojxTybjC7QMfrsgHkd6g8uzGcBVx
         jgcQ==
X-Gm-Message-State: AOAM533xlBQPKUFKvnFdbxM9IKGbMSOO5QoY56iFAuaGl+xn0lrxRNcE
	Gup1kJMYSoL6a2ACyjOItY7zPG5KUuyuqNmg
X-Google-Smtp-Source: 
 ABdhPJy+ITfX4eiAydyrUrEiRQ8ufBWuEol407RFXtSgoANkbanj5jvsbIdDNjfWaS1e186YYT2VQw==
X-Received: by 2002:a05:6512:3a92:: with SMTP id
 q18mr13969769lfu.198.1634339045877;
        Fri, 15 Oct 2021 16:04:05 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id h7sm705489ljh.97.2021.10.15.16.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-colorlog: update to 6.5.0
Date: Sat, 16 Oct 2021 01:04:03 +0200
Message-Id: <20211015230403.4166500-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93381

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-colorlog_6.4.1.bb => python3-colorlog_6.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.4.1.bb => python3-colorlog_6.5.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.4.1.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.5.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.4.1.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.5.0.bb
index 59a0e9493..bd9008330 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.5.0.bb
@@ -7,4 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "af99440154a01f27c09256760ea3477982bf782721feaa345904e806879df4d8"
+SRC_URI[sha256sum] = "cf62a8e389d5660d0d22be17937b25b9abef9497ddc940197d1773aa1f604339"
-- 
2.25.1


