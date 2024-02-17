Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34922C54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.617.1708129027792681049
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UKqf2vEk;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e104a8e3f7so2192398b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129027; x=1708733827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QV9MK+1pYXvIaaF85NSIjJvJWIb7+SELiYPpN/fm/tA=;
        b=UKqf2vEkBvoXSkYyh6S94ko/+Z1LcCgPgtsP4ZsNEtFpHSnpXGZFwAA2Vly0E9zaGc
         8h9GLtdaP+raSqtFeRh0tWg51gxro5NsVgpEy1NxHAvw0TzHUwtZ8ocG1vw2agcl0EMa
         tWBcbXNM+mwu+/GQmoRwqWY51/+xSDE/bZ9vR7kV8AqCp17RhHkoA4kfaU0YUcJSYtDM
         uoKUwAqGfY4RguEa3M2Em0H4/Jno4f+EFk3ZnfzKn+AG3sGE5DVzT/UqVgHLd5sCt9U1
         B1LjOzyI8EksknCn0hDYu59NSZJVgbKsQI1wC2ybAMkz4S/k2cKU+T1EJdFX9i5hDrWj
         XSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129027; x=1708733827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QV9MK+1pYXvIaaF85NSIjJvJWIb7+SELiYPpN/fm/tA=;
        b=i8/ESm67mFZS5QSjFoR8EWNwvrjCR4QHq89F33Q57XjKcfGhYypvI7rA4hI4/bl6R4
         rgac6h257KQlpnhr38XK3vQQpp75WPJaq8Wfv6sjt6Y9pe9p/etgSyyQvcCY/vzSD2qR
         BpWLa9zSTC71wT/nuiFT/3zsliYyYiyj8wqa1g18EhANrdxfHPnKA/IidMxyqE2KBYHY
         vuG5qmUAXXoyRfq8a30tS6Osy/vXY+hrJXgVCHRVaLhGSR9+SZTJpxwI1DVSyMFfKtH2
         cgiv0wQEJNuXA2IiYnZJNdf19wrIBLB5uxYW6NyWDeq+pWjaBTiaTyu6HjaKnwg1SoTU
         UOIA==
X-Gm-Message-State: AOJu0Yxzewo1JRjzWqCdwmxvhMRUoMQr3Z5gCEYRRuDBwvMYUZeOsbYK
	KkLZ8FKWstl5nxwCKvT79rgL9vSMi3t6NjaYMKQ/b+kDtk3uLn9FY+OKDQ47
X-Google-Smtp-Source: AGHT+IHbt6uKLeXQ0SCYDHggOmpQY0iHaCeVM7MonCcuupCT4fipkZnPqhrig4aUjg448mJk5lhPhQ==
X-Received: by 2002:a05:6a00:1d90:b0:6e2:3793:b33b with SMTP id z16-20020a056a001d9000b006e23793b33bmr900272pfw.20.1708129027020;
        Fri, 16 Feb 2024 16:17:07 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 44/60] python3-blinker: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:35 -0800
Message-Id: <78169fbc891ab79ea49c5b3dc45a0568963411cb.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108814

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-blinker/run-ptest        | 2 +-
 meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb | 5 +++--
 .../recipes-devtools/python/python3-inflection_0.5.1.bb      | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-blinker/run-ptest b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
index 15c3f6282d..69cd362f69 100644
--- a/meta-python/recipes-devtools/python/python3-blinker/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh 
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb b/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
index f1d8b4fa95..8f2cf4883d 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
@@ -9,11 +9,12 @@ inherit pypi python_setuptools_build_meta ptest
 SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-asyncio \
+        python3-asyncio \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index dbde8963e6..5c6f4e2356 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -13,8 +13,8 @@ SRC_URI +=" \
 	file://run-ptest \
 "
 
-RDEPENDS:${PN}_ptest +=" \
-    python3_pytest \
+RDEPENDS:${PN}-ptest +=" \
+    python3-pytest \
     python3-unittest-automake-output \
 "
 
-- 
2.34.1


