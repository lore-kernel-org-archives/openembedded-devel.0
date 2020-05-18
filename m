Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.43867.1589813445735279117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KhST5MM4;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 145so5054643pfw.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KWQz54o/1tEok9qizQzZL7EejvhEWS/0GLJRXDOhM+w=;
        b=KhST5MM4UySRei5ghzmUo1vNd5wpapNPGZ4xCMh1WqYf68UypMsvVe2Z6+7qwxRTr6
         Xjr7bOTiTE9hYug1/m+c7Avb6In2A6JPWdCJHslJkDO3ooFXjaIfU/Zt+g3zDQBCPrKi
         a4zBcxl6jNbPzJ5HKzxG4WDeze2l0tqXSQB8G+smwxYmXKEunBnmrmuz1fizjuXYC70N
         oEFjam7qddigxOxlRYnsoZ8RcvP1w27ZA1dhd07I6Xp2rREeTXGxRI60bZIinMRYNtj8
         lcjU5NfkPSIwVHxa2wOrQwmo65cyUaBu76cEyL/dhXiVSTRvaYmcQB1YpJP5iWxF7FA8
         FnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KWQz54o/1tEok9qizQzZL7EejvhEWS/0GLJRXDOhM+w=;
        b=QF2xpniCUJCEJYiUFBSt/DQyecuEhB0LWrzr7y3cyWCAl1xbZrFoVrmMqV9tYqHv7K
         DI/gwrMD3o5eUV0KRoJxqrv13n73812Y5TC50hGNT107B8KoKuktMqteAN/qhaLIm1cd
         2XgeWU1d/pXImoe5XdF6fvep5WV7HfKXsz48KFWYvhTsx9lKZwKN+Wvjib5fs7ii3tmu
         hEqPS6phPA6j60qhXVA1SsVc2cER5kEgyYF/AoZobefRyg2k8ZVLolGuH6nFa2+BQ2pQ
         EFz38VXGlnnF5tZedCz/epPasPVRzcyHeWhZXNYpQK/JbD8SIqC7OtkrVuj2crfbYQfW
         HZ3g==
X-Gm-Message-State: AOAM533DyNwsUlO0jZvhWg5waw7Aczc5qXm4FLSHVH/xaGfgGwtl8RpX
	LSvGI+p4WBoXPmRfAXz1UwoMJrLA
X-Google-Smtp-Source: ABdhPJxdXjx/Hi17Zag6PfgjgQbwJ4UXZR4EEmxd1xQ5EVmOIOCNrBpKPFJd76kyXqh3t9kfH6Ov1Q==
X-Received: by 2002:a63:ef12:: with SMTP id u18mr1735506pgh.375.1589813445132;
        Mon, 18 May 2020 07:50:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 34/57] python3-prettytable: Modify ptest output format
Date: Mon, 18 May 2020 07:49:39 -0700
Message-Id: <30216566deba65c3f3aa23c47264a3362a284296.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 71be27f71230a7a22a3c53625aef6256cbc18dce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-prettytable/run-ptest       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
index 5cec711696..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

