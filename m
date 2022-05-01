Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFA1C43217
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.182.1651422411322471423
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=er5CzK1F;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c23so10924023plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mDOIz8vRt9q+oxjwNpuF/SCHo0Aq4Q4luV51jBewMw4=;
        b=er5CzK1FFOh6/a9LGhdrlrqQU0sC12nsXkhgvSM6aTZo25arGFv9SZ5p1/2cBEemPo
         5CMy436I6pOV2Gjn0XGNcHsTvXBt4b9zyokjJFyOP4w9D0Ch6Pxj3aNDPUb1YhN7D4n2
         bt7bFKl0nXlBev7d3gJdjnwDKyn3Sfxrt6Hvl6PB6x530a64Az13+R9jlWpDTQqG8gB4
         quzhOGZUOvU0NpgkBiPz2ACl92Sg6uMutZdrZpGecGhz/diOTBf6WMZD5GSaFO+7ukSs
         InlENNyJlqDdaWB3iNLhbO1XAisYOdjabMoeaZQJMHiuO1Hm0MKQPJck9stvSWLmkMEV
         v3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mDOIz8vRt9q+oxjwNpuF/SCHo0Aq4Q4luV51jBewMw4=;
        b=vvHATnIp9i8k46fAp479CZP20ghP3kjZPXmzUauf4tFliffYYqUuy91xPwgSBRhxyS
         NirIdSFWp6pwHN6TjqJQr5y4uCbNoVesmtWgFL7+9jPHuVRECJkJq0QFT9Fl+DIIxV7E
         3VBoxwSWXg8ruqqVliWTkS04w5430viQ/cH6txv0QS+ScrZR70vhB8ytDdluOxZ3lJSx
         bR4RPdUWkc7+nlTwFsvSplo/r/Smqf6qnAZxuZ7Efeew/eK4UzTmmhDZ5KIMjk6TzJ5R
         HblDTwwPbRUqwhM24t0LfK8tVCLo64FORefNJ67jsorRVNkL1wjfHMs23jNG/MXsA7kE
         fV9w==
X-Gm-Message-State: AOAM530JocYFt3cnxjRVAG3/2F7e73qMtfeosCzBqTiZhtleid4HDxhx
	WvHnmg1NohT9atdar0x9j3DTQ0Coz1DLkg==
X-Google-Smtp-Source: 
 ABdhPJzw0ak0/ayQLu2HNw36th1pDNkOLnruDxO3afQEnsjHj/4gUBjVyIP2Fi19qfnOFw1CaMHPjQ==
X-Received: by 2002:a17:90b:1b0d:b0:1d9:7cda:cc8a with SMTP id
 nu13-20020a17090b1b0d00b001d97cdacc8amr9018413pjb.174.1651422410512;
        Sun, 01 May 2022 09:26:50 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 03/10] netplan: move from meta-networking to meta-oe
Date: Sun,  1 May 2022 09:26:36 -0700
Message-Id: <20220501162643.513646-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96915

add to the dynamic meta-pthon lot

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netplan/netplan/0001-Makefile-do-not-use-Werror.patch         | 0
 .../netplan/0001-Makefile-fix-parallel-build-failure.patch        | 0
 .../netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch    | 0
 .../meta-python}/recipes-connectivity/netplan/netplan_0.104.bb    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan_0.104.bb (100%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb
-- 
2.25.1


