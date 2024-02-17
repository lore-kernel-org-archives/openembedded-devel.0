Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9842C48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:02 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.571.1708128962273932813
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SX/HYU4O;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso955240b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128961; x=1708733761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg6cAskr6R/zH19wECWa4NR8Z1/d12KBEMYBrMtwO2M=;
        b=SX/HYU4O/2pJRsNybDb6pSRecyaRMbnuLWT+I7wMeQoeQUryOeJC0Wgn+Ghlvz3fYf
         llqeaMiH4AzdPuUE0VIMzeVp5RdExfkb+6Rp4Lru/73aKeUuAV2wFa8aN/kbKbUrNFdR
         OD7mk1C92A+dsnMr8zOek+0xLZjGNFGczMfZ1gtNHQucLLfVqsxw/4lnrFhBST0OBidQ
         zF4UEq/H4TrndkqE3OQaVC17Mv9BqqcKjrLLgaDdmiCm/Q486oPWjLNHKoQ7CzqLPybF
         1Blaqs9C+UZFNsrBhPJ6flgpIFb6hWpV+OntkdYuehpgaJfC9O0947ztke/oTLUgBqs5
         FbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128961; x=1708733761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg6cAskr6R/zH19wECWa4NR8Z1/d12KBEMYBrMtwO2M=;
        b=Ifm+16SM3Avosn5gRqKHoaatbDBAMHHQSnsI3RU9AUArCo3WKM9mEkdS+Up1S2CeKL
         87A5/oukjnbyJAaShqhQJVISllsBqa2L/MUzRNRX7pWjoIM+r3L3ieTTBnOH7+Pwc/xR
         +sxYGFJM0zebsOytJmFqtD/wfgKRE70SLEXk+8sMmZnKZtbw/eOs75s44lc0ur733am3
         bApBQTLtBoBMgjsGs14+ISXwA1D2d2l3TbPCLupK0PNiMHfbqpxC/wf3EIr6T3ZFGC3y
         LGL4+Y43PAbKOmOnzxStgqcbsBIshtAzTD6l3ZV/f+QANtBSmFX4H6l0DaJP+NwS44r7
         5lTw==
X-Gm-Message-State: AOJu0YwJwmSAiRstE77WCbOxsopasjN5mrTeOaog21ni9tby9vpCn2i4
	LozbMviqRzj9gPtnsHy4CHSxC87wV6quW2n9oJWww4b7lJRIzD+yQsKADapX
X-Google-Smtp-Source: AGHT+IFbVfb8PC1qWw0vwVhYsz7Y4fw7p7HOyODRPscXbguQHd86zrAPPNPGlFvs/JY5kAIYf/wA4Q==
X-Received: by 2002:a05:6a00:6c90:b0:6e0:2edd:6ee1 with SMTP id jc16-20020a056a006c9000b006e02edd6ee1mr8253623pfb.22.1708128961502;
        Fri, 16 Feb 2024 16:16:01 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:01 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/60] python3-uritemplate: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:52 -0800
Message-Id: <8df766926c443526fbd04954318d6a684e23f46d.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108771

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-uritemplate/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-uritemplate_4.1.1.bb       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
index 3c41b1eb4f..e741b6268d 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
@@ -14,7 +14,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-       ${PYTHON_PN}-pytest \
+       python3-pytest \
+       python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


