Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9D6C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9063.1685521541186902057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=5r8nuxpT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so40245845e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521539; x=1688113539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPBbSYLfZ2JRdLmZONnDbYElUHFVmJa7pilHOSCxN4w=;
        b=5r8nuxpTMz6Un3NUrE+23MqszfAyOw5ipBYxgFufGTpgwBelNkMDsXgItjxnnflCdj
         NVkZvnyXkbxHq309OxB39i824dZScEHSeQjLY/qIElrH+9kc7xue5uQWqN/S/TC5InSz
         fwbQxehLGlbLaohSRNcxu3CugkrURWiyBTvK0LSoj/CKNw6rbDyMD4gJGk4ILUWGjh9d
         V4Itkmx+GShUA12CWUk6fO1B8vwcBy4Jt9+MSeHta57OKWZQwaL6GPYkD3bTtxc2/QoO
         i9Gw/YZeDYVexiL0QGRTwPW1Ql0RSPtIuyaVL1KULvxLgbWaQb0GMRU6ksOrWNf4bAX5
         gNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521539; x=1688113539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPBbSYLfZ2JRdLmZONnDbYElUHFVmJa7pilHOSCxN4w=;
        b=Q8R3h7HsVDfpK7xlEQwCE243/bt20ykFy0FIf091+tYl2N8JltoMOS6zoXFpFCy50X
         fTeo1yOpIo/Cypy2DVOfd1GWqcjV3TdGrfLeX6CBiava66xAjd8kYWgPg+ogzTJSqWvM
         wNuQ/WpLr0rO3TajoBC/Z8qeb4Z6DbiNGnXCN9WjHNEFtxDjv6W9NyrP40iWwl4qDkrN
         4oRTrH/pjW5plIxZqAPNWYHcV7VFqYAHv/pZlSPhxAWY15TbtQ2emJPiLBYnQYQsGFju
         K+XZid1drSHncBRWrQAIP0k8eq7rigtvSh869JQTalxUlapwIcfiA1OfdouZTPpSddgi
         12Mw==
X-Gm-Message-State: AC+VfDxd5o3Cb5QivYhRT2a3JTukyu1J0QHpmIe4VsLX9p07hqAsxyAm
	SmpgHqkc3pxSc4Z4fDZfDi4Ngw==
X-Google-Smtp-Source: ACHHUZ7pD3KkFALsgZvPyR2PRawDEnGKkK4+nzyRJJMGDu7byFRwvCwcPALSUczrraI7zBlKKe5LUg==
X-Received: by 2002:a05:6000:136f:b0:309:4e85:897e with SMTP id q15-20020a056000136f00b003094e85897emr3060472wrz.17.1685521539751;
        Wed, 31 May 2023 01:25:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 031/149] python3-stack-data: fix coding style
Date: Wed, 31 May 2023 10:22:39 +0200
Message-Id: <20230531082437.10646-32-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102958

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use 4 spaces instead of tabs and order RDEPENDS alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-stack-data_0.6.2.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
index 4d62471ed..f341cbfb4 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
@@ -11,7 +11,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815"
 
 RDEPENDS:${PN} = " \
-	python3-executing \
-	python3-asttokens \
-	python3-pure-eval \
+    python3-asttokens \
+    python3-executing \
+    python3-pure-eval \
 "
-- 
2.39.2


