Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07D9C47087
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.21472.1649623280308937158
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=NXWYaoCB;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id y32so23381623lfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7F9OUzjP9Yp5ofYOX8WesJvpnnWWbXzpm7//8K4sGU=;
        b=NXWYaoCB2mj2ZJ+nynynm5YWcDI3Cv/P2A++DOqsNAEDIOt7Sh2btKgSmNzEZTUoPS
         TsfAuhm5L6aZV9cd9py8MKpabxNIYZoc4SJrfhoOIKvWtna6YYnMVBJTQFjqZWe2BcNV
         6oWE8VXekVIVvHvV50YmkGzUhyh/JOYR6JcVtV6gfdgBUdUTgpKSL1XBhzpvKFpGBq0e
         wB7NCUOaFqdRIN3uBO3yRonPRYYA0PHWDqG+2uNT3R9isUY7/O3MdDV6nf7YVYsH5ypR
         E0XLr3VJaAoFRFXqiC/zz6V+4ft588oRxmW37vE7QeKqz9Wu24CqMBezHXZOkiLJLk7l
         BKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7F9OUzjP9Yp5ofYOX8WesJvpnnWWbXzpm7//8K4sGU=;
        b=rVzkMCgj6zwSyFwgyBkpskNrxRqiZQufyeaL2XSt0QOaS4KgwC59CMzXWr8P/Onu/I
         a0GhnBqcB2tvi70bMRnb+Yk0pBL+zKh2hGjwAGXggShc3PiIELMU75TR2sjN9mTup3St
         Of9Y3PhNdy/cRg4UpTYpZOQe5lnz2coI1qUyYp5xYlx/KQmiGq+4/uhL+GDBRo3AunL5
         UVvEXGOlrK/pYrjq8iJNeW7SWDrNugZheQVxL0UEF9t8LTdhKkgfCgLFlxYpqTkvVFRH
         kR3dDyurZaa9GV31tyR6M3Z4gEChQUfr5bN16qyYFNk7NyBEdJZ+SmuYP2PfB24YA8Du
         Rt+A==
X-Gm-Message-State: AOAM532Xex4ZgZu0YvdPVjGaxQE9K+YH5V+3B+xcJ7fFHuxlRsf3BDTt
	A7KZt+156eVEa18tmjJH0HCJK9SXcP89Sb/R
X-Google-Smtp-Source: 
 ABdhPJyX/gXbdvfqbG5krTNjWCulsJWg/L0O3xPbUZiZsi0iso62WdzH1NjvDGL+ijMyWgLlab9WtQ==
X-Received: by 2002:a05:6512:131c:b0:44b:5b7:75bf with SMTP id
 x28-20020a056512131c00b0044b05b775bfmr19589075lfu.652.1649623278076;
        Sun, 10 Apr 2022 13:41:18 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 z16-20020a2e8410000000b0024b53036641sm820490ljg.81.2022.04.10.13.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:41:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pymogo: update to 4.1.0
Date: Sun, 10 Apr 2022 22:41:16 +0200
Message-Id: <20220410204116.4044644-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96517

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pymongo_4.0.2.bb => python3-pymongo_4.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.0.2.bb => python3-pymongo_4.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.0.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
index 6189730b3..d47dfec50 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3364b5c153b0de15c39cd13c5ee73a473f7337eb2d9610711f50f14a3a611413"
+SRC_URI[sha256sum] = "dbba77bc0b706c7ee496fc75a6c6ed406d85f6091d5fec488a8944c3828e6462"
 
 inherit pypi setuptools3
 
-- 
2.25.1


