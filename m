Return-Path: <indresharma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFDFD116F4
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:36:24 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.5528.1729834577698688667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPV+FIx3;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: indresharma@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso1067734a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 22:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729834577; x=1730439377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tFzxrzcFwv7yem5+h0WMJjI37W5ujGeejslfGcXOxEU=;
        b=XPV+FIx3gNpHgMQK1QAcCZLGljdjqy8CLGZu3rqQcE9jdw1A5HLYzrp+XasAyKDRZk
         bXiK6o/8Bf3GakOKkZcCCAztTnOjo8iE1U5ZJg8b474VI5v+JzbrpBy43m9HknwJryW+
         4H4SNthO6M27eKEt5enG9FDjvLEP/4+QmzSGE/8tpyyg+seH/wdeXaV5QlbSAfdkZp5a
         ceqcsg+kQf9eoFhpImgHHR+IwlQ9KAWuezquJEf2NedltKSPih0Mm1FdNDCJ3ZHrzNe3
         NmWL2+mnwo9Lw/vAZqYjudoZod2PZp00TpMTNoGHFIvWzHqOA6A9zbjNkaQlepwvfP0+
         BZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729834577; x=1730439377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFzxrzcFwv7yem5+h0WMJjI37W5ujGeejslfGcXOxEU=;
        b=KMbL8yqwiS3ol/XbxrVkhqu5t9ikpEKh5S3ihi+v0fImIX4M09ATtkF1bQFcdTT99h
         sbY2wQcU7p39OCwhpIfncG3j9bH/gh6XLx7ts92PHgMdAWH2bDKb7K+lRVTCCy3U11kP
         lxTCHDbeJUDkL9fkb4OPtgl9GpxRE6rcNPX6VAgLN5KIpoDobtKUGChRkNEyWm/DnKBE
         pOhpBpuQHX7w7Z75BtldryNGjwwlrgzcDj95nnP5pZILBDliixkhur5ZtZ3f0oupJXBN
         RJKN986cV7ntSxO1bt9pwpaBZKBhEUjpwLkqc7aXhm7lgUMZHa0gu2fUzmXP3qPGdU+W
         COtg==
X-Gm-Message-State: AOJu0YyOm3BOME+qRYQj5/cgiH4jz//dDnJ7uXziBL4gx04hlca12Cm6
	UscTLnugbhovQfc3j3MgA+KGkaXI5a7GzS/kM7arhuZDqgRm/QTWbATLJQ7j
X-Google-Smtp-Source: AGHT+IH70I83XE53mxb5gsGY4X/RW7/VPNtvaiKIos/JwrjpUOlgtdM5uxmjYU+SJJdFNtTeNp/FRg==
X-Received: by 2002:a05:6a21:178a:b0:1d5:2767:9d08 with SMTP id adf61e73a8af0-1d978bae437mr9786788637.39.1729834576813;
        Thu, 24 Oct 2024 22:36:16 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:db3c:64b8:b715:3809:afab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3c024sm324747b3a.192.2024.10.24.22.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 22:36:16 -0700 (PDT)
From: "indresh.sharma" <indresharma@gmail.com>
X-Google-Original-From: "indresh.sharma" <indresh@timesys.com>
To: openembedded-devel@lists.openembedded.org
Cc: "indresh.sharma" <indresh@timesys.com>
Subject: [meta-python][dunfell][PATCH] python3-aiohttp: Set CVE_PRODUCT
Date: Fri, 25 Oct 2024 11:06:05 +0530
Message-Id: <20241025053605.554848-1-indresh@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 05:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113224

aiohttp is used in NVD for CVE's like:
https://nvd.nist.gov/vuln/detail/CVE-2024-23829

Signed-off-by: indresh.sharma <indresh@timesys.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
index 24eb021de..2caf841f8 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-yarl \
 "
+
+CVE_PRODUCT = "aiohttp"
-- 
2.25.1


