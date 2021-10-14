Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD818C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:06 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.9264.1634218325317378763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=bq75YH2P;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id g36so10213485lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I04HozDlJ1vkMadwGdtjeFbcpDvOBniGCq4NYFYDmfk=;
        b=bq75YH2PJt8coGUrzw3JOdn6tYMn22nx8QuPC20RMak/TQzmBVqpQhNud7EWO/2QaK
         LBismd8fiN7GGe86eFB6+qsxEKTsl/Hm9W0PGXwCri2rTR6REObNtNwTaCTCBFNIiMQt
         575KNx0tvdP/m+fUGElhinvhUJYEW31tMIJ3UVXAc7Hyp9R95ILzMerR6cBYZOZLx/lm
         NIebkvMCDmG6LMNvXYPQ027Sr3iqwxrkuu8wwxs6TC9BRs0uLC4licGDHeC0r0QrMXMk
         jv7soM1dPejkVqzUBKQGdCXlpR16puaKXppGrU49/wRwyyiDbKoHOGfd/8bO39Zajbwt
         THLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I04HozDlJ1vkMadwGdtjeFbcpDvOBniGCq4NYFYDmfk=;
        b=4W4QVJcnriqZjGT+4dad2tv5PlI/hhhEFURHu62sPLqbLFRoVeZcfNZ3nVu6Xbtudi
         I+yXl3wNmbcNwf/hjzojFk629cbXTtZER0qaCd3pnKw9JwsvohwONg7lWQBXHiJJ5g8b
         LV8eUT5Zaa+1kS/NUV8wpR0ptTmtYfRTRZpb45aZCRGonQ7Vzwy6XEhiCwICBIGIsJMN
         8jKsLoxlvypt5Q5SDrYuQfmmdjiSW0oEf8ImaYJj75k3ftCPNpQNtjGnVnrAFBAjp4Kt
         l5gt8DQq7e6qUWs1p3nEpAdangRfHHSwDGjOGeRe0NKxSFG17ALt8QeVGmArSw51tzSR
         lFiA==
X-Gm-Message-State: AOAM530zWpaiCX7WR39WoJ8HIJy4v3vELCclPe55GFgGM+KGQ54T1OqR
	Jn82mcmMGiENDINKUkv/NQD/R+raE47CUuZj
X-Google-Smtp-Source: 
 ABdhPJwsKAsK3X62EY08kEARs1MnQu/TxIP+ThIAPlqkFnZTeR83p1TGH/u+yWpzSjWYg0M7lEPBEw==
X-Received: by 2002:a05:6512:3409:: with SMTP id
 i9mr4974502lfr.91.1634218323038;
        Thu, 14 Oct 2021 06:32:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p8sm228150lft.242.2021.10.14.06.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:32:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 1/2] packagegroup-meta-python: remove python3-anyjson
Date: Thu, 14 Oct 2021 15:31:59 +0200
Message-Id: <20211014133200.2547975-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 13:32:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93294

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f0159f823..b660cc9a8 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -25,7 +25,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
-    python3-anyjson \
     python3-appdirs \
     python3-apply-defaults \
     python3-argcomplete \
@@ -478,7 +477,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-jinja2-ptest \
     python3-markupsafe-ptest \
     python3-ansicolors-ptest \
-    python3-anyjson-ptest \
     python3-appdirs-ptest \
     python3-backports-functools-lru-cache-ptest \
     python3-bcrypt-ptest \
-- 
2.25.1


