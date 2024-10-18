Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FE6D3E1B9
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.29960.1729278806366975300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TP2hnjZ8;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e1f48e7c18so20081887b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278805; x=1729883605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHJHXnneDqAdD/K+IwmxRQFDHb1R45jr1j8SvtEVBh4=;
        b=TP2hnjZ8b29uWURUUylOiWXSJDTa90KipWL//fn5oIXGqn595LO4Op+IcG1anU+0CZ
         PA4WYrLk1TeMIwxcp64qluP9wYUIyiSwjZWvWPf80WNoPiZzDE5R29K8rkliTbb6/2Ur
         X9p5C+4g2Ru72qTR3+YQ12Da4gZnGYWmcbYb3iKng0CVlF8NM7VJ6DyMIOC/et8az5CV
         DRD4r4t4vvRTxCJgu5dZ7N3gqw96b1fj6cGBO65RmxnJ/OIfC+/NQtGeVUfL5tTHENx1
         aOk5PtXrLgYvkdHhWyqAdg3F29nlqOXcomi0gr0b3FmwjCodalUJ/jXXw7h04Lv2mHJO
         M+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278805; x=1729883605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHJHXnneDqAdD/K+IwmxRQFDHb1R45jr1j8SvtEVBh4=;
        b=He2osbR16I+hMX7ytQQCym5/WvmCrA4OAYF+7VkthiQDuZDLfICG/h0n6DSyKODAjr
         in2YpeXv/igeDFEA7owTgMDp5SE7E9Cuox4YmKVapVvq8N7ho+4w3G9gOYlqDDCoAs7x
         O4kdULRQID7499GAgQQDACT8CHXTu2d19CFGP8hop43V4J1Xc8W5B+LDaBvp6LR1A7XX
         s8YeeOQP0TVJK/kgP8HV13lmfWiIuutO8tnxltLbhZmrob7E9fPGwptVqULCzLqcpltv
         xUs5XFf90IA+INkLe0CToMScbmukmDzWHRwo1gbR3X6pBMIq7Jdbce0oDltgiG+OHcqo
         mRHQ==
X-Gm-Message-State: AOJu0Yyd05s5RHyCT+XW+uJ01AniwOzIL3I0F4yT3fO7OOKFazHdSJBZ
	j3GQb0bRYAnJYGi+8I4lukKqvUePetZlhe7JkiI6r1pUFsGuHDy9Fs2FhQ==
X-Google-Smtp-Source: AGHT+IH/YPvEdfgVjTXWb9om5rpUGj6Ol7er8XnStOPjOc9vB7BkVMvn0Z/tbJ0nDXd33KX8RHpuFA==
X-Received: by 2002:a05:690c:9c08:b0:6e5:c145:370a with SMTP id 00721157ae682-6e5c145382cmr37434257b3.43.1729278805068;
        Fri, 18 Oct 2024 12:13:25 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:24 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 22/68] python3-flask-nav: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:09 -0400
Message-ID: <20241018191101.25184-23-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113009

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index 3855909fb..3d5846148 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Easily create navigation for Flask applications."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
 
-SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
 SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
 
 PYPI_PACKAGE = "flask-nav"
-- 
2.43.0


