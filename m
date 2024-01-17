Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34B9C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 08:26:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5118.1705479978300603262
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 00:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=xDkYxSgK;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e775695c6so23769415e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705479976; x=1706084776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMtwwEFKbWcFc5ji5BdaRqXhEj6OnUep9jkpjYrgMhw=;
        b=xDkYxSgK7Hfd3GHwq1RNP97EiGsB+FdsZ6+DM+PPmxQO/YSB8LvS7X4et0RaDI3gZ2
         rRIOfqAwnVJ+WmvRCBwOA5tPgWzfsvJNbHD6Nm/ZUWm4rZhOlepCoG59zZaeDEdsMN+f
         O3SZVdqEm3CHzT/+7xiTlNg2bWi6T2rPXlNp17WO2n9Q7nSlw+82hMgB7hMHN7gHa+uZ
         iNI3FkuyVtVdEQJrA8dPZ/8fk72A8Z6//o6lvKT2CPDTD+WJFDzFqfYG76Xd7pCm4PNH
         SLvWN74FhiJOUKGc8KmWXyZKiQeCZj63BDGa5lryH3+PENJVZqRmqrZVKz05HYTug+/X
         qhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705479976; x=1706084776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMtwwEFKbWcFc5ji5BdaRqXhEj6OnUep9jkpjYrgMhw=;
        b=APTy6B9LIN0PgFlmdWlI7nv1591lUjywlw/Feszetwoj08OOeKRD6tKiixtoackZV3
         uSrOqOGWGM5dSIEFa9bNtraIIDigOeDslWGqTwGqPLdKhGcamHvOS6Esu+2zxTLar/rs
         J4JxWSSf+CeqOfiqlFog317bGZ0uovGUqKyVdHxLguSq9VxLsEILi/fwiRRb05qEDN4H
         EBOAg135MmtldoM22d2Clu2GO+oeTxOwp7ZdXy65LyH1Hzg7/TcRIq6f7gSpgJVM62MI
         RykaGg7s+1ekMriWSaxebHHzkTWF2AH0Le3rtQsqlQzwEAzIuMFjFLN4QBCccTzgg8mr
         LGkg==
X-Gm-Message-State: AOJu0YyFQQTMJ4DMKjKxtsrARe1P5s9G04gXbLNJdk0PD8aqvyeHo2yT
	dFPkCR8imcVR/aToIEVVjUceVHZIYF0CoR4UVLiqN115Xv0BvhvA
X-Google-Smtp-Source: AGHT+IE++Z7Qhw8CwPvgyc92rcOyG+5SvXAFrUlM8K1NFcsfH/nGBy28g+qEON2tHlyVTXaeke9m+Q==
X-Received: by 2002:a05:600c:1e13:b0:40e:6933:4903 with SMTP id ay19-20020a05600c1e1300b0040e69334903mr4106972wmb.45.1705479976006;
        Wed, 17 Jan 2024 00:26:16 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040e4a7a7ca3sm21733799wmf.43.2024.01.17.00.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:26:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
Date: Wed, 17 Jan 2024 09:25:19 +0100
Message-Id: <20240117082519.3037503-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 08:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108324

Since the python3-coverage dependency has neither native nor nativesdk
BBCLASSEXTEND, remove these to avoid triggering warnings on universe
builds.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
CC: Richard Leitner <dev@g0hl1n.net>
This is related to this ML thread: https://lists.openembedded.org/g/openembedded-devel/topic/103499188#108305
---
 meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
index 3a68011f4..2591539ec 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
@@ -11,5 +11,3 @@ inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-coverage"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


