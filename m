Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.36789.1606592855363937219
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t2DxqtBw;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b10so5981821pfo.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ETIjNY4iXRXou5h945iH2xKL5AWfyw5nyTWmknCvg6A=;
        b=t2DxqtBw9qKkUazQvM/v9WFi+S2SOz5FAJoUd63KXwbOGmlG8Ppc4wpPxjgyUJLJ/f
         Mw3Av6UEBNWEv72yyD7wF7y2yn0FUrgOu7QotWsG7ez09hsGVdIGn5bnsfVs7fXikZ17
         C7ur22AZoN4QyUo8wqM1mbg0otv5WoPr0xMQZLYkSvHvPgviWqTNPO2d2wP5BBGZbPL8
         xQLOFdFa4KksNCVdTcpu9hs25GEZTG+ccuxsvurZqXUoKG/6xjzNPkeGiNkZQi99Op8Q
         0eoQcj2LVaTlHcJah2sBiu3Vex3LGRixXsEL1PV2M9U8CjhSrGWniQoWOKPz1uACAqpv
         ScMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ETIjNY4iXRXou5h945iH2xKL5AWfyw5nyTWmknCvg6A=;
        b=XNXZCCLOnzrDIhxXb4OliIUgyBSDDVToNoGqstIl7/orpCwuzFj2+9uoS5IPbX4n8R
         g+WKwRmHqs5PPY7J3H7JQ/hzifsh4HVU8PtpBtyeTTkCwkrTz0iNHJrMGAnYYQWWFUWP
         LjWPrXJ99lo+3Piud/0+feNpXGHFB6D6zoGtjkS42XLk2MDunUsHDgwxjENB6DW451BU
         uih0zoZj/GUJt9witm8gX5084lj/i0CrNhZVmT7dMrLyyGS4dswZiWXiKh8RE2Qh0tFc
         NeNMJKTj/uTSiJqAGne5etwsp6uP6siLGwrSapm7dDUY70T5e4nS6lb/k7Pmf4rLtFRH
         ykhw==
X-Gm-Message-State: AOAM530cjDVUFUyY9qxLUbmL+RH8OrVT+UU2NjN5NJI02IBl9IufMnWK
	2cr00iTTD4OVnpnh6GnDD0JB5SoFxLqtRA==
X-Google-Smtp-Source: ABdhPJxKXiQBQGQDoDmlVrLu2+idwV7mc+8iB21ccTcJ3b3xiT+xislkPpsJVhA5SjVX8o8eAnGhYA==
X-Received: by 2002:a17:90a:3d48:: with SMTP id o8mr17735499pjf.103.1606592854742;
        Sat, 28 Nov 2020 11:47:34 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:33 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 16/16] python3-sortedcontainers: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:56 -0800
Message-Id: <d6a9e42efa1ec22b79290794d1f6bd44185a0dd1.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
deleted file mode 100644
index 6060c03723..0000000000
--- a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
-HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
-
-inherit pypi setuptools3
-SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

