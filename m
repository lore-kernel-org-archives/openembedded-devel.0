Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB048D2C106
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.19615.1730817418443479215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AAkBVMvY;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e9ba45d67fso50969537b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817417; x=1731422217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPGeOZojJ6Lf60jHxJYGMx9mG+SRMUukGkzZ6oeJ4xc=;
        b=AAkBVMvY89ugQJA7573v7j9TbOe2I4HeB71Fs1ncSHDJM7P3QxicPFTaY6aR6cfbsk
         WF4i9AfCwrneZ0pDdxcspzKP2yYQ7z5uSnmZnVcPGPRdsukycfsFzNmoYx5uQ6ALjlfL
         VJFmBEPntnukNLUCcg+Dc6Zu+rDDfGv4Cv5XTdgES8Xwr1QhYuMsSkXBknlOdpdPGzLX
         j8LSsdm1gKdqeYgATuAwGYBmgIHXLdSv2+CxUsgRVVkvuvxQodprwok9MWJ66TvSLM5g
         GuY1P254pkUYzkRqs70BHUGZh1+ppVrJ/Sr+9NXeQjjF/t3Z4Oh4zw+CBcKosuJm4109
         31+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817417; x=1731422217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPGeOZojJ6Lf60jHxJYGMx9mG+SRMUukGkzZ6oeJ4xc=;
        b=omHnvoevMPTNoO9hJ5386j4b9aDYe2+Cik0rF2aSJskVsGX7hVJWZPHMaTmrUzKGVI
         jDdIYkzaww1Z6XKv4gQWnUt4lfMJNQJuiMXd7LKL5QBtDRFfDekzfMCNkz2FH3sPa3oh
         GeKHJNfZZ9h9XhhSGT6sR4J0M7ZtDFpmrjF2qL1EmPawNncqCJa5dK6Bluf5TQp7V4oh
         Wwyvs9kYgIyBjZZj7NdgXFajWxn4+pm3Q9JMYgvZ7dVyl1mXzdIkUP0gOidXWWCw7Rzi
         rIa/eo1GubmdIJaQ+P5QCj8085TCzyC/WF7RXL4jWJrWTzt0yJjeanELs+6ltEa0ueF4
         Hc4w==
X-Gm-Message-State: AOJu0YyO1Ug08+RiqmfYwaSSdJ3ozw3i3Mp1XQAr2A4j35IymkJ97304
	e+DRbYDobeYu9Lqdw8MldI9xoEU8K8PyHXl/iqsClBjs4R+lUzaPyR/4Bg==
X-Google-Smtp-Source: AGHT+IGd0XDrcYyOxPSo0AYIYyTzpH8X3TFfFqsTqC9M63kskZrY/uk4iU0nz4XYUqcqD+vWjf/33g==
X-Received: by 2002:a05:690c:304:b0:6ea:98d8:a55 with SMTP id 00721157ae682-6ea98d80b01mr73131847b3.14.1730817417517;
        Tue, 05 Nov 2024 06:36:57 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 40/90] python3-typer: Disable test_rich_markup_mode tests
Date: Tue,  5 Nov 2024 09:35:05 -0500
Message-ID: <20241105143638.2301245-41-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113458

From: Khem Raj <raj.khem@gmail.com>

They fail for OE, see
https://github.com/fastapi/typer/pull/859/files/2cfd641d86a591a0d8582dec9292c03e6322a21a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-typer/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-typer/run-ptest b/meta-python/recipes-devtools/python/python3-typer/run-ptest
index 94b40789b1..94b6c0fc22 100644
--- a/meta-python/recipes-devtools/python/python3-typer/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-typer/run-ptest
@@ -3,4 +3,5 @@
 # Ignore the test_tutorial and test_completion.
 # Because it needs the docs_src package what is not in Yocto.
 # And the tests are not that useful for Yocto.
-pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion
+# for test_rich_markup_mode.py see https://github.com/fastapi/typer/pull/859/files/2cfd641d86a591a0d8582dec9292c03e6322a21a
+pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion --deselect tests/test_rich_markup_mode.py::test_rich_markup_mode_rich
-- 
2.43.0


