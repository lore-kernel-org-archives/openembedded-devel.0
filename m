Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E29BC0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 10:39:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.7787.1737801550291830038
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 02:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hJ8IKwJe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so18612345e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737801548; x=1738406348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2D5VuJzabmKRrpiVgwJSi8m5su/EkjfS+gb35+rtZE=;
        b=hJ8IKwJe7qmqYBYyERKuVLwqPou1A3uYpbDM+RrTqYcK2ak3SoMnPAaFSjin8A8xzK
         SIOzOTTAwBew3kzN9e4QE5kRGqbhRHYR66kRgFVV8ediHLLrHrYBv+RxfoePzn3lb9VS
         IaXPgOp4ly83rjpsOk8sYNdy0x+JZ6oDhvNlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737801548; x=1738406348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2D5VuJzabmKRrpiVgwJSi8m5su/EkjfS+gb35+rtZE=;
        b=GKK8QDm1VyXXsmFAzc2xwWi9Jk9a2rTUVuntcQwyx5kvMk1/m27rD19Cygqv5Ei4SG
         RMbniziRHjfk27V3dvkrQewomUVy5w+M+0nMPR2k9jK4bqPJqbolmY+vkyWXWvQgmbyh
         nHzvkeRKPDRTOmIcMAsWVP+Mdr0y22mSQYfJBODYBa790xqFkFWzwmiXCIb9Vk/LuJpu
         zU4VH9/QmvQI+cT+sOML/UrD8aNlPANFHYO3gzW1kwqnhhRCJZkg7aOhDUMsp47PBOkY
         g+sPQ5KcElt25kIUrhojrHBrPo8Xc6iVrK5A8aZ27EEU2Isjhvf38vxRXf25Q4J1UiDA
         5SLg==
X-Gm-Message-State: AOJu0Yzo/ZdKmX9pN9kds6oaSmL3i4P6PivBEe/zcuWPeE49I97uGMj7
	DN0VcOAauga7YX9jIaAiQ/fvhA0aOjVDLSi+o7/c/6PaNB/wYkldLqIbbS3d6J7BIEcMhiuw/U4
	466o=
X-Gm-Gg: ASbGncsHA+yMm1t6EXlvENOQAClYEIrZZNePL/6s797FNXvVq3FRFXy1W+qgcF0h5Qa
	DnVBsiME1S/JVTbgrrr5sN70BzQw8O+Fy2Ai7IfoWb9OG08ShyX/99oKDw5QS/yPYzijuJG2GkG
	tag8XnXvlzPm/MtmjlPYhBv2Vqb0bjxHhW3ekn5vbFNHOO7rmXbb81S5C41+xwlVJf2HYZLYn7G
	cFB3v9iHIvP6bRdk7ac01t60k+LHy8aklxiKgSZJEaa52eom6QqDlgO/UCZrWpWDnZoFK762GHG
	bLYDcVhaKwqhPuYJJ0KFoSLTmWy8WaMP
X-Google-Smtp-Source: AGHT+IG9Bj3sAKCCaLvp5UHLVW40DKZYmsqYhSXYOSoVmyZucOrGhaseeCdPMWLlpdGOjH2NA4fs6Q==
X-Received: by 2002:a05:600c:138f:b0:436:ed50:4f8a with SMTP id 5b1f17b1804b1-438913caeb9mr351667005e9.10.1737801547002;
        Sat, 25 Jan 2025 02:39:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac79:b32:597e:d068])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4900e2sm56718965e9.24.2025.01.25.02.39.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 02:39:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] crash-cross-canadian: Update to match OE-Core virtual provider changes
Date: Sat, 25 Jan 2025 10:39:04 +0000
Message-ID: <20250125103904.2455885-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115075

OE-Core changed to to use virtual/nativesdk-cross-XXX replace the older
more complex cross providers. Update the recipes to match.

This fixes check layer failures on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
index 54883cef38..1ef643af58 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
@@ -15,8 +15,8 @@ DEPENDS = "\
     nativesdk-mpfr \
     nativesdk-readline \
     nativesdk-zlib \
-    virtual/${HOST_PREFIX}gcc \
-    virtual/${HOST_PREFIX}binutils \
+    virtual/nativesdk-cross-cc \
+    virtual/nativesdk-cross-binutils \
     virtual/nativesdk-${HOST_PREFIX}compilerlibs \
     virtual/nativesdk-libc"
 

