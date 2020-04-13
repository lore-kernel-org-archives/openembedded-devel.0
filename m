Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.795.1586803415458688567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 11:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RvXKqJ9/;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id w11so4828588pga.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2020 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2wbPFepIEoAyEzVM4eyHxvq9RCKjwDg9MZsOS6LWCQQ=;
        b=RvXKqJ9/r6BeY+ywyHuQgw0OZKU6XN+qO14VOp9lM1OkdPxA87sUU8PLo6/hK9iU0c
         dKxBpQ0A8Ed8N0eBCUHXu9A/nf1nC0uUms3Hni0zXpVKTO6wai8nM/QgmW29yaDAQGto
         JPiVZKYgwX51Pu2qC24vQ108GSrYjPX33BOfclOh4UdALuInnI18dWTNj+8fYr4nBrln
         MvEtt1rR5v/eiCrh6ngcU4JKAC9IzgF6tgf4HZIprU7FRNck3E6zqmM5PAaT/LwwyE2A
         63xtbpYLKfRaM+RKAkren9Vxpl91XHpvPHpdsh7EAiPHuOK1kTddDwwQSNauwyscAU7K
         /6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2wbPFepIEoAyEzVM4eyHxvq9RCKjwDg9MZsOS6LWCQQ=;
        b=kYaZp4Ek4KbqzOZTkefaCMF9I7tyU4A5cQJdGtznjuVFPqH9+1u2L5QAKWGAI/iWMS
         reRl5CkHWnGrJGElAc/Smk4h8hEnI11HCl+iAaBWKuPCJ8NsTYz1cprEatpPpWptJLj4
         2FG4QOOoNQA+fnGepulzJ//B7Hke7uTzlqjx8TkTRMua2V1UslUyhiCpVMs8paZlPivD
         OwL2cMs9O67jpx6GSNlUnVKBJhdQsm7iqkwuR1Dnch78iM04/lDZPB1bURAr6vDvnI0j
         Bbaz+vr2gF0G5aa4rZkvredmrk4YGF7Pp4TKND7mOnUZBTehLyen3B7qCB/HEhckTPdm
         B75A==
X-Gm-Message-State: AGi0PuY0ddiZHQ0wJ0BlpoaOeu9jl2/XK2s5HgpSwxi3Qw1YPPZkxEBh
	4oR36nDPvjYfF2qDGub9pRlDd2VYcIw=
X-Google-Smtp-Source: APiQypJPztkgt/VRvbAjpbXkHIDkKt61GINYjfaHLcBWbJFUm13tzYi+jJVHur1GIUEax4GajypSHw==
X-Received: by 2002:a63:4e1d:: with SMTP id c29mr6576877pgb.235.1586803414442;
        Mon, 13 Apr 2020 11:43:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id l71sm3793234pge.3.2020.04.13.11.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 11:43:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: Specify the target with -target instead of -arch
Date: Mon, 13 Apr 2020 11:43:31 -0700
Message-Id: <20200413184331.960731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that generated code is properly cross compiled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 8b549f9a42..3687c267e1 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -45,7 +45,7 @@ EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
     CC="${CC}" \
-    CLANG="clang -fno-stack-protector -arch ${ARCH} ${TOOLCHAIN_OPTIONS}" \
+    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS}" \
     AR="${AR}" \
     LD="${LD}" \
     DESTDIR="${D}" \
-- 
2.26.0

