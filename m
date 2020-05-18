Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.43862.1589813441553227828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PctbrSfz;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id q24so5240309pjd.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HP/z1lO25Ptw7cGBXBTe57cxrW9HZbEBAwJSycl5lOQ=;
        b=PctbrSfzKfacxp+Xc+6oQGj9x8wd09PAso3G3DrgWw/qQOGdO60hhwxNCSBDQ5ygO2
         k/1uXNVZVBgiG12mxxCMEGFyINgd+wyipaorrXKv0H+xoZxaOBIfIwcY/VrmglCl08u2
         TJXVegPENI41kj8ksgNAbGxVsdFtZW3+px24ntp0jZ98Fub4YqXVhxrT4s5EoIbirf5u
         SwxOtEL0XCw2IRmFX+Z2QXY4MIANeximYxrH2pokQLwCz/wokUOQwOrWcl9HawTeRGKa
         DZpz+snjSwRmHHv5sqzopj0Fq8DXRTiAZ2QeHkeJGStYnzU2Jh85Lm8FHs3qXpZMFBm8
         mKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HP/z1lO25Ptw7cGBXBTe57cxrW9HZbEBAwJSycl5lOQ=;
        b=NOAWRBPmkSf0METLLO2Uv0i/QP1s6zdhD1DF8lsqBcbBun+6p15ryISvmeCm1Fwlt/
         Ymyeu+AKqpxXxkOLx8jd5m6GTea4ezv17inf50rV+mLC2dO6jqf3Y3YaIXKPAyBNkUF4
         qpLX7Usr/iUzf/iUMd+t9ICgNMY/fKXoLTm6ijWs5K6m5hhO84zCcNfIwFnpSQLjnj9Q
         GjXLGFS+iWJf2EAXnQsu6P/0KDMryH3y9WDqM/yQK8rkSuYzG3eTQIylp/lSXiWenf1M
         rGhPRq36fEzlTlzEqzjB+LEJ961GrRPqybVYjl+ZCXD0OfK9a392a+GAGtVGlW33wEGF
         6U/g==
X-Gm-Message-State: AOAM532npN7jnU8c9KstP1jpnaJHbiZKsBZdBc2REclCnwyuExcxZFLz
	F7MjsCunALomr0b8s32UcP2tyvr0
X-Google-Smtp-Source: ABdhPJxpGP5D3FEVoTr/oriA3PdWbvyDHCUNz1rh2LiWwxm409b8qfqfN8+p1Rwz8I93ZN6hHsnCRA==
X-Received: by 2002:a17:90a:4e07:: with SMTP id n7mr20821665pjh.34.1589813440890;
        Mon, 18 May 2020 07:50:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 31/57] python3-pluggy: Modify ptest output format
Date: Mon, 18 May 2020 07:49:36 -0700
Message-Id: <87970c841a87b70f1710ef99ec47c2178ba33430.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 60ef83881cb285b8b20f3a178af17120b0a49dac)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pluggy/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest b/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
index 40c284799d..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
@@ -1,2 +1,3 @@
 #!/bin/sh
-pytest
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

