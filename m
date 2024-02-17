Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BEDC54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.626.1708129041898598741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cOO4K5ht;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6da9c834646so2387102b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129041; x=1708733841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7EykmVwTp1ldHn+MdqSOYmd9W9NRvO8u3k8TRRNX+k=;
        b=cOO4K5htwVJpgtvk9UskTecsSZ1W4Ntzs4wl8dY2SNpNc7OCZfWnKM3J04lDiSGz4K
         fH2Ys+mwVFAlWyAgSSRLsWlTnt20UrOYiPNbq9lq0evSrTMcrScn8BXEF3s8Au1dDQKt
         alO9k5E53c9cPohK7gtRmSCbGe2/BHtK/bgD29fK6YnEhVKeV/4+H+PAJ1KVvGS5UJrB
         DmatHD/dcdcKsYxN90BjYMhQBTcU4ZPukdzspaWafkAmcBvuj9FwXzqBFMmXI+Znj6UC
         selMwTmqMmqIdd6p28cYAXBbdOqytUC53Rcby3mV2hl7T3nY5Rk1e7hLlw5rXHvJ7LE1
         8N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129041; x=1708733841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7EykmVwTp1ldHn+MdqSOYmd9W9NRvO8u3k8TRRNX+k=;
        b=Ikwhsjix9KyKDmBAfmOmQAdg4QsG76t7J4QuHAy/GGAYI7Bbd6IMrVeqEjTeRV1cFu
         jNEq6IDQ9+erY7PwbiTLFA+16ygsBbiZhrbkc+yd13dVn1X7QU9QAEFVwxjdNVfmq46i
         Inf+1wgBMVfJ6btLKDq/Ry+6Vf8TWTyBthE6dlu4mP+XXicjCkxo68NLIRwUfjKBqVGj
         +pVe6RvXn5Dm4Kw0Q2Z2cWNk3nBwOOAqtePCLRKBvBDClPI6VURINFm2I6h+D44xlflf
         zJuj/2U4O22y9OXh3tngpkug/+rRdxy5o1WJwN6l0d46M7AM+uGmQ11Ked1wNDcJsVbj
         u08w==
X-Gm-Message-State: AOJu0Yyl3pAGFfKVSLGNcZpQsmYgVN+ocJonFfvEbSCuwT9Yww83BKQP
	KBymQ97QCFrMKZyUXMEPYjhME7sffTKmO8ILBs7USwI6C+zgUXIuSTWNAGDS
X-Google-Smtp-Source: AGHT+IHpW4ThOmDUDKTZpQjC/jN9WqMnl/BWsDlDuqSqtQP4XzVD4myHDcmJiJIWBRlFQ/j9Cj9VNQ==
X-Received: by 2002:a05:6a00:4f59:b0:6e1:7e8:7a55 with SMTP id lc25-20020a056a004f5900b006e107e87a55mr6451444pfb.31.1708129041124;
        Fri, 16 Feb 2024 16:17:21 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 54/60] python3-pytoml: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:45 -0800
Message-Id: <0dc564a5cf8576c9ee7d1d6ca8f2a628ce73ed61.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108824

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pytoml/run-ptest       | 2 +-
 .../recipes-devtools/python/python3-pytoml_0.1.21.bb       | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytoml/run-ptest b/meta-python/recipes-devtools/python/python3-pytoml/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pytoml/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
index 0f04a12039..1717085967 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -16,12 +16,13 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-stringold \
+    python3-datetime \
+    python3-stringold \
     "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


