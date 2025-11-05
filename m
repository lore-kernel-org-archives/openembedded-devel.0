Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3E8CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:27:49 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21048.1762378064328444257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKpYs/iq;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso463887a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378062; x=1762982862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcPGI2Xgc2TwBxFwMbh50v0M9iuGfIbKm+2oHyRIPcI=;
        b=DKpYs/iqrt/JcYiLj/oOYJdr3ULdpuLDNj1JTfDUt5zD9YTLwPYkNaLPmpyGWs7+Z5
         idkbh7K+xHOBfKsADlOaj1RdC+GCng/yDAyL4xPFnxJUiKF6TIPilWuaBPBnd0+TiLfU
         900h7bFBmbsmVF0wUHBoy9dl7fixyXeReTWmDYdMbi5oqxNbRpEUxs1i5BPJIXmxuWm8
         hlKzVeOke+Zp3EQucwBHUUTC3UZxNU1/UhbWiU5tyWwTI0r/EIN2110nMpASfQYy9bYm
         pYXiQeWYMC3YUqwCZXblDuBgr1hJ2Ibqvo+fZ5vxNGzgCVZaVQyskjvRH3NyAc7W50w5
         M6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378062; x=1762982862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcPGI2Xgc2TwBxFwMbh50v0M9iuGfIbKm+2oHyRIPcI=;
        b=IVipU2S/0QRPQt+eVD/DPJ0z9XDZHV4fOVaT+VWeYM688+X676Pi05gt9v5IQ9zWw5
         symturN3sdeIzkoQMPXJ4j6o0qZ9+a/KGPDUoE5uCD8DMN7mWOAgAkqfouYYBJNd/nB/
         dPGTaWp8Uz+80a4KiP5siN6CgvUa1NNJKAOT4ZJZhNSbhTYiAjfFrEPPTz/0BNVUIy+H
         2qDP+9VoXB2lYi0U2uR2duykR5qIxteFlKdt5HkSI889lAN9Rqk4KvpVCL6pmxdEK6/i
         0e0dLH+g9+r3WqMIVpinPtU0oR9DJF2IVJvqxz+W89kEHPxV5W9U92SHZSmvPLibEjlU
         rQhw==
X-Gm-Message-State: AOJu0YyazZco6Y5sG7Ub+Sojf3WVPufAZDZia1o8hwB8tgxnVyDgLJ6J
	NKMpeQkzmIyt9In3goXCuQVRReJvaW4yVbhT8hx9Bo8S2a7x+zkmN/0lSS0xURk8
X-Gm-Gg: ASbGncsjirvkl0Gnpt6HbdEyFX5b13Zq9kzSNBhwvo0QA3MVglHAGTzR/79I8u+hFx6
	ONJ5LGAc+ZaJqSvuXoPZgkVMQptb1YjGC0GhC/r8dsZpAnUjlA/8+aP0/B1mZUgSHDG/4F6ez9H
	kD79KTOUS9DpJWmJtT8UvYlwNvUBJFtemax7IfD8YFw4o8+qYlCx0v/reOg7XEDY0ZT/9lNAM+A
	EKc7zOSCHnGK5IKQToOfa4sXpsDHIvUCmg7vva/+VnGowFlFp9W5Ni+ofxpvvgsSubuLqQwKlQO
	hKSI1kXq0+TDXi1whMw1cwQU4Gu9bhqeVtv+UyRI7zRfDcjE/7Zrug1tyhhQqPSvF1tOFj7bdbC
	iwI/d6KzHaogkZv4UPZhkpi96QFhze5CMtoa0BDeSyosDN9CS/69TfiuEOOr7N+BQaW1a5rPofS
	R89/5LsBa2qSPAi0PRjvKb33x2DMgSMU4NEEoaE+gDTI57Un/7PTxeNtIgmnGUacp57YYGnS6TS
	/4kWHz3OYkYtA==
X-Google-Smtp-Source: AGHT+IE72DqBhOgL8eUUqS2T0D7dUdVP5jMxidLw+7ISuOhuZlRfD+oMQ2ED2MQpuzMB5tWQgGroIg==
X-Received: by 2002:a17:907:944a:b0:b6d:8d8d:3010 with SMTP id a640c23a62f3a-b72655b7411mr343741366b.56.1762378062251;
        Wed, 05 Nov 2025 13:27:42 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:27:41 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/8] python3-yarl: add BBCLASSEXTEND = "native nativesdk"
Date: Wed,  5 Nov 2025 22:26:28 +0100
Message-ID: <20251105212631.386242-5-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121332

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
index 6be8a6773c..6c2e2259b7 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
@@ -33,3 +33,4 @@ RDEPENDS:${PN}-ptest += " \
     python3-unittest-automake-output \
 "
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


