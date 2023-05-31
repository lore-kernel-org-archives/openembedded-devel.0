Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E98C7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9103.1685521515596542212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=RJYbnSrN;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so2957692f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521533; x=1688113533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va8cWgtsVZRX5LBvBEkhCONY2PCrQ+N9Ic1tcGGsSP4=;
        b=RJYbnSrNoB5gxdq0r1cjFKKnADYqfnFcPnz2M5MHbs1nV5HsdMUZ10J+g6sbe5HZvZ
         GHmLEwRPp/zcUkFusF6s1AQd00LGqpBm8Z8sZNgj/uqaAbM8bgDiIgVnh3zhIh+dCGrU
         J/PEJ4Xs02VZUToxAykXliu+Pq8ytXpmAnBMnphBmqeQzsIkqKlEN6XjvzmqnQA31+Yj
         LnqsnlD34RyaCR2tnVF2F3tEoU7+cP9PMJE3rbwV4hJWKJng89X9XFJdZ7JBumeO1tW4
         p0hFIUYYcbMthBptCpeVavipN+ovC4egnHO/hmWa0DyLAelZRHuQUXZv+T0SIQ5usoHf
         QqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521533; x=1688113533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va8cWgtsVZRX5LBvBEkhCONY2PCrQ+N9Ic1tcGGsSP4=;
        b=JEeTYKDQGT6jW9IfXNLdUQw5YdKq+Tnz4EA5tYLgRqT5ZKoNy7z7x+qoqOJbOKVRlG
         FdXaq5FQywuQxuwkE6NwPeiiYgiimHkXXERl5QDOoqU2Yp6zCToMbTPeZTUUnxsQFm98
         3MAczUpgfBX83vOyZfo0rbvilJBq/KCBqLplAxX68yNzg0HoV1Y0dCRVFnYv7+1PYQYR
         s5Vw8MwoAg3ZVJtZLWu6cU5pvG8LS9TfKnzbhPVpom6ZaJEqUnj+Ja/hhwrh+76sC+DK
         25TEu060dQJBgCU2q+/6POXTo62KL4DEA+Xsd+4kdHbrVeGDW+3riOuCfHlFXc9BhdRF
         uj+g==
X-Gm-Message-State: AC+VfDzJc9XUgOK3fOhJ8tLvpmIJv2Fs5bBElzQCWzutsw/Bb6Z4akdc
	9b3XkkGX53FbMPFH3qEKFWLXgX/okX1cTfXU890=
X-Google-Smtp-Source: ACHHUZ4imxF3Bz9gbLTc4j1QAWi6Zf9sakZ9xK8NxVGB0ojY/WiYU6A1lqPwwo8t+KP4BViRKgDfcg==
X-Received: by 2002:a5d:5150:0:b0:30a:8fcb:ec24 with SMTP id u16-20020a5d5150000000b0030a8fcbec24mr3221576wrt.1.1685521533206;
        Wed, 31 May 2023 01:25:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 025/149] python3-sdnotify: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:33 +0200
Message-Id: <20230531082437.10646-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102952

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
index dc1961ac3..ebf000135 100644
--- a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
@@ -17,3 +17,5 @@ SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c5
 SRC_URI += "file://0001-setup.py-switch-to-setuptools.patch"
 
 inherit setuptools3 pypi
+
+RDEPENDS:${PN} += "python3-io"
-- 
2.39.2


