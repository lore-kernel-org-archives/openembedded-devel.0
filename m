Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CE2C83F17
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 08:44:41 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.37771.1753519478194271161
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jul 2025 01:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=flX67fZ5;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-455b00283a5so17856915e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753519476; x=1754124276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MirvH+4z77YGvivUk0/R3+xphQASmbYHuKJ81DRi75c=;
        b=flX67fZ598gG9u4ZT6ME8t6mEqk/dQq7hqH8Vq9axhOXh8AVYq1ijnQKdpAR5uFrpR
         4cB57ckSLDNPSF4VyZY0BHwOPd3oVfugEKYE4asZV9RfV7O0OU1ottuoR1gR3AHaMFNd
         hbAZpZXvmi1Ap2CZYdmC5dHp2wta4Zv9m0f7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753519476; x=1754124276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MirvH+4z77YGvivUk0/R3+xphQASmbYHuKJ81DRi75c=;
        b=Np2/7ZJ3EDwLpDyVd06UDW5EckNGlgN2P7aoZIabPrLDdubRFrEpsEf05Lw6vZdHIC
         Lp9YZ1pBkQuqMhsunZqksbo/F5H6PtTkIRwsupnkXB9VLvpF0/ycX9SvSGnLWtBtpMak
         c7b+82R2rT5QgwV9p0VX2vJqkkTC3oksz+zAut+7qT6MQtENVRfnwXatAByrTWVx32LX
         R1pjguQRnZh4JvVQWZinHkeRPBZiED3ZieQkOUc2FZmQd/RY0ytsCkcNBLDKwg/+kg/U
         EuI0aES4j0PHzPTEru8qWYNVL5qjdT43e4Eu6NmE+0/mcFxKGXiftfzUx5Bn3hlai3z3
         hHeA==
X-Gm-Message-State: AOJu0YzvKP07Ha0mxquRgyuv173u5QaF8JlMMKQ3F7LzlzWVeOKmxZFY
	YUeSmQGh1+W6e3J+zDFi5bpK+Ftdns4bMj+IdjzPMLol3BL4BN29WOSC7aQMXdcc6vI+E8c3I5f
	pOa2Hz2PIi/tl
X-Gm-Gg: ASbGncuM28EQcHuBCFTp/orjeaXu9/5qAV4enozi6FpcV6xZ1GP0uIRhIn6+ktPlmJC
	zvrdvZUtazY9jedoDhI4SnSKYmo5PoxUKl5HS1Kw75CwCnU9tRpS3fn8pRq1BNgtWX5sYZQikey
	kuRza6KFE8avEPG3B7d/OmuxoIjfNfJE4SZ0rKve+LX1yhRlXNB2Xjb63BbkI0SjFRaUVGpdbFS
	UMIIXVNoNCU1tvcpblEWl/ws5ZOMqbAWVh1elW1xOrMsGHdhs0MaPc2PwGWh37Im6wWWv6ai3Vy
	oxdqEpE2OyG8b/ejNHxlxho8wX6awTebFuoiJIn6a44Pzx1DiPZSncomtjupGi4LzoFWTapY9nR
	y07Y3ePVxVT9CGDMfyNOGQ+56W1e8Qfnvez7fqxNZfzZUg1sgmV1bI2/kylUR/CmE/R4mNMxkNT
	EBB51dFbs2Enjmfw0N8v1bTWrga0S3ykdyKRI4aqvh
X-Google-Smtp-Source: AGHT+IG8cE8g1dIim6VuzmNdcLbKk0tg96w9q4luGuixVlfCHRUmy/BlS04zcXHO9oV0tjU6YuxRzQ==
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr28453235e9.8.1753519476058;
        Sat, 26 Jul 2025 01:44:36 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb0591c4a400ed176bd93ed9ff0f.ipv6.abo.wanadoo.fr. [2a01:cb05:91c4:a400:ed17:6bd9:3ed9:ff0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb2ac3sm2227751f8f.10.2025.07.26.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 01:44:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] leptonica,tesseract: add native variant
Date: Sat, 26 Jul 2025 10:44:24 +0200
Message-Id: <20250726084424.2046250-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 08:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118739

From: Yoann Congal <yoann.congal@smile.fr>

Since commit d6736b37c3f4 ("python-pytesseract: Update runtime
dependencies"), pytesseract rdepends on tesseract and has a native
variant. So, tesseract and its dependency leptonica also need the native
variant.

Fixes these warnings from AB[0]:
WARNING: Nothing RPROVIDES 'tesseract-native' (but virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb RDEPENDS on or otherwise requires it)
[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb | 2 ++
 meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
index 2e1a3642ad..068937e6bb 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
@@ -18,3 +18,5 @@ PACKAGECONFIG[openjpeg] = "--with-libopenjpeg,--without-libopenjpeg,openjpeg"
 PACKAGECONFIG[giflib] = "--with-giflib,--without-giflib,giflib"
 
 inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
index 4bc0f5b88f..f01cf8e138 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
@@ -18,3 +18,5 @@ inherit autotools pkgconfig
 FILES:${PN} += "${datadir}/tessdata"
 
 RRECOMMENDS:${PN} += "tesseract-lang-eng"
+
+BBCLASSEXTEND = "native"

