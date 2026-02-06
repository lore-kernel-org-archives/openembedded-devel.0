Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A36EB28F0
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6909.1770366054081313606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QeGGSGOB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a302794so261646f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366052; x=1770970852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM6m2n3rwOCk2Lq3o+3cI06oukbrohDvjYpDy2EZXJ4=;
        b=QeGGSGOBHh9VEtBO9JjrSIN4WwPQ3LDaSfbaFFjjDsYnv0nCpcNYrX9Xel7HVr8wmq
         NBHicBkIYLu1EON68efMFT2sxNB7rjt8CME2qUA4MDKfW3BQ2yY7L1yS32XYI3f407Cs
         R1yztAoF3Y3u+RGDnTMuX5fMsjNRWTwauHA5SQZjgDVkSNfhyoXX2mkLfvLcTz0PZJvj
         xs13VMBMqOtPfSB/X26LfC4sC+B9n4EusprGySrDg8Jl1aYMQIcYTQfYNs6DTCkP1sXm
         zUiUXkzeuDOGcrbHErQqEdnPFML81n7hSbYB0eL83M2QSJKGBdTDxSn9AOcx5/G2jkyr
         2LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366052; x=1770970852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QM6m2n3rwOCk2Lq3o+3cI06oukbrohDvjYpDy2EZXJ4=;
        b=mti5dWkkGWP3c6Q7IFybVCFr08k8mq94VvNfvVflAeiEs6yzeX6wNDW+X2oKe7xcKX
         EELO7pzCFR3Wfg1eN1WxN4C3cV/AOR1ql//rHTdYKShSRWCv4Hmuh9m+02GcbeMCOrQe
         o6cAK0S5vM8pTzapb0VNElOIp2Z6AUrQ/AqbHI8KrWJbnY8DpqttjPpg13L04srUABO7
         m2sMFzgZ+tk4gnSJ9+MZAE+4pDtLLzJWhaxcAMNJjthJ6fDR9K1iXolxcuqbSTuzmoUf
         IloB5de0A9wowkMu6dI2Ze78NAdvWgmLIWg7d5mLAPC/p6n1W5mV5pH981hgrVbImF+g
         STSg==
X-Gm-Message-State: AOJu0YzYxB8JW7MG1r7bQ1qpOYPNRrHvcZN0NKpFjcrZup6OiGOSXq84
	SwkEFevBRw/g/lMrlrKPs5tw5DQYplefDsauZ/4pL+jsdvvW/71mzwvLx/OHSQ==
X-Gm-Gg: AZuq6aIGCvf+yfkMK6/+m5NS2SYF9mLtDGFqHFSvHstnF7AaDwF8lQAj4fB23Uvr26o
	6kCUe+0sEwzUXj7ACnIS+MsJx0u2uSS+LxaE0FVJe2Dgn686F7gI9nEwWkNT7lWJgIynFcv05N8
	YMV+E3gNtsY2p7LETqkkn3boodhCbns5TG+lFdekEjwfXJRaojk3OPfnENMmxqY1wEMEZu6+9Dr
	k/YCJyXcnNGLGna0OUX/9rUdre2iazBCIu/+ncUamuaPWHzsDqVjtIIXU42xx0yd8WOQv6i0i28
	levP+1Q9jRahPisyaXWaFDTNu1Fw/0P9DPVSWELZm8PZ7thPsgbyZ+74sxXXxiF1xsK2laUj2qn
	Y9G2YD3c/NeIzDnFk2uX3cCJLoY+D6BGjNkv6PPbDtg60Xgbn1eyBQvEkTawkLP4xQO6pQmxqWy
	lH3SXW7wAi
X-Received: by 2002:a05:6000:2384:b0:435:bbde:dd43 with SMTP id ffacd0b85a97d-4362938efb9mr3008528f8f.61.1770366052331;
        Fri, 06 Feb 2026 00:20:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 6/8] freerdp: ignore CVE-2025-68118
Date: Fri,  6 Feb 2026 09:20:46 +0100
Message-ID: <20260206082048.1442403-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124235

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68118

The vulnerability is specific to the usage of Microsoft specific sprintf
implementation. Because of this, ignore this vulnerability.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1b4b952b5127ed9c35cae0c6cfd6e1133c79a946)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index d0d7d28b55..d51700c81b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -94,3 +94,4 @@ python populate_packages:prepend () {
 }
 
 CVE_STATUS[CVE-2024-32662] = "fixed-version: 2.x is not affected, bug was introduced in 3.0.0"
+CVE_STATUS[CVE-2025-68118] = "not-applicable-platform: Windows-only vulnerability"

