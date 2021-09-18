Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.871.1631984273611943072
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kPsr7Mvn;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 17so12916316pgp.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b17Puuo78CcRs4idQeMyvIi0gkSSAIbRi2e309B0RVs=;
        b=kPsr7MvntVNX/NxVJ2UHTNZRuarmfstJOVrQJg+B/fzHUHUT40VcypZixYZGKnc0Gq
         FRqkDthleSeVUw7czHXY6O9ezwJZ2AMv7cKy1yCJAlcY+0kPrxvVciKO4G6sGUilUrpE
         IaYROA0EtixCs9oLOq9LwfM5ukUV/OuQnBi1n8BKn8jDy55LAR1CxP6YcMUHwofb5bXL
         uc2DDaobQXtgiMRPtNdhqFyaPRIPXxDjtxloBCTk+C7iJjj74Fp9WpsW4WrNG+Lold2c
         nIfiDTNdYd9Oob2OVXJTYNeoTOa1ywuCBPvZC6N2XkW2JJm0OcYKrb5wNzzktkTm86uF
         h8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b17Puuo78CcRs4idQeMyvIi0gkSSAIbRi2e309B0RVs=;
        b=sKN1dVZruP/1ymKkwc7arj+fez0/8JZZuEOZiVA4mngyHyUyQ13WBV2qSpdsVqR1BZ
         cmQ0zQfvgseY0aEfSkVWRetL0nV5OK/CeO5SYgGzMwV/qaqKA6vLoKZ2fanlPTv+ie1S
         +VuNekW4VqzeKFKMek7muCBjViYYkrLooCdj4mEmZUUOhlSaIuG/qFZbFFVbhF/HQd0D
         c/tKKG6+JsdRes9km1gUnEaXfyM3OWxjtHE5nFHeas6F0PqtM5UMoqi1HjdqhTieol0O
         3KklzCB8ot2p9KGkEon3R/fcE7S3hW0bPbIfQ4NLagLIYHJDvtx3uqtjNyWDtBjZEE54
         BmnQ==
X-Gm-Message-State: AOAM533CKV/EfiDUwZ6Mrm7eDrHxQB/6QAR1/Lmuvqj8yvT6lA/vWC2s
	yqwMTG+QxeVixNV40cnCaKVnmg5XE80=
X-Google-Smtp-Source: ABdhPJw1KWQM6vpctUJX3SV0SI7I9RNO7Qt3dtT3w28GvQ7p0tmyPt2UmheGqdi0ECCzdAwOzTH9eA==
X-Received: by 2002:a05:6a00:983:b0:444:ac28:1ee1 with SMTP id u3-20020a056a00098300b00444ac281ee1mr9888743pfg.49.1631984273061;
        Sat, 18 Sep 2021 09:57:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 17/18] python-flask-bootstrap: Update LICENSES
Date: Sat, 18 Sep 2021 09:57:37 -0700
Message-Id: <20210918165738.2581429-17-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Missing MIT and Apache 2-0...

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-bootstrap.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
index 688622afa6..58b542dd16 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "BSD"
+LICENSE = "Apache-2.0 && MIT && BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 
 SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
-- 
2.25.1

