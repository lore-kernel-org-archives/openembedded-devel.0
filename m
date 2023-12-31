Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11CBC47074
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 09:31:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.217222.1704015103136629163
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 01:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X55uIvWE;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33678156e27so7427738f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704015100; x=1704619900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44npvLT//lx7h3RblJUcyk7h1lWSUVcUGvpa+TqROSs=;
        b=X55uIvWEmIi9hdO5nfyzWlq1PyglDnfKYTDqPykDlNUk5mVs2eHW2TN4e1KupsIr5H
         LfwaxGk58FfhtFq4gAe/wnL+dE23UacdvRJSM7S2f8nDXUqv2r8l2hybvwFmKfrJL6zX
         bcw9JQ/389GW+tt0AaxyNmnhA19kkRZIqG9G2lIbuR22+L/+89dPCqv9gUK6DLRMSXzt
         SDybCUHeWXKOgdeH0FfjkijAy6akGJzJ0ptEpV6VdaYeeDC3OWGMgCBLp6E2faTE8dNJ
         DG5VyjF9JJOMUgaZ/NknSO78IMh2N4e+JnTfuvE1r0lfwXm30GRir36iJdBBotpquV15
         Oknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015100; x=1704619900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44npvLT//lx7h3RblJUcyk7h1lWSUVcUGvpa+TqROSs=;
        b=Fzwd0WQGNUpbKe+1pX5sVlkuK/7F1btAKFYheLggDpyQCC3xU8RReRFoaZ7JfEKDll
         EyjnMuwP2V9Ff4hEARA2uhFPRV7quih6t3URLfXF6GV4PMScqacAoTzufbgNRwl4cUPT
         zq1rjwNMng/npV64+GzSRB/KMTTXukM7GhLRW21qYYDcSZUbeKFPbBoLk1DlhmQ8QV05
         oC49GjiC8eMAPKcn76bWlXlETj5+cjyamn59FIvmjN8+yKl5XSr7qrrWEHcEi6WCV5ga
         Mb5pQNdQ4EHW2w2ZzFxiDMN9Cwf/UZT+yxXiRra3ygmFNsF8eQ/VUZBsx2byVQkGB2Mj
         eBxA==
X-Gm-Message-State: AOJu0YxK5av4BaecFoYtKhaWBH37A8ymHDkqun6Wpb1bStAGj7+/XQry
	Hqah6WA4AleMLFai97C53c6wFdGLY4Y=
X-Google-Smtp-Source: AGHT+IFsKXWFBxqVJu+nkWcRDf+GT7csf5YafloyFfTxKKzhAr+L2L2qT54s6Gv0izogmN7Szk9BCg==
X-Received: by 2002:a1c:6a04:0:b0:40d:6032:fa8b with SMTP id f4-20020a1c6a04000000b0040d6032fa8bmr3035480wmc.72.1704015100417;
        Sun, 31 Dec 2023 01:31:40 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c9-20020a056000104900b003368849129dsm22511506wrx.15.2023.12.31.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 01:31:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 1/2] c-ares: Filter out "Live" tests
Date: Sun, 31 Dec 2023 09:31:35 +0000
Message-Id: <20231231093136.15425-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 09:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107950

Inside a default `runqemu` there's no resolv.conf, so the "Live" tests
fail, exclude them by default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-support/c-ares/c-ares/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
index 15971dec058c..46572111b5cf 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/run-ptest
+++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-if ./arestest; then
+if ./arestest --gtest_filter=-*.Live*; then
 	echo "PASS: c-ares"
 else
 	echo "FAIL: c-ares"
-- 
2.39.0


