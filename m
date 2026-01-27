Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083FBD19515
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 11:19:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8547.1769512745934334965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 03:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aOBEpMC/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so47407715e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769512744; x=1770117544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7UjErVu/n6ZbJ2/CSgvYIszSKWZj1yDsrMm7Euo2iek=;
        b=aOBEpMC/pzdzKLZFnYTjFdzz60Nf1GIY3LaJ+8FnN+54ZBRzsEQHOzTG9rpAJ4Wuw+
         5GI7Z/ZtRkiZd9g+YRbCyV3vA6uoURmGvkZF6f4q0uVFZJ1esEFyI2l4hbzoFr5R5uht
         Cc4WTbuSjyjcslUjvwTP/2Xr/6sd5mJYISTvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512744; x=1770117544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UjErVu/n6ZbJ2/CSgvYIszSKWZj1yDsrMm7Euo2iek=;
        b=t+eIM0q+YM1Rr9BtAo9LHBfrMI0Catx8orlljluPxDm+OYbVr3NnacSNgVOoT8NJ/G
         dTqYiHpFRDi2cAfDqy5aoK5r6KB/Wvf5k+A25+pjatDhQ7hvc0MEeYdKoKpczHrUf5Wr
         5hinWANQL3qlimMJRaa0IC85grnAiM2G+RIlZmiceNkEcvXEuzZuWyffdnOr0BT/GR10
         v/5HXWceoSItdEZgvsT98pIvoawzaR8zKFuaky2kQfzNWhSe+Zohpb8LqPwebQ+w4dEG
         PsYCXY1VBataZ4eueHx8/RHikV+tT0k3+WQoH2phLJMe0iEfrc8ORXoZV4brYsC+k37E
         jTsw==
X-Gm-Message-State: AOJu0YzzgTOa6cWZLC4g51QsMev95hwf0hvdjQxtSUW+XWdE24XIL6q7
	UVizprcpVyIrFxttF2vut0VHmsXwg20gzvqIPXZNhACVHfuqNEKnehzazvot1/DLjFFzcl1Jsvt
	0m1/m
X-Gm-Gg: AZuq6aKdhvvuJW19WbbtmihVz7EVvkqGOMdq4Ux/F9xbV6FqA1odAorYJ9R6SyEt8yE
	VU3UDJdfNPzXm037FrmpXhIT0H6S20kov76DIB47b9eMgs2GXkAreff8CBmpCRT3Q2XLgnIzcI1
	w22FjGXiN9++n+IcYCY/mhiCQUzsbXq09kBWbMCh9Dw2eHjbuSRbhaAjjSGFOON46c8LhD6UFLh
	PPdmmWUpIvEHG1Ex1pZSOnWO2qEl0YsIdDGIX2geMT/SBdKpczMiTe0i7DcA/MQ7mc3mD5uO+qI
	84k6S8Ib88+quTbdZbsGbqn0xSaSBi2sQ4NZIXospUw/fpga2Fr735SHTduiZHkCcL64JSj4zSW
	VmFTsfjYfLRBMAaNNCm6g/2qDz6BBAkmBw/bIRseXg7YdW8fvW6yrZyXx8kRwqC4beaTDS9un8U
	S+hHvdT3WGPBJtrkvgNpe2gfp6
X-Received: by 2002:a05:600c:3508:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-48069e33c08mr15490245e9.7.1769512743751;
        Tue, 27 Jan 2026 03:19:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm58189925e9.6.2026.01.27.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:19:03 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-jmespath: Upgrade 1.0.1 -> 1.1.0
Date: Tue, 27 Jan 2026 13:18:59 +0200
Message-ID: <20260127111900.3683454-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123938

Upgrade to release 1.1.0:

- Fix concurrency issue with cache
- Added support for Python 3.12-3.14
- Removed support for Python 3.7-3.8

License-Update: Use file LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jmespath_1.0.1.bb => python3-jmespath_1.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jmespath_1.0.1.bb => python3-jmespath_1.1.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-jmespath_1.0.1.bb b/meta-python/recipes-devtools/python/python3-jmespath_1.1.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-jmespath_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-jmespath_1.1.0.bb
index 73f5f4d025..5d03382e69 100644
--- a/meta-python/recipes-devtools/python/python3-jmespath_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jmespath_1.1.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "JMESPath (pronounced 'james path') allows you to declaratively specif
 HOMEPAGE = "https://pypi.org/project/jmespath/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2683790f5fabb41a3f75b70558799eb4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03b6f09850fb409684cafac03f85aff1"
 
-SRC_URI[sha256sum] = "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
+SRC_URI[sha256sum] = "472c87d80f36026ae83c6ddd0f1d05d4e510134ed462851fd5f754c8c3cbb88d"
 
 inherit pypi setuptools3
 
-- 
2.47.3


