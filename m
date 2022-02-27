Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B453BC4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 07:58:53 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7185.1645948733255826591
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dPGJfCq3;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id b22so8229465pls.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UYbAbEf4leac/OvAV/vonApmYpQBs/ZhTq9Gaj45+tQ=;
        b=dPGJfCq3gCCH9N+jLDVKp6b9YOI4TKree3DFYlz9DhUfiJb61DXA0OXJ5MK+1vrWzQ
         ALL7mv27lESNOwUDLY95bviBc0r5n+Lcm++G4uGlRM72f3/w+q/0DyZOEi5Gd8vieekG
         Xe9V3PhIX1LugyvlGXEse8+nJ15KwWsBJkeypDfGZ7oUq6ggMXAixth1d39cYSiQkAyG
         4rQnLZWGwwd5Kou2eQHQjdAr0tC86m1Ir7ZJUKFRTxfecOsWirACmXkMAx32+cP+x9y3
         EPA11fvRogT3fMbB+lNUdl3EDso2jWTXfW55dd9hoOVREq8zMhMRncM7MHcCLNT4FbsR
         4mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UYbAbEf4leac/OvAV/vonApmYpQBs/ZhTq9Gaj45+tQ=;
        b=K5Yv9CN61kEfpaVtiDKKlD7vn9nQJQjUgq2Ee9MaSBRudn/umcrL0m3akv0HaE6oh+
         2DT8NBIMn9OC2N/qs+STfJFymLM4GzbcUPoymRFL3Yv6E5mom7duZpbmva2I2CFjqaGn
         Uluz7Z1OmuCjNPZwTbrEZ1hm327mfPjwo7PuxC06zMPYFGMNiLhgZ6G2NGj9DwDSCWoP
         Zo+O6N9JoVzGrLi7548oyBXmH8mYLE/H3mV4MxQ8a6l7htPwQZK+JI6Y7CN032JJDE4L
         mdSRY+xKenh+wrs9kAj9nfGQelwytrdG7EeK1dc5gQtc6uv88KF2B3CYGoou1lhTwI9m
         b5bQ==
X-Gm-Message-State: AOAM530wqlZr89CW5tzAQROLH4M97z/QgHblN00HlA0NJLJNrNKy5bUD
	Bh9ZgL8ajVkwE3oI7AuzQZvxGRsv4yzHlA==
X-Google-Smtp-Source: 
 ABdhPJzs/z63Xuyhd9qaXjeGXRgcU8NXR55Z42kSxQs8lNBGGrNGtFjIgxWPaat9iiBgkSms/XyPjQ==
X-Received: by 2002:a17:90b:4d86:b0:1bd:223f:6cb5 with SMTP id
 oj6-20020a17090b4d8600b001bd223f6cb5mr4577556pjb.151.1645948732556;
        Sat, 26 Feb 2022 23:58:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm9012845pfv.50.2022.02.26.23.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 23:58:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] python3-pycups: Inherit setuptools_build_meta
Date: Sat, 26 Feb 2022 23:58:45 -0800
Message-Id: <20220227075848.610467-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227075848.610467-1-raj.khem@gmail.com>
References: <20220227075848.610467-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 07:58:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95556

Gets the wheel dependencies sorted during build
Fixes
| error: invalid command 'bdist_wheel'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
index dd00f444ed..3866e60a12 100644
--- a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
+++ b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
@@ -16,4 +16,4 @@ DEPENDS += "cups"
 # See https://pypi.org/project/pycups/ for data
 SRC_URI[sha256sum] = "57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13471dce350e380c90"
 
-inherit pypi setuptools3
\ No newline at end of file
+inherit pypi setuptools_build_meta
-- 
2.35.1


