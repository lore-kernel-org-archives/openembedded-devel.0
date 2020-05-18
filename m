Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.43710.1589813413486558697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHSmMw2M;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id 5so2122114pjd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nj/jS3FRM3KapHN1IYvu6/vHHgoqFMb9Rzf4qnvr5lY=;
        b=fHSmMw2MfiLeJK/gb25jjS/cj2VnBURmNH93OYp8nu5ut4RH0MmrhBzJT5PkiSswxy
         TKnkVLdGyq8SG233CS8GqJo7sV66EStH79R/YOWvuRoREbiB1o6Px+yw4z56gS+CgMGU
         /I1T1pCJh3jzjRMi/BJcuS+cNP1dCEtH/lVosxtUS0n7iDPukrWDiDnU81DKGpVtC1Ou
         WI4cLb83RnnLsEvEXSdgy6vstHsSyiJ3Hb1VuDgjC2eM9ad2WK6U3bkBzNOfmpJWs94r
         5afCLftcL3a83r6ab2OwVb6Y/CEoOPUphXeH/77MMlj95/Eb1yvOErlTMKM92UPMHLHS
         DOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nj/jS3FRM3KapHN1IYvu6/vHHgoqFMb9Rzf4qnvr5lY=;
        b=rdP+y4MojyE0+yzKOVCp8rio8yT1ITi4eUJuDkaXstQccsMtYqoDROXqQuOqGK+DiC
         62PmqMPo7D/m4z7zDzDctNdMFFn5SVCexiVH973UlpTiw4jGwv9+hfL2TWuq/Qjl+CDH
         bqecTy0OmvRZSTsSO1RmXS/waPaLYerojVohmTm6AP6RvNxeJYNyPLOT1YGcvkCHb7vt
         xVdOcI+bWtWjltt0Ru7yH9dvjU4PMRefBEWh73dmh9ldNwQmWmR54NrV52+RysPcppdT
         vVqmkdEvpqtSVt/wJipschqCNx+YFX6o7Sww+G94UUAruDUMffn4BadFEvOwzvx4Heei
         nuYg==
X-Gm-Message-State: AOAM533BDI5Fv7QWPCekx8m6cRfxWvKSSLRiKWvUXfyStNF1Qi07AOMi
	Fbt2x6ghZ9n4ICxmTpliZIWy8cnf
X-Google-Smtp-Source: ABdhPJx7NiX2ITIzuL3wOjm8tmG07yh0M1zgVTE4J5dAYKNXCvwdsUEXbN8sLEzR6TvfyfIBiO0asQ==
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr20146423pju.207.1589813412827;
        Mon, 18 May 2020 07:50:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:12 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/57] python3-pid: add the missing rdepends
Date: Mon, 18 May 2020 07:49:11 -0700
Message-Id: <1e1128683cdc27ce51931658b4402862df0a282c.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pid
 [snip]
ModuleNotFoundError: No module named 'fcntl'
ModuleNotFoundError: No module named 'logging'
ModuleNotFoundError: No module named 'tempfile'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 580ec1e925e07484b46e76f2e7ee09d9b40c19e5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pid_2.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb b/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
index b8dd0d7474..ef19478885 100644
--- a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "ad352ee1dc28b9746a15451c0c53e9d7"
 SRC_URI[sha256sum] = "96eb7dba326b88f5164bc1afdc986c7793e0d32d7f62366256a3903c7b0614ef"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-fcntl ${PYTHON_PN}-logging ${PYTHON_PN}-io"
-- 
2.17.1

