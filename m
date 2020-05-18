Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.43441.1589813449803387052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rRBgTBfI;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id m7so4329924plt.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bgBO8hdFiKDaVwOSoQccL0nZgF4ah53eW3pr7rdstNU=;
        b=rRBgTBfIpVRckNd63r/jg8/Ak55pdpm3MQnCLQVbx++pqz/y4TaXnIihyVjnLPteuV
         AKxkuyKDNRTuB0YcOXKWQdZaA08C64EpeOkG3apuOnTy7PP6SibjWrVQ75UmQXa/WRef
         2iOZuRMz6iy/EgtZ+0gcNu+Ils5Z+bluKYrSK2XM/fr1E+QUsVp+oIbsT12Wn/Iiu9en
         eBfes1IIWKzrOTwu8ZdvidS3881p7XVL/JpaYoluh4hQLDmYuR+YBOWChQXeFCA806WQ
         M91tAS8M/FJhhqNA/eJK+YUyoUBbqaw8ighmsLDOaHTuTqeZWoHURi1YyVJd8I+oos5i
         gBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bgBO8hdFiKDaVwOSoQccL0nZgF4ah53eW3pr7rdstNU=;
        b=EXUjrdgl9cEHyr4hFSiyhJZLZ51iJjuKxJk5TgiFlv4NT+MYFMYZJnegPsJcxIVQz+
         DFsiV8jWdS8S6s+s8PajVF5BpjcHzRZcVhpQtiZSOHwEXYttVEP/E5C8Ej7mQ8cEgafP
         FFgQHPjShhagczk4Ffdd3vUk9aXNdAKrGQaywVzG3nDBPwT8I6z13cuvfPQ2rYn8xL/6
         gnbacPjFmA9jpPyl5i13X4masIB0q0xz5NPjZuLFz9HoNs+/iOrUDwBoPTQ2l3VXJfO3
         r9xUiHsho4hsy8FIzbbl02jsqxxY3sBF/3FjwZR69ue/etW4i0BZ2ECvFGjlDrzcEiqg
         hFcA==
X-Gm-Message-State: AOAM530ZgcFNiTfP/Z85KNqnuipz79gIS9lHLLvjt1A23W2Xboa1hkz7
	ZCgm0qciXnsjO9s0RIsFFjpzs/JP
X-Google-Smtp-Source: ABdhPJzRQKSuxDrLEVdcGzt8QTQwXpc23j9rybl17QbPHlTULD4+3h7h4gYgoSVDnnNXJDPxtbw1Mg==
X-Received: by 2002:a17:902:a408:: with SMTP id p8mr17248139plq.36.1589813449104;
        Mon, 18 May 2020 07:50:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 38/57] python3-pyserial: Modify ptest output format
Date: Mon, 18 May 2020 07:49:43 -0700
Message-Id: <7d19977984b1e5c97ecea22ad246b50d025129e6.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6919766bd2b39f00e87189cb5c531cf0f619beb8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyserial/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyserial/run-ptest b/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
index 5cec711696..e301963f96 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.17.1

