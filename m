Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54918C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:57:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.25274.1639249073914972705
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=6Bl1rrja;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id z7so23723806lfi.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqFBhIQLCaQcbflTysfzwDUkZ/oDK2xCVzoptvqGKjA=;
        b=6Bl1rrjaI6BQxew1FyuhdvnYKlOGGYOZ5eoManTsUbWNUKCs3eSU0srBbyI3Urj4lx
         mbXt/Y6gq0ZCf74piJbCI4Def7txeshKYYdd0irAO2PC2eYMsW4HkzFOi3JnKW6JUamD
         R4pD1+azNlMuG6/RGW574qak6VCdIT1AT7dwNsjJ38hMvXA8br+RGnnt6FfMwE5wwddk
         hF5uVU+hPg1MSKicZdg2AKpgZNd19FB/orM5nvIivcD2AmsduoXKA8mb4VMqPv9qS9W+
         xGdATxztHpDRHtoLRBMm+lhPIbEkUF0UiZ+uQEiDQf97gsrP2rI2YL3dnUQk5XrX5zl4
         6XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqFBhIQLCaQcbflTysfzwDUkZ/oDK2xCVzoptvqGKjA=;
        b=HtT9u6IpDM0Sj100GKl71BUDOFDbRVXg3wTQabhC60KMa92dp1idlq3R7ZJFom4lJx
         zAJsKU9Coosl8nAgBRo86uj9Cm2d6eNSiSIm/Je/cJDedNii2XEyqH6ibw5EWSmYx1kD
         4mXBxD2SzGyTDDNv8OrS4/tBmYC56/UXta/BSGVZsAhDzg/WWsA1XxzYRsTjTxxza78N
         Ert45A/RB2+CKt5bCJ3ZnF/YzgF0UoGiwgZvGEqvhm04ZrS7IeAwmqYVSypv8yskowDg
         mG5jzpv9kU8wXG+W+apspqG2ptbs5fbI1QNJBooXLDQk+ikrQluEmIY4KbbmwG/2sG0K
         EFEg==
X-Gm-Message-State: AOAM530MdIIFGamLw9cWUEopTZ4Sn0hSjVHMcscQWt4l4jjuB8WnB5pF
	GeWytZi5oqQBFrbzvNlXZi6+rqJm7RJKn9Nh
X-Google-Smtp-Source: 
 ABdhPJx6nvTnvoWzCKkve4BHYlCUd8Iw6KgieIJxe8LXKSF96eAvNk0UgNnunz3dw7U/K62RU4FMhg==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr19343733lfq.228.1639249071584;
        Sat, 11 Dec 2021 10:57:51 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id r6sm729934lfp.66.2021.12.11.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:57:51 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pywbem: update to 1.3.0
Date: Sat, 11 Dec 2021 19:57:48 +0100
Message-Id: <20211211185748.2545562-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:57:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94288

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../pywbem/{python3-pywbem_1.2.0.bb => python3-pywbem_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.2.0.bb => python3-pywbem_1.3.0.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.2.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.2.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
index a6ca4d5f8..26758427a 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.2.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "8ef48185e0adbaeb9bd5181c4c5de951f6d58d54e2e1d7e87a9834e10eabe957"
+SRC_URI[sha256sum] = "5df0af28f81891a3914a12f3a30b11b1981f7b30e09c5a42c011797e7fce9b6a"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.25.1


