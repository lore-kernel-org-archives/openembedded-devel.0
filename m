Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF22C54781
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.616.1708129026358787850
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5jjvXTk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e09a890341so1662794b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129025; x=1708733825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saG2ZIHlZgLHdMeLEFFgHct6gb2keqHIDIb6QpYzF68=;
        b=S5jjvXTk73/TK+cO5sfOesJx3rChJTVK4IfxLVb3zgnH/bUBLg6RI7gZncpQ563U4o
         mdtXLAzGDxvFYNu8yoRDL846iESaj7cLfi0hJ7AZecJgUtjIP9AYMUstA7TJi1ojlmx7
         sIRrMB0JwZbLhFQimyZ54p2mp6uqd2AZxcnDd/Lkl6fTidqacB1LX1CNUWVD4BFHG7ek
         z0ZylOAlJIPI93HMCj2I5cFBU84QG2k6zsIsDf8CWfXjjwNvh/QCf2l3xOBMvmTpakna
         iL7h8Bns80hDchhzjMIQzXXivf5BrjmgKX0X53vl7reXkZ0wqyfc95k1La/ttVMm1DV1
         bidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129025; x=1708733825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saG2ZIHlZgLHdMeLEFFgHct6gb2keqHIDIb6QpYzF68=;
        b=PlEeeoqnBkMvKvtBo1BQ67E+nvYfme0/8GLOwE+uKQHcDAqnDh9i7Ij1SV6KeaNIOA
         htWHgX7047+O/WBPj26Qhv0PGhjqQOgNn/1GxABUDE9bZh8SxMt/Bm1dVyD895VLVEQr
         JksZwwuTLDvgoYCEVy9i+SfB0nHGJ2cOAwgfipDBvkgbfbj5s02g4nxJNTWsCR6505hQ
         T0daDub7HuAfK+hJxlmX9q6xpbOoZgy9FN86HcZrlf7kom3OtXxxu0pRKKKHnlc1V8R/
         lyfFDDHIi+W/2UCy0vaLvCCBOpHEdj9vFdIML0j0YzqfgpNS7asYCPDUsje8eVbkZ9QN
         XWEA==
X-Gm-Message-State: AOJu0Yw9Lz6ceG/3HcvntBjIJQgOGqw+4dbtKnuhf5nkyUiAi/nkneTx
	qlqXSMtbYvWFQwXjyfGAdGmtJ/temZlPvj11gU2rmML+xwCeg5dn+OMg4ewr
X-Google-Smtp-Source: AGHT+IGmZ2YC0rLCeDTZenCKcH2g9J4CuREvfwF68iHYZn4n/VEgWj+XmiwccrYjeGuDDouFA8BjCg==
X-Received: by 2002:a05:6a00:2d81:b0:6e0:9da7:8cfd with SMTP id fb1-20020a056a002d8100b006e09da78cfdmr8179610pfb.5.1708129025642;
        Fri, 16 Feb 2024 16:17:05 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 43/60] python3-inflection: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:34 -0800
Message-Id: <5623734d6837475ded05966751d616fde0a9b259.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108813

* Also replace ${PYTHON_PN} with python3
* Fix some _ vs - errors

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-inflection/run-ptest     | 2 +-
 .../recipes-devtools/python/python3-inflection_0.5.1.bb      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-inflection/run-ptest b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
index 0caffb794c..f1c8729f0e 100644
--- a/meta-python/recipes-devtools/python/python3-inflection/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
@@ -1,4 +1,4 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO test_inflection.py | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
 
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index ea3b76d511..dbde8963e6 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -14,7 +14,8 @@ SRC_URI +=" \
 "
 
 RDEPENDS:${PN}_ptest +=" \
-	${PYTHON_PN}_pytest \
+    python3_pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -22,6 +23,6 @@ do_install_ptest() {
 }
 
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pytest"
+RDEPENDS:${PN} += "python3-pytest"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


