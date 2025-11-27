Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1C1D116F5
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 13:19:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18176.1764249578456645814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 05:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rY7Y2kmr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso4854565e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 05:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764249577; x=1764854377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g01F6sU1yu7NsMRcaFwizzmeOttzQ9RPLw0xezjjYn8=;
        b=rY7Y2kmrS3YhBZjwrSdhFlZ6Yn1P+QMMrIaywHY4ylI+9BYTgCklVQO34PWYXPwlGy
         94TAD6XvsNX51eRTESj0+OwSSDzP4kwnw0X9CdufK+Z8SL0JUCCCbe1/AQ+pToDTse6J
         xfZJfIH5nbmXNn76yrjFr7wGTnGFvwr+N7xiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249577; x=1764854377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g01F6sU1yu7NsMRcaFwizzmeOttzQ9RPLw0xezjjYn8=;
        b=DkF2lsmslWyiXmmkES7HVAUgJhIrk/+My8Gd/n1BIfzudeJ7yYNv7HtblGw57WNK3T
         4qeSMzEXdxHUHqpEkpejUVDJHDMFLerbrpvdvEOpyeL9HFPB/7+p7MNW6qOLKLi21QHX
         vGSzAAZO9IyS4c9vDrDHfx+slvd0lLE6r6Sc8i9JmZi3Sr27TSjpiRRbuKBdj0GLHCr5
         aAnGT/s+xMfwL/qoYSLNnWsdCG00uGWX5HGU6snssvfDlOuPlXj04LtaJFuS7oZujAPH
         JzSYKQSlC9ToFdvab2juydPoSknvMz7CJ+qsEtOjelLij5WCj47AiJhLuEv6lZx5jXjf
         j7+w==
X-Gm-Message-State: AOJu0YyhwksaBHqn4QwzO4YQRkX6BO+Gcq8DjRRu1au3fqgDRjPaYycg
	NUPxvfhkOEpiBVRqToksb98/oiqxM3amQEI7vpMcnvnyGWNvebhebqkscG/8jYdyfOEpBBvsyR7
	KZnyv
X-Gm-Gg: ASbGncs5ynth7B+uAKmCOofDokN0FfA1Xyc1dp1MpX3nggRrgeXhLpFUJ7V5mkI+MFa
	d4NYAVYjQ626YddR4V7KT3Or6j26cWgCPxV1MCuUZS/+gvyV3va7L0NXq2PBw2Oz5xaZEvff0mY
	Nj1QASMHqHFDFJaEgVjKpeJx7/9ZbosZRasZx55/+jNOHJjIciO3bwmG8bjqWGYXom98r0ttefw
	U1kERBqJPI2Xtb9sHo6BkNC+88LcU/i+lSlHZXg+oKSgAwcCNeR4CZSwZ+q2a7cbklPZtefC01p
	/0JIXegdi7U5axYUU/FAGxirt4nghXzgIId94Ryv0C4ct/aYOmJMG2bpWPNkoA+EDSJ1MF+WqQr
	jD4+V0PzJAP1v4TiZ0NzvRi597PN0r/WmYzbeLEDs5ZEYL/51K8WlUT1ta2eb15/2jmviFRctn8
	X9Pu90pXwag62zXB8Uf3uzKun4
X-Google-Smtp-Source: AGHT+IHK4hsUMIzRf2VNiTmkYi2/CbLtLK7Ma2LlVJcRcpGsU/WL1ZxrpjUj9tU7FXszv92+pDMNhw==
X-Received: by 2002:a05:600c:1f8f:b0:477:a0dd:b2af with SMTP id 5b1f17b1804b1-477c01ea502mr200762875e9.33.1764249576458;
        Thu, 27 Nov 2025 05:19:36 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm94305175e9.12.2025.11.27.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 05:19:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] openjpeg: Add nativesdk to BBCLASSEXTEND
Date: Thu, 27 Nov 2025 15:19:32 +0200
Message-ID: <20251127131932.1256234-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127131932.1256234-1-leon.anavi@konsulko.com>
References: <20251127131932.1256234-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 13:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122107

Add nativesdk to BBCLASSEXTEND because python3-pillow requires
nativesdk-openjpeg.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 23f46c45cd..6d7d87f5f1 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -17,4 +17,4 @@ EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/',
 
 FILES:${PN} += "${libdir}/openjpeg*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


