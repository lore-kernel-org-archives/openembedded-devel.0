Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47872C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.615.1708129039843793294
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXmL23Rn;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59a8b9b327aso883302eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129039; x=1708733839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGPlIUKBGMfcOT/i7MsYXVGM5gFOCkyd6fs8boE05wc=;
        b=UXmL23RnSGrIpGQfL57vYfeBZGbbmHZNuRS9L/+lefv8fhf0xq6TtPS1orJYrOHXr7
         uTBlhaEdBn+M4cjrf7YCQSEWiWXVFm2BK/ipPVXLw//xOZJznSbGJLLrBAl7tTeS/qux
         yh4jLHnCr35Vu6iWabIkqP5qZ3w5+F55EFkTwx5Pa6Z6SfPGaRpla8Hevwm6/vkyyOsX
         6RmMIzd2BJw/mm+yrNdYY8tIplF2JgzEMf1liWIy5Dxdc7Hd75geQSXxmss5MJWCeSu8
         yLfk58AbpEjD9egrQl9aNMhRKmUWjSZ52RcAn9zlswR+tFetYeCgA6ApiqQilAyGRpVk
         4ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129039; x=1708733839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGPlIUKBGMfcOT/i7MsYXVGM5gFOCkyd6fs8boE05wc=;
        b=LE2ylDYr29yTYtUV5pYgLYwomeSuSBcdkhxR4l0UeaoQOlzcrJWTUQil6orRcl+AE8
         7uSAP3Npq7GPe6Wa+/Wql1rTYi4BmbS5bXFPFjyDvXKL8/RkL7UGT9ssgOVL5tF+CFge
         MgDc7tEsB9yQBiUblOfcuWGZU0ac28sz9WbBTU1vuAhuLFusC/B45NsawJasRgRzA0nl
         cwXOrRCmk9OyKAS40hxeQ2LbTRx9rFE3YQIOMqqOqzXn0xsYYGv5b13QYXtYKhjbBaP9
         EI/CGdU7gqcFR8ssHSvFqCPUgWvR2PRUWf1sB7wVUl0ZcIlxUs1Ikqe6TdqErmym9fbt
         9HxA==
X-Gm-Message-State: AOJu0YwkGaIWQyuRAyq0zt6E8fVk+ezK/X05vE4mLM4zmgSCrKqaHNH0
	Joc19OQzqbLKiJhtWwnCX6Ajk+hkwSy0LUCBvRooK6MwE1WQJm0FLtDhDeK1
X-Google-Smtp-Source: AGHT+IHAf6PDLecgEMiQR9f+aDStOhI6M0ewkGqDpyj6/XHdrRBUzT9Hf75aCvN4gnBsE8gwrjsNMw==
X-Received: by 2002:a05:6359:411f:b0:178:de46:783c with SMTP id kh31-20020a056359411f00b00178de46783cmr8053680rwc.16.1708129038727;
        Fri, 16 Feb 2024 16:17:18 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 52/60] python3-polyline: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:43 -0800
Message-Id: <21ffc77956755f0d8ab74b81ba6c6408bb520bf2.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108822

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-polyline/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-polyline/run-ptest b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-polyline/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
index 2eae0caf9c..4abe167f7b 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
@@ -16,7 +16,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


