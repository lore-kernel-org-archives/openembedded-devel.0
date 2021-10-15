Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D402C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.4319.1634338571401717352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Z2Jm/3P3;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id u21so44553729lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oCy3TNaQ+edb6kW9zgMRAc7VrL1ZQ6HNfrwkfPICe4o=;
        b=Z2Jm/3P3Ycdc1ghgkt5tOcaGuKK1Xn3UYlHfjUz4oSld9zF7IvqPAaMTtlPx/eZ4r0
         31jJX4tYNwQB5zmWA4L1UXwnvF/yJ8nKjkzrpkvHWtiRjuqoGZHkgMCqSpmqZWEytEp8
         kokUSaYvwKN9aVhAsVaZbKSqpXMsB1aPTPRsb6Jpl4h4k2ckFtb7zb7HoJm2S/5vtib4
         VUle9GRLOY/+MkYL7iTZiRTOLITN0mRrGAEO+p4o93riDeUOcOnjtf2BElcOfAJhIMgS
         SYmd6MZZQrrBNDX1+cRBuPKnzbu8H87ospuwDS5aTTD6oefTXcNGZ4+bHfKDwwWwl6QW
         f+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oCy3TNaQ+edb6kW9zgMRAc7VrL1ZQ6HNfrwkfPICe4o=;
        b=KPpLA+naC5koBDXFpao5LTyw55q+V9Nz0M0GDsANF76lavrWIZvTvaWZLtYsmz35G8
         3XmGA74qfQUHwcxKRafN3PltLeGresSVuf44mIwC9kdM/MJY/KkkX/A5kRi6UL1djfA8
         jlJf5zDUVBY9D5ocLyQzvwRPpt7G3cc9U6HfvCfLTc92Pny7pIYQSBZbgNMlUz8Yyem5
         3f1e0/XQqAKPdugy1vRVQFXAm4Rra0VSKol2/+zOnO9wfj1z3Svy1TbZDY70Ft7OP9H1
         qtahEP3onl1Q8YMNHd9PXTqZWnoiilLIo6DB/JNCLl0We9wfMYhkXO73ix00Dm6j5Gp6
         TjAA==
X-Gm-Message-State: AOAM532PBjdVmGgMzddBFjERmk9GkfdoqY7d+U/FME08NuRHKwb+DcQj
	Ye4G6GQ1aE7KtFmJYgXLSQYHzuWp9FvQ6Dj6
X-Google-Smtp-Source: 
 ABdhPJxC5lVsvlfDqilOXbU8GL5pJhAPSYMUQILXgAyrcjCZ7Ig/yPGFMNy98brcJMXD76aOrOs1gA==
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr2935913ljp.3.1634338569493;
        Fri, 15 Oct 2021 15:56:09 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 bd19sm706746ljb.28.2021.10.15.15.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pytest-timeout: update 2.0.1
Date: Sat, 16 Oct 2021 00:56:07 +0200
Message-Id: <20211015225607.4162362-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93349

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...pytest-timeout_1.4.2.bb => python3-pytest-timeout_2.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.4.2.bb => python3-pytest-timeout_2.0.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.1.bb
index 3fb8bdf82..a790a6551 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 PYPI_PACKAGE = "pytest-timeout"
 
-SRC_URI[md5sum] = "552cc293447b00f7a294ce7a1fb3839f"
-SRC_URI[sha256sum] = "20b3113cf6e4e80ce2d403b6fb56e9e1b871b510259206d40ff8d609f48bda76"
+SRC_URI[sha256sum] = "a5ec4eceddb8ea726911848593d668594107e797621e97f93a1d1dbc6fbb9080"
 
 inherit pypi setuptools3
 
-- 
2.25.1


