Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837EEC3ABA3
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 19:37:24 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.121519.1726429035623562300
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 12:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMlgNvA5;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2055136b612so46915115ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726429035; x=1727033835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf9xEoSipjwMINeP9km2zETMSDTitUiCDbSGFVmiPgQ=;
        b=gMlgNvA5y0PHptT9D5zqKmR3ZVP8437LyVDMPej1jWrQ8wI20Ub4Kns4VPDRweP7am
         kjJG1xvQLwm+LuwQSpl2XuCRCuVXPLBL2Mjaw8B+xdvpUOvgmTomHaj6Cf4WdVc5zvqF
         7SkS7unJBCiqV0yoaMNd5WgZVGaOr0cz9HSsJuEswa1B9y5LZJzMUNVI+ZMTNm1Hn3v4
         N8D4uDO/vzM24CIUTXsDF4HWByr6P16G+Xcv0GnyxqKex1D4+g7bGl/bQTQHJKQ1WqW9
         OAvcrDjuIiy0m6xYZnMzvKjW3t9wZUx4T0nxhD3KoFbMSNV8gmbR682+fJP8FRAAVk4I
         iobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726429035; x=1727033835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf9xEoSipjwMINeP9km2zETMSDTitUiCDbSGFVmiPgQ=;
        b=StXUo03wNs6DeIHVdH2cBzeDQp8hoFTB9zHkFmUkpWLqwcsaP8/dMT359wssLE0Wb7
         YKAyScltbUBnBvN1Z4nXnrlmYB99jCLc+VWyoTiwDoNPmH2AaVzhdcgNf4WDjPWPq8bz
         +NKImALhPyespy7EnKQYdKhklaxxo8TNopf2EMvwDP2hZUzEz9l6lKvezv6YYfdFzoES
         pB5WTTuH/hLyp95Oz2kkpXVg0YOwskPItWtX6BjNwXTQjGr21eOODpxif9kKZDiFBCZa
         H5dPeA+FwZj+8sx0pCN3dmtJtlJJTsLNc2hP2h9aEPaila0FIw36r5UswCdiBzSCCkVj
         9Leg==
X-Gm-Message-State: AOJu0Yyx3rLox1JGcT5yJS8l099aPl5HoBykq6SZD0nWQFEPyltH8PYS
	qhFo9NJ2XSb35R6lJIPHBNxNQ6a8FCd42/uFditKul3QkYRciAo/1+9leelC
X-Google-Smtp-Source: AGHT+IF3V8nTy7Yo7QzGWKIUUs514C83TOa2oZ1Xd3Ywubb7fk2yBNh6BbE0uu5DwczsckNXC4A5Uw==
X-Received: by 2002:a17:902:dacd:b0:202:51ca:9823 with SMTP id d9443c01a7336-2076e3f4b5bmr202820295ad.46.1726429034737;
        Sun, 15 Sep 2024 12:37:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207947364d5sm24688795ad.282.2024.09.15.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 12:37:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-fastjsonschema: Add missing rdeps for ptests
Date: Sun, 15 Sep 2024 12:37:09 -0700
Message-ID: <20240915193709.1131399-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915193709.1131399-1-raj.khem@gmail.com>
References: <20240915193709.1131399-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 19:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112314

Allocated 5G RAM to qemu when running the ptest to avoid OOMs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-core/images/meta-python-image-ptest.bb     | 3 ++-
 .../recipes-devtools/python/python3-fastjsonschema_2.20.0.bb   | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-core/images/meta-python-image-ptest.bb b/meta-python/recipes-core/images/meta-python-image-ptest.bb
index 002bd7a39e..794b9d1e4d 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
@@ -29,7 +29,8 @@ QB_MEM = "-m 1024"
 #QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
 # python3-scrypt ptests run into OOMs on RISCV64 qemu
 QB_MEM:virtclass-mcextend-python3-scrypt = "-m 2048"
-QB_MEM:virtclass-mcextend-python3-fastjsonschema = "-m 2048"
+# Needs atleast 5G to avoid OOMs
+QB_MEM:virtclass-mcextend-python3-fastjsonschema = "-m 5120"
 QB_MEM:virtclass-mcextend-python3-pillow = "-m 2048"
 
 TEST_SUITES = "ping ssh parselogs ptest"
diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
index 0524a73b67..4dd9444a9a 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
@@ -17,9 +17,11 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
+# python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += "\
     python3-colorama \
     python3-jsonschema \
+    python3-misc \
     python3-pylint \
     python3-pytest \
     python3-pytest-benchmark \

