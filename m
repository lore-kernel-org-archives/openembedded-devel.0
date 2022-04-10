Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA27C38162
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.21308.1649623346255576291
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=CBskLEW4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.180, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f180.google.com with SMTP id s13so17836260ljd.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMxnEAVyok3oyDfHQqfYEFl9SKyHIEIlWH8bcyfcXQo=;
        b=CBskLEW4c2yxRiNdgenaHikdtR8E7w2ZpxuIf9oFQOzw3DpdEge6TsqXLUaLzHxrsh
         98EEOwkEXBG1kbwXxrHaRAEjmDk25vka4qq9hi/M4FHDcSSC+255MlNhc6lHqM1bambQ
         M+gIjs4U6NEzGozqady+Mhc+BdL4ZVV3UFKiljPbK6xvbVw4R/hTmdK10ybvLrzuFndW
         14sNxSUQcmEDnmFVBeJnP1O4Hta+6wtAzTmb6dYbA8hUfODIx1nkZH4Dbs3Bg2NlduL7
         c9TO0JORn/292m3VOjSjtQohjLg1tekMDFjficU8OLs5/10GL1XwpP0gxdHPLxNOf1MS
         3Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMxnEAVyok3oyDfHQqfYEFl9SKyHIEIlWH8bcyfcXQo=;
        b=jqgVIMznSbO6Pfbxw1hmaOg/2qQdeF7XK/pmd4FeNP0o8dmLJogqOf+81gGgzGa37M
         BUJ5fAbDEn7FkgmI6Xzv/ecX8KMLha3X/LUTN/bM8vP3cqX+Iamq3rKZUFxKqbIgcAch
         H1GYs0uiw6/KwQzeoC/goReT4z3xZOaIRLB1hew4bPrEHui7hfeHmPqeQBgRIKP5E61d
         Jxn/WysuRyJKkPpZ4doVfWHqtIDSuS34ofltE1WJu0S6eaRvgSmHrHQjOkKwF45x420u
         sDMmGX++RxyMINdYvfrrjR8q1x0F+ffFuPO2z9pFX5rdjAiRujcIjMCzL+3mt9TKGah5
         17HA==
X-Gm-Message-State: AOAM530p4TJMcNUCEFInrB+r6ZwWXsTVx5SNsx3S37JiVbxkZK/TrxCU
	4lTtNKX26zhmm8K6eA2s3VqSUvwku0uTSBrc
X-Google-Smtp-Source: 
 ABdhPJxBH3cxJoSHpukdTrY6p3/BsPaSE81k7nQZVB8FXbZ1MK2O3cYwzNMVldaqrQ5BEwRXl3TJ2g==
X-Received: by 2002:a2e:a488:0:b0:249:6096:a381 with SMTP id
 h8-20020a2ea488000000b002496096a381mr18473376lji.268.1649623344102;
        Sun, 10 Apr 2022 13:42:24 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a2eb555000000b0024b4afa8888sm1017909ljn.78.2022.04.10.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:42:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pint: update to 0.19.1
Date: Sun, 10 Apr 2022 22:42:20 +0200
Message-Id: <20220410204220.4045429-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96520

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pint_0.18.bb => python3-pint_0.19.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.18.bb => python3-pint_0.19.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.18.bb b/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.18.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
index f555144f4..e1c471e06 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.18.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8c4bce884c269051feb7abc69dbfd18403c0c764abc83da132e8a7222f8ba801"
+SRC_URI[sha256sum] = "3e5913e4ad125f672f72e19e06a8cb1f6d36a4922b6e5a49e04ff882511f82c8"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


