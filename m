Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77514C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 00:29:09 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.19638.1693096147837078102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Aug 2023 17:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nnzXFR8A;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c4cf775a14so1397204fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 17:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693096147; x=1693700947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksY/xRoVRmxr0d0SSzPC7v0im4Rc+1p7GoJF9mYPbEE=;
        b=nnzXFR8AJ7+cvXhyGV0ZKcfqgOeeqmgJ+14pkHJVuQ0mhSRRXkjgOOAr+NEaxaVEwe
         4FSHC1YatnKO+vt9MSKARoJD8CM5KW/QX63z8EhU0bqTkSaB5jHqx45q5xD66p1lsQ53
         R0zP1BIfclz3jOz589v8biBDiNqhNDg/K51FGpC7tdvrK4jWxlvbW27Xvdw4c63aXjjW
         Pyx79K5BfHhoYTXATLmQQBDoeCSo2q4T5xsJsimEFtSPNCTRWKCKepxbZ5qlGNQqKBra
         PId+bTqJcgxl5Flwl2F0HeEPW2sF5BBGFcGQJ4rh7eCzy0z830o1ZGIE+gWsU4sGst5c
         C6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693096147; x=1693700947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksY/xRoVRmxr0d0SSzPC7v0im4Rc+1p7GoJF9mYPbEE=;
        b=XUCYRZ6avtObpblG/+CyF6nqHSe6kijEuAuknjIh106AV/Y7GNeUh9Gpd1JbVsjI+s
         mA5iDDFUMymFoQHNSOnTqxCNcYHNjPPIRPlFmBzIvQ/1BIhQnrsDE/9x0grw5boIHVXn
         pQSMGwn6RwyFvG1Kx5I+TR2rbhocj7gZUljiAaWd0/yNj0gheSFwWwBx4aYdPRhqDpqs
         myy0ktllOaEfnqe07tqFoqgSWBycRk1RefHTbWoDklWcyuSvVNtsUGPgAn2frIoAtfYg
         res6mnqz+KTNFz3NluVG+m2BbC0entMPwNzbltDZGrI6Um44xgGTf4i9GMXwd4gZOhVF
         ZF8w==
X-Gm-Message-State: AOJu0Ywvr9oPixaHixw0zPqJEUgKUCsdbqhf8PTk8bSEIGGDR6O1ZBiC
	DjfyvyTpMsnivoNPhjmDRbwizT+V+EJvOw==
X-Google-Smtp-Source: AGHT+IE+V4l8utAZOnUsDp/p76hsx/MiDbNeDBDtjrt2t//kdMBWI0ZJFzXHh/VHkj9NI2QklFjd2Q==
X-Received: by 2002:a05:6870:9126:b0:1bb:4ec1:50af with SMTP id o38-20020a056870912600b001bb4ec150afmr7795732oae.4.1693096146888;
        Sat, 26 Aug 2023 17:29:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b001bdcde49bc3sm4321353ply.119.2023.08.26.17.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:29:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-lz4: Add missing rdeps needed for ptests
Date: Sat, 26 Aug 2023 17:29:04 -0700
Message-ID: <20230827002904.566500-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230827002904.566500-1-raj.khem@gmail.com>
References: <20230827002904.566500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 00:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104623

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
index 2d6663fc86..9d31ab68c2 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
@@ -15,7 +15,14 @@ SRC_URI[sha256sum] = "e1431d84a9cfb23e6773e72078ce8e65cad6745816d4cbf9ae67da5ea4
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest
 
-RDEPENDS:${PN}-ptest += "python3-pytest python3-multiprocessing python3-psutil"
+RDEPENDS:${PN}-ptest += "\
+    python3-coverage \
+    python3-pytest \
+    python3-pytest-cov \
+    python3-pytest-runner \
+    python3-multiprocessing \
+    python3-psutil \
+"
 
 do_install_ptest() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
-- 
2.42.0


