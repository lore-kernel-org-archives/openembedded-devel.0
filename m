Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48BA108B913
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:04:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10986.1774008239878907509
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gamJuZns;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso16243315e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008238; x=1774613038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCHHxwMnAsgW+54NSX1gj1fT9CwNXpHBNuZe02WOHmY=;
        b=gamJuZnsFGB7r2GMfZINN7oN3PcFqzzsVjfQKjVdppsStLuw/NQiLBlw9Knur8x37k
         ipSCfmdECn2KYcZF/DuqBk5tYU3TyecRQIAAyXH8aYifAa/mNIhdMmYSPWmMgY8EXNTx
         GX03fcz0jtYbPvOvu464Jk4qDVIav4swIZDl/6PrBDVNpkbDZ6Jlma94b6u3klZceLWw
         yQylFjvrVIKeRFMn6qM+gdMNUllWVOb9eecvC6i4L40qc0/Rp+NVRLnyyiJrw6ixVJaK
         zzoYYTyuVmuFZeZzxDZrzblJfEH2+KQ/7CsxBp0tAOV2h4w9khZ/iJD/4qcBUpodaCGd
         fCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008238; x=1774613038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCHHxwMnAsgW+54NSX1gj1fT9CwNXpHBNuZe02WOHmY=;
        b=XQwGhGwCdQiSDga2D7VA3gi0vhv1edwfyWG2Ve2+wqj5v8WgRR39Sr1p5OHubRfZjv
         BotvOo8VU3M7pLBS83XCwdGCVXMJS0NZ1xb5npbduNl+ApM9jTuOs7Dv3RofO3B4O9zJ
         ELY0u2Be6LnF36dd4qfYE9TWfyBjxDJ+fWRuljZz+f5i7mYo31+XhQEY4bpfmyZkQ32V
         tvV6QxPGm7Dg4jtGaDALdwlY3S+Sxw4I0Qru+W/65cNVdQ0FOwJDGXT+8/BofKBgK53w
         tFIgziaOmV7Q0iwqjgMqDzhT+O6qDPLp2mnWGEzLftAYRwXwHosV4D1Cbc4+4EWrgTtI
         DuIQ==
X-Gm-Message-State: AOJu0Yw00htxxWoxrp+dmTRWRNei6RNgG7bvgocuHbROsPQaTAyYc5r/
	I7FaMGBJ7tnGSKtUNU4mRe/PhP/XXadgRGdsAPmnzPsaOv0UEZjlAfHB/UXhMg==
X-Gm-Gg: ATEYQzzMTxGV0/1dApacV7oQxCJx9cE1JZBHW3QB11U2+lmIJaPxjkBxFGlVJNRHXJW
	fIg4LOn6d5c7vsRTZD1ttXt/mHqdH1IiKffD0YVAdxZW7AUBbFEK83f1HVxC8/1CHdgbOm3wSkF
	akdhyD9xNNw0G6vS2OAp3xtoa2FX5jvKeWWxlztF70UDP+luaGoZ1lm96+uZZ9GMiGQPaKbS55L
	c9j33tko23W+blA2CBvbpeZwAOL48eFx4OAbO1zVDrIFSGENlsX5oU/7PetEzg/X3vxY9JcWKcF
	VPlFwkXNRwC0x0PhiPBCLMzq7esxT7Rse4Mq7tAI5cLjF+3IQeDFAwv3Dq+rSu2JH/FhZB8vl8l
	pZ+WRspiv2FUOM8iPTU7HN2ArJ+iRp0kPkMeeedu1vBuu30ivA13OzXCOkMIWyZ8rlUKESsCoom
	n4e25ifGswJfE9hOTUAzsyolTSS5A/JGg=
X-Received: by 2002:a05:600c:4705:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-486fee0e2ecmr41205115e9.15.1774008237945;
        Fri, 20 Mar 2026 05:03:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm6258558f8f.3.2026.03.20.05.03.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:03:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-lief: drop obsolete CVE_STATUS
Date: Fri, 20 Mar 2026 13:03:54 +0100
Message-ID: <20260320120355.2973635-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320120355.2973635-1-skandigraun@gmail.com>
References: <20260320120355.2973635-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125437

The CVE is now tracked with correct version info by NVD.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lief_0.17.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
index 69e1d59956..fe954e1b32 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
@@ -13,7 +13,6 @@ SRC_URI = " \
 "
 
 CVE_PRODUCT = "lief"
-CVE_STATUS[CVE-2025-15504] = "fixed-version: the vulnerability is fixed since v0.17.2"
 
 PEP517_SOURCE_PATH = "${S}/api/python"
 

