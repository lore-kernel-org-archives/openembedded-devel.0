Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D3AE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 21:16:58 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.2067.1734038213600784400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 13:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a817ee9936so3852045ab.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 13:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734038212; x=1734643012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUAoQNGiwsdKzs7nXaFvJkz1eVU22TTfghjwkwWdoFA=;
        b=ERALzjTJkM+v8qsu3rmeoc4FUr+PotOkMQDjpHk05TbnyWwv90Rzpixtkq+Y9t4+Pl
         4/7nU1hVKeh2jASNrMi8p535a9BEx9+uMGm4DNZeF3fCBsl9oPGOTKLvpNW2I+ZryMaN
         rxNrc8MrkxkH1moccBREnswYuWFJXoK+rACnozHFfNQwLtCpW8x3H19viOeR018xGs5s
         d1kQvGsZ1E2ubfhoL+T7E6aNubbMn/25dudYk39x2B+Xr+lffJueS5bWGJ1uSDrV2Nnb
         9kcqNOYdifpD17irD7JDB8PZ+KgBeHT4xbWR2jsfHKUFh8bmdCgQwPKFTotQm89pV5LA
         YI0Q==
X-Gm-Message-State: AOJu0Yy1QHfMfrZu42V4nSjwtDcziNI/nZbssWACDxqrZRRf+D1RTu4w
	B1I/pGwVtcIkRQgVcC/Sm7xIqxfERQQVaqm89HREWA+SoyPU0IVx58Tg+w==
X-Gm-Gg: ASbGncvC/vSzAWnNPycgkz4/EmnSLzQxJL7sUGmwaxTlimaeXcqWeZe14BxctQYFIgr
	2onOp8yCogQ/H6eWyUUn2HIL1zJwPWYdtCSF1PiF0VnB+CLalD8DHOY3stu8Zkc4Uk1NeqkrlcX
	J7uNBUL+FolKIZPd0L6lQg4NxAcZ2WqmTBkCRDzgr6WgferWMhE19R2CNLccoPJpJh0Z8I3j+xT
	qXCi0oN6W/0VFKB8L6VYNmP8hPlLWpb89lWh/NRBjGzVbQqRa/yORkX6uXqNDi6E54uTrhJiPkH
	WCX6tOl3PQkxVxG62/FTKwtnGQ==
X-Google-Smtp-Source: AGHT+IGMdZUOQTMYqWSbjx1OdeNny1RkhM2dKjN9QeF/vBqQyiAXDHEUBnLt91tMQTc3uZYOte0rMQ==
X-Received: by 2002:a05:6e02:1d99:b0:3a7:8134:cf1 with SMTP id e9e14a558f8ab-3affc172f3bmr2867845ab.24.1734038211808;
        Thu, 12 Dec 2024 13:16:51 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2bc840d9fsm2399793173.86.2024.12.12.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:16:51 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-mlcommons-loadgen: update to version 5.0.0
Date: Thu, 12 Dec 2024 21:16:31 +0000
Message-Id: <20241212211631.3548096-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 21:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114303

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ns-loadgen_4.1.29.bb => python3-mlcommons-loadgen_5.0.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_4.1.29.bb => python3-mlcommons-loadgen_5.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.1.29.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.1.29.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.0.bb
index 93969c149..614f1be46 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.1.29.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.0.bb
@@ -15,8 +15,9 @@ DEPENDS = "python3-pybind11-native"
 inherit setuptools3 pypi
 
 PYPI_PACKAGE = "mlcommons_loadgen"
+UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "99d404bbaa6dc3106db608a1c28b6fdcb317b12994aac8a85d81a13bb644802a"
+SRC_URI[sha256sum] = "a90fc0a3775acbeea64b43251d3baa743228c44b3742eb99b4f927548b527328"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.34.1


