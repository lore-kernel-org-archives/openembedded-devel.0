Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759ADD5CC9E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:47:04 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18627.1765878418692074009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lyj5aME7;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so897622166b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765878417; x=1766483217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkzLP4qrB1OraF/UlSKyY4uSpexAC2N9NTFoQ3t3WR4=;
        b=lyj5aME7bIJkTeeGJiBwm47ae69ipRWhyJy3LvqnbfG3Du3JK4A+htugg4lrn/mOCs
         oyDlSn3ZTX/udx2TPHE3fRXmHkzxS8zfkVWbo0W83phELS39NuWyznhWOepUKQmvOyHn
         hsrZPJl3RQYxrN5nqw3nwqWpgMvnSnn2qRg/K8FYIRRvsWpylnrjsKxxOM9AdT/Rt84e
         yTR30k4J/4x5JMGdHe5aH4Gwi4OWFh70fptDZL0iYX2pLVqpazmaAXq+afpqsse3kywD
         x8kLBGlYgwWQr7+DNc90/aTdg4j4TXBq/D2JKmSblyz51olnKzbxtHgSr9Cnfv8j9T5N
         Q5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878417; x=1766483217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkzLP4qrB1OraF/UlSKyY4uSpexAC2N9NTFoQ3t3WR4=;
        b=p5R3m9dbW6+ziY/qp0Im2go17Va++M8F+0RG46+VfEgvwg2A1WD1iwwuZPSvFfTcSg
         8A+n736/TEPzA7gx9M19D+9M/7n/CD+XYcQatiNx2iASlxh1PCWoZjpFucjazPfIx7pf
         YqNjCbnICmG+nADvAzCrmC0NzEzM/yyRRrqX/54wUOAaxvT+3Twn6ad2PXdi4SP6XpbL
         X4aGm+mzNJ6/QeEd+bZtQVRBaqipKG4Y1h3462dpiz8JhNoqNrR3KbQIW+xCZO1XfR2H
         sBvpQqcAOqroEEpJIIH2XPZwJzo8KFg7QPfySRt9C4rNpWu3V45ZTdMXop7KYpfpy45h
         EhvQ==
X-Gm-Message-State: AOJu0Yx6lAtCK9TLAv2RJfKFEi/tx+GrN6k77SLAwGRPRKk38KtmlhMu
	xEDFZ693nF6eRZ6NgqJ0ocpkdbmNJUQri6GGRrI9U12UEWV11uI2GMbXmaY3WA==
X-Gm-Gg: AY/fxX7vjW7wWD+nH/OVkkwllGnbZsTyzD36+OWpGr4wroIHAhpL0GmRRiDdMBhGlW+
	szKfM1t356BZT/BEIP8qQXUCuym8Eo0z3ZXj2seeHqWDEP16pwBrPpo+dlKyvMsFePHQ7acdR4M
	xbMBfXriCQWxjbiiZV5E2lozjAcWrpByC9bSS0IM9pE+dDIWbQXfACkEzI3D9SToLRrDoevFFNs
	vS2u1ugyzJkG83DYHQ1k/LXwwdZOVbo6yCzx3XIt3laUw/RTM99m6mXhV0WAHjMahynTZNhRnTn
	eurJTN/bxjqZRJqcxU2UR2UyUZ3mUSjC3d2LYTIrKJqu7JtRiYcpAJSL6b62ptWKXirtbtsJi2y
	GjmlMntXERUkU/aIp6eNEyRfgayhVVK9ZF2fCsGRcpecROfT9/l6jEqi0KGYLVo1JkChDtAzatI
	w7IL0msL5ISGnan3jil4yprt2zzGTTLLDp+/K/T9jBaRL+OgcbdMvw1u+j0602wO+T
X-Google-Smtp-Source: AGHT+IE81x3pYna7z4Vip28bwKjnxVY/959UucUeA5jfq4EBc7AyL9b8gxE+Q/Kui85tzIMkCkUGDw==
X-Received: by 2002:a17:907:7b8a:b0:b73:5c12:3f8a with SMTP id a640c23a62f3a-b7d23698224mr1458698866b.18.1765878416418;
        Tue, 16 Dec 2025 01:46:56 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ff7e5e79esm99872866b.46.2025.12.16.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:46:56 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-async-timeout: add BBCLASSEXTEND for native and nativesdk
Date: Tue, 16 Dec 2025 10:46:53 +0100
Message-ID: <20251216094653.2704060-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122691

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../recipes-devtools/python/python3-async-timeout_4.0.3.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
index 3d35780b65..480d4cb02e 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -16,3 +16,5 @@ inherit pypi python_setuptools_build_meta
 RDEPENDS:${PN} = "\
     python3-asyncio \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


