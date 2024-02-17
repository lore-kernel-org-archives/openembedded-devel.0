Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA29C48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 23:54:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9194.1708214087466491153
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 15:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=eKJPr6Kx;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so26084425e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 15:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708214085; x=1708818885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBTpAQSBOJk8cVE0EhWDlIbu78fjRy+UVTv/kG32hWU=;
        b=eKJPr6KxXdyxlp34EEgyK++clP5PzhDYZgNDVSvkVG8y7EsUy8jSwyolUXNdTnmmh6
         gMqSvTKUzzU6B7mXBYLXp8wcLRjW0Dz9iNboWeT9O2saFqoblv9hYVndA6M0bO01c8kn
         srElKzqqQmXtUdkVT4+1wohj4A4ekfN9rfjM4UNpRpEpU9ddwmZ/5zbVG0KrZEC3RxQ3
         FDTEX2KUMtQyPqtksuXI0cC+nvHfzDj8Zvth1zzvYyzf0EgH74EAVOZ7fyv9yTcA1Hok
         Ovbt2hSR/85bJGoc1M72h22wOrZ930a3VT9Ib6hHOccGOUhkMNe0WBjVDQ8ARhQ4Hyn2
         fPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708214085; x=1708818885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBTpAQSBOJk8cVE0EhWDlIbu78fjRy+UVTv/kG32hWU=;
        b=g+hGeAmPgZC9TfId1ZQjEqKlNzQG8x8t28VqS3o9a0y9Qm0xallMN2om+kU/BL4WBy
         EWWeqdo2iFvN6rhODxJMm/dUY4rXPUiessw+t4xvVQuCEkJ3VNSoALu+o4Obv0sX8wbq
         d1jiXCRfrG12cFdIASRkub6oPUfJ7iLeN9LGrQdYl062g9yrrxZ1hiNV9guR/xCqQj6t
         tg9WYxQ6D18+zq7zARVAV3w/3lFEu+BhJWPYx/ESrIWvvaRSAw7SrZ/U2ENdwF5AckFG
         EANvpqcuq0Z9QUCP++H+YyUJZLPA9AE+zw5DSRhpvX0o2gdi/B+8VbY5qSBexshkKmN0
         kt2g==
X-Gm-Message-State: AOJu0Yzy34W3VO/DioQS0/w4+2I7mCylOK+eVN6UKpIlYt/MxFSqSP+t
	c5ZYN5kiLmCkrVTxWGmXQXn+c/+2CNjSl8/0IFWLMv9DsLdgXTMHoEeguS36HNO2sKwoj6IuE85
	XJmo=
X-Google-Smtp-Source: AGHT+IGIEOdyHAqbkMxpVjmoH30pWBLIKRlgsU9VE+NI8cssp2ganGhLlFuyqqDfA/8wWzsv9FxY/g==
X-Received: by 2002:adf:f60d:0:b0:33d:27cf:6208 with SMTP id t13-20020adff60d000000b0033d27cf6208mr2179529wrp.7.1708214085059;
        Sat, 17 Feb 2024 15:54:45 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb058e286b009d8a6db98b186dac.ipv6.abo.wanadoo.fr. [2a01:cb05:8e28:6b00:9d8a:6db9:8b18:6dac])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c378100b004125f34fd7csm1817628wmr.31.2024.02.17.15.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 15:54:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/2] influxdb: Add missing group to static id
Date: Sun, 18 Feb 2024 00:54:24 +0100
Message-Id: <20240217235424.1091544-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240217235424.1091544-1-yoann.congal@smile.fr>
References: <20240217235424.1091544-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 23:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108837

The influxdb group is used by the influxdb recipe and created by default
by the useradd command.

Also, align static passwd file to the USERADD_PARAM in the influxdb
recipe and add the missing newline at end of file.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/files/static-group-meta-oe  | 1 +
 meta-oe/files/static-passwd-meta-oe | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group-meta-oe
index f20c86f65..543c893c0 100644
--- a/meta-oe/files/static-group-meta-oe
+++ b/meta-oe/files/static-group-meta-oe
@@ -5,4 +5,5 @@ mysql:x:603:
 postgres:x:28:
 zabbix:x:605:
 mail:x:606:
+influxdb:x:622:
 nogroup:x:65534:
diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-passwd-meta-oe
index 00f3e107e..daf686b93 100644
--- a/meta-oe/files/static-passwd-meta-oe
+++ b/meta-oe/files/static-passwd-meta-oe
@@ -7,5 +7,5 @@ zabbix:x:605:605::/:/bin/nologin
 cyrus:x:606:nogroup::/:/bin/nologin
 pcp:x:620:nogroup::/:/bin/nologin
 pcpqa:x:621:nogroup::/:/bin/nologin
-influxdb:x:622:nogroup::/:/bin/nologin
-mongodb:x:623:nogroup::/:/bin/nologin
\ No newline at end of file
+influxdb:x:622:influxdb::/var/lib/influxdb:/bin/nologin
+mongodb:x:623:nogroup::/:/bin/nologin
-- 
2.39.2


