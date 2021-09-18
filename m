Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.926.1631984266739958870
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L5ynVExN;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id j14so1149790plx.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hbV0MwF8v5xd+0u8Mfhx2ECGhSrCgnTvFWmc3Mc68Rw=;
        b=L5ynVExNcoG5ywcA7PFJuw+kBwGZIS5FeiEwj610XO5KF4L4h1yMK7cTukemnuUWCL
         AaXqL+mbYXalk8n2+QLhQi4y+fDgKFv+EHK0+YwjYD0RE1XJBqeveuJmDbgRrg/B0ah5
         LmtkuSD9BiW//bil5uzG20PKEJ9MJ4DxF/AhqPtqyzsu4UB1uVz0+CWlnGTK1JG3dtQT
         IHxJ8wobOZokjQkHmH0GTdeLv6GqcQCUtpc/d6GOaUSz40DBi/mWkkKU/m/zniKbWGYJ
         R65CwsZ63W34E5Ualk95p8c1mDtdQuDrhr4o7fnFzHxbCgLi2XBrYYxKPelF/3/Q63O1
         F4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hbV0MwF8v5xd+0u8Mfhx2ECGhSrCgnTvFWmc3Mc68Rw=;
        b=SNrdQ+e9Zykbtz+66Lbifcj7oDRlFGIA29pr12Rci4nyXrhEqSHSyVPxD//1Q6rQ7N
         UvK8XMvK7rNIcYwbS0fA0BT5PbxSpua4/e1Ih5op1qm3ugVMNt9hPnT69lQC7E0hXemG
         45XHyUe5lRb+WwZzVxSutbMKYzl9suS5/de2HCQOdOxrvjGSyEfdHgFkvTooOM8A2rND
         V7ktjLn9mcYG054vapQunDru0BgNEp5YwPKMCWn/sY2teBDDQ28ixVUOvwRpO7/HO4WL
         rBr3JXaSFILT3OGh3ZJsRMU7pNBq0WEfX0+uoU01iB0GG/Ok5wA1x/qtbWmPUZnmE98R
         3QSA==
X-Gm-Message-State: AOAM533ZSyy6QbAO1cuGdXv4L2M/2xgmxZSgSIFKCcOmUh23h+JIAutB
	5pkVRd0wXjMysGZQ/KEpbudEzcQQibY=
X-Google-Smtp-Source: ABdhPJxe7QXXdYjsOkvO/vmhAPIU32YF4qU53FesBvBfNdIu4vXMZpqFakaFipAs9bapKvrpleO+Mw==
X-Received: by 2002:a17:902:868c:b0:13c:8ce5:92b3 with SMTP id g12-20020a170902868c00b0013c8ce592b3mr15129765plo.13.1631984266115;
        Sat, 18 Sep 2021 09:57:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/18] python3-sqlparse: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:29 -0700
Message-Id: <20210918165738.2581429-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
index a159975f71..3565da7d13 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Non-validating SQL parser module"
 HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
 SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
-- 
2.25.1

