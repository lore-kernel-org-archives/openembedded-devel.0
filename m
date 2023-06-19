Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1DFEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7396.1687180991918962718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=qamezLiT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3110a5f2832so3387854f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180990; x=1689772990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTqldKrnj4BWJ/5Uc8Zd0h7x6Y/c2sBripdEf/biCYU=;
        b=qamezLiTFbvyoZ2NXjV6QwuFFdTTIcX4F2XN2hOhdeEpVHdKpzPh84YhLIiRY2ycV3
         b95vblen6lXSIWQSkmr6p0vKOu0UBwAGMowdEoXt0jIbb4eebuerUZA6coFtHrRnniqk
         voDijJNVrLwTDZeUTS5wAaz5KLG4lRWd96kDAOAJZPoheoPnMpaGRQKr+q1mTi6HX1HU
         Pc6huoi3EFJQCd1cAxSFK5biwxAeLzkd5b2ZEfvmlQGHhdzpj0iwFXsNubiRZjjJFunK
         /Ir+1M6plI4QmRbjlEqDjrU/EmoCXRhENjxuZ8tTL73RVyLrbtwHvxDl69iE3/dxo4Us
         ANPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180990; x=1689772990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTqldKrnj4BWJ/5Uc8Zd0h7x6Y/c2sBripdEf/biCYU=;
        b=acgyIOnid5wTARn1J8vUpP0Bz2XwtpVHbIDiqu5hlvIi76zb877g3I3vdKl9sLbfdM
         TNhOZueVp0iREjUj2g61kLXSz7NmkHfnrNCxLgWmyPnFqlU+kYOVVNYIQcHy7AwV561Z
         uXyj3A+1CZjg3Q+lMpTH8kTDnLNU37m3QaNMlwnwgHihCJkBA8k4UIsIU+Y1mBzCLq6U
         Ela8lGqwa3qzWHkxM8QcW/1ToVS3Y7Mv3kTHqQyhk+3/qyRE77X0cuM5cKe2mk9l63n8
         xo39/879988jwsKdBwlnskB6fzMySGCsguHkOUCcN2eNILeWazV+yt9k8fK96iGtqinm
         uBlw==
X-Gm-Message-State: AC+VfDyYjEDuUbu+e8QVh6PhJd6kKe9lcqL6UPB6Gz0PGp5pZhqvIzAO
	pXugheD/uQ1o64Pghf+0ENke5g==
X-Google-Smtp-Source: ACHHUZ7/kIFOGZwb6ffMuSYjaFP0OYFzSUJnJNhw6fLO0MQCkXiMvmcbWv8vGeTN/sOxORtBeTFXPw==
X-Received: by 2002:a5d:45c3:0:b0:311:1944:ad33 with SMTP id b3-20020a5d45c3000000b003111944ad33mr7405309wrs.12.1687180990515;
        Mon, 19 Jun 2023 06:23:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 48/54] python3-dateparser: fix coding style
Date: Mon, 19 Jun 2023 15:22:08 +0200
Message-Id: <20230619132214.213417-49-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103432

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, order RDEPENDS alphabetically, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-dateparser_1.1.8.bb   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
index 67b82940b..13e8b184d 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
@@ -12,9 +12,9 @@ inherit pypi setuptools3
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-dateutil \
-        ${PYTHON_PN}-tzlocal \
-        ${PYTHON_PN}-ruamel-yaml \
+    python3-dateutil \
+    python3-ruamel-yaml \
+    python3-tzlocal \
 "
 
-# Ommitted ${PYTHON_PN}-convertdate, ${PYTHON_PN}-jdatetime ${PYTHON_PN}-umalqurra
+# Ommitted python3-convertdate, python3-jdatetime python3-umalqurra
-- 
2.39.2


