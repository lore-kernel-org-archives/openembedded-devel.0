Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7811CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:02:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.39124.1697205731767664313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 07:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=OoCYh0ar;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-405524e6769so13846805e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697205730; x=1697810530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46+Rh0tUROaTU3vZtpZWJecTNMj7NpvLPppggkFgjfo=;
        b=OoCYh0arucvyI4fRFm+pCxPf6l3z82F5rab34BOgZQF8tIuLnSoyzt/R8gNzZM+UHH
         QoQlzixkvO7Cv4ZMFQfMRAhoXSc6jZs7E71Hc0GWqK+I1AWrzJIYETpAMgD5IhFbyVt4
         oSGghIUrM3yHVh0NS00mV7f+1It7IWjVWujgoek0AzYoQlY9IJ/u65Y1u3V+C/VM0lN0
         WYDY59d7IVRkxIJTLezZFZOMccg60ro7nBSWRAOHZPLD8bDmh76/X59mChCsacS9hiY9
         4jRmwApXEJgpiMgqk5eodev9h0TvPzRrOteRBEXKaBsPwECvT8LkJiN277VTVUtQQT++
         dw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697205730; x=1697810530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46+Rh0tUROaTU3vZtpZWJecTNMj7NpvLPppggkFgjfo=;
        b=hcPGIbaP7Vud0ydwWqZtWM2PX8Gn18fHKU8ZzWRlFGDs+YqcESKJOldD+x91rrAw2s
         NqENaAGUkAvPVfCE7fcfjzmIWG9LY+w2CM0t1VnCtRImWgZntzMCPLmvqcU9I5r8OOqG
         MIpCXsyu42o69h5/7JDyDwUHHN3gx5g2sw0nzhS9WDWgz7e1DlfdSMjAlRoB2MEInKxX
         9fL5Mh84jozKLvnnCEYbrEmjyzcYKGcobPpTtCNkos0jeG6a5x9CWTyWR6flI+sAztFI
         Cp5iVzDYD6+BPjsZhrNtnmVIa6UiAz7FcYGdTrwftzpxV1n21yEKS/tmaDFwcx8zYCRw
         A96Q==
X-Gm-Message-State: AOJu0YxeA/5OuGRkTi4/4neJndcAM5gfNNZj1QzQMdGo1cjmCEGg/3gK
	vNdy3pr7FtVA5zn9qkHNBEsHZWx8sLEpVxvtoKA=
X-Google-Smtp-Source: AGHT+IHk9arcE8si2Ixs4CgF6uxvmZIWJqune9/WquokzklC8ffKmQnQLRfd2fBqC7j6jgXJHzxSkQ==
X-Received: by 2002:a05:600c:358e:b0:406:51a0:17ea with SMTP id p14-20020a05600c358e00b0040651a017eamr177687wmq.10.1697205729049;
        Fri, 13 Oct 2023 07:02:09 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e0021d4f13fbc3604e3.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:21d4:f13f:bc36:4e3])
        by smtp.gmail.com with ESMTPSA id m32-20020a05600c3b2000b004065d67c3c9sm224195wms.8.2023.10.13.07.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:02:08 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Dan McGregor <danismostlikely@gmail.com>
Subject: [meta-oe][PATCH] static-group-meta-oe : Fix nogroup value
Date: Fri, 13 Oct 2023 16:02:05 +0200
Message-Id: <20231013140205.2944335-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 14:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105468

nogroup value configured in static-group-meta-oe, used for
reproducible tests, was not consistent with value defined by
base-passwd in oe-core. Fix its value to 65534.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Dan McGregor <danismostlikely@gmail.com>
---
 meta-oe/files/static-group-meta-oe | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group-meta-oe
index 79c9bb6e1..9f2700e55 100644
--- a/meta-oe/files/static-group-meta-oe
+++ b/meta-oe/files/static-group-meta-oe
@@ -5,4 +5,5 @@ mysql:x:603:
 postgres:x:604:
 zabbix:x:605:
 mail:x:606:
-nogroup:x:607:
\ No newline at end of file
+nogroup:x:65534:
+
-- 
2.34.1


