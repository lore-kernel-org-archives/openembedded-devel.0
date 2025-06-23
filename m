Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AA1C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:56:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.552.1750694191756963286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 08:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nK4IQMar;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553c31542b1so3543924e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750694189; x=1751298989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MhLGLFpUMP4piDz6Tnyg+N14dWIEuPWQmbaqZ7h8Ggs=;
        b=nK4IQMarom9bDffP0ljh/ptpSEUwgjTjBjUJoegAdMfNdi3bPmsvpt6a5qlVShOrdP
         SVi620Icx/TQ4kVRumeI4INmdAafGNXErtMFqQaITGCRYdAM2vhsZ18aAhm3QlK+G+pm
         7NDkm24IFdBMm+5Vl4cKKBwyt8OuN2q1VIICuXGdAOSJNO+0MpbgFkJpmER9uMQnoLvL
         8G+cBs1BiQe0aclHbZmqVlVM7hmZ8vvMf6t+nRpVho8NMfkRn58n30ZyHvbZYGc0pSK9
         ZX/ennGSqs6Lv5QUomLK2jxiAgl0BkGbYj9IClwT9y2px8DsdPwg4EmWxZWuVR1ni3PY
         /3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694189; x=1751298989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhLGLFpUMP4piDz6Tnyg+N14dWIEuPWQmbaqZ7h8Ggs=;
        b=Htm/mM8GAbv5EM6vj3ng4jM+X19AQdkqVWSBh0slkKny9805rc9kCC9nbaZnUBLzMJ
         y9F6l2BsfeqYK1b62x7JekjqaHWEGXRO8UzEDxvzy5RnU05V3CZvoPSqjvAHEt6R//Lv
         jn95VrdY2EZRKWUQRTDPfuLz+L618wrlMC7Q+o7eIhe9Dg+TPNAZ0so4+Zx7e8jl4oBK
         2bfRhW/XbaYilh11TKSf9lccd81TR8vri5xm00Udu38ISuXD/lrEHRD2RSt99U3uwmjz
         5uLQhr3fqZz9QyVRpOtqDmDyA8axOZOe07wl8AGFw+yjDfnVujx7+NK6iOwTI8XpIBoV
         APRQ==
X-Gm-Message-State: AOJu0YztFovvyVjc5UPCtWCk4A4oqsIUul9kJU82wQP4iWk8zMkAJtuD
	SDPOQteleA5r5eaOY/eXUU/C7kTv79YHNzNEpXlkDNdxm6d3l9g9T2ng5a5Oig==
X-Gm-Gg: ASbGncsIODReiJFevVLowgEOqOVbW+dexfZMdtXx39LDnnjcw+SskvlE8q34vumB4eh
	mf5eKjDbfr5MdHyh93HpwLrARlLF3HheJfkC8pCbFknxJrwMLHGeGZiAQb9p3278LWdbBo62iz0
	eLB1UGVryJ5VS7GMpKcRArE4sGYutejF25mYLN7zG0RCJy9TcfHNxRbE3/D7pqwaMLSA8dvrQ2M
	c/85JypFZFde5pJAIIKrRgL3Ba6czxZE0efcuFFWGJ8fGPowE8YrAAEq7L9EzNYytK91b7MptX4
	5Nn5B56d0f/90m7odHU5JdtJ5t+lmzFM7QgpBniBOXdQ03GEIVhTZ/o51mtI6V9ccUa1EeTp8HS
	+JE4=
X-Google-Smtp-Source: AGHT+IGaC7hanYYlWy5iDmEym9aPUgM6dM/cI19NnvjHm3ICTbLvC3Tgx1ExJAPKrSOCRQeXdLgWsA==
X-Received: by 2002:a05:6512:3b0f:b0:553:2fa8:8405 with SMTP id 2adb3069b0e04-553e3d236f9mr3728850e87.56.1750694188919;
        Mon, 23 Jun 2025 08:56:28 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d727fsm1434941e87.251.2025.06.23.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:56:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] android-tools: Drop workaround flag for incompatible pointer types
Date: Mon, 23 Jun 2025 18:56:21 +0300
Message-ID: <20250623155621.173813-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 15:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118084

- The build completes successfully without adding the flag. In fact, the flag is never actually added. Because:

If we use the += operator to add flags to the CC variable early in the recipe, changes will be overwritten because BitBake applies class assignments to CC at a later stage, which replaces any previous modifications. We should use :append to ensure that additions are applied to the final value, after all assignments from core classes have been processed.

- Additionally, the standard way to pass compiler flags in C projects is to use CFLAGS.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb                 | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index ff83b6c2ee..c04a1ef8c4 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -187,8 +187,3 @@ FILES:${PN}-fstools = "\
 "
 
 BBCLASSEXTEND = "native"
-
-# http://errors.yoctoproject.org/Errors/Details/766881/
-# android-tools/5.1.1.r37/git/system/core/adb/adb_auth_host.c:86:23: error: passing argument 2 of 'RSA_get0_key' from incompatible pointer type [-Wincompatible-pointer-types]
-# android-tools/5.1.1.r37/git/system/core/adb/adb_auth_host.c:86:27: error: passing argument 3 of 'RSA_get0_key' from incompatible pointer type [-Wincompatible-pointer-types]
-CC += "-Wno-error=incompatible-pointer-types"
-- 
2.43.0


