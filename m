Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463B9C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:33:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.32907.1741772020631615001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 02:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m1VnVcAU;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so55080905e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 02:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741772018; x=1742376818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewlTm0WRq1dDYQojkFVUFZP52Zy47AnlzO7zUKawJKI=;
        b=m1VnVcAUO8fAyjaWwaM1PJ6PS9iKH1Ac3F+DwTp4oJAaOjVzI62aV5Gxd+d20ByIFe
         5jtqZF2sua6oqtCnJtKqAimLcvIeBWFye1RMNZ1ZOLKZCt7A1P9rwTfD8KaEES0g8kgb
         U55fS7U5p0Zc/hWHTd1JZQ7sGBjA3bSRma6D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741772018; x=1742376818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewlTm0WRq1dDYQojkFVUFZP52Zy47AnlzO7zUKawJKI=;
        b=jHPcZ1SAZ1hcYUphmRZnwXYxKxt7gJFehdAH1g0OBdFVG65Rq0OpjXf5A3WXPfECwi
         lQZ2RQkVCK+tpygqZG405DbU7etUXXphRv8dWtUvh8B5l59ZyYuYep2D/fC2bkVDpf/w
         mbEbp13LJLQY9Kw5EFUGX/3sIPpusNISrqzV4Jw9k4VWECuT6UteiKVD/5LQabLvxVBv
         yqq1BPnfFIv8oKQDyxIPiSOiYNPWPmzoFpwS0xoVe37/8hkHjronMiM9Uw06U/Ew3Nx8
         wIagF0mhXJmu7PenMWn8rBWTj/D1cn3pBnMg4DwKgFxdW6nYp474n5TNG9mMVFofioAj
         7tZQ==
X-Gm-Message-State: AOJu0YyV0DD+MefoPh4PGER78kqNMlJIGF9JNg+T/CAO5IkMewk4sn+w
	CUrpwWL/EJ3ISL8zhaYm+V2NEPSU4ITVf3WpE//urWFFhl4c5ZoB6gxWYq8b4FebblV0TXZUzY0
	l
X-Gm-Gg: ASbGnctF4UqUcljd//qZTTue/oHFLj9HS1UdW/6sjrrfTVWtR2EIXr8ulpJPdPq/kgF
	NYmYUzs7Ec9ZECjUKDiwGMBPUJ88UbrFXC2Y6dI5IMgWp3vkUJOTdFxIGf8YHxf80ogVq3hsAZJ
	v/C1rW6ZSCLOzwQ26zs4TOaIi+/be2b60SzGjGAwnYCHrpWUnrlfFnk7Mz4JFWCkzK0KLK/GApd
	lFqygvtlYOvrZnBYpqqIo5Vf08smslL67h5cXi4XDeDh5GhC9OiptA2qSgyhvLE6y2QjjrKOQma
	iIzZpE5STdkLrJzqEKpjb3zCpBGJEKatufRzR9fmkyrH3mmb6RkXbKCs4x0fieS7mUM9wmC2aNk
	xrDzA4B/Po57+3RzXkhAsP6Yt31Lz0bQeV7tQDdVG9Nfb0Uinv+U=
X-Google-Smtp-Source: AGHT+IGYMYI/VTCN8i8O12tnUpcdgoHWXm5h59/uYlXu2Uxcw77TvLSAFwYYu6Sa7zpw0T+RWR7nBA==
X-Received: by 2002:a05:600c:35d6:b0:43c:f55e:a882 with SMTP id 5b1f17b1804b1-43d01c2aa41mr77204215e9.31.1741772018371;
        Wed, 12 Mar 2025 02:33:38 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfa52sm20112977f8f.21.2025.03.12.02.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:33:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: remove thin-provisioning-tools
Date: Wed, 12 Mar 2025 10:33:24 +0100
Message-Id: <20250312093324.3238381-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115917

From: Yoann Congal <yoann.congal@smile.fr>

Since commit e19b4c9755fd ("thin-provisioning-tools: 1.0.13 -> 1.0.14"),
thin-provisioning-tools is in the clang dynamic layer.

This triggers warnings on AB:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/213/steps/12/logs/warnings

So, remove thin-provisioning-tools from packagegroup-meta-oe-extended.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 449f671f7a..70d05c44bc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -878,7 +878,6 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     syslog-ng \
     system-config-keyboard \
     tbb \
-    thin-provisioning-tools \
     tokyocabinet \
     tree \
     uchardet \

