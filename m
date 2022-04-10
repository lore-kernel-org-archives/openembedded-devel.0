Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95B6C38A06
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.21341.1649623477038653638
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ZVdqyWT9;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id x33so16932884lfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/G81XrRJY6Cko/yd9izjAIvkR5GAfIC/QfpYEGOzYl4=;
        b=ZVdqyWT9Q6URk2+3qhsvOk8r2TdnejStu3pdz2F0DQF9TYaazhKVC2DoMSFnWSNpUy
         Ex0G3zue07uObu3qnoBNeUgyr+7JhB5RRDgLdSpMey6Q21VjMf6lCnZYYon3AJmVUC9Y
         X/64qZCmK2macCr/M8/LSNPIUssJW7kzB/x7XYejBtveSdmB0U3FMBnqF1ifqWH/KJG+
         OGb9v8+10g4RH2bim3On4di16k0Wr0e1J+MjwS8lWUKVIjzeyqnVNtdA73vMvi6/er5f
         8zVoU6qhtdnW0mHTfTYVZ8oSbGnpOLNK8SJmkbcQS+M/Z1/OCb/e0OO4Oud8n7xFJaWI
         6rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/G81XrRJY6Cko/yd9izjAIvkR5GAfIC/QfpYEGOzYl4=;
        b=JWO5scJXl1pNURjN7hd9CWrOkwqZ0H++14R9uO7D7pR65n0xNM4Nfk6jZZ9xx2UqUu
         07S8wHbKEitPbSaYSNvTo605A2CQi1PNu9fgMJwanhMVgshRHkGy23k7pxd7zoYNIEDf
         kYDyC4FgudD7O25Atqm/LNHwgrv5esSjpwCPTBhoOOInp4WYruqgncyYd63B+yEhmm8u
         8o+Ee5ZE+Q9QPrmxjfjlUsFpgksS47dJDY2jB0XPAinfJ5TuqdhHRLuRBU3NvF29VcjS
         k08Ah8nhRr1S5I2KWTLAfndZKyqN8b20FSDElszmx6vqsz/hPT+h5jAfbfbavL/ZAo9k
         37BQ==
X-Gm-Message-State: AOAM530mDw/YIGjhIjPSdbl5V2hi3XFLWsrh5vueFSFjHaGKHbQQ6+ub
	1yw6C8+4TX5PMcDAkPJqzZ3K1XtSo0RdYdVB
X-Google-Smtp-Source: 
 ABdhPJzuJ7wS5EAGWDLwTkhPucHp4WB952ZRjjv74OZLGrj6lZqa0mO9iRh+pg0aUk6mkEhKusO8bA==
X-Received: by 2002:a05:6512:1148:b0:44a:6c26:e5a9 with SMTP id
 m8-20020a056512114800b0044a6c26e5a9mr18830242lfg.491.1649623475000;
        Sun, 10 Apr 2022 13:44:35 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a195e1e000000b0046ba5a4a75esm190310lfb.148.2022.04.10.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:44:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-api-core: update to 2.7.1
Date: Sun, 10 Apr 2022 22:44:32 +0200
Message-Id: <20220410204432.4047253-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96527

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...oogle-api-core_2.3.2.bb => python3-google-api-core_2.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.3.2.bb => python3-google-api-core_2.7.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.3.2.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.7.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.7.1.bb
index c43fa4c58..55884e99c 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c8889f45cf58deca522888ae1d39b2a25e93e7d1b019ae8cee6456d5c726a40c"
+SRC_URI[sha256sum] = "b0fa577e512f0c8e063386b974718b8614586a798c5894ed34bedf256d9dae24"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


