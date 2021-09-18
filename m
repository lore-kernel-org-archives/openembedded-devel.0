Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.2234.1631991291600117034
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 11:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sle8Y1IV;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id 203so4489048pfy.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+u9Foq1ifJbhpi9JJHhxeXJNOazaN74LcgtTONRJY8=;
        b=Sle8Y1IVxx3c0TlODX5elvL5ea1sVxAniNtitNUJszs0tohRd9+w4wkcGfB96PIxl8
         TJHFCOxvaxqOqwkEE8ni2LGF89bBeYkjSsRJamrtH4wvqF3mqmtA/GV8WcRXJX+sITlG
         jc6ASmBYe1S//jvgILsF5HtM7dSrhbbJomqVDYvbm8VZfUnT13bRCTR+bV1Zl+yF98Qx
         vPIvLWUIGhuW0aeMgNwJNrIscXvvU3qgGNden4V/5Fi6tOpxcUpbygTt2Y7k9j/+ROpU
         rEUzpFA5r742d/NkrPaLeniGOEmwirTJ/u4huWOYPStKKe1t+QzNGvXy9+rKMJ3ZXZb/
         qajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+u9Foq1ifJbhpi9JJHhxeXJNOazaN74LcgtTONRJY8=;
        b=hH3hhkft+RC1Hh0CdCiE1IZsxmrtmVHBmFEsST7HbfXgWn6B2UO/F47GIReRrEjy81
         i0rGEZ6l5bykG/IxKNzuKk84/N50zUNyzW7KPpxgTRzNOZw0SdcMaBrBcYuRR+W+R/nu
         awlr3IjKljIeXjxWfZXqC4cLmF4zzqVOAMNZAy0kXN3pHBbfoR0zodMyZjw/t1e9lsUI
         UafK3XKDgZ9JZMdYxYOd5R05nLdv9DhmDmT+0U1Bt0v70AK4vGV/DsIQwCSXh3R04ZAC
         Jx8Dvsv1bxzwny/bh6EyeqZjNtY1n1uqkA/KJsgmlRMVaSuqiUrmqDElKxQ9OncNTGXH
         VQ9Q==
X-Gm-Message-State: AOAM530vwRBDOqMbCjeTfPyAQ9C0TSI5Llb/tzwTt9+FJBTcAgjr1+5c
	+3rqQbEXYJki8h/gZDf+DaA3ufK3Mco=
X-Google-Smtp-Source: ABdhPJyC9lANW6E+0Mm4D85hS1olGri4oyBN86NjSwNWd/kgFPOBHLRW+SB1u43hY5mQ8znOU5W7IQ==
X-Received: by 2002:a63:894a:: with SMTP id v71mr7258131pgd.13.1631991290798;
        Sat, 18 Sep 2021 11:54:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id q21sm8503698pjg.55.2021.09.18.11.54.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:54:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] jemalloc: set precise BSD license
Date: Sat, 18 Sep 2021 11:54:48 -0700
Message-Id: <20210918185449.3691848-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index d4fed864d6..7cd06f1025 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "jemalloc is a general purpose malloc(3) implementation that empha
 fragmentation avoidance and scalable concurrency support."
 
 HOMEPAGE = "https://github.com/jemalloc/jemalloc"
-LICENSE = "BSD"
+LICENSE = "BSD-2-Clause"
 
 SECTION = "libs"
 
-- 
2.25.1

