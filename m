Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C7FC48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:33 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.583.1708128988897882857
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SfZpE+cw;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2224180b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128988; x=1708733788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/2lZZwxjjKYrXRGjfLfkvw73VO+xR7JW2zEZClzXvw=;
        b=SfZpE+cwkLP44rFuh91RhLotI/zZaUeTGLYIUnBl4IguSPBvC4kK0H73dNYM0RyJPB
         FZNlP6RAZV4Fuqvy+sllRulEi0KDY7Qo2ol6kToNPtZw7Uj0Py38/DfvpgKQqO2dM18R
         5VShBEXyuFb7GP+tPyo0Lmt5c5nK+17Gxtperq+I6Ns1WU3oOXxu6a19VUEsj9b0acdY
         B1NkpnrrJlD1Fpe3LNj3dZN7tVVLFyZie/Wa7G2Zz2buAV2RbabQ7Kn0Trz7M5XG4Ndj
         Bmn8J3+eGAfc0fMotydvlo2DUciM7Bt0i0YuQTj3yc3N++3dpbLR285KMCn2TL2vFeCa
         otRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128988; x=1708733788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/2lZZwxjjKYrXRGjfLfkvw73VO+xR7JW2zEZClzXvw=;
        b=S/NUL5R65hnFyr8+NQDKE3kUdli2mx7wRwUVwF70lgPl6oTLtErDx6WBSiriGgAdAQ
         tkuFUYWuVwCf2hk/Q+KrOh+V5kBb09WspOxW8JgZFNWVilgb5ys7EgtW34Tu9VixLuu3
         COAsnWcW9V1wrij1c/UJ8fbdB2lcxI+QFANJDM0SyTxE0+H96Wse3jBsYT7Yp07XGoqz
         7AIxLLIIygIVXhD7qDv2YDZxrWG0vvNwHpChlDHxAooj7CJMwlbqrhEynR3a1eqtQDgS
         heMjBcHV9N7R9I8Ru4vwifJYZnLOdP4hDaWDrdADun+a946uSp7LKYSn7gqxc2NfWpZa
         GFyA==
X-Gm-Message-State: AOJu0YyKpwo9IfF7e+W7DC+c2ZvBJUQ73a/f7ct5xVAAJaC3ShAIDEGP
	8vQXGauWmwRbN+zbhgOom0sKfc5Mf4NEQ/hIfrWztoVeMAx9i1yrmGbzNe42
X-Google-Smtp-Source: AGHT+IHz6q45Z9aif99VbeqYr6QfsKxQw7GhIa7c2YwK9CEJ0SMiF4zko3tkno2mhKNj/1YGBQ+e8w==
X-Received: by 2002:a05:6a21:3405:b0:19f:c0d3:42c3 with SMTP id yn5-20020a056a21340500b0019fc0d342c3mr7398516pzb.4.1708128988111;
        Fri, 16 Feb 2024 16:16:28 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 18/60] python3-intervals: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:09 -0800
Message-Id: <16ebbccddb8944ae4caacaef0fc25de2220d824e.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108788

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-intervals/run-ptest        | 2 +-
 .../recipes-devtools/python/python3-intervals_1.10.0.bb        | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-intervals/run-ptest b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
index 357d8cb987..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-intervals/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO test_intervals.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
index abf87c597c..3c5be47806 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
@@ -14,7 +14,8 @@ SRC_URI += " \
 inherit pypi setuptools3 ptest
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


