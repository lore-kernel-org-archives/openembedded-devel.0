Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.43731.1589813443731179741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X+FEYNhz;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id n11so4932135pgl.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RBHshHPa49Gb/QoVPw16gnHPM7lrd8+ufomYHfJ5DMY=;
        b=X+FEYNhzLnNa2RDffHYiHYbWMdGJCxae+zAEXbt5ZlHA2DMGfIM2P3zvcCRGzdUDfp
         1+e4xwGYIgSxskhhY+ldriatta7vW0swnKTjB5olZAyyENfuYIbD/EMkKgD8mFQUwr48
         8nqjJP9FG8lpVcHj3E45VljIXLQak4mz0UXSPM+YP/RcahbQvPCcLlhzeDb7tFuqgsoj
         EXpekhkgbTbllKQApjly9b4cuOBOA1YA5kA3Hx1gQJ0d23DKnf8hWX/dD4LpjahGMRHo
         MH/ASaccyG/OfE+VW64wtBwy/3k1XwjwV26eVMzAI1L/VKB2zPQwbaJgpWFWmUTIOu/i
         lr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RBHshHPa49Gb/QoVPw16gnHPM7lrd8+ufomYHfJ5DMY=;
        b=r27IJM7wMbpKn8V9yaUEpvNvjY++NaLBBcF5mSJMZt8WX1WfCWGPj9GHhq+pDNCniQ
         Ny4o5i3HZ9B7kNuXFuuDjVEb5v/OvNp5Dz2j15689Mjf55v3JNo7K0HhMdPTh9QazvOr
         eszumm9btwNcsBCCB3ire0xWU/VdGsGAIZMi+ZrlCRtyZGeowVl83e4MUvd2PDhRKdPQ
         SbFmjW/gXbH6XwmJQVtict4m9edKESBlU1BFDdFH0wb0TAtbmWxtUEKyhJJ4G8t/HoOl
         TRbcot06tPoACAJ784PboOPwW9QVjK6GV2TcBOwBJV6YUP7Fez1GcE+3bO2SnzcuTBqF
         crxQ==
X-Gm-Message-State: AOAM532B7h1zbpIS5JQmiqHJi9obfn4bJL784evEFdFr153UFtbOXbiL
	kCt/fiCmaaK4AcbihsrdQR5vlrHj
X-Google-Smtp-Source: ABdhPJzbpL72HSWvfGHwuYl1u4tm579Sac96Aw3Lx4I6cGJHV+/jFNiPDtvnXSDmXf+pZCtmqw0d0w==
X-Received: by 2002:a63:f001:: with SMTP id k1mr15938769pgh.268.1589813443079;
        Mon, 18 May 2020 07:50:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 33/57] python3-precise-runner: Modify ptest output format
Date: Mon, 18 May 2020 07:49:38 -0700
Message-Id: <1575e865b72cd2a38bdfc4720c1b901cd11a8ba3.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 388d26db292e2fe158a0e993cfb84805c74630ce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-precise-runner/run-ptest    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
index 5cec711696..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

