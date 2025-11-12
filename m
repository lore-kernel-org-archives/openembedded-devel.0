Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61501CD37BD
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6236.1762976160195133021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCDmlQGc;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae77516so646965e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976158; x=1763580958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6JpNkOg8SjL0wg5zLEbzIP0qgU12jEO0ibLrJxBRL0=;
        b=YCDmlQGcDeKtxC7IrPomDaX9nMrz4IgJ1iCwFY7O3SM7QBUBZro8zcEQxlbpTf4uQ8
         IAAA8IhtHGufhfKrP6ucKDDxovUFBz47KATE1kHE4Wpr8lbUFMloW6CjbLmfR8Kio4Ko
         3RXzbpxPshnHUUTO2pN0kkt55LSnQ+wMWVf0EE/gPwjLHP7Wjvd/GQekPY87wN5DAk9A
         IebTdSwINmZTOSFaKHKkxjJcfb3YUVoo65MmQDXyuV8ieopbbPrNbqNvZ1lhIHbShKtZ
         IOWcTRod7C/+W++0rLutqYdbvZqnCK0+iVlmGWaQGipsx8jKg7ZaHU/VCb9TKeDYQxnq
         B3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976158; x=1763580958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6JpNkOg8SjL0wg5zLEbzIP0qgU12jEO0ibLrJxBRL0=;
        b=kRccpDQwWDQTIAQk91sMjkSnvU/m3aI8oMU1ju9C6GMgEvIMWKVG4q3mCextLPspA1
         m4+O9W6DvDNI5ko+iZM6z9m8Bx+UqIYqvUv72+d3IceGO3FEV33ddAN+oqg9HD603idl
         HdbJf//TdlflaN+Cmlr+8+WzfCmeC+Q20jQoL6md3b5CtpRjoNrvMd93x60HvGjAVLMl
         mSTpXYdnkzY/Yj3pNaETRjkLITSV/p5VaHMWPnw4ZAOSSPLc069ysTBYlrGsClTrkwFZ
         qSaKnfe36dyQEi4DeJQdz+p2oYVLSagBXOnOiy9wrAr+Iiy/I13h8e8K2w9PAfsD+YPJ
         cwzA==
X-Gm-Message-State: AOJu0YyhX4X0oPXur8qgvRyJMHt0rkTR3Jqv2KpCy/Bt+ACwzV855J5K
	+7A7Ow+1167q4757SQJJtCiG/MIRXob4IKwOeHWyzdqSZjIngkz72FeuZvt+RQwM
X-Gm-Gg: ASbGncu28Cvets28lY14JvAcbPHWIoVzDAW2nIdjz2AyMOngjT17DVGDL2BzOBr5DIr
	oQ/xGoS406+F7kD1PZbyBLYdZ8Cbiczekb9FEBDvoQCMd8LcNbY5ZhJW8WwcjKXE8qv5vclbYiO
	X8eTwZywedtAyyMnFXo/Vj+fJ1bFWhV4FbmjVw2fCBEqAMza5UaTs3Ho8IU1/jZP0KMpxxc0xqo
	+VL7/xUibCG2g9DnXjC7NenPZYT2YiIXTo0W+i+qG+Kx4/lYMnCpJYvuJs91WWPHjbULUK9v2Jq
	5KOnQMyhnR3cqu+s5IK/8C0qrev/hYNYiVABw/HNln1aTNZWsGzWaz1XzFz4Ci4tOT8m1f91UtP
	+J7p9YYBSFMN9bXm6sGwkJqb14jPeqx6LtvFb3eBG6ut4rO5W0YHTnzeFj6yvd+6ZHRgVlFIozA
	==
X-Google-Smtp-Source: AGHT+IF5VkUfL2SdlT1ExE6KmWln/COwFpxjMpj2p629lmfs1soiqf2ARMaWIfft5PpIWpWmFmMtKQ==
X-Received: by 2002:a05:600c:3587:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-477870450ffmr46846895e9.1.1762976158509;
        Wed, 12 Nov 2025 11:35:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 20/21] python3-behave: update SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:40 +0100
Message-ID: <20251112193542.1589821-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121581

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index 1dcc7d218e..caca282707 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
 
 PV .= "+git${SRCREV}"
 SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
-SRC_URI += "git://github.com/behave/behave;branch=master;protocol=https"
+SRC_URI += "git://github.com/behave/behave;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 

