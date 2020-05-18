Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.43871.1589813450796296921
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PS2wFe5+;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id ci23so1880084pjb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Z4vrmW2XM2LX9ioxB/zFKZXYyj9a0170bpgtTqYymRY=;
        b=PS2wFe5+7IpZrPs6Lrblz1fT+qfubh7+CCHiP6Q8RxzeplzdQ8uFCs8m2C2XCmehB1
         zXzn/rJ1ASOkNzc1lhCsolrF+OQQgVyf7rZvlSrxit50+r2gnLVXVwXdFQsPxY6egYaX
         4v3StsPtek9o1YRUVotK1Jixhx5KhWYjMwZIZkqWOY4P0Ngr4w6QIrfDFqxSFU5+zKom
         XiXpxt0hoFoqKSTMwLxuS7oJYnub73AKhsLoe4wJGm3+kJ5ydVqMMYJ4/cFpgdzTh34H
         KbZBEn45/YzLQG+dWGNbj8IMAKS6S2APvSXojPj7pIhClVpEFUeI9NOnmIrXP4FJuGGz
         zb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Z4vrmW2XM2LX9ioxB/zFKZXYyj9a0170bpgtTqYymRY=;
        b=qt0zHQJ1yngNvlvAMAIDB8I1xd9XKPgU6EPft7h7s6XWPM0sIWPWXCzO0uG23fKJc6
         gJtjXTnCzJb6FASSdxCCvdu640ujUg98g6bP/s9sKvhm6my3aWoEYZdtWruxY3ig8RX6
         xYvdnnERRMjsW8CjHXiR+Z4YBmcnRjlLPr/XexcAUSbRIEVd2zNdDXHEbUdV02yEe2ZF
         wk8X0kOAX1KjZ3INs5GLUy/kVw1qYZzs7wL66EHLcrcUgo2dCWTD8ylfVMAYLrHgMyDP
         qik7jqLsiuj2DIr0Bh0Vx8+W7WRs/n7F0JvfBrmwWOdBX3XcgUM5uDzZvR8p/NxOjM7c
         Kxiw==
X-Gm-Message-State: AOAM533eIxM9XgX/yPqraWN130BNbFM2voT8h6wVkhvKjw18DnNF+Ecb
	0ey+13zGxK+JkDAMjTN58Iy3o23P
X-Google-Smtp-Source: ABdhPJxZTn/eOBMOXuXlLWbJ38xViw7+Ys7Bo9yBPyNwBQGsdvdvbUQsyU7NB5rdBy2gD5/1NkdB0A==
X-Received: by 2002:a17:902:c40c:: with SMTP id k12mr11646962plk.11.1589813450063;
        Mon, 18 May 2020 07:50:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:49 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 39/57] python3-pyroute2: Modify ptest output format
Date: Mon, 18 May 2020 07:49:44 -0700
Message-Id: <574c1aa730c2e664eb0a6aa31e6edb286d8eb0bc.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 638bd31bf82c1c76053a8be05d0723649f72adc2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
index 5cec711696..ea429ba21e 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+
-- 
2.17.1

