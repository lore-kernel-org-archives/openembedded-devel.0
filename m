Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.43734.1589813446837492002
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UGFFX6l5;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id r10so4942366pgv.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=g6wRKp5OneZXc2D+UEXVDbmpRppqdl1ne4tm+5L9zmE=;
        b=UGFFX6l543XU16dQoMoZ+x/6n0T5xeCwEQpUpwVsgJ7jhHlGk4RYVM2iPYWInpwQvr
         tP0v+1p4sdKak3N2UFaatGwQndE8r4IzC+mp19rdQqup4ulqdyNsrex6qDuYqctKEEmD
         AqZU/va+39gh1GogjM0Jf53HILy5tzhrlHJm27PmX9VSfKuuCmG8amhE3tjxG2YDfa9I
         DP3oXc5kHAuogjWxjgst6HudkkXukxoSaSod9Ne/61rXVNnNJ75SzjCMjlvuGElHpWTk
         le/SGDFLiIcbEpRQ8JjeTf3GlZJ06fAla/jdMvqNKfZj2U6uiDwAplKyXWzIXQah8Fc8
         jMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=g6wRKp5OneZXc2D+UEXVDbmpRppqdl1ne4tm+5L9zmE=;
        b=q3LciucD7rB3JtLi+R7MXXtVVYWLculBvt2SBmIVdz0OTqU81ruOBAXc3ouKlwDVqm
         Ybpz/QyINzfjPk8JerFOd6Tb96sRz8kmC02BYaRd29XVJKe/0JfTofyuXnG3H5IeLszl
         XCuqmHu4aD+A3TdMV3lEO91KKcMfCOQIyRZkBpDItqdfKou4Gmz2laMEUU/jvLLYpBvh
         hOCMHabfib6ltELMuiNLrDB8b/2Q3VeiIWJcq7W78lDSjbN6hzmnydi7mDR4ss5S1DGz
         bAXZvx0P73iEu8G8YVDkPJ7NnXMkAtlwVOCSfAijZa3st34Nc8qkz8H9xlXWjxQ6oPBk
         f4ug==
X-Gm-Message-State: AOAM532PaEVBEeImr7jwcXXFdMg0MYeW+Yhmg85WFk/sOnlSKYQ7attu
	mcjAIsm/JK2AaVDHUdb/DBm24Nb1
X-Google-Smtp-Source: ABdhPJxDFJekPK4nzTECwoltjotvFsnjOEMM+X9NkXJ65N243gyEK4p9n2a1ZLzT0+YlNA8svTlxMw==
X-Received: by 2002:a63:d807:: with SMTP id b7mr3694098pgh.41.1589813446043;
        Mon, 18 May 2020 07:50:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 35/57] python3-ptyprocess: Modify ptest output format
Date: Mon, 18 May 2020 07:49:40 -0700
Message-Id: <10c4c22708498347b1199b377b51a70ea1d1e545.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e4213de6504c2a021380c7f41dadf64d98c53b0f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-ptyprocess/run-ptest        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
index 27c9e59c82..15c3f6282d 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh 
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

