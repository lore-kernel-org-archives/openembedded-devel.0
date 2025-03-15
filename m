Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600F9C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 23:15:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.20224.1742080511453004619
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 16:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EHuOW0Gu;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso5561515e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 16:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742080509; x=1742685309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcruI2qDlGwCfXtVFR83ziP5MV1Hptm1UCN2IawLjHM=;
        b=EHuOW0GuuCBFFI7LS8N80OHCte6wEOFge6Q/tfA6SfLBRz0RsnDGpdd4qba4L3GaDa
         Ts6rJBp49eCas2R2deG/NY4SJdRbERybgy8raUYy/WmB9+LOl4k5oq2RJZdgWGMWTnPA
         /x3E70REcrIelqPPDVAVY/kXoUXHB3HSox1GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742080509; x=1742685309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcruI2qDlGwCfXtVFR83ziP5MV1Hptm1UCN2IawLjHM=;
        b=MlxS3T99fHCBGSOIHUMNrQMCH1zxIgp+bYCRjQSymc8v9aiGnN3XgREI+KdtpNKJjF
         Bf1P7ztFyAMGP1k+Ss3oMym0w8Um1kW2uSAnFo0uW/qFTR2FTFAobCIpS0ycze5fqPDI
         E323IdCU9TiG3fHwT/dwY/xvoa+tddZGhmP0nzeiKUTki7VWz8nfd8tf81D88Mew2Y6P
         B1GBZesZpy9puNW3K0Dzpgk38TaOReL8EgYuOm2iySanUYjftE+JGQonIaEhyi72nnvf
         d2LvOnnrn4raR2dd0aiiz1frvTiSVRnBEzRTZp5hOPCrIHUH+nHi2ZHdpm7DQ7JO6T51
         oVrg==
X-Gm-Message-State: AOJu0YyUDiFNI4O7XQN/pUfvCR3753ZaoUXo3mSi1QAieyHBcarbDQ55
	jklf7tqPITy6VFE1wXm4zvu5lZI4i2kEopuX1QvTMu7XLfk5lgQTthRBPhbIW9VSj5j4yRJImZY
	e
X-Gm-Gg: ASbGnctJe5lcY1xziTwb7jUqpkQvyoF28WGXDPsCu7dWjBxdAatDJWI5MK7KA8UFS0g
	LUCbVO0eJNcJBMFgkfZoaSw/Lr3RvDi6HXSHF431femboa2v8AIv1hUbhTCoDz7sdEQGQ5NGrRJ
	ahpndH3UjKcSYL9uQ0xaLFfigPDlmAVPq4BK8u0xF5uMaRBxhePxOtoVNNgB8e8MFqTAcoYYInb
	cw8wY455TbHvWw/Xf/gdMhKiAsdBXfrPsfIiOvCjV5V/d8gyV2aJ+EcGMrr4zfuTBuzNyuT8CWm
	U//g8+R0tJuBoYdUghh8cLIm41Th6FhQGGheHCN4hQ+bBvsWJ6gryugWQ6GG6yFiNt3kyNqG0Gk
	fp5C652r+NZ5jhx5Py7s+YXXL3a8uIlcy3gwUMxMtaOITSBw8e5I=
X-Google-Smtp-Source: AGHT+IFZWO6bAYN5MCVD+h+vz7Cw3mMH8dcHE5/cndwIKmvsJm57vBXPd0VeSDGDe3QXvtkNg94A7A==
X-Received: by 2002:a05:600c:4447:b0:43c:eea9:f45a with SMTP id 5b1f17b1804b1-43d1ec646demr85344435e9.4.1742080509201;
        Sat, 15 Mar 2025 16:15:09 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c23ffsm10145716f8f.22.2025.03.15.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 16:15:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] libgpiod: Add gpio-manager/gpio to static IDs
Date: Sun, 16 Mar 2025 00:14:58 +0100
Message-Id: <20250315231458.2865189-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 23:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115998

From: Yoann Congal <yoann.congal@smile.fr>

In commit 9626e8a2c8f2 ("libgpiod: update to v2.2"), "gpio-manager" user
and "gpio" group were added, add them to the static ID lists for the
reproducibility test.

Fixes this error from AB[0]:
2025-03-15 10:40:07,437 - oe-selftest - INFO -       ERROR: Nothing RPROVIDES 'libgpiod-gpiosim' (but /srv/pokybuild/yocto-worker/reproducible-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb RDEPENDS on or otherwise requires it)
2025-03-15 10:40:07,437 - oe-selftest - INFO -       libgpiod RPROVIDES libgpiod-gpiosim but was skipped: Recipe libgpiod, package libgpiod-manager: system username "gpio-manager" does not have a static ID defined. Add gpio-manager to one of these files: /srv/pokybuild/yocto-worker/reproducible-meta-oe/build/build/build-st-meta-python/build-st/meta-selftest/files/static-passwd /srv/pokybuild/yocto-worker/reproducible-meta-oe/build/meta-openembedded/meta-oe/files/static-passwd-meta-oe

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/36/steps/40/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/files/static-group-meta-oe  | 1 +
 meta-oe/files/static-passwd-meta-oe | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group-meta-oe
index 543c893c00..17ca545d10 100644
--- a/meta-oe/files/static-group-meta-oe
+++ b/meta-oe/files/static-group-meta-oe
@@ -6,4 +6,5 @@ postgres:x:28:
 zabbix:x:605:
 mail:x:606:
 influxdb:x:622:
+gpio:x:624:
 nogroup:x:65534:
diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-passwd-meta-oe
index daf686b930..1aba2e8d62 100644
--- a/meta-oe/files/static-passwd-meta-oe
+++ b/meta-oe/files/static-passwd-meta-oe
@@ -9,3 +9,4 @@ pcp:x:620:nogroup::/:/bin/nologin
 pcpqa:x:621:nogroup::/:/bin/nologin
 influxdb:x:622:influxdb::/var/lib/influxdb:/bin/nologin
 mongodb:x:623:nogroup::/:/bin/nologin
+gpio-manager:x:624:gpio::/:/bin/nologin

