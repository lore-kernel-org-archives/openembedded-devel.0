Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EB8C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.635.1708129051200259083
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHyWgozq;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e0aa4bb62fso1568412b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129050; x=1708733850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5DBVqnUzwqE62otUyIs/MftHxzv6/UQY5jJgLDcpcw=;
        b=GHyWgozqi42/1GGqB+3Zt7vAwKZfqpn2yEImfRtSNHiHIjK/EbItzT45iZmw3Nnd2M
         8fY2vLYsOaQSn6agIThfwMaJD9N1PMAHujK36ErKaW4O49Hn4ZIb1dqsNyqUZeMBIy3Y
         98uCvjS7D7XBcCsycRQuQsnNiiw+D/Zh1thwdXQIO8CCDjQqkl++wv6EtH/aFb+WmpC5
         G5b12PqZRbNBe2TOfgZ6YDwbxMUDLXGe5ailV7LBn/BtuqEo8VM3WilfYnfSaBQP5vA1
         9zxUULacHu/T3DABLHZ1GGFHJyh6F7epPP9GGqFQbV3nNbdu7+J560bZR37GpH6pnleB
         xuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129050; x=1708733850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5DBVqnUzwqE62otUyIs/MftHxzv6/UQY5jJgLDcpcw=;
        b=XzChUB1ZVJ6t5sIZemBOw1YoYYYbUuJkWD/1uzdQJ+t+g3OJFB+WvnMR40s3lkiJcf
         FB8gFfA4/28MZ0DsDM7G5S36DIVURoFeMjtDhddra5WXPYraUAMk+Q6clO2RkBkwcDIb
         U2SLucXDuyue5gwMEe78LX3inos+IXAb3flHVORQ6ZplCf9Ugk6CoRMQ8WfRCeKXBsVD
         yHNeRwuR6S6IFlhYpGXB61LYzIvxZLPlCPMIn5VmZl7gGKK+wFmMcJEKGCMWXiBE2qpu
         Lo6C0UwET5Izl8anM44um3hzhgbofKp87qXOkwxvhP2EY4Tra15vRdvNdi9U2sInMYbV
         zfsA==
X-Gm-Message-State: AOJu0YwAwNBRk8jV/gE3PBftqqQJ8wmjb88lTGODC9zo079LTyEX/vwx
	ozgudbI4Y0yf2yyYp7y3UX632et1IktcqA5cprEKPHXaTI/sBlPrgclELS2i
X-Google-Smtp-Source: AGHT+IHZ2GH5E+fNu04FpsgRFVyjvaIQtKxR+1wtQwylcKeOuuzYJjOi68+zydqTYVMybOtq9ArQSA==
X-Received: by 2002:aa7:84d8:0:b0:6e2:497f:abb6 with SMTP id x24-20020aa784d8000000b006e2497fabb6mr545738pfn.0.1708129049547;
        Fri, 16 Feb 2024 16:17:29 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 60/60] python3-pylint: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:51 -0800
Message-Id: <b82ce5fb3a9ad57e815590d3688998a4c8bbd5b8.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108830

* Also replace ${PYTHON_PN} with python3
* Sort all REDEPENDS alphabetically
* Drop trailing whitespace

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pylint/run-ptest           |  2 +-
 .../python/python3-pylint_3.0.3.bb            | 56 ++++++++++---------
 2 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/run-ptest b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
index 2a4e87e03a..ed424cb879 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest --benchmark-disable -vv --minimal-messages-config tests/test_functional.py | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --benchmark-disable -vv --minimal-messages-config --automake tests/test_functional.py
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
index cc33edd829..eb4b9e897f 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
@@ -10,34 +10,36 @@ SRCREV = "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
 
 inherit python_setuptools_build_meta ptest
 
-RDEPENDS:${PN} += "${PYTHON_PN}-astroid \
-                   ${PYTHON_PN}-dill \
-                   ${PYTHON_PN}-isort \
-                   ${PYTHON_PN}-mccabe \
-                   ${PYTHON_PN}-numbers \
-                   ${PYTHON_PN}-platformdirs \
-                   ${PYTHON_PN}-shell \
-                   ${PYTHON_PN}-json \
-                   ${PYTHON_PN}-pkgutil \
-                   ${PYTHON_PN}-difflib \
-                   ${PYTHON_PN}-netserver \
-                   ${PYTHON_PN}-tomlkit \
-                  "
+RDEPENDS:${PN} += "\
+    python3-astroid \
+    python3-difflib \
+    python3-dill \
+    python3-isort \
+    python3-json \
+    python3-mccabe \
+    python3-netserver \
+    python3-numbers \
+    python3-pkgutil \
+    python3-platformdirs \
+    python3-shell \
+    python3-tomlkit \
+    "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-core \
-        ${PYTHON_PN}-git \
-        ${PYTHON_PN}-py \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-pytest-benchmark \
-        ${PYTHON_PN}-pytest-runner \
-        ${PYTHON_PN}-pytest-timeout \
-        ${PYTHON_PN}-pytest-xdist \
-        ${PYTHON_PN}-requests \
-        ${PYTHON_PN}-statistics \
-        ${PYTHON_PN}-tomllib \
-        ${PYTHON_PN}-typing-extensions \
-        "
+    python3-core \
+    python3-git \
+    python3-py \
+    python3-pytest \
+    python3-pytest-benchmark \
+    python3-pytest-runner \
+    python3-pytest-timeout \
+    python3-pytest-xdist \
+    python3-requests \
+    python3-statistics \
+    python3-tomllib \
+    python3-typing-extensions \
+    python3-unittest-automake-output \
+    "
 
 S = "${WORKDIR}/git"
 
@@ -46,7 +48,7 @@ do_install_ptest() {
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PTEST_PATH}/tests/.pylint_primer_tests/.gitkeep
     sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests/data/ascript
-    # regression_distutil_import_error_73.py fails to run see 
+    # regression_distutil_import_error_73.py fails to run see
     # https://lists.openembedded.org/g/openembedded-devel/topic/103181847
     rm ${D}${PTEST_PATH}/tests/functional/r/regression_02/regression_distutil_import_error_73.py
 }
-- 
2.34.1


