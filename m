Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED78C47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 16:50:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.17812.1705596634374129156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 08:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=DiBMrmaD;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e8801221cso19369045e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 08:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705596632; x=1706201432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMd37t7wHzYTKNbpFiYc3kOeNQpEdjPK+xGLBVM1m/Q=;
        b=DiBMrmaDEcDOnNhPDeCkp9Nxo3Ajf/gGQT2Zc2WbGmh1KTsICjSMDtlxUyHoMzCnU2
         Abk8SfPshct/fe2hLx5hzYEzNLyUkeJQdEx3+8yNY/xIOWAkzRj0Tws0sp/bmW9ycjji
         oRZ/ZNuNZLN5eLAsV00gwfkNAb9F+DkijoNx3j8n6/raMANsQ4yebuwFRabILBMw8cYt
         6X+6ZOkKDcwNuPRBwVnY+60Pq6SOaoBl4Y0r0iDkDiRTGIF8QsGZHbr8aSLAhQzLfxY0
         gaWvklYHlFJuxsvJCvGQwTy8DfdPau3OO71BWgxlLxMP/virYbWon+qORugaavFFqLys
         wnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596632; x=1706201432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMd37t7wHzYTKNbpFiYc3kOeNQpEdjPK+xGLBVM1m/Q=;
        b=Ak3qgztTlxz02IqgP54lt2DlyAs9eUsso8b+M/Q1+1J9R6ZIN42QiXl+Rcoff+FbE9
         7FjAe6ffDO5MMtXZmxrT6iItiIFj5YuaK44Awc8jQHIPTPBWDnHEGxV1y03aBXU5IeUw
         IL3QPqWQFdvPSwDla+l8Mx7QOGY35mGRi9L5uSREaprtBdUxAyElVvTzmVE1S0I7QSg2
         UGMpnxy1xU2/YVN17Oa+G0b4D1Iz4oYIGjjlztknVo20NieGQGh8K5nDPe5UYOgKipek
         uUIWAq6jP7qzpwA4WA9/Px3IF+7Gx2NhALydEBlMgC1aUW+bTC/VcMXxV4xFazkkRfAX
         k6tw==
X-Gm-Message-State: AOJu0YxK7xGyY82NpQWDTHuvfRw2injLc1JImA5g25oy4xM2utZihlCw
	JwCIVDrYIQLDRTS1ARQgDmAFcbZwhLPrnqE8klO2aAUId3vZ1Sh3BqUsVypI4goAppzf/IPEclI
	wdR8=
X-Google-Smtp-Source: AGHT+IFlt6ntPRKSTwZI3MlAq/SO3i3EZp6Xa52f9Jmi5WDBhCLWERf6FypT/+Gk9aSWspCaStcOug==
X-Received: by 2002:a05:600c:6a0e:b0:40e:5e30:212d with SMTP id jj14-20020a05600c6a0e00b0040e5e30212dmr783429wmb.30.1705596632368;
        Thu, 18 Jan 2024 08:50:32 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c501200b0040e77ce8768sm14435012wmr.16.2024.01.18.08.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 08:50:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 1/2] python3-coverage: add native and nativesdk BBCLASSEXTEND
Date: Thu, 18 Jan 2024 17:49:58 +0100
Message-Id: <20240118164959.2797172-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 16:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108346

To build python3-pytest-cov-native we need python3-coverage-native.
To build nativesdk-python3-pytest-cov we need nativesdk-python3-coverage.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

---
Tested in native and nativesdk environnement:
"pytest --cov" does exist and start.
---
 meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
index cb1041c2f..30922697a 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
     python3-tomllib \
     python3-xml \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


