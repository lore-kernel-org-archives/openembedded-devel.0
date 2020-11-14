Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.7992.1605370251721748039
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 08:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P9LQs/Gb;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 81so906728pgf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBrLo47OfEbvgEmkHZXZSj0Y0eJgcD0NEvy/C7i1kKU=;
        b=P9LQs/GbQk12+hSnAR+p7uYq68odxKFzCUzXI1mqunVKW4vJUCvGqvGr1Xw3UOLRel
         yUSuihzNzbguwzTqTDSpT4CUMZPjgysKnij1y6IC5tnnyQMW2bRw+s+NTqRHzAThW2RC
         OsNYdVczOvfB+Qj2uwLGuGbJHzeZ9sey+Mar49ObAuSVsqnIeeVTc8wAgczMaFwnqk+i
         nBGJoKIN6zTEvXHuQHxponnTdJ7YRnHFY7S/J9jWcc4xB4FRRz1vt3OYQRSJ4+doIOoN
         6hFJSAYDSRjqBmGDp8xicx7IamarldG2nhbtBBUVFShRvCST83VN3aZMyaOC8L2PymnR
         RSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBrLo47OfEbvgEmkHZXZSj0Y0eJgcD0NEvy/C7i1kKU=;
        b=CcwDR/WjJF7NhkXns26KeVAvtY6pMKRcXGwOA1R1dH8O7FtTCrZlELhxfuw4O4+qWh
         m2I5U6LXApJJ6m0wCOrJxIpFb6NTkcNC32A6AwbYbTTYdMZKofmRTRuszUWHqF3NqROz
         rBHDdzGsCvFRYFnBraXaDg+l1U47JZzRXy3q6sGPDguamKD0OaVLAwnQybq+pGL2koVt
         KF0zHGt7Aymu5PUBDSiLnu2q7qCAHT5mNThmvDVaztq3lKeZNERYIvjvCpx/tIxekNbJ
         KYPMyDkIahxtST5EBjAsWOBG+WgeO5Mm14AmbCuT2LWPxtHaTe+4DUVtiCLuhpDid9sI
         PniA==
X-Gm-Message-State: AOAM530GSu1yWYIejV4X7hKdT+A+FP4+hbnlvzwqwgM2l6qlS8n0pxP0
	SOmH4nXHJNLHwgj8K4UqQqFUKRetyCxxPX1l
X-Google-Smtp-Source: ABdhPJypVzuibY7KRAJIZ7jVtEb5E5/y2Qn4uL1s97or50ZfFUOqpwRlp4cmTVmfD5k0d9Rg+zbygA==
X-Received: by 2002:a63:161a:: with SMTP id w26mr6058397pgl.17.1605370250899;
        Sat, 14 Nov 2020 08:10:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id r2sm13279798pji.55.2020.11.14.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 08:10:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python-grpcio-tools: Add missing space for append
Date: Sat, 14 Nov 2020 08:10:47 -0800
Message-Id: <20201114161047.1906014-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
index 1a15c48de0..6675f904c1 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Google gRPC tools"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
 
-DEPENDS_append = "${PYTHON_PN}-grpcio"
+DEPENDS_append = " ${PYTHON_PN}-grpcio"
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
 LICENSE = "Apache-2.0"
-- 
2.29.2

