Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.43437.1589813442760879836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IqhbOpXb;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id f15so4329825plr.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7+9kgoo+Y26LzUEaMw6Cv7A95ukIJZQTR1gQt8DdmtM=;
        b=IqhbOpXb+Cs/boEhDbGGz6i25vo75EnIlhS3tXM7XOpPI6PWUhgoEY3vkDJydOZH/n
         M0IHj2b2CP9R5hU+VK2EyHUoR5C3d2kHT2+X7cWM4yEuzRuv6OdzqK3WjywVDeSdqycs
         Qy0dtdBFPUIH86TfCEFNbHMemhpj5rgUMHXTqGIjxstlRlzgT6LensACzNfh1LZ9R3zR
         rF6URGrIiqt4kj9n2Gnx8W1itc/rlT3x7bxf0o9bEW2M59EsGUirq1GZYSouZ4bq65AW
         gh/RMImMIAhWEtd3/EVfltLJJWwhi76i8UCF/cWzsAivwNTTlXSqB9TEyUn/4bGfKCnN
         6Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7+9kgoo+Y26LzUEaMw6Cv7A95ukIJZQTR1gQt8DdmtM=;
        b=YxYqVGPsFx4Cu7+FisFb0AbOFe0aJO505rtdP1uR34ULHYo8+ClDOYVFYQBQ+QsM6Z
         qqE4KzTOYAn1IzBMYvSWkLhUJoeBa7baxW7EGgUdZ3iuYz7TDsfK3eYnJoY4GhN4RKan
         ToBqzvdk0z5n8gSbZ7kvFWMDBTm2RtIeN88WySsw0W+toEVqMBEucNnwzJKQQJ1E60u8
         ou03wb1Ejqc/G97ynUrj4NILlw6c7XXDmRdUht6N6EFTB24wAKoixcmktJ79sS6o2olF
         TztF73aUKznaMzC1e2p/cMdz3TON1N7W3wn3VcQVNy70rCCRQthvt+HuasffEuWik+sW
         zYSw==
X-Gm-Message-State: AOAM532A93yuq/oZZ/nrJF7NjP6+U/X/lVhZhLBtRh+S70wBPR71uRrl
	lbwc3/TfmeuUdDO484zTGPBQtPKj
X-Google-Smtp-Source: ABdhPJyXkouQWHgNOu/9ubM5VZBYF1mjZmX6QHYBkA/qbgakrctZngs7O2iuHMMGhQgBYOijv3P1gA==
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr20148646pju.207.1589813442113;
        Mon, 18 May 2020 07:50:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 32/57] python3-polyline: Modify ptest output format
Date: Mon, 18 May 2020 07:49:37 -0700
Message-Id: <59ff7b6371ee9b3ce6d71ecc4c74d134b4707f84.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6b69dab552ae2c00c8cc6d68b062dc0067eb690f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-polyline/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-polyline/run-ptest b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
index 5cec711696..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-polyline/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

