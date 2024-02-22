Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ACAC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 12:56:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.11964.1708606569993185077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 04:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UY3TGAYh;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso763923b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708606569; x=1709211369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8PeLu4uyM4qXzS0nx9hYD8DtmXDKWnD5qHJTR5sw68=;
        b=UY3TGAYhApZvjWmMF0ZPNGRxnZ5+nnMzWIoIDgYaqm7T7d8N547rpoDy3+ewX7RxH/
         cWAnLBYWv/vbadnq5XOtof2lEOV+KFUsKQL3FmkeUSvvxKosnt0g77p1WLCTkybM8Htz
         AjmKysitUt+Xz/4vajElequZKd2FxhGqSmP6CANWbkQoe21Da6UJvcKxnT86z9ZvPLtS
         oVLAA1mKZ9GDJY8zKBM7kfFbnq1xndFRdLQVstEDUoT43qe2r2ziEFiL+FsApQ5+OW8L
         vDRTakNnkhktxKuniDl/c7OXySiGoqqb9f0cucFHvxZ5eg24beTcZUiG6SazS1pMt7FE
         xglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606569; x=1709211369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8PeLu4uyM4qXzS0nx9hYD8DtmXDKWnD5qHJTR5sw68=;
        b=hYNr2UD8xkHuaVEMYRm0PBfgzJ09Nd5qHpXY7/27TriXZbyVLgaJIwYiAOdU5KF852
         rJTTSa1UYW4CCoawCC7xeD3swr7yzOKbXJyyVn2d8sphGHENnayydsommWymDgCg5hnH
         ppu1ZdP8YUPvMnN0/C6kMmICUDMi3qASAAhZzeGhEXgznOhT5v7v1kZsdjB6OL2+w0ZS
         GHggHsOxojZMbC2E6qEl0qFxxopJX8iRW3IHUeuMdnMH/CEZUbG7fSpvNPnwRAC48hXd
         m6Oi7D7aRw4pWZCqDFygyLWa19EP7/yISbolXd0H+dLIwVbilD5IYxDzwECkJCFl0yWx
         tBnQ==
X-Gm-Message-State: AOJu0Yzkf8Mx/Zp3jt8sTJl0NoSq6D1p+yuCfbddoQmKh00UanYP1QYl
	zShCc8/gxEqbOUJ54WD8QXD2UYYtBeX21IICpjihpLtGpMldVF+f/3z1oY6g
X-Google-Smtp-Source: AGHT+IFq/w5j70HSBtLq73LPoBgzAvBno0Fh1Th71e5S+kiz3+bJzzDIUeOBtzGP+R6PC5Zu+suTXA==
X-Received: by 2002:a05:6a00:1a8b:b0:6e2:853e:3d60 with SMTP id e11-20020a056a001a8b00b006e2853e3d60mr3884890pfv.13.1708606569277;
        Thu, 22 Feb 2024 04:56:09 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c9a:86f0:776f:e069:b3c3:975e])
        by smtp.gmail.com with ESMTPSA id le3-20020a056a004fc300b006e469b4bdc1sm7338623pfb.42.2024.02.22.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 04:56:08 -0800 (PST)
From: Pawan <badganchipv@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] android-tools: Enable position-independent executable
Date: Thu, 22 Feb 2024 18:25:51 +0530
Message-Id: <20240222125551.66224-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 12:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108983

Enable position-independent executable security flag for adb
and fastboot. Verified that flag is enabled by using checksec.py

Upstream-Status: Pending

Signed-off-by: Pawan <badganchipv@gmail.com>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index fbad5e136..6ec90c2f5 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -77,6 +77,8 @@ PREREQUISITE_core = "liblog libbase libsparse liblog libcutils"
 TOOLS_TO_BUILD = "libcrypto_utils libadb libziparchive fastboot adb img2simg simg2img libbacktrace"
 TOOLS_TO_BUILD:append:class-target = " adbd"
 
+SECURITY_CFLAGS:append:aarch64 = " -pie -fPIE"
+
 do_compile() {
 
     case "${HOST_ARCH}" in
-- 
2.25.1


