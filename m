Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478DAC5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.616.1708129040716164173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eu6FfOiX;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2224419b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129040; x=1708733840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq8TLBzDTDuFMOA4+b/Qw1l5Q4v3aYdV01GupbeK8mY=;
        b=Eu6FfOiXPQC5yvPMxu48iwit8GDQ7hBHpV1psv9YAajL+XdhYVvOY7oFLKp8na0pTw
         ENqkzci2z5Y+a9L493l3cC4bIZA8sKHmP+NJvaTz9n9g4vgzAWCip2XkOrRXaKCCZ/1g
         UXgofDOjTcAgM1xqUTkWFW8pq0KJizvvpCfqELLuBMt4F50DH540KFG0bAiqiATZfdXv
         eLowygmaPrOiYgENGbDp9iIHi3kFEvDJ65QTqV6mKQ1v7PUs1wEMob4lK7BddpG5zlWL
         LYGT1rsUhzS55WLpEKMLZeLXhVPOL8PoY1drscxiaua42peZJNgVJAGweormst9R1Fwt
         Nxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129040; x=1708733840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq8TLBzDTDuFMOA4+b/Qw1l5Q4v3aYdV01GupbeK8mY=;
        b=uKBgPgjehDasS2M8TKIr9FV97/t/RA1QVy7h3meBhttOm5UYr0OuFOQ1C9yTM4cU/E
         hy8nJb8D/o7OH+nY4yNAZSbYMUUfis+kI/NaNkuzIcgDQS24ZyCNndkLWVo1DVi02X4A
         1LdIql/aayDAXxMT8W5sZmR34q/P8GlFjxPmu9r2vvlEi9d34P95s0GzKaqofYGh1U1N
         AlePUtyauPUlzC6N+f6WGwOOhc3JvXd0bpN98jGecM05RAn4QMvqsUxhrn8bkND3kT1j
         tmeGwLGW0DOFxJuAVmufWv1kdiXYj+NP7g5pU8sBOZaXtPVqq607ghQGrlY9/X83sazu
         T5Cg==
X-Gm-Message-State: AOJu0YyTfmjcFA4kU8w1mv7pl/WJyg7DRn73BABcBJc9FIi+Sug+Q1/h
	S0mP/641I3YMjuVT0vhCvbbQTGY3727/ZbKHuPVlhqxHWNhMt2bKC7FVfPo+
X-Google-Smtp-Source: AGHT+IGfiUndg/fdmnbiPOnGCckG6MxKPPE4t7P0hUugJ469uWH9ewf6jsvtDN2+otbucxv0dxZbHw==
X-Received: by 2002:aa7:88cd:0:b0:6e0:4b81:907b with SMTP id k13-20020aa788cd000000b006e04b81907bmr12707859pff.10.1708129039959;
        Fri, 16 Feb 2024 16:17:19 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 53/60] python3-betamax: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:44 -0800
Message-Id: <d3322436dc8057d77ad6f2e1e5da4d2b3bae3c78.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108823

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-betamax/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-betamax/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
index feb9ab3e27..468a1075b1 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -19,7 +19,8 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


