Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903A5C531DD
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.87198.1723218544905926579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fc9IPtJI;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so3685125e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218543; x=1723823343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkSd/AvNWgmnAJtZ4obgqoYPkWqn2btiTPS/drfEta4=;
        b=fc9IPtJIW7Zk8a0A+aL78JzFl8T9wWThLzTTeRMaxfK/MHmt7mp6FosxhJbr12rdVW
         r/G0wQGysEjSMsQeVRGw6G4fgU+Ss/cQliZ1IVwoilpuoLodITTc+GhFF4d1efGtOzgW
         ZEo1J4ZUj8zNtNc9TlJtlAMHBhFedjH9CP6585zkNWzO2kOfzSMKv8Ir8g/mVopUK+0H
         ZIgFoIbkaore6kvivJizTs+fQyCPQBn0P2ZgEe2s6F46ehWuOxCkvdQQzh2cHLHeVwxR
         SjquWlmRuV3CLYCQYfu1FsKJHOEdNgjTtB4ZIURe1gLkO6AYDoqEWchIvq0IFepu7g5b
         m+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218543; x=1723823343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkSd/AvNWgmnAJtZ4obgqoYPkWqn2btiTPS/drfEta4=;
        b=jGt/6iE8uFtpIBnLuh7rN0i2aLjxSqqrwadMziYxw4wSVmillvN9AVbT8lF5g4FmSp
         x3BhB+goisqt9/fBJlJj5mY/q9W4eRa37Jp5AnOZ9S/Fultg8IxZ2hLtGkZIVevlxSF1
         Oi0C2IVMzeP5exvxGvVFMnagMelRZIzY1FyOUNEkyHw2syYqOihPZ+k7y8li+g1IrGHk
         1noKv4USRJR/EEB/nRPEap5n15ofvpYVHaJHhlOKSHXuOEZNGMGNoBAbuWtpaJfvmEXW
         TXu9N1VS5SD1cSRIVwXOEIFM5fsjgTpcfF4ud5bEvhKSyMOIborVRth0ZTUnZAp9cv27
         a32Q==
X-Gm-Message-State: AOJu0YzIKX/W4su9yNM9nJgZH+hAugXZm22Zc6KRaz2MvUFuNnNqE4Zr
	TT/meul/PTB2v5L5WMAeTO/odl8OerZ9PMx1nq+aWCXPwrhZOVBd3DM6Q4xf
X-Google-Smtp-Source: AGHT+IH33qxGE80N521JhM3gtgEZ2xf4R0LLrjVEN3L8PZAqHwyObXbFrS/zIWCDf2APCpUTpm2rpA==
X-Received: by 2002:a05:600c:1d1d:b0:426:5f02:7b05 with SMTP id 5b1f17b1804b1-429c3a17117mr15144955e9.2.1723218542730;
        Fri, 09 Aug 2024 08:49:02 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:49:02 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 09/13] python3-pyasn1-modules: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:26 +0300
Message-Id: <20240809154830.14927-9-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111705

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyasn1-modules-0.4.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
index 34f3639e5..48372d917 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e90
 
 PYPI_PACKAGE = "pyasn1_modules"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pyasn1"
 
-- 
2.25.1


