Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0BBC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:43:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.19064.1744720982813564864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NJnaUITC;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so821164866b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744720981; x=1745325781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8oLJ1r2g1R6WghKtSE0Zu1UjDqhcisFV8UnsV6ukgiA=;
        b=NJnaUITCJLW+0a6eN3r8/jBbP7CBu7WCBdadHmcZzQsDuuB2Z62Q/lBuZBzWXqSnRh
         U6VTPDV1nyar71p6AWn/FsKAhTl7uKrChBZ8P53USzknun1QetqpS2FdIW5D/OGcEgMd
         4k/DOsb9C+/6jhY4USSMe+JhxAUNDP8ehxfGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720981; x=1745325781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oLJ1r2g1R6WghKtSE0Zu1UjDqhcisFV8UnsV6ukgiA=;
        b=KFyT9R/ZIHS1VV0ApOALoqGdQFv8tX7plAcPmRDMgEMvS7DvllVD5E7N/7u5lCkxZH
         fdOxInMV+JRzFTNElHcTsKs1MyKOETX6e8BIB+1r0moCOvEwDqfSyGwIn98phOEnJYYp
         Nky9psyf+FDe8I8ZaY5qoGn9dZDuE3GwiW8tCwzWSzUh34UpRZ17U/reNvWb/O/9oqlB
         TKEmmDD4ZGp5Cp7c8yfAb9Zwvlp+d4rNsItqjcQ04hz4+QjznRGzBwuc4eoKtDZ0eyLX
         V+iXhpM6szag4+6uv2Zai7KTIrTYaulKI6CzFg5wlIGZyVj6sLYWCbT5NkvOOZCrKYZ3
         6zKw==
X-Gm-Message-State: AOJu0YxLLC2Tl+dFtuMOp+lDJ1HXgvxsjyZezPiUE9hVf+OvN77AZ6/j
	iRVl7Wt8dcV4Utm1SgpoKPC7ZCb4Rkj/oAnqatEtkwZQ/lJBpPTYF+loKO1qRbsvYkMearUGmRr
	d
X-Gm-Gg: ASbGncvtk9GrwKzT5HFUZVsrIaZFzoRe4ra7lo1sy7++lmmU8UkRgbPp7tC7ELd2iDJ
	Aw5UTNQDpiCP6XLyY1nEbqnp1e+MYk5U7gQXk6oNwuYuH3Z7rJrFXvtz7r4HLnnxAQ9IYYGwF86
	dygUKu018hdKjUgnLKUCgnENrkBjHtIzOMHyCdSW6oetXijl0mlpVTHInXFgiLMm2LZZdeS2GZb
	RN15ahTdK2X4PAZp8+8/Zo/ihyATIABy3USx7ArNFhs6P902Lm6CvjpxHeZbgDtGLo5loM4BiL6
	qBLOEkLvJXrRP2r93+wgo67/+zGa8RfzxuWV7dIZyRi/6zTpgeI7D4IBwzKzZTlTqA==
X-Google-Smtp-Source: AGHT+IE2vRgHTuTSy1h2o0vPn3QxlKTQj2EfmlDTWcrvHNodzoIT4Z1A5EkbGXacibyrWanE+HiSmQ==
X-Received: by 2002:a17:907:6e91:b0:ac7:81b0:62c9 with SMTP id a640c23a62f3a-acb16869156mr278278266b.20.1744720980970;
        Tue, 15 Apr 2025 05:43:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm1069660766b.47.2025.04.15.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:43:00 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-zeroconf: Upgrade 0.146.3 -> 0.146.5
Date: Tue, 15 Apr 2025 15:42:56 +0300
Message-Id: <20250415124258.1202166-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 12:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116861

Upgrade to release 0.146.5:

- Address non-working socket configuration

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.146.3.bb => python3-zeroconf_0.146.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.146.3.bb => python3-zeroconf_0.146.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.146.3.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.146.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.146.3.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.146.5.bb
index 257ed4a187..63383a6079 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.146.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.146.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "fc64ed2394291927468b0fcc71c70483fc333bb38e7f9c0f7c5369b525248a85"
+SRC_URI[sha256sum] = "e2907ce4c12b02c0e05082f3e0fce75cbac82deecb53c02ce118d50a594b48a5"
 
 inherit pypi python_poetry_core cython
 
-- 
2.39.5


