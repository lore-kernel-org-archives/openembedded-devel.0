Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA65FC7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.56500.1680474608937530557
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bYCnCNTd;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id u10so26274732plz.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGP1/QIoou6A5NHdBvcpU2teH4LQ/zmHwO6R1QGKpBM=;
        b=bYCnCNTdJzFz7LWvraAu7D6ekeTRGT9YoDHJNVL47A6Db1MMB0K5NNsRJrTl9dU6nk
         xMFFFl4t+TaA/1wGYqZD5W82HRyOx0ei/08VMfnqm4zQ1Uazyj7wk0/O6vMYJGUSZxyA
         IYSqdCS+ESfMreNYq6/xcuk1smlmDo4kQvdt4bxd27ieVnuLFBX1qVuPnFC0U1cVTRv1
         +knSvXlQieQSHfZIOKGAqsA9QczkcosUojM4eh+hDb01J2gcVMszRmA7QWRTYTKrSHfV
         wYW1POF6DMad9rydB1MYfvOrljg4rpv1uGTJQ76qLcx/X1OYjHsh3GOYeWqxyNX7/Ubc
         a6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGP1/QIoou6A5NHdBvcpU2teH4LQ/zmHwO6R1QGKpBM=;
        b=GDaTuTd+vBNZqwfqnrxeDZEh3M2v6As5DS7RPRTH0BqxSfPPsNQ3KuMAUjxZmjK+rA
         V3/pOPHD25Tfzf8ieoFyKyxEzQ0SFfdvWxXRvzSd976kWblX+SJzz1iBeOErE1zBFWgG
         1yLcwrIW7wmNJ3ZOxU/9VZbg3iV6DeMLWDbYDOrd6ehew4xKRA96RgGemrVJcTzu7eMq
         KSd98c4quw5dKhrnBMF7a2Zo9PwDsGlkXQRwudDvLeE47Io87z8qQ0f03GnjVX6noZB1
         8rnjh2VXKGIdS7vFnK/WE+2FzrAFesM9khoKdIRloGSVBN121MYwA9PJd25Rimvh0HS2
         6L8Q==
X-Gm-Message-State: AO0yUKX9y05s0xoOPA2Xe9uHtM83qpAU1HzS3JHrnyqaozhB+3sRXdrX
	nlpY48v21srdlLNpTAZ9E+g1Fie8bhI=
X-Google-Smtp-Source: AK7set+Bm2YUDFm1GORx3YB36Zgh8CqZR2s+w3aUl8+UcU83/ytiYjSIjtdgbbrrGHgoBsszUD7Uqg==
X-Received: by 2002:a05:6a20:4f24:b0:d6:a0a1:6c6c with SMTP id gi36-20020a056a204f2400b000d6a0a16c6cmr24537312pzb.8.1680474608015;
        Sun, 02 Apr 2023 15:30:08 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:07 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/11] python3-aspectlib: fix ptest
Date: Sun,  2 Apr 2023 15:29:39 -0700
Message-Id: <fba331aeb47d0113f5d5c51008a60bbac9d5b2cd.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101885

* ptest RDEPENDS on pytest
* Use python3-unittest-automake-output instead of using sed to reformat
  the output use this new module.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-aspectlib/run-ptest       | 2 +-
 .../recipes-devtools/python/python3-aspectlib_2.0.0.bb        | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest b/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
index b63c4de0d..8d2017d39 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index 416b031c5..d2b0864ca 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -21,8 +21,10 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest += "\
-    python3-tornado \
     python3-process-tests \
+    python3-pytest \
+    python3-tornado \
+    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += "python3-core python3-fields"
-- 
2.34.1


