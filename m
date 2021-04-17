Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3579.1618693577723920429
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vCpsQyDX;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id a12so20619795pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XOXHstCX+Kh7nA3JlEZDH0qdExec+O0wPC/P/iyukZ4=;
        b=vCpsQyDXo1+avim3kLqSZjT+jyI1OuYiUTz83+FoPNQUVEmt/Ny1FY2CVeCOxoc3uJ
         xk0Pgq5eYVXlo6N4V/pr6aPnnv0RE2JroHcNk7p3mfwRulfx/b2FJSay/CDFAC4N54cq
         ovAogapnh9CXM/yiJnoDJ75juM40WQCXF7KayRy1b9pykNjYHpWk7/iKY8QqOTE/LUqa
         p6kRtbUUDAzcOe7Z5pTQ6v39gT+PnxJO8oWmd4oUm8uTii6G4sAxkL+wubHvRDM7+Akx
         HgV7uoSn4DkYJXTxe2vQd0K9vBeE7viUshsLpq0hf/7E35/kpfhOUEAHmWUnVyMrgm7c
         IkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XOXHstCX+Kh7nA3JlEZDH0qdExec+O0wPC/P/iyukZ4=;
        b=p2solsug7fjRsNpxMK/vwkMcOSdXXSXDRHtQWmiHfDEHRNGGjcB9yMFWjfmMudz8fR
         umPphESlScbGY1gUnjDpRtOPP7ijH9qWYsI8OCkZnrjQgRLCtwRsy1vAj42GaAQA/T+l
         RjXadju0e4WaJdb/vUbcNTNVMbIblMv+gGJtQfQLu1KBHblkqR2hB8DCmi7Fkl2m9KZB
         A3dR2N1bBwHPl9uZWU7JapWdrK+JACQZS7ebAvJ/2cBBpfs/NtROKaJXYORCr3Jq2kLL
         kfWqB4Iu1lbIdB2qoAH2oaxq1p/+EjkaMkvlgjOxrjwa3wxZefyAoIElffkztLgVD/l4
         4x6Q==
X-Gm-Message-State: AOAM533ot6S14wz1vyxyK1t9f55JQk3zyFnOKC16b43+8vfe4JM2Tz8q
	31OaJUSJpXF9QKEKV3Fo8voQNy78bjGzEw==
X-Google-Smtp-Source: ABdhPJwKTR1/aGE4OkbcACAhXfv96IEd/m4HWohhrBDB1aUoqU0eOtVDiVCLIl+gkx6JU5HFbttWNg==
X-Received: by 2002:a63:e707:: with SMTP id b7mr4729684pgi.389.1618693577176;
        Sat, 17 Apr 2021 14:06:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:16 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 10/50] python3-robotframework: Upgrade 4.0 -> 4.0.1
Date: Sat, 17 Apr 2021 14:05:19 -0700
Message-Id: <f3b636c86acda62b23ae3fab50e5b7709ac2bba7.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.0.1. It is the first bug fix release in the
Robot Framework 4.0.x series. It fixes several severe and not so
severe issues reported since Robot Framework 4.0 was released.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 801b0870288d55864102c0cc8bdb8522d88d8bc0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n3-robotframework_4.0.bb => python3-robotframework_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.bb => python3-robotframework_4.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
index 6cb8643bded..3e5d67e0a47 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "a02a6f4af3b0830e4396058694c333cb63eb47f50acf6723be34f0f7a4d73ad7"
+SRC_URI[sha256sum] = "9fa609ceb78f67b1476edce8a7011b16bf3ab41c0fb8c211de6c99955eaf9fde"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

