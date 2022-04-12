Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82517C433FE
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.929.1649797000131271251
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 13:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=VIOXdvcl;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id p10so34230385lfa.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nqpuKVNWfdUVHx9zDJpR8tpcO4erEdh9zddCTD5tZk=;
        b=VIOXdvclp9lPBZZdCacg7peMOYa2uqUWKQSYDyEsnsFESb3mNxFJTZToCezC/2QAhP
         PN6WgLTnvK6ft9Lw3bs3iYMAq/9BeVqHkhX8JJyMEYcaU/Qoj3ldbzHmiotTJq7TYJWR
         VvJFrWuLSut3NsXykCoDk90kXAZyIcOVD1gWEsCZtQSwDHMfGd2I28ibB6f5qJqjTRbs
         AadpEZzcaj0ciECRjTuGPR1MAnh/KfMzkLjhStpvn6Jme9f8vfFMtsfiBkfJDt+Gfp4U
         1wkD6CZKi72FnuHHFzRy1Vhg+p4M2HlNgSYMHeDo+waVSznfi9vAidp+nahv+okW3ojY
         zrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nqpuKVNWfdUVHx9zDJpR8tpcO4erEdh9zddCTD5tZk=;
        b=5U6/PDn+XC1qiJGsqIGHox8C0v55MBUT+hPaZYkkSSGDsBomS2KHB5UqD8PGB5ut37
         4V7yE+qHtyFRgBwtINw96argKMxQby+VZw6yTo8Nh/X8KGg1JUdJ0XUKBScMJFx2wePI
         yH9FNRRz/eokl10glrh7niIIeRkc0o/RQXCGNfz8KdgpYRMWH90mPKFKLagRz6hdLjWh
         TY6QFi8JRFGWcAYp3BjHxXMCUlzOuuc0thZ1vRqgjMfYioAY4izMFvyhgNcLAaz6QuU5
         N/PlNDO6P+1dm0H0bJpis/a8nAQq7tteYZ2P2Y3VvWHMu+RVvE2UT8UcqjXd3zqoxU5X
         MOWQ==
X-Gm-Message-State: AOAM532J5u8PkNVf15Jtx5FNVPzkuvnTgrdlirRmWmuJk3qKjp6/uad0
	jA+dYMzFAD6fjCgE1xB7tUFIoId04OWo7lpsh6I=
X-Google-Smtp-Source: 
 ABdhPJzAHwnPg4ZL+/wWWmzn5Qvi/ytOHy+a8SQLh9tlAGQ8ZQbpGfMgZWmoDKKDI+p/LNtv96m3yA==
X-Received: by 2002:a05:6512:3d01:b0:46b:a5ba:3b7f with SMTP id
 d1-20020a0565123d0100b0046ba5ba3b7fmr8893555lfv.454.1649796997742;
        Tue, 12 Apr 2022 13:56:37 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 2-20020a05651c00c200b0024b5eb11f92sm953766ljr.19.2022.04.12.13.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:56:37 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-extended][PATCH] redis: upgrade to 7.0-rc3
Date: Tue, 12 Apr 2022 22:56:34 +0200
Message-Id: <20220412205634.165379-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96593

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../redis/{redis_7.0-rc1.bb => redis_7.0-rc3.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0-rc1.bb => redis_7.0-rc3.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0-rc1.bb b/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0-rc1.bb
rename to meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
index 1a9577154..e977d67f6 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0-rc1.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "9bd57d3c9ebba9dbbd6cd14b0c263ce151b0044fb6620b556449c2d82e06ef3d"
+SRC_URI[sha256sum] = "66b2ecc2e4b53c62940589434ea8af3a85546df131001680ed294028cd84ecdc"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


