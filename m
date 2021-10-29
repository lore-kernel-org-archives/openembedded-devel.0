Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B163C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 09:43:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.3241.1635500573480305620
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Y/iCCkNK;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id p16so19996006lfa.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7/PIWd15u0ZI3ikQUA0j+j3YLaeB1Uzilex6ZtxKbw=;
        b=Y/iCCkNK1sDjIIXEfju1HfiCPGOHw3e6wmBtvfKG4/TeOxw7gOrl2fTglTslarL7WW
         tfA42xA0PCyGVIELmffQeBYxucKwpaS7ltWB6ciGtVm9nCGz5jqTg6pBRG7LarSJXzYK
         3JCyzlMguzCOa7+6VhhLD29zsm0rwW9VaDokklpHx7HtJPmjw6gWFUuo8YvTEtm2oD9D
         t9tzSxD5fdDi8nzvLrt3/slpfRa8VOJxeOeMxLapl6Pfyf6kSXuI7iChZrTPwh8TzV+X
         iKeRGNaxTIAsjBszaeW+aVFNy0oh3mAT91XT0WZz0073juWwZkmT/nJMtczQ25wReEt9
         KFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7/PIWd15u0ZI3ikQUA0j+j3YLaeB1Uzilex6ZtxKbw=;
        b=MUm8hxrzZ7rnMsdh4L4FVNSCOCKP6FqKg5yVnBSqIVTLiqbdu94+YYJ1clC4tzxiIC
         KpuCKB07N2qnMyISJHQJkM3Y/OupxkFRRKCrLeVL/MRrZa9gbBJv2wVpoxn/7MlBkWen
         iuVfqKhrfzYBWDQeNh6XSsYSOogXV3YedOzTi139DLpeNK3QFa2XL1l2HYfo9TPENpZ6
         lydVtvAxOb65YzelFkCBGRD8BQ2CevaTzK5jvd6yX8wuNXyZCzCp5lw5W/HDu8nI08tf
         fKCwCzCUzqE1xSHYecW8RmgmSJdc6l/OnTpxYT01A31eLf8Su6WMmORhWRpG9nmmFvZQ
         rx2w==
X-Gm-Message-State: AOAM532DfbUygWurNcYXdlcuprsTF2f2Psd5H5yU4NaGXoH57fgQdDV5
	agucT1yMe/w2+KIM6Rwp7j8fTO5alYo02Q6s
X-Google-Smtp-Source: 
 ABdhPJw1Cx4cmAmbiGEHUd5Hk9UKMq4K7F7VMZB8YESmSUc6U0JIkjoX0BISo1OFHKRQ3nzgmjCRPg==
X-Received: by 2002:a05:6512:38c6:: with SMTP id
 p6mr9196692lft.526.1635500571546;
        Fri, 29 Oct 2021 02:42:51 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f15sm558443lfu.104.2021.10.29.02.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:42:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-api-python-client: update to
 2.28.0
Date: Fri, 29 Oct 2021 11:42:49 +0200
Message-Id: <20211029094249.1415023-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 09:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93648

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ent_2.27.0.bb => python3-google-api-python-client_2.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.27.0.bb => python3-google-api-python-client_2.28.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
index 41ab48c6b..19ae3cba3 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "659e9955f0f1e02fcce5dec85622eb5af1807572ef0f09c49d68d8426da670e7"
+SRC_URI[sha256sum] = "07e6fdfc489a452d79c5efdc4cc2d5cfd7f7aa207dec82786bfcc436b208e027"
 
 inherit pypi setuptools3
 
-- 
2.25.1


