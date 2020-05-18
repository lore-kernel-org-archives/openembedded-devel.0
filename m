Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.43426.1589813424853252064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ivwDfNjz;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id b190so5067093pfg.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=w7OiBQKRIzX9AYrk0NmyGZYOSZOQZI7M/70dOQKNE6k=;
        b=ivwDfNjzIzoI+mYlER3tNcZETyiCkWDcxWNoKypUDjQPcv2XddiOrFH6QjDPvn/8Tz
         ondWKQ5YJ5WBP2JjjmdhjeZuc4cywRLhLvOKz2xBCPQBLXHRBBnp+y/O3CPXyyS4uVc5
         I2OyF07I8RrnRV5h9cQVLl9gIrDv4xuCRQ3E2JAiHruaVLA/qGTPGkzp7DbMBfWhsBzR
         KJRh6xdqZWMe++nJ1+eJDR/TQ3ruDSBZmKicEuO8/hl67fiyXTYeEaUIliDtbZYud5Vq
         eaNe2FB76+gTJiGmh3c3fst6a1yoHAGJTkDcyfLEP0GawBGuM/bLI7U5/e7UgqmBhbII
         MbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=w7OiBQKRIzX9AYrk0NmyGZYOSZOQZI7M/70dOQKNE6k=;
        b=PQ4lGC0/4QFnpDnwd/IuvqYrJLwlzW0lrvPuV/so48dz8YwpjoTGEdLivR7scL2O5G
         m9c7nOeEFKHMOw6k4sXHUu2n6JiauEjjMcuJ+CddOBIiNeEF1SSDZ2DmPx3JxVS7/H15
         Ot96oWXdBM77I5hJlPHd9FOz5zalgzzAtQHZSy2yMo2Wwfx4/405919WKLqICybW4k9c
         LFkvC3MkiVo30ySj0sziUAjJIC+zMGEVmrKIhKwMFzWMq7SCpo8Uu7yj4PqfrN+TkEBd
         Ik3yJDBFu+jt7y8FA8fnXEKwlTvm4FW3dT5Pptar2sy+biOq3n2sH/jQSbYKJeHpQiTu
         LrMw==
X-Gm-Message-State: AOAM532sMyC+tBvXW3ITPO6dHpmD6XOCxYjfvk9QNZTsB44V8JqqyF/d
	1HaCyE2ZtrfevsIAGHfIqA8ZR3z6
X-Google-Smtp-Source: ABdhPJwUJyOoab+/PxR5HDHHPxfE1f7OK2Q8QIzmYARiZ1rd0gezWR/bKMt9H7GLXBpDrN85aRD5Vg==
X-Received: by 2002:a63:d807:: with SMTP id b7mr3692747pgh.41.1589813424156;
        Mon, 18 May 2020 07:50:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/57] python-pretty-table: add rdep's
Date: Mon, 18 May 2020 07:49:22 -0700
Message-Id: <8fc86e7f5da2c96399e06e3d1b62c2637b24bdc9.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: "Slater, Joseph" <joe.slater@windriver.com>

python(3)-math and python(3)-html.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 623cc3dabf77cd0bdec4ca61149f61049c1142e4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-prettytable.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
index 09384dae17..c77a49191e 100644
--- a/meta-python/recipes-devtools/python/python-prettytable.inc
+++ b/meta-python/recipes-devtools/python/python-prettytable.inc
@@ -29,6 +29,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-math \
+	${PYTHON_PN}-html \
+"
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.17.1

