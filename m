Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.43736.1589813448996155686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UAiL9EOm;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id ci23so1879942pjb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Qg5fg5zYH2BfsNErdvo1B5YiN6L+CXq/cpBXQWcsXfc=;
        b=UAiL9EOmWJdLop2p72n6plSrWUDPkEE0ZeR2hZBHImlRz4OFCV5jay7qz3/XtOLchm
         SDrwVzRZvxFrBpI1B3EAe3ZA7+ujdpc/3LfhoHeo+EhWxDFC47r0yord13/Gc7SePsaP
         rN16kdOGVt2LeIty8FNOfG4Zapztj79Mee+56bDjsHb8HMt3x9e5aVVZe1xOrJTiULi/
         4p0NLfkUCpx9ao1B4i2EFqlrL6Aegmy4dZUKuLyHB6nERVSnMxzOAPMZWIvH6tfU0oDA
         KKEPFMgnwowxhXf8QNR8u+kfyfLOARv9CS5GmpmnVXySuzvGKTrPUy/GIsCvGrWm42ha
         aLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Qg5fg5zYH2BfsNErdvo1B5YiN6L+CXq/cpBXQWcsXfc=;
        b=LCLAiuHATo82PrdZD8HXGbdjee0OpouHvagfIeRdif8UOMTNmXM9NmHCFGphWEXNaf
         LgUdHf4HbIlhHW3zuHfrAXdNJWVTD32G9bvXcGfDv6XbAgXin+G+tGFCojEMM65IMbtO
         sADWJBYkdQod3qB2c8QpiwehQe8kqXHX0Lt6Kvn6GW4aM8rKXT/Cca7zUXgpE9JrH9Ny
         z5d5wr9H4hbbUsFDxaVZ1yAVVp4NV0cRB99W68iHh2B54K9NshrllobGrMiFqVBJSnuq
         HvyT8Ppbphf31y11gA2MY7h46oB5g4osUjhTiUq2S/rWFI485sqtCM4iWcnhC2+TTw5h
         x0Jg==
X-Gm-Message-State: AOAM5338T00JFT+pGF+4pUko8K5SYDHOYcWO+I4JaMDgDNNibOqSP480
	ifPrYnhz4cyaJcYqn4iwbYMSmcQy
X-Google-Smtp-Source: ABdhPJwND9TmdMyYpwlCYcjV+Dmo//NqSH+m7yBUIFx7WGbyZxmaURoQtstp0B3nFBb8WqokWV4H3Q==
X-Received: by 2002:a17:902:599b:: with SMTP id p27mr15332781pli.75.1589813448304;
        Mon, 18 May 2020 07:50:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 37/57] python3-pyasn1-modules: Modify ptest output format
Date: Mon, 18 May 2020 07:49:42 -0700
Message-Id: <28f7192a541928fc91df41a166161412956cefe4.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7b39cd7ad26bee0f71c3d7ea3bd6ed8848ab1871)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-pyasn1-modules/run-ptest    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest b/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
index 5cec711696..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

