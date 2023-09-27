Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998AAE7F14F
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:37:25 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.812.1695850641181122395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-658967a5334so69824006d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 14:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695850640; x=1696455440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUZ8S3tZAn3uLHDp//XncyEkkGifOYGudOhOaqByZhY=;
        b=Ed6uKQRxhOXzUHpLvoE3Ex61AoBVeSLSaB4kvK7TeIneKNrGpL53KZUqGGeKbiueZC
         TFi8QFd2piKDLWWWufA7Q34E/XxWr956qKkVCUVLNg4Rt2aFmVuZDt+EH8F+oz7AtT90
         eiZF6A8pw1al4s4XbmVfBQSmXqgHoJ7o57sUlw5pE/vC0+tTFqH30gHy0TcXCGvLPKNI
         uyhUydtnY7ffyC4zdCHYJ+iG84B6RLdcBCl99x7UklvtHSXSuDs+FVfO+rHT27RkabMz
         dfrhXjlZnASInxfwYN5a1dEFmn4tipq4vFNJBOy3i+qO5po+Q2IXRK5DmbVwGmnD9bMU
         ZlOg==
X-Gm-Message-State: AOJu0YwRQnTBL4q3JxH6+vIW3hECPvl9quTI1RBlU7jK0NwY6t6G0xRH
	jMPpO/G143hd9fXH7+jfh5nKqHIxx1OzAw==
X-Google-Smtp-Source: AGHT+IFOea4pjiCsDi86sEGlJREYpzdepezpdjlqwIneKtNDz++QIneP6imhEZS5ap+o0+p6AffVbQ==
X-Received: by 2002:a0c:e44f:0:b0:647:2f8f:8c29 with SMTP id d15-20020a0ce44f000000b006472f8f8c29mr3080977qvm.48.1695850639859;
        Wed, 27 Sep 2023 14:37:19 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id w9-20020a0cb549000000b0065d0b9bf316sm53735qvd.79.2023.09.27.14.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 14:37:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 2/2] python3-tzlocal: Remove dependency on pytz_deprecation_shim removed in release 5.0
Date: Wed, 27 Sep 2023 21:36:13 +0000
Message-Id: <20230927213613.1721447-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927213613.1721447-1-derek@asterius.io>
References: <20230927213613.1721447-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 21:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105213

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
index a59fd9364..9673c5d0e 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
@@ -10,5 +10,4 @@ inherit pypi python_setuptools_build_meta
 RDEPENDS:${PN} += " \
     python3-datetime \
     python3-logging \
-    python3-pytz-deprecation-shim \
 "
-- 
2.34.1


