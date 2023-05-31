Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FC3C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9057.1685521527357877125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=0gNtbuHc;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso3928663f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521526; x=1688113526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykHcPsoKpr0tBpv1g4y5xZD5iUKjKYBw5INt4MBYz28=;
        b=0gNtbuHcbZr6UnyNclgRmElxCwgMISg3oTsIM39fSQjrZ5tNGlAi+0oTFA41wPdlwS
         w+iWUhpCBOr6SMq7wjQexO3i0Jmfol5WHMs6suho6aEeZfpbCdHM7LtAm1Jb/Dv+lILY
         1Zfc4SBGbtIukw+TfSJDrzz8R2rmqKjjPUsdZaDlcigXDsqUWTPHWedYtXMxHCNYabsG
         U7DGm5pUzxYDbgkDK579Ml5lxOfElc/sHHwIiT9yvBnd8mbGjX7NnXf+Ksb27n+aQL8J
         oVdxMZG2zHvrV/XCifCYYoEoDeuHo8cdoJiOKctqygyuagQdJvOeQnE0LIPeiX78y27J
         jkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521526; x=1688113526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykHcPsoKpr0tBpv1g4y5xZD5iUKjKYBw5INt4MBYz28=;
        b=l57curw36unY9KlVDWGDG6PnIEP8fns7j9enVwPvkPYW71NBFxC83d9CLjUkzqzoPh
         TyQfQD+GAC84dEjfDsNfFw/ju9BeThCDxB3yNIy4iQsxKnSI002Ghmk1iOauT8L38oXR
         hrOHwnDHcZOgU+NwpxECTf8alG8ioruj/sL2jnqk9HiSfdhjViH/CrlL/KWjF8U+T7kK
         L0aWCZqoRNHM4bBdvM7WWixrjvTjAocthXoLNC5Hz3Ywq2rso18bBXNiRe9xkemKu+id
         stSOcOk6Ay6P8Ok2fy/IlTCd7yI/1XjV5C7T4n+LbLsLVL//DP0VxEb7AxnC81946Qap
         eVbA==
X-Gm-Message-State: AC+VfDykC0jbwhcq0PbMXgkSyOB5ZhDc+/ek1DuGIqAFk826K2WMctAT
	P02WcbnqygXupL3S8yOc1vBQahlWBD0DSR69OrQ=
X-Google-Smtp-Source: ACHHUZ6wSCSBbBI44vR9+embGwKTLJFZmErW50uzwmw9oWPbclKp4cD/Ip9shmwCn9UwRrfQqhlmOg==
X-Received: by 2002:a5d:6148:0:b0:306:37ac:ef8e with SMTP id y8-20020a5d6148000000b0030637acef8emr3523171wrt.56.1685521525880;
        Wed, 31 May 2023 01:25:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 018/149] python3-mpmath: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:26 +0200
Message-Id: <20230531082437.10646-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102945

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
index 4ac9e2192..01dd8bfb4 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] = "7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a
 inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-image"
+RDEPENDS:${PN} += " \
+    python3-image \
+    python3-math \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


