Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4729ACCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 21:29:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.60.1761254944576523496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 14:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k5Sd9zKv;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710022571cso13954385e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254943; x=1761859743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJxDjW35Z2puhf4lZ5yxTZCf90aOUMjSfOgZx9k/znI=;
        b=k5Sd9zKvyaqVEr7FSDyfB+l3haf/YElAxKKIScxt88HrRUYYuhbe6F0hI/2mOR9u5M
         xOgx9S1PlrkfCBymb9fdx2bDmeOHCd6sgwHaMNjYIoI1l+WOqWl+ciqx3eWvpiXzS3Yq
         PTfWy5mOzpNC6QQY5WJ0rE9f8/26R6VYKMcR65+IRNukOStRYTXshzkxa6DtIq6rMejw
         Jc57MSmKRdlvnMuRCnFCRGya+TwqCgr4wwqohbAEBfmXWIhPXNZ5ZDlGIPYVIrs2imCk
         989DyHldECq2RPhAYZ0Ia4uvJCn7zgVWY2Mggh1StiQSQ6hl2oAoImWirai0+LNkVrGx
         g2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254943; x=1761859743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJxDjW35Z2puhf4lZ5yxTZCf90aOUMjSfOgZx9k/znI=;
        b=pFwghM1IslWmc4NYr1Tt9TxKkC7nqhlsPHyQCJwDfkFpt77u6/00Yd6W450iM0UyTL
         AVBl3Qqra+0Mfy+aU6n75zP9xV/7OYnmHQspdxZ8wL/nfNDu79q3DP9nUHTxktEuw7e3
         9HFSM4PZryssC3xVOpJs+tJznbyG9X6PIJ6xQHLQ1D+jBX7s6NXO96Oa3+OPqGD6hP47
         Zjdr/DQQjvgkTvUS4bAxxEquaaerfthSyAZxllyVPRUHZ0rWDQY0jb6Q0801gxyTtJya
         +wKVox19dWOouSabQ8H5w7utuprJ8/Emeqg7U3CBq5Ti82r0bbqv0NWNe4r3BpWzUKDQ
         E+DA==
X-Gm-Message-State: AOJu0Yy8Sl8ilMVcoZf1MNKNrkpIg05M9wMkM2wD1s3lC/5qNqk9Pesb
	n+brbOkS658X/AykJGBPPijOydVSRGXHjmxmRaxGT2s0WleZkZFary1rUbDITw==
X-Gm-Gg: ASbGncv7033hmXEAtCYTFqkj4psUzHr9Ano8PC3KvGSyM+Z0DXDayz6QBWjunJQVXEQ
	htwmg9ulm86TsFT982TVhkwW2qwlVNtKNct0i41qOht81Zm/fP27WO555aec9fENxhNzbMT9/d7
	t1I5VPFWdxizRpGwXHAn/l4LhKdoGjj07F/cN04hO6UCSibP7ekAuie1Zc9Ie2W2pbOh8AKquvN
	D+FqIdCEdHODELY/E+nL8zH69VvqRBkK7zvy9a9mQ+p7kb0e5USyqol3tS4WJTbrbiYohiK44+v
	ZnVwaRnCH3a1a7TJWmMDotJyUAf4qINx9CZxgNZ+7A0R6JkoU65tnJsuYOC4ftZgwmatfmCW+rl
	2PklAEMMkjGpRTMIIgHlcGm2E2uANmHFpyP0T6LZsmeo8FVfTXUJeVaUllXAXoI8lnllTZoihTt
	gl5cx0QCbtTaPOUKCR2Uw=
X-Google-Smtp-Source: AGHT+IEeMx5vBsgS6KRpqUoIogKwtnLZ4yCXKKyZ9cfitCaT++iDUUPv+Poq7i82ZiE+738Ukra6sQ==
X-Received: by 2002:a05:600c:354a:b0:471:152a:e566 with SMTP id 5b1f17b1804b1-4711787a2d8mr135586355e9.13.1761254942699;
        Thu, 23 Oct 2025 14:29:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf4cf7sm66871885e9.8.2025.10.23.14.29.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:29:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-pint: fix ptests
Date: Thu, 23 Oct 2025 23:29:01 +0200
Message-ID: <20251023212901.841481-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 21:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120940

1. Add missing ptest dependency (pytest-subtest)

2. The testsuite is installed in both the site-packages and ${PTEST_PATH}
folders, however some dependencies are only available in the site-packages
folder, so many test cases fail.
At this point of the branch lifecycle I decided not to refactor the recipe, but
rather to just use the installation in the site-packages dir to run the
tests (switch to that folder in the run-ptest script)

3. Fix the run-ptest script to output PASS/FAIL status.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pint/run-ptest | 3 ++-
 meta-python/recipes-devtools/python/python3-pint_0.19.1.bb | 6 +-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/meta-python/recipes-devtools/python/python3-pint/run-ptest
index 5cec711696..6abbb5de73 100644
--- a/meta-python/recipes-devtools/python/python3-pint/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest
+cd /usr/lib/python3*/site-packages/pint
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
index e1c471e064..4402908a35 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
@@ -27,9 +27,5 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-pytest-subtests \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
-}

