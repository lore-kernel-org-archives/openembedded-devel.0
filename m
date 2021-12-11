Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA757C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 20:03:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.26191.1639253037634526551
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=FsO4rdKg;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id k37so24029508lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pn1qfGKcK4qi3ie9baRhupulZz3aOB+GVaSIxqeWu8Q=;
        b=FsO4rdKgNuJ/Reezk2vjvAdxR8hBlrohSrcKaLqsJMKeJYE1fOU0ZlbyQGOcZpzkq5
         uBcttGoDWvcBl3GR4dRC1T20eXe3LQFzsCc7lL6TS9SWlwDtRFWQ5zt6tWe9e1Jgp1cs
         dWQHlMvLMuKYfksoMwktKJhjfwmOmwKga5rUNshZfiGZM9178ZFDNdsfVgqdHmZSOliK
         ROWzuPtb7NzSmRVD843ReJvmpmyaVyBd8nB+YNV/nAVj/68mvmmnzDTwMdSOVh0JJvxP
         ApkwbW+xYO0iI4JUVc/uyLhipDME3VTURTwiTVOoLC8pBSKelPzIMM6z9/v7vrbzmjdk
         Zseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pn1qfGKcK4qi3ie9baRhupulZz3aOB+GVaSIxqeWu8Q=;
        b=bQ50gNnrziQ2vbuO8MoG4c/zXiN52wVmS/owDpUySyjxDWEyKrlAJBbrOfbZZTo54u
         c7sbRJqaMcM3R5LGGKmPs4dNc2kehwJdDdoaadL3Gf8tK7asTyl3mpgqNMCXSrVHD9dr
         EfpkqeDDc066uBB8tZ8qk81J+SBFhMuAaphJ66VmbRxfmywZqmFg2kS6wiHCHwe4yA1n
         ljiQDRKsnu6Hyt/+RQGoXSyroWQCzwO/7SHWHE3b5XGnqLaZgvbszzGurAEEgul3POR+
         ui+4G66U3samB0BsBb46zaPUfUL8XNvGGwdHj38vglJ6wAGgfJLlVsjZt9iuRo0Js5Cr
         hajQ==
X-Gm-Message-State: AOAM531lwas/kfBW2wKetxyaW+dyHLLkfo6nkKH86UpZy/KabxHY8Env
	esVRGhagTF9X6dINZgmIB0t1R/xRdSJ9brKr
X-Google-Smtp-Source: 
 ABdhPJyaXeK2cZvkOI9pBz9ZgFJ7szit4lRZiuh7Vxagg8SSej6sVJGBp1V0RMpNYwn/JdHtxNwuHQ==
X-Received: by 2002:a19:431b:: with SMTP id
 q27mr18969532lfa.562.1639253035729;
        Sat, 11 Dec 2021 12:03:55 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 p13sm774369lfu.130.2021.12.11.12.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 12:03:55 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-coverage: update to 6.2
Date: Sat, 11 Dec 2021 21:03:53 +0100
Message-Id: <20211211200353.2612123-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 20:03:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94300

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-coverage_6.1.2.bb => python3-coverage_6.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.1.2.bb => python3-coverage_6.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.1.2.bb b/meta-python/recipes-devtools/python/python3-coverage_6.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-coverage_6.1.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.2.bb
index c456800c5..6e080b00c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d9a635114b88c0ab462e0355472d00a180a5fbfd8511e7f18e4ac32652e7d972"
+SRC_URI[sha256sum] = "e2cad8093172b7d1595b4ad66f24270808658e11acf43a8f95b41276162eb5b8"
 
 inherit pypi setuptools3
 
-- 
2.25.1


