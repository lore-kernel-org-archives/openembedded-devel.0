Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.925.1631984266061642891
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hEmaoap1;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso12206617pjh.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZjeNoGN2sLcFacmmgPDu3JTswAngoKIAFcrurNsIBfk=;
        b=hEmaoap1LTda1PuUXplYGs/+F2yTdTpm8N4SOOQ4offAgg/pqXGuWfa01gZZi9RueK
         aAU6r+nwmS51aJ1L8gAClGOZNQCIAA851s6T8X3Px81yf6hQU1951G0pya8zxzWV/X64
         etek0Q+7oGVvLBhJxNpV0b6Ix82G3oIsyWHw/u6SitflAM2qZTuhA6JkI1Cz1bBnjtFH
         SqzmxIuPnrvUQCoLMCVM9mmQ/82Yv2NZGu/PSmEInJKFAjYUIqc5HYVixhZ7nBm4sAf+
         sAYQaqv3r00TsdS+dYtYQwMjO/aXT12HGYdz0Ekug/rZplELmIOmUaV7laxZwKY/tCDx
         47OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjeNoGN2sLcFacmmgPDu3JTswAngoKIAFcrurNsIBfk=;
        b=gpNhFChyTInT5eeP/x3A/hmVbaEJav0FfAybEBur8Zi9JiKmWL3Ly/bSj+l9rlXaP9
         3ZoYy4pIIaEqw9sfL6UBH6tEG4DHDnK7Fy31rlWfJ6GF3ADTeFzCFw3QeiS6cUzfP1uj
         ad0AL9moPQ6sdJvwMzi9nSsdf9nI6hCDVdNImaJ9Hc7/EJ0my7el5VPwSNtQUFNf64HN
         +uTlK1ScWCPGOWtAlC3+wJUjls9wqi1fGjosAhKRqkmyufNDnz3fQN8JsGLByV0Qe764
         WDkRZ2hyHdrh5OTZoNnPk9L+Md5YS/wpc12id5Llur4asG+6nHfCo7j0C/7dBAidfuz0
         kcow==
X-Gm-Message-State: AOAM530g4eBd3v7Cl88PlLRtqCiocHu/mL1OefF79P2KeOXyxHxD/eU3
	gm3qOpUzxEmWLyXumWlF7ixrBLndY+4=
X-Google-Smtp-Source: ABdhPJwTPl19tqbTHaTkPk+ysXJShZd8KILq+W+CxV0k2ATuD2nd/fs4HhJNVEkxPKiESimP3HwvBA==
X-Received: by 2002:a17:902:654c:b0:13a:505d:6a04 with SMTP id d12-20020a170902654c00b0013a505d6a04mr15240738pln.82.1631984265460;
        Sat, 18 Sep 2021 09:57:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/18] python3-sympy: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:28 -0700
Message-Id: <20210918165738.2581429-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sympy_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.8.bb b/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
index 1dd0a5a854..e274857f76 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "Computer algebra system (CAS) in Python"
 HOMEPAGE = "https://pypi.org/project/sympy/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2245824980a408ef1749391dfba32b3b"
 
 SRC_URI[sha256sum] = "1ca588a9f6ce6a323c5592f9635159c2093572826668a1022c75c75bdf0297cb"
-- 
2.25.1

