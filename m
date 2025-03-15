Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81974C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 23:37:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.20504.1742081841685230613
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 16:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vQWFgyh7;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913b539aabso2076392f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742081839; x=1742686639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ny3df9GGHPu3GDVcVNx8G7RcnsyR8CLP4miu4ddyA+4=;
        b=vQWFgyh7tISurtakj7+s5YTQBRrg5JAVQKCIQO9B1wAr03P5z7EU05a4JHpPjZv5vJ
         il3I6swTKE9FU1tn/r/bJJfD2Ux2xEF7FHpfo4K2YEamyGgAOSFwCZKBqEOguVB4Nq17
         7chI8+N3LXiQFPo+RhGT/Jvzx7PbtuTYDePKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742081839; x=1742686639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny3df9GGHPu3GDVcVNx8G7RcnsyR8CLP4miu4ddyA+4=;
        b=rnl7kLQdotVFSxtw+1heLcwdJDGmvdrU/ri880PSze94QBTXEGqS26LrnkAB5iocUa
         0osJLroEQDxcqXPuEGgEZABRzc6yOB1U5RiGEH6pIsQvwaqr0/KzOvTV55uBsELVc7Yh
         PVqSdsNwcfEmjjpYy1CaurQznpNq0AM6oX5ilMFmSDQVILlEXVTE6eV/qFftRk/DhUqD
         Pke41jN312rRyoeVbHD8gY6mDboRbZt9SIau/FPH+Ea2WY8PLsIuSy3ymBKwtMjvtziM
         pUzxfjh0jyYifXT60fzo/O5wZrrNWE48Uswuk5iWuB/xwOG2mmsBbIKCQX/PYGHNFRNM
         9WhA==
X-Gm-Message-State: AOJu0YwU3MKv392OuPY3svjfrngVES4B1HQlgsbF4uqP4W7a6b8Ehtho
	dfZdMhDx7MCMibg+01olLs0Spiyk4O0MW7CojO9dEMV06O6jmiArw9WacMWn9rky7eJpl+1yJI1
	W
X-Gm-Gg: ASbGncsYjjMU1ivGlv52DY7ED4fKOpJXjs9NnlGHED5Q/bQ/+MJ3FKGDcyNOzU8HRPE
	QTd8JdmA7AV4bSBU6wvCspV532uKeUj8Lu5vQOvMXjJUErKfAP99ZQZECOCeIQzxQiEZLnx/fOm
	kWcvEKJXmsQpJ1wU1C5zJwS8P6dclUjbfq35Q1phSqv9Im1/6q7gKHBaS5ShcxJF0ydvepWy0Fi
	F7ohFrmsJ07e1tTDXCUZbg6pcEs4Z0CLPVVc/k5trB2s+VWa4A35Re+apTccpG99PjZG5QLZbQD
	qmhorZieel8i6xAEPZEDI92kd33sDv8jLHk/YUz7mUB2p3yMZVPiKRYuF0Mk4WQ+0w6uzYlWx6B
	BwCGiaiWWue2sx8Nzuax3DQ0AmNYY4zuTczycJRcFMk4PuTKMM6Q=
X-Google-Smtp-Source: AGHT+IHLQ1BzvznVdIP5cBJFeMw3AiWGlaxyqhjbOVffyagxxCmiUMYBziKPtjLSw7HrMYzG6Aq3DQ==
X-Received: by 2002:a5d:5f47:0:b0:391:2e0f:efec with SMTP id ffacd0b85a97d-3971ddd6136mr10273291f8f.7.1742081839483;
        Sat, 15 Mar 2025 16:37:19 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b90sm10583177f8f.53.2025.03.15.16.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 16:37:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] reproducbility: Mark phytool{,-dbg} as known non-reproducible
Date: Sun, 16 Mar 2025 00:36:46 +0100
Message-Id: <20250315233645.2871272-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 23:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115999

From: Yoann Congal <yoann.congal@smile.fr>

From AB run:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/36/steps/28/logs/stdio

Diffoscope output is at:
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-networking/oe-reproducible-20250315-xxydi74w/packages/diff-html/

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/conf/include/non-repro-meta-networking.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index 139ff40b99..16240df059 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -28,6 +28,8 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     ntpsec-src \
     openl2tp \
     opensaf \
+    phytool \
+    phytool-dbg \
     postfix-cfg \
     rp-pppoe \
     traceroute \

