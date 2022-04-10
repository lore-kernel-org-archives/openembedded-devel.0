Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99529C352AA
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.21293.1649623266593404997
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=juHxagS4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id t25so23358346lfg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=469NRowZNzX6oh4iEdlXLbb2ETpN4I1FmzZXei1hcwA=;
        b=juHxagS4/XCvIR7VYEaKfKrMzsvNeJ2cVRRzpUH+9TCha62yl7VRJo9SbG2XUdQmut
         LlJyenWdHZjBQgmDMNy2mydxwH41lNNdo9gM/3gU8/dSV1mtJrYrFe6hNgipAtuHuakx
         gRoNmNzjPizJUKRmg6Y2ytET25AVInkuHGb0FXJuyyoyWZ2scBQQ2o2rbPSd5P6txZqQ
         qg3BwcSisyw7S4+gOh+FWqRo/vu4SFYR18EnkP1XtzlbcmBkvDlGy7fVQqkAScMOheKh
         Ib7xQkHg9qx3goTS4buHDNXSKAgoBbCT/PWMoh9HUe/FIzBYd7YqdRPwmt5v2Pggf7ja
         SmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=469NRowZNzX6oh4iEdlXLbb2ETpN4I1FmzZXei1hcwA=;
        b=iS33RCZ6X+D/zFS5IoomazFIt7ES/PsvSMxsKVedNET/LSYNDo3MJM5JL7izcC+pxM
         F0M5DhuazPeynTLCRdsru3hM6zKnonh4em+bnD4uEJMxinKToFc0SsoGVgC91Y2R95/Z
         OJarLKvnbfh2PmbgXShPea3iLUHpdQDZRp6M5g1SoWx/6zkrcC/9AfNkm4s7HQq+VRia
         MaOJ3XyVbZ+F40mNzHYwhWcV7O5b7d2QkGGYGY+yrcUYPKLx1WvvqVHBXacZSOxTh42l
         ZynTXpvY2vGQ376JRVKlc5xkJYABnzgE9r/tt10yct6P0KtoLuRjDlJ3w7vJOwDkhQIY
         PozQ==
X-Gm-Message-State: AOAM533T+dldu28IxfSz3/QCWD4klWDpYIYcn6qm2DKY3NvuQ0Jos24F
	18zvK5Mg1qjqr7Ih0VocVE2ZBqRH66YKL0iC
X-Google-Smtp-Source: 
 ABdhPJx6u0EUByzhpLbeChCtbG/diKC27/hb5TIi+mxseppNW5wh09Z7Kz7sUT+IejRz5XOvfAgaNw==
X-Received: by 2002:ac2:514c:0:b0:46b:8997:9ad6 with SMTP id
 q12-20020ac2514c000000b0046b89979ad6mr8320579lfd.620.1649623264624;
        Sun, 10 Apr 2022 13:41:04 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 a2-20020ac25042000000b0046b9f84bbcesm352938lfm.48.2022.04.10.13.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:41:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pytest-helpers-namespace: update to
 2021.12.29
Date: Sun, 10 Apr 2022 22:41:02 +0200
Message-Id: <20220410204102.4044288-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96515

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...1.4.29.bb => python3-pytest-helpers-namespace_2021.12.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-helpers-namespace_2021.4.29.bb => python3-pytest-helpers-namespace_2021.12.29.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
rename to meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
index 024650e9b..00e73f5bd 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=440a4cdb311cd7ad181efb4cba06d562"
 
-SRC_URI[sha256sum] = "183524e3db4e2a1fea92e0ca3662a624ba44c9f3568da15679d7535ba6838a6a"
+SRC_URI[sha256sum] = "792038247e0021beb966a7ea6e3a70ff5fcfba77eb72c6ec8fd6287af871c35b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


