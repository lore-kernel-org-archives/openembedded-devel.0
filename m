Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C493CC48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:12 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.578.1708128969569429238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JvgNYteR;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2223962b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128969; x=1708733769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpYgblcHTzFiwg6sAbIUSGPrDjOgyHP9PTpZCR+5VcQ=;
        b=JvgNYteR16D+i/hwSb/pOLZ02ibDzNWAvrN9bIG96ogQPHMfaGIDxpdM9tbD+23h07
         rH9fGdP8bYxDY5b4bqNnk9vV2NdR4YnKQcqyKpvLIku1Sh+UpGfJUWwpqG9uaBRT/PVh
         TkhJWvkRO5vmjB1whdYH1aGUMjNwe6FLG0gJzAKa6mjhs+5+p1d8mXkTtyFTr7zkXjZ4
         rbmXAOH8ueYbgRQSQOiB7P7Weo+T6JPq6/qUWWfGllEdr8qg+zbLxbp3bSeZ5QewE+w9
         siThRsp8e+toegjQCHDJPi43VoF0PnpngVEHtudKhTShlQAyeNqZJw3rT0p6domDxHcc
         gUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128969; x=1708733769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpYgblcHTzFiwg6sAbIUSGPrDjOgyHP9PTpZCR+5VcQ=;
        b=OS8vXJ9d5Zbh6c/fHqDXar7w+UZa+60Wil8B9arlU3LnlFwgOKZXH4Qp6j4pJn8OYN
         YBu1GHahpv2vIVNLs67/G+tn+JkQnJAIzR1X7D0qhOfVNOgV2F3NCmub1LKahNN2Yf5O
         E3R5HIPafBQJOVIKH0axX+ZRG02YQ3jJN1kDI72nRTOvp5FT97GiceLXNMbJ17YFEKy6
         2ok5MiORG8cU4CmcyZZ6AK5BlBKVACoRgo//Blf0uC3SvH1L4zXNLruqLye1FvgoJD+h
         LwVuMfSXYHSk41GoiBnu3DZMWRMASRc+8LsOrX9FLd2iJmsS3OVzhRGFZeZuONOIdaip
         QpIA==
X-Gm-Message-State: AOJu0YznrXvsVxp6ePrHj/5o1GGZsSOfqQWH8sKmyrNeToD2S/jqvFJn
	sDhd4ZLQaL/r9+LXt5ZPR9ovJnGUFsfnb8QWrLc0D/G/INaSPAxQrMGw9fS/
X-Google-Smtp-Source: AGHT+IFCoPrWNfShnj0mFA7iMryCS3Azi8UbS0WASDrt1fwSzGEShKfN1XEYJdtoe1GMRd5afx9uAw==
X-Received: by 2002:a05:6a20:e605:b0:1a0:584e:fda9 with SMTP id my5-20020a056a20e60500b001a0584efda9mr7079934pzb.28.1708128968799;
        Fri, 16 Feb 2024 16:16:08 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/60] python3-tomlkit: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:57 -0800
Message-Id: <65c1c96816acd1dffdfdee3ff386ab0f77f7f451.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108776

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-tomlkit/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-tomlkit_0.12.3.bb      | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest b/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
index 89acd77770..d4162a110b 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
@@ -18,9 +18,10 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-poetry-core \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-pyyaml \
+    python3-poetry-core \
+    python3-pytest \
+    python3-pyyaml \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


