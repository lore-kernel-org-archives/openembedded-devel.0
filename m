Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDC2C64ED6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.8631.1676550484240568156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UQxM1LmK;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id s17so107330qvq.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrSItSJBSCfVwf2s9H8ak+znEgTK0GJn5G480fSPFn8=;
        b=UQxM1LmKVnpNzjJR+M2JW9R35vqv8FecPOEyb+EI2pHjYbKjWbLgjE+soHx25P/jHd
         MkKl9ha7ZzjFnxWDfVFDoJVex1iHsmDsEf6Rao7vGJj6LKvqjUYCe6s6BJmvacTLajEQ
         PGNUYUv+Njb9BFcu09XzTg5AEJK+kM558JOVDiYa5CzteSTT4tT98YhkfYYT66J9kAdg
         0GZqA/u6UvQfWuQRSuqRPPFFSFPr40oCXUJVHzFzyvoY6CLFRL82kNWgdsMpT5Oznjod
         d8Kizig3aiRHiM3rnkHjUGfC3aY+BzszkddjSxjEdtCIjR26FgKMmLfwjQGinJMFVoXb
         M8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrSItSJBSCfVwf2s9H8ak+znEgTK0GJn5G480fSPFn8=;
        b=rmpIjs7s512OmA4TsYpviKXmD2Z9rodeSTEiaY0fqw9zl1194C7Dwn2rfclsDI9+4J
         VhRiHzhOklyquxDt/lVl0t00r6xXDmEUoq7b/5PKIH8JRTal5tVfRzwgeQyNzblRdqyX
         fSC5bPldUa6NYe0Smcg3LQct7nBvFvpiCgNySUoLtYXzoKZ1dbA/G6LmkD24FxryLllP
         oCaBmmtz8hHf7039vUdxtrowEVPKfDnQ82/jweTd96+R7/CPPxXFX2JlgohnRGBmpDsV
         /CNPoCRoIvT0tzaBIafM893wuy3Xz51w4OvHiem+NgPjSMtOa5xFclVFZTApJlZ58b6Q
         AVug==
X-Gm-Message-State: AO0yUKWKdYmKPEsGtN5b3pYquy/FdSPV0YhMe+N7efUiqaUvbkLHHvVz
	OyyMJiIR6sIypGPNLAubHU/k9Zuj8fg=
X-Google-Smtp-Source: AK7set/iqiaK/JRpDcSVELqtGs48mHyFlUKPrie6kA79QeSQp1kNCx2vNbA5KAopYHrc+3kMc3tykA==
X-Received: by 2002:a05:6214:c8a:b0:53c:c2d1:e3da with SMTP id r10-20020a0562140c8a00b0053cc2d1e3damr10048143qvr.2.1676550483214;
        Thu, 16 Feb 2023 04:28:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 05/15] python3-pillow: Add distutils, unixadmin for ptest
Date: Thu, 16 Feb 2023 07:27:15 -0500
Message-Id: <7eb1f15de85e7f66e95d2058f955130819b67531.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101107

From: Randy MacLeod <randy.macleod@windriver.com>

ptest results:
   ====== 3600 passed, 324 skipped, 2 xfailed, 1 xpassed in 74.41s (0:01:14) ======
for qemux86-64 with 2 GB RAM which is the same as seen on master.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 68c81029c0..5a466778c0 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -38,11 +38,13 @@ RDEPENDS:${PN}-ptest += " \
     jpeg-tools \
     libwebp \
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-image \
     ${PYTHON_PN}-mmap \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-timeout \
     ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-unixadmin\
     tk \
 "
 
-- 
2.25.1


