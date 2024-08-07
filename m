Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A14C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:14:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.33066.1723036466319642817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 06:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HR/EttkZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so12172125e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723036464; x=1723641264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVJtuX37YYei3FMlwJHhOHA8n/h5es6zfqSdhe31nMY=;
        b=HR/EttkZLP+GhHXJN5jrjSGmKNPiIl6WvLg1s+zDDydeyAJJl6CNNmuUsPGIteDZ6I
         F+oGW0XomIFJqRxgSiuEe5NkZsiqMG90ecGSP4iFKG+y9CPCIk2sla5jnCQrQEev0iNB
         VnbW/c2EuN7c8L3D0A2NQs1v+Wxo/rg+CbJ+dGLQ9WEQctC5uydiQDG+e/3jUNWO6ezS
         erFChtjTvTklaOhdvr0hDruzq29IS4AssLiNeIzbrrugEb9qInwopmUKUUc3RRDRfVF6
         +D4YaAUYrQLiWMsUG8nn26MHFxHKVTy5lY9ryzYFHRTgXgTmTy9qFc1kYu5g0Jbi0g1r
         8MbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723036464; x=1723641264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVJtuX37YYei3FMlwJHhOHA8n/h5es6zfqSdhe31nMY=;
        b=XuTIoxjcTITt14f2/88E2ZWZz8igQQIFfFEV6ouuF+SwpGG1Ns2NBSrcpeS3anK4RB
         hpRNI/bTwvKQB/Fkv5j908fTCnCYrhoy+WEOKt2/zKFx/8jAlEaLpqpUDJ/0BA4mvGGU
         p1GPvrfvuAB2abNQ9fgXrIQgYSMdAKpErYHxp9U5TQzYnh9d6fh9Z4DbF5hTcGSFzxQz
         v1bnMHdrIzp8mFHKAK46DTlzwdMO01YvkD40J2mM5SNP42iRtJv0k9N89Y4O7FC8FEec
         2lssaOjyOoq7SbPbLb/nBVn7de1nre3mfXKVn4jXXc91lnG3sUAFZlEoxU7BcLWCUGXq
         083A==
X-Gm-Message-State: AOJu0Yxjim/aFZafF/M7K+xn8ifm+8jccOh6TimQoTUSuG4FbTzKJlSs
	pICXIRpBA7NKoZGjOOik7YYWY4MeyuboKmlddRCsvbctjJXOZTCPa9c2Kd8+
X-Google-Smtp-Source: AGHT+IGFK5tgJPFEkZH0dgK+pB+1MapajUUhKh7Z/F05ROMWTS+fbYsdKDFqcb1u5IXOpHMrSugpFg==
X-Received: by 2002:a05:600c:4713:b0:426:5dd0:a1ea with SMTP id 5b1f17b1804b1-428e6b7f3f1mr124919385e9.28.1723036464142;
        Wed, 07 Aug 2024 06:14:24 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd06d841sm15872913f8f.101.2024.08.07.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:14:23 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2] python3-qrcode: switch to PEP-517 build backend 
Date: Wed,  7 Aug 2024 16:14:19 +0300
Message-Id: <20240807131419.150841-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 13:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111634

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-qrcode-7.4.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Misspelled subject in v1.

 meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
index 204f4ecee..49cf62860 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
@@ -3,10 +3,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
-PYPI_PACKAGE = "qrcode"
 SRC_URI[sha256sum] = "9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = " \
     python3-six \
-- 
2.25.1


