Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D9EC27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 13:46:50 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.6025.1719668801163480597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jun 2024 06:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6+UQmNt;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d62cd28645so363475b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719668800; x=1720273600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HdWXbxmxI7E6C0X6cMXvCzP39OVDf9TN/tl0ouuBJCs=;
        b=e6+UQmNtPFm/z2+TeyQrCZgUyufXkwJWL7AGaIk1l2tdQkB6IZplaZxOkaVo6SNnAe
         kIdE0Fklg6YKNB/eiHq/pjZaxTKgU3LdtWfSJ4zwGNTHBLuI6+gTAMn3QvGAUZSPdyDx
         DT3D9nvH4yF/uIE9bqYoufbzrdIZ7xZOojzQvSXVQQBrAPkiNoshXe8qN2A8UWNLSzYb
         53enm9t6G/rEFHdghrypW3adpwRmKd79E42q6akoGQ6+jqIvM2ojrnGglb68rVR10HZD
         UW4qNzmQRkvwFbqtk7VqU/wCvN56E71iw/H2MeoeewM1YRCT1PQ9TCbOZSU4m6EmqOdH
         MrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719668800; x=1720273600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdWXbxmxI7E6C0X6cMXvCzP39OVDf9TN/tl0ouuBJCs=;
        b=wlILDIIFoMdEKsSiFbHiudzog8wjKZXZRcRYS1Hvb5Dioa54oLhVIIJ8nqcpqRxw1M
         AER+iGpjc9uNzSinZS8YoP3fMkgR8VGxfUthhR0vqaFfKIakwAeK7JjmUO/uQvV5n7rs
         S5RNAtQshKU9hdp0fGPwHHRuvHPT3TxuJweq0b6T/4qIEgOULzusijPwl9SXQ2ZKIEwM
         52vDqTUzBON/6/ixvxT+DcND0jM7Cy77qHZ0/EqJGAqY25H9mJgebH0DXhR310FonKFx
         c5tfoPYoG8cMsUjKagxhnPsAznIBbZkJjO+fHwBv8kSOU2QemdvZYnbXnPTClbXnUSyY
         fONg==
X-Gm-Message-State: AOJu0YxNgeXQs8SkvBuVp6kLH9yIFRZKqXhyL9ck5mDMLQWKBQ+PxKIN
	y2tiepk4fcSx7ENLU/0Ox9pgk5GoVH5WT3o+ubhMV0txvhXJ4hrX1qeM7w==
X-Google-Smtp-Source: AGHT+IF3nc5vfd/ZNgdUYokgFZQdA8FEhNE1IBno2AiyuNg90Wp010prjMTFvJM38VeOGZo2/wEKpA==
X-Received: by 2002:a05:6808:13c8:b0:3d5:5bd4:75f2 with SMTP id 5614622812f47-3d6b35ca306mr1563424b6e.15.1719668799999;
        Sat, 29 Jun 2024 06:46:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e53b56sm3295089b3a.38.2024.06.29.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 06:46:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pint: Upgrade to 24.1
Date: Sat, 29 Jun 2024 06:46:37 -0700
Message-ID: <20240629134637.2801732-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 13:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111160

- Fix custom formatter needing the registry object. (PR #2011)
- Support python 3.9 following difficulties installing with NumPy 2. (PR #2019)
- Fix default formatting of dimensionless unit issue. (PR #2012)
- Fix bug preventing custom formatters with modifiers working. (PR #2021)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pint_0.24.bb => python3-pint_0.24.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.24.bb => python3-pint_0.24.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pint_0.24.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.24.1.bb
index c570fed6ba..8959a72ff7 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.1.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit ptest python_setuptools_build_meta
 
-SRCREV = "7b47d6b7b0f7655efca810a90f2781c0d1cc7fb9"
+SRCREV = "4c2caccfc6cdac1f80a9bfa15ebea1ca49836881"
 SRC_URI = "git://github.com/hgrecco/pint;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 #SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"

