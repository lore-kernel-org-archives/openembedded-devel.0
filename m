Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9803EC0218E
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 11:07:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7858.1737803220624669591
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 03:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QOwCoScc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so29799985e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 03:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737803218; x=1738408018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJvDRErvL6FvmwDzbnKM5H+HbIDcZcIW79VtcBy+wUM=;
        b=QOwCoSccXv792DglfTlIY/YDjPIgUs/TCdm7ZET8p5zXGqQPK3hkY1PIimGX6StuJP
         bpcc04mTOnLx0ipCvCaPEzs1CmB1B5AbI63zzklcE1ZduVzvmgNX6KPEcfrsfxIe1PrK
         XXElpSaLb+puWhJ1AxnHA69oSXx/MbU48x1Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737803218; x=1738408018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJvDRErvL6FvmwDzbnKM5H+HbIDcZcIW79VtcBy+wUM=;
        b=pLOiphpY2Pfb4FbsGCwzAzwelykdWhXumm0W1XSgvi5pCfWyGLst2Cgiw/mhSXlOdV
         RCo9oMqb2lkhvAY8ae0od8e97SI4Snmiii4JefF9VXqmlV+0mvgFVzCHUhw+nBLEUVQH
         1X2YhCuAcaPnNVT+LQxT76HJMylHCR1wvjihYzWFJNHaH+hkrwYeSfSwJR4Ce1c9QLUa
         wuL3u/4ZJbMaxf2x897bFT8GMo19CRzNcVSCA5N+2aWJvYhVJmMKZPw8OeYmHqJfZJYe
         3tvVme2Ib+l8VS0pEvMd7Xv9L28063yrQgSqpmYep7AiSM1A3M0+GfnIvDOkKZGzFCPH
         6izg==
X-Gm-Message-State: AOJu0YxQcbV5jd0DV5Al9hNEtujjQdBIO8/IfT4KZ9OBM1kgelmUYeHQ
	eynRprdgKLHyC31mCGFirxV7KS0nPEqtzlUaM76aKhVCUWvl+txgmtdW1YhPWMS7eK5+ZquS1By
	bY/U=
X-Gm-Gg: ASbGncsBHAtn/Nx03T8PfhfxJ6pZkpyiAIITk5ty2yPlAhxvKY3etlLkNne6pitPF5f
	QDWi8tWPX+dJC5SH/zV8KwO/cFR2BOCZsqK24pYfbNpFvoaMcKivZSD/16CtBcNTe1ElBLOrn61
	eAxjYh8fD47KR+f2VL1jnCK+ESeDWq9UHKnmqIjg7kPkjYxk+Rlg+UaDa8AmsrWlFDx/QQsVUVR
	64ZAgU4PoCgbxJOq8VyyOCMnM4imj2dXmofCQXb7qLqgrSkkDDu3cCaFj3bm01DHvyDVNnmzcAQ
	XTzo+5025x0kpscBFmeA+1YzqyyBOWqu
X-Google-Smtp-Source: AGHT+IHrr2E4dYnoenBiSdTRxhcbCj8pyCk0apAaafIRPYy6OwGIp4Q5vUsW+ivAwGN16UeHOua9sQ==
X-Received: by 2002:a05:600c:3b26:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-438913cd4a1mr290687595e9.9.1737803218181;
        Sat, 25 Jan 2025 03:06:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac79:b32:597e:d068])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb057sm5308179f8f.62.2025.01.25.03.06.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 03:06:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH v2] crash-cross-canadian: Update to match OE-Core virtual provider changes
Date: Sat, 25 Jan 2025 11:06:56 +0000
Message-ID: <20250125110656.2464673-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 11:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115076

OE-Core changed to to use virtual/nativesdk-cross-XXX replace the older
more complex cross providers. Update the recipes to match.

This fixes check layer failures on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
index 54883cef38..bafe56d2c4 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
@@ -15,9 +15,9 @@ DEPENDS = "\
     nativesdk-mpfr \
     nativesdk-readline \
     nativesdk-zlib \
-    virtual/${HOST_PREFIX}gcc \
-    virtual/${HOST_PREFIX}binutils \
-    virtual/nativesdk-${HOST_PREFIX}compilerlibs \
+    virtual/nativesdk-cross-cc \
+    virtual/nativesdk-cross-binutils \
+    virtual/nativesdk-compilerlibs \
     virtual/nativesdk-libc"
 
 RDEPENDS:${PN} = "nativesdk-liblzma"

