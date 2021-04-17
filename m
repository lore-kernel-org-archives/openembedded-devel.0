Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.3510.1618693572952351067
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vAPXwK91;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id f29so21540358pgm.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xj0zVbWHmFDknV26u8AaLZ2CF+lxPSiDJl9fvYkU4bQ=;
        b=vAPXwK91xuZ752HMK7K/kLn/5cc3JDhR/4Zfocz9gXGlXxiME6eB8ykKcWZC8Nlt/g
         CQJOVgyghkXVn4i86gPUX/dpn/5bMi14Agq+kj3zxQkYnpea6PYrEL6MhtJYhWKT1yax
         S0ymcFhz1N3wutnQ3kJeU9ypGxxck//+cu1EglUIdLnBLVCHxIrR5OqJXwxXxb/IwHAK
         DqsrdJJ22UR/UV8WRHJ6fFyFN+PeOjPLCalM1KaDV7p9S31YQPt98VcopVNugVoDGvuY
         ZOWTkg4unsHn5tqs+4C40Wlm0oK2G7RxYvqZ2Kg4C1Ij5Q3QZeEtSqgCqgCX2TCVzTs9
         uZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xj0zVbWHmFDknV26u8AaLZ2CF+lxPSiDJl9fvYkU4bQ=;
        b=nLTg1QhPAuEYvnzAogtpH9kMe63JvGHBOvfmCNPC+h/w6uNNKXdgq0GHAJC0vOU4uT
         2J+4DmGGd5pWBy7PhxxMGKaBwOLulILcqW+/DJj4R+V9C9/OxpOqun986V/d8eM7Nphm
         PlGljA+7w8T5ZoqlWVzsHy9PmcPTBYnQJ4dbX/YnZoy0Tv2/wf9ure1uUiFqOEZCdWO8
         /bWWmIc/YiakXGdTeHLu+gaLD0XZj9PPSpicnjD35AUe7JLbcw2BgzUI4KOc6M7Jv3KH
         QKZKusA3oJXzu0ghc9DtTztvyDf63FbXe4oiD2luRkRKBQksdEAnSLE6lEQfs1qwlgoT
         uM9A==
X-Gm-Message-State: AOAM5316+sJSGwEwfOWD7I7cNF3xyFneR1ii3PKYGWKgu1Oe8J6vjMNJ
	+jEmm7/1H58aP6idXrg3jQONO7ai8ppckA==
X-Google-Smtp-Source: ABdhPJwO+e+RO9m+Il8t+iKPoEzbXJ/WYawdbA73/xzXbcXeCSuDUE5p273aQ7bGa72xW+oJoARqew==
X-Received: by 2002:a65:620d:: with SMTP id d13mr4812659pgv.85.1618693572411;
        Sat, 17 Apr 2021 14:06:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:12 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 03/50] ocl-icd: upgrade 2.2.14 -> 2.3.0
Date: Sat, 17 Apr 2021 14:05:12 -0700
Message-Id: <be1b9699baac990102d77a5ffb13944e19fb03fc.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Naveen Saini <naveen.kumar.saini@intel.com>

Release tag:
https://github.com/OCL-dev/ocl-icd/releases/tag/v2.3.0

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/opencl/{ocl-icd_git.bb => ocl-icd_2.3.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-core/opencl/{ocl-icd_git.bb => ocl-icd_2.3.0.bb} (84%)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
similarity index 84%
rename from meta-oe/recipes-core/opencl/ocl-icd_git.bb
rename to meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
index 2e43939b91d..d94e4c2f0a4 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
 
-PV = "2.2.14+git${SRCPV}"
-SRCREV = "109694ef2686fe25538c05f3c856912f8ef571a9"
+SRCREV = "59c098b6b1f97a339e3e5308499aee6538ecea40"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

