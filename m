Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB24C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.588.1708128982967834360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJGQF2PH;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e09493eb8eso2923371b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128982; x=1708733782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoFD7u2diTlPvYr9e6jVXZr52vPhWv6cl3EDoC4rm38=;
        b=MJGQF2PHvPoupelL5gfDHyPWJZGp6MlG5kR5dT2AjReR4C/cPDOIZg25cifSzeIwG+
         EsaZunhD1egVlmUPOf4vQ35LoDR68lA07fvXVioGyGXZuBSkCaKP5ESNcbhP3yMn9L6p
         O7t768M84M7JVVU6Cj/zdFjwYU0rLv6Uo7r1hvTPLphJktiqK12ZUe6kwLJk+uZkbSVu
         4duxjH7OrY7BR1MmGQQKAyIEhamdKOwn+ZjMYx3K1hFbMrquYJBE5U8u7+QXCNjr0hJ0
         c0FQ88eOpl8WNQZe6j42oR0IAQKREnWT7AL2fdlGedyWnNBf1uoDpWbr1Qkpjsqbj7Ic
         Dydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128982; x=1708733782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoFD7u2diTlPvYr9e6jVXZr52vPhWv6cl3EDoC4rm38=;
        b=DJPnVsfzvdtllQE3lXblYBIJrFbUE+RV9cTsnoV/4praZ1HtGmI8LBYuxUPHF5Kli/
         pndvOMK0+s0xizvdRtQuN0TxeU462nHqydMVFoGsWi6jlNy7wDDgAbPLUCGTyD3m6ppn
         amfI70FFonZIHYiHQeQXGjEggnuFAtfROvWol36Fh2UXAvqc+BHtCG7IwviU26Z5qMJe
         WVFlldCBdIc9SKfB/uVT1Mt9oVm/IWv+aZmnXCTzfN6+qN6vN0bKtnvUhFbe2Gsrb98Q
         ot0nQblNL3lUSz4ztkE6zXjqyRx3MUcgdBSPNxEhs4HPYVLcXh72HXfFYVaXJeAvTRZE
         2zUA==
X-Gm-Message-State: AOJu0YzKc1PiAEHgpdCHRJmVxx5XqrkCU2Bl3bOVanxQzn2k28yWOxWt
	e973SCxpqT9Smd41bsbf8Tu5r+B3CPx1byw+bA06ai6PUngA1wWR+VQTWrEN
X-Google-Smtp-Source: AGHT+IEwgPKERsmHtyfEhH212YySjKMyrezBKCXjSpLvXGNKQDCY4Z9F2kPI/351xjvHQFb6QZLxcg==
X-Received: by 2002:a05:6a21:3a47:b0:19e:ad09:a571 with SMTP id zu7-20020a056a213a4700b0019ead09a571mr9300637pzb.29.1708128982165;
        Fri, 16 Feb 2024 16:16:22 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 14/60] python3-trustme: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:05 -0800
Message-Id: <06501ac3914300a953ad130eadec51c52201e2f9.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108784

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-trustme/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-trustme_1.1.0.bb       | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-trustme/run-ptest b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-trustme/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
index e925712f36..ac03bce2b0 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
@@ -20,9 +20,10 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-service-identity \
-	${PYTHON_PN}-pyasn1-modules \
+    python3-pyasn1-modules \
+    python3-pytest \
+    python3-service-identity \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


