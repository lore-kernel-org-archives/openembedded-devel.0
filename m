Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2663.1624825340736784891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W8FL+oHK;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id o3so2599603plg.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jreekET94W8LCiA4C4HUYC2UXg8LiaUssUNAQFEfaoU=;
        b=W8FL+oHKjnKtiNyrdM2UY+yNtn2Q69M0Ho4E2LutIi2KTpbVewuiphtU24nlYx5yHx
         wucrKll7i+8QgDkiyvEUOq5SJwS9Yf4tRzXCWwaCwyse2D9gbi98qPT71yPDEpllesBZ
         H5o0JkGXJcGPhXbwpGuzUrJwVExahzhpEPw7lwJAuRYtk71v/m9YVMGyxdec3X/w4dDn
         BvJPHyAFvI7NkAjax49JOgXlp4/9fOoExXlQBzECBQzTl1/ykQWI5GpfKX9v6X0PakjN
         nlj3CRvedbQK29yZYNy7ilDW02BFP+E/koFJTgZeUr2h7T/jV4g/tX+hjKypJw0lxGyT
         RYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jreekET94W8LCiA4C4HUYC2UXg8LiaUssUNAQFEfaoU=;
        b=OP1xVXBiY2tWh8D7sRVO4vge53MZ8AhOq+gbsHZy3+gNIwpqlxPKEigHm0l9Y6Abr5
         cQK3egktAWO7ZB/0HnYNF/hj4dFD5farrLYt9cSG+pyZSTyUMdJphG+1hIFD19+Lf81u
         O5Ch9QD5Mm/m0kjIK6y5ev2GhQMVp62W8rkjDx3JX5BiuafIvpBq6RtyRvqQXdj4EDhC
         NJ2nSFgp40J/sh+zDGwa7ZkwG2r0y5m7BxaQWnfPOeP0MW3sPtQ8WWEqmWy9xyDHPkNi
         nCq9MhyLxwsMUcTDBOQUZ1v/Y8se30+FuG3bZ7kOtwRNEJOpM1/WwWaIec7xiugM6VNk
         jI+A==
X-Gm-Message-State: AOAM53204EkKNAL2CVl4Qye37U18fjfQ3IHMdCiNi5GsHIbf8nTrg1hp
	aXfkAVhDGLndfmI5yUaXwenP1KOgW9awhA==
X-Google-Smtp-Source: ABdhPJxLqRmvafAT9dTnDC2qgWpPqKb8NEYWBfuBSPB17UfUB4QIwJeyzwvsmVoUF7MfW9KwkHERtA==
X-Received: by 2002:a17:902:c94b:b029:127:9526:80 with SMTP id i11-20020a170902c94bb029012795260080mr19389968pla.83.1624825340168;
        Sun, 27 Jun 2021 13:22:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:19 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/20] wireshark: upgrade 3.4.5 -> 3.4.6
Date: Sun, 27 Jun 2021 13:21:57 -0700
Message-Id: <330e5baa1bf56d591ab72438027b68182c0d1a22.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1c3701018ba2d251a72111f1159c9605dbff3992)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
index f440328027..6acd849f89 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333"
+SRC_URI[sha256sum] = "12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628"
 
 PE = "1"
 
-- 
2.17.1

