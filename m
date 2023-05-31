Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B724DC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9071.1685521567116095511
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=HtUH2iP2;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso3309815f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521565; x=1688113565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iPohiFajYmrghxLJHNLK/TgwkOYzptMUMQXjybrhts=;
        b=HtUH2iP2/9SCvLgVliw6cPMv5MbyJV/xnxUlXz8pAvJXm4lw5s3F4CV/CVhIc9qfwD
         vKAjXnzuUJUsmIuTn7GuFInY6Ay3fFDP7TNLo6+c+F9TXSQw2+drZltDS2I5kS4UeHFQ
         VDc2jHyp+ePM7phEO3r3K9FIutckvQXv1g8umXuxSlu4oexS9cDuzm/HYYWWdMioBoZQ
         yrnAjU9j9dm71CCFfLHzr2vXg4qdWPFTHfus5hEcdCwIKDRqqw2nPXcmgw5/pxBEK/6i
         OiUqpDG56eJtUXfNKSrMJVNePzJgt5P8SahOAf4Ix/nkVaO2ZX1nM6b/Lrl4hIMCH9qi
         1icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521565; x=1688113565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iPohiFajYmrghxLJHNLK/TgwkOYzptMUMQXjybrhts=;
        b=RJhL3GZsmHwGduggjtUBRmbnIsWtvq9X8AUrovGL9iF9/AKFje12kUajWyUDbIofRk
         gSKsOFm0wvvJd1OVjUwkIQIiQEs9RjfwBZPWHbVqKtkVF7G5IgMg207MnVXgViQHSO+g
         i8c4sqHRC8ElkhpPSeu9//5RXSDVidD8dpJFoUG4bc1+Rfxu6H15QYIk2Fus1D4KrAlx
         jh7qjBdVesh49RXFh4LLMWQPIDXrt9xosuI4INuIVK6pPL8zMDAfraemhAdl1M0O9ij8
         LjDwYsnLelEes0Rj7vgXsk42NVTUVmbiZMDDe885eUNOYT9F20qGe2NzpQFmw2YuTAVB
         hNWw==
X-Gm-Message-State: AC+VfDyetCqRYSoJuCMqNELU8FSeuDk9umQLveLa4YbNXxvog/Vxl3SZ
	4ZUsEfc2RYsgCt7bjmNc0+ovPQ==
X-Google-Smtp-Source: ACHHUZ6jfda8k2UZ1sZ7ZiB7Ukv6beYsvAsi3OI7eoDZULkSqjfiNCcBv7pJtI4Ewcdir9EG4TBKvw==
X-Received: by 2002:a05:6000:11:b0:30a:efe9:3cee with SMTP id h17-20020a056000001100b0030aefe93ceemr4034926wrx.62.1685521565612;
        Wed, 31 May 2023 01:26:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 054/149] python3-pydantic: don't use PYTHON_PN and improve coding style
Date: Wed, 31 May 2023 10:23:02 +0200
Message-Id: <20230531082437.10646-55-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102981

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.
While at it: order dependencies alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-pydantic_1.10.7.bb          | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
index 70f6834f5..7392b5103 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
@@ -8,13 +8,13 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "cfc83c0678b6ba51b0532bea66860617c4cd4251ecf76e9846fa5a9f3454e97e"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-typing-extensions \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-image \
-    ${PYTHON_PN}-logging \
+    python3-core \
+    python3-datetime \
+    python3-image \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-numbers \
+    python3-typing-extensions \
 "
-- 
2.39.2


