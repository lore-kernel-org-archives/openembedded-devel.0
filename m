Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.43861.1589813440260695199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YOH+TCox;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id n15so5228127pjt.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MZHh3lXl1kjDoPORTHDqkhtWu7X0mrixh0TKKtxXRpg=;
        b=YOH+TCoxJQ3f90WMg4QEJquBi3DvGwX1uMy8LcMLu5xZ2F7e/hs9U0umfsNhkumnk0
         oOyL8FIGMa4Vx3kWGV4QGSnty/adUzITokFryaVOBGb15FtQ9zHoL+AvDfVDyoS4pVSZ
         Fq6WSshFVhpBVtDPh4aUlLiZbUViJMctSb1GDVVYYNIkKXJ2kpysVoZ2yVDAkpPRky2z
         oe7riwx8KSUyh01m9vGl0L2YqT/gdKqliYtpAm676ggRAMr9fhjLXz/1dnva0Pu2xMeG
         y+kYNXqZr3KgZpn5El8ujj+UlzJdc9l2RDFNTEipuioXG5MFIn40XrDFjHPtEk05BNgQ
         u+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MZHh3lXl1kjDoPORTHDqkhtWu7X0mrixh0TKKtxXRpg=;
        b=ZmykFd0gtOM4nExxskkxnbg/fIlAZ0kb9L6D6DLlDpQW8ERLgBHT/Y+gUmEkVUmRUS
         4/a2IsmfyVjd0ifT9KJk9MDuQr3A677ne6VmntywkdNs5HgTMmHf8cMSBT9w//qZdukY
         jXfG5o6BBAW3vi68sNY9p/fwETwfGAkSEaWeMlMcLQchO98fVjgvhXGKOC+DDXoS/aZ1
         t6JoVhPAa8iX2rGARTzsqEjWYLxmtsPKsSRbl+MgGgHV05d00Q4mJ543Q1rylr5y7jhY
         yImzFuJapF5eGWwlTND7ityudllmZQxCTRbFcWG//9b0aHiba1escCy9q7uqhL7WQSH/
         8jMQ==
X-Gm-Message-State: AOAM530LXHzfg1mfPmsJGhkxVx/YKS7eKjX+wLIEGSpqXQPyZqaLsaMs
	nK+kqTlu+CBp+j0qR+rAmcJd/Ons
X-Google-Smtp-Source: ABdhPJzqdcPhVbJ2chL7AHh5MJGkBMWjd4sGRZfTVAsJk5Kw+H6Ro5Bbk2URXCrz1uLVJ5tYO1K9cA==
X-Received: by 2002:a17:90a:68cd:: with SMTP id q13mr11562033pjj.177.1589813439616;
        Mon, 18 May 2020 07:50:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 30/57] python3-parse-type: Modify ptest output format
Date: Mon, 18 May 2020 07:49:35 -0700
Message-Id: <db209bf7fb6666944da1285e733137fc0f192c39.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 86d1c32a818abba71c5a52d21249759cf601ab2e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-parse-type/run-ptest        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
index 5cec711696..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

