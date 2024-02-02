Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC738C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 17:22:28 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.966.1706894541096584974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 09:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-42aabb1cdaaso16974821cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 09:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706894539; x=1707499339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymKwhMx30BuZWI1+zA6FcZqSKsu3L4a0t9EcMlFbZbU=;
        b=f0tTSLlgsssEQfIPzArqqER+TdzKbsuWbm5yZIBUbER0Z9wnhFsq/6NCTO0NBQ8LSj
         5SSrzi31YswlC6gBjrB2s9jcMSWSeCaItpAHCeAuYMpLan1BtGsdMrIc9XQz8dYoK3Ti
         JgoaIV1iY+13HAAgzq11bXtpfE/Hc508jefT4BiCYIbNzittBB/JUC4+7j6XBk6YOIQM
         lHqopfKRf3v41amJs3WxCdEha4NUGPH+U1LoATYTssGGgALFljphK8FENXh7BLtM7Tno
         3xG6s68+hAYNJi0AcTNkfKIOo62wmZEypKeNIVOrSiRlN2f2yiYPEKHFImpIR8ONBLGu
         vu9w==
X-Gm-Message-State: AOJu0Yzkl5A4TZr44oe2wnzbbcSGlO4nIqUs9M2eiKDdnFBQ7M8FR5u6
	pbBso/pyJr5fkmMsHZRHVgvU0MMHk+lNY2a0F2IW57n83yF+8pBvuSVAdx4GsyYWXQ==
X-Google-Smtp-Source: AGHT+IHVTdvEsNnRD6uYjzaAj7xMcXbJE6iTDPXIeYWtVME/PRuMQ8UBOuZDOH+P6bQTOJH13jAEgQ==
X-Received: by 2002:a05:622a:c1:b0:42b:f462:aee5 with SMTP id p1-20020a05622a00c100b0042bf462aee5mr2292143qtw.0.1706894539094;
        Fri, 02 Feb 2024 09:22:19 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id x24-20020ac87a98000000b0042be1188749sm986220qtr.81.2024.02.02.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 09:22:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-parse: update to version 1.20.1
Date: Fri,  2 Feb 2024 17:22:09 +0000
Message-Id: <20240202172209.1460915-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 17:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108531

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-parse_1.20.0.bb => python3-parse_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.20.0.bb => python3-parse_1.20.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.20.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-parse_1.20.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
index 3ca6fbbeb..610a966d4 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "bd28bae37714b45d5894d77160a16e2be36b64a3b618c81168b3684676aa498b"
+SRC_URI[sha256sum] = "09002ca350ad42e76629995f71f7b518670bcf93548bdde3684fd55d2be51975"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.34.1


