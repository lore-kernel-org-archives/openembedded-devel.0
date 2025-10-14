Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D44CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:04:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.17264.1760450638627626203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SYO3Xk/b;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so58142605e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760450637; x=1761055437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1V0Ok4bZjQyIQAxTh4+3TNmQj7L7GlowUAIuFJuXVU=;
        b=SYO3Xk/btIF870UWIdl3qVvqX1gzKUvPJrnKAB8Rc7HH2bKX7PAiz+EQ2BknvGvy1o
         Egss/dCsJKESz8XR4NDKvixFrQyPQ0Ye38bRnSAxN9qqlxLATHxmhsCFo5c6wVOEANtw
         8pvci7pJyTj0ahxA2fZvVz81ukBGEga9Z+cT8OMzn/6lkzrnPxHL87n1FibGvOcaYPXg
         TsgbSETCAtvzFg3ZyaoNBsATCWepbrEsMqJZOj76Q+ciuU4FSfBL0BAJQkblTtnE4FCm
         OLz36vdpCdQCSECBM6mXAPWr6K1TZAh5RBc+rUu+ZNAsi5XdS3fhO/VpaGVG0DDqefhS
         Khww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450637; x=1761055437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1V0Ok4bZjQyIQAxTh4+3TNmQj7L7GlowUAIuFJuXVU=;
        b=DSuqcOcm5upUzRTFFbOcfWrp2fwksQcZtQrxHqO22MkH8cw7D9BKhLVDmtD1eGXJRQ
         yK8dzX4IIa5hbQdCCTtVqhm73xLzwRXImYAYAwKvdy9sGfJMxehBuOMtP+BfdQws4srX
         Sgxc3eG4wsAamcArQVSoLqfrIinmhi/nd6bQiE2Lf1uzO/CWIxUXBMtWXm0xfygylfvR
         6Vr7qQlW0wWJTrv5d6iqgflfEpMJhH2YCAbOx4W05ga4/DS258m9AjMgDs6u2U12ONSx
         wEdSdPnJvw/BC/aJetMH5+asWtDOROAmBl2y2d8WjP35gzjjJEnV5mJPK4NC+bfZalY0
         RD2A==
X-Gm-Message-State: AOJu0YyXreXPE8QYYwZLR4qlrHIK87K0Y28CeUNQgWYTXUAEju9fPomi
	gqpCPIfoUslBcGOSb+ESt4zbC4PS4IJbMbk9MOotFw1VEcJWMnJ0rhCpuqBNSQ==
X-Gm-Gg: ASbGncv+Tk0RFTreVqAJ9MXW4+W4fhc2MIFZRURmm2vr3hGQlqGASRqI79B5qr1vpJN
	ukDR8rGU2jcA0YoZiWGJ2ygKE8m0H7rT3ciW3Yx9o5Bbiiel6yW54p4/niiwlAO4WB2f3zirVy1
	Zj0oOGz8BJNCQihD+Zh2UZVwfVJxWG5CPFllRsPTdl6V+sOAXot2kOc7zkvwMKy3oKwDTf5RTqj
	UwgvMYE0AChSn47mGGUqn2jpgF6mPUsm6GizW+LA14vQQkEggoyqqvBbfA9grBND8R1axL4gIxG
	jZtqo/qousSUUCOUQ//+Rx1ICbELyEhqkm5YFLeSkkpo4bXRNU7WG4uX9DZ5UmmpOk3pZZSe+q5
	UQDHBJP6nfWNCuqKMdM6nBWwfa00CdEwnf9grQKEADAX3bwAxpDUaugENxZR/
X-Google-Smtp-Source: AGHT+IFWPFbbsT/oR5t/WnXrHCQlJc8Z0ACz97n4p394OV12qUlfyExD5/cf7+6vUWULtLOVMG941Q==
X-Received: by 2002:a05:600c:3e87:b0:468:86e0:de40 with SMTP id 5b1f17b1804b1-46fa9a8f2a2mr177435275e9.4.1760450635481;
        Tue, 14 Oct 2025 07:03:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589a21sm24409541f8f.23.2025.10.14.07.03.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:03:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] emlog: set CVE_PRODUCT
Date: Tue, 14 Oct 2025 16:03:54 +0200
Message-ID: <20251014140354.1056601-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120611

From: Peter Marko <peter.marko@siemens.com>

This will remove false-positive CVE-2024-50655 from reports.
There are different emlog components from other vendors around.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8d45d909315f5c784234261bb3e97d2e1f0a102)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 2194b2e536..07965ab203 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -8,6 +8,8 @@ SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
 PV = "0.70+git${SRCPV}"
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "nicupavel:emlog"
+
 EXTRA_OEMAKE += " \
     CFLAGS='${TARGET_CFLAGS}' \
 "

