Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.412.1626798677546240267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bXC4sRPO;
 spf=pass (domain: linaro.org, ip: 209.85.128.44, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f44.google.com with SMTP id b14-20020a1c1b0e0000b02901fc3a62af78so1845849wmb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yEiwNwmUOyG4AkU0baKhUsdh6EpfGG503qhYjoIKxGc=;
        b=bXC4sRPOmIKcteIInsa/gHXMvllNzmmI8+P251dOGcbwdMxkXxWykQqVo0v+zdA1gz
         +ng4AV6iBn929Ky1irlbeX3Jcf7ff8eEiUESa9gcCPqjya/wZLSNNgbpR5DAKmABJDya
         Hzu0E/ysvBWp7m9zwHuoIO7h/yzzZP44Yf4d6FutBeL3hBNXwtXNjPyXSmsqhrLXz9pl
         WX4E97PDhS9iSeLLp4Ka6tD2OUo0aF9n/o0Qay2uvwXtdrvLNcX9hPi1UiUjmDVRSUqZ
         Da1O3C+PwKUunSHDg9z7OQCQ7fa4KkrP7U3j2GrRIPej1UpA6+oiyxadpMtrXtFGkbdh
         rFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yEiwNwmUOyG4AkU0baKhUsdh6EpfGG503qhYjoIKxGc=;
        b=srXboxraU2Ug5ahpP3ro5b0SrRyB5jYiqClA1ZBj61StZzxEjn114fDTL4pv7XLgoY
         Fo8QjbAnyQDESKkU4tVMl083fZg9kpSWt7EXekgMqkjvEwM/Y5H6tB5ZyVNDpMHgntG8
         VH5HgtdJ/9r4o/IAX/NQinJtuLtB0BqkfgifUpJQHg3HOjK63muWaZYv+dL4HNg5rMeg
         4vpzLzemCNmyZkhTWQ5zYQ9ZvoZQlyWzNnQaji3IZgYrv4SpUv5H3h0sDPomTqVWdSm3
         DD3zBwzgsgtZrddZKNz2DkyAIi1Gh2ljoQxAY+jc2NUapfIq5KDaZ+rOInGWQQS76sMl
         HR9Q==
X-Gm-Message-State: AOAM532q+8MklWgnHG4n26psx0TYxKzW7dTTRDGeQqLlPbCEwOcsh6vB
	VCi4bJdU0Ym9rdmuw+KUXbd0pA==
X-Google-Smtp-Source: ABdhPJzRsmwtKZU8CBGV1qkueQIjhCr1rTQlg5BIEOXugaz0TdsPwPRuqZoKX41JIr15hMIw34krGw==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr32873841wmk.89.1626798676011;
        Tue, 20 Jul 2021 09:31:16 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id l39sm2256731wms.1.2021.07.20.09.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:31:15 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/5] python3-markupsafe: remove recipe
Date: Tue, 20 Jul 2021 18:30:49 +0200
Message-Id: <20210720163052.11295-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was moved to OE-core/dunfell in
ec222f6af5f8 (python3-markupsafe: Import from meta-oe/meta-python)

However it was not removed from meta-oe, as such this recipe is now
duplicated, for no good reason. The version in meta-oe and oe-core
match so, it's really a no-op.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../recipes-devtools/python/python3-markupsafe/run-ptest       | 3 ---
 .../recipes-devtools/python/python3-markupsafe_1.1.1.bb        | 2 --
 2 files changed, 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
deleted file mode 100644
index 5cec71169..000000000
--- a/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
deleted file mode 100644
index 765e3c906..000000000
--- a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-markupsafe.inc
-- 
2.29.2

