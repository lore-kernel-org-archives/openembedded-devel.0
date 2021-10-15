Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9095DC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:33 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.4307.1634338592916376740
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=UoRC5QDE;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id t9so46908403lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oyBMeQ0hHAZ40YdHZGZlwWZc/CUP3zJBL7lGMCPvrfU=;
        b=UoRC5QDE40wXtS3ZNv2fGBPo8JhB1Tzv+b3ZWnIYeo95EEkyTQScbWGBGomWMRGPTR
         DZJVsx+xydObUyCc4ZwzwwIxZEQ4yZSdJAZp/AENTm8t3zrjHFFR6Xz3EUTi79sTZC6s
         7wudDRwgjsQINkf7V6Fapnj4jRgSewgvfDxZFRO49MOfU1qAvtXZ2QoAqTMq1HjlpRHF
         AS9WyODA8mgKPSlhPavgr5nHADSokGjY5//AQw7LUJ2IE+C0dOzY6uVbmwc8auNOmqH7
         20SMN6NIKfZJvMVSAyJ9esJ0e08WoY1p3m+G895DTp5D4uQxbgwBMGX0QunDOmo1TXmd
         exEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oyBMeQ0hHAZ40YdHZGZlwWZc/CUP3zJBL7lGMCPvrfU=;
        b=spFL0fd/RMkfg6ppenSQLZhxp7t/yGVQSOwVh4/y8Ct3vLiM0hXfT8cu1jiL2iWFB/
         ZYcQYFH2yhs6IyG291CR/UndBIfZXyyXi0LoUKQFGwk1gtzKK4AZYBvQlSpuLQhDSHG2
         dgqUCabfYRkJhKfquo77n6jlkhxJhiUUum+9dPQ9MJUD2jSukYr5uetsnJ4GBBUyO9Ax
         qbFvtWIqCYmEojtgZ2dGZ61GHYDUvJLLV16DmVYb4xlnNZXr7xYYctsdFkyICNN4oPTy
         xle79tcFOk3YZWo7EmlMEseur/TO9/qC2/9Vdx+uyQHPmVaKAYzZLf4VIfAA/w8F70UF
         KcCg==
X-Gm-Message-State: AOAM532UBlsRqA0kf3oSzWadnGE6/PqKfaXaUSJtV4WAZq7uupEdI/Cm
	wTvuaJU+7yLIv4BF0qmGfnfFVUBDKmm1pXkq
X-Google-Smtp-Source: 
 ABdhPJxA+EpjjOQ1cOw4UdDHvwsYGj+QyUK52hP65/HtS9ntOEok28by/uzfjhvtREjADPsCYbJhtw==
X-Received: by 2002:ac2:4115:: with SMTP id
 b21mr13702416lfi.437.1634338591015;
        Fri, 15 Oct 2021 15:56:31 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f10sm656960lfs.56.2021.10.15.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-paramiko: update to 2.8.0
Date: Sat, 16 Oct 2021 00:56:29 +0200
Message-Id: <20211015225629.4162985-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93360

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-paramiko_2.7.2.bb => python3-paramiko_2.8.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.7.2.bb => python3-paramiko_2.8.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
index ece55f1e3..1942a1d6c 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[md5sum] = "44136d79da4cd7619e368018ad022619"
-SRC_URI[sha256sum] = "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
+SRC_URI[sha256sum] = "e673b10ee0f1c80d46182d3af7751d033d9b573dd7054d2d0aa46be186c3c1d2"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


