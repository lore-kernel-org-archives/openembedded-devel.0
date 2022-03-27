Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F38C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:14:43 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.1466.1648343679039280853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esVtaqzd;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so12181271pjq.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y4RJNsK8+3vsxR8Hmm6/aCDaclrKmwL1FvyqUUNmYwU=;
        b=esVtaqzdMYS4ayHIw8DZLK7LFSIaEZtgsz9YHt7OJnGJwU8FW7WLaQyZmIouUa7/Kn
         pkm9yAX+EsWOKMY2ku+Qlc410A8v4rVKbj7Pe9Ufkc8TwK4z9zgUw7oMT88WvNWprRJu
         Dfx0D5P9fDzIMozgI+FN5OpAWyZobwfCOueVCUE9A3BeWVVmLAgvsvP5M3vl2EWEKUlq
         lrCZeACCg+Y5zyS5vgz03KNjIEXihq7P91Z7npTR+KXl+iZPApc7/+c0bY4OnVGhwsOP
         GzTDK+rc2W+l5A9veBn6/6exascHcwnP4WYCBs5xsdh/cK/LRazn5yyJOCZAP0MmIBUM
         LTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y4RJNsK8+3vsxR8Hmm6/aCDaclrKmwL1FvyqUUNmYwU=;
        b=zNQvI+ni1N1J+E8hp4ZgfGhRuASMEY5T46zG+trju88etEVPPPiwxtUwzZ2x2q2+Xf
         BzQyUmfgfCqJkwiKA/FjwEpRugwmbom4VR6rz8qIIPZB+CV8xBt30mcX2LVHtt0uq3h2
         iaDh2f6IsGdvHaxxefPvxRsvPINfbSFLQvMwzWGGuAoqIGk2B4FbU9wyKBzHTIVtx/op
         O1oFcR3FMiV2qJaoxvH/ycKBoEgZ7cQdWDrfjGHSsxfgfX/NKX9ZfI560F1onOlmkdOk
         mHD0Sug7Svi70TU5/m0TGnUGLSjkpBpptm5240YNFQD/ieji36GoXn5CdOQsZ/t7PeLb
         gscA==
X-Gm-Message-State: AOAM530cKhG01AOFafwJZfv/ODLIFuyQgGR5MEArcMr9FDuoRF5L7FRs
	w8ovHJM6Lp0dHkgEpxWn4UxBQJk8Q9I=
X-Google-Smtp-Source: 
 ABdhPJz/tbmUksiQw+s10Mb/04Bs7ctZqvHoyUMc2p2fOUkAWNOjaDuBT8utJOPKhXh7VtHDOw0RFA==
X-Received: by 2002:a17:902:728d:b0:151:dcc8:9f86 with SMTP id
 d13-20020a170902728d00b00151dcc89f86mr19126351pll.76.1648343678373;
        Sat, 26 Mar 2022 18:14:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm16525147pjq.17.2022.03.26.18.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 18:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] abseil-cpp: Fix ppc/musl patch
Date: Sat, 26 Mar 2022 18:14:30 -0700
Message-Id: <20220327011432.555592-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327011432.555592-1-raj.khem@gmail.com>
References: <20220327011432.555592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 01:14:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96219

typecasting to pt_regs is not needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
index e8048fe940..95210565c2 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
@@ -62,7 +62,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#elif defined(__powerpc__) && defined(__GLIBC__)
      return reinterpret_cast<void*>(context->uc_mcontext.uc_regs->gregs[32]);
 +#elif defined(__powerpc__)
-+    return reinterpret_cast<void*>(((struct pt_regs *)context->uc_regs)->gregs[32]);
++    return reinterpret_cast<void*>((context->uc_regs)->gregs[32]);
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
-- 
2.35.1


