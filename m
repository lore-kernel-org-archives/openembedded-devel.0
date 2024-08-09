Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6840C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:48:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.87182.1723218523238118026
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OPpcXEfH;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-369f68f63b1so1226644f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218521; x=1723823321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFiSQMJHI43oqNyM1bAf/PL4uDDcDnsyq+Tkj0NRVrc=;
        b=OPpcXEfHuYe1xdlqtuxL/vxibxt7aiEdJgrO5OmsDAzv3N5LGcPyZHeMrXQK7y0pau
         MeBLrs5KPGw7AmLrLcniFM2V3h87/2GMfvEW5J42tdsPy/KdTosqGyezv0BvyVJDQgQq
         ioKnhbb/JcHBDt1dYN49zJ0zH+OQdp73zaE12DRoz1jR6BQ+TwFiWF5p2CRPByHsAFe2
         KEDsDECvgqefOGrg771UF4lEdrVWYHrj5Fw0GPLe7qiUArtC6RZn0h0ElYioIC/gqXTn
         OJZy6urSEw9AUe5WDvQVDyhsyeJYaAUppqhYerLVVVHh8wx60FMlp8QseJoForAtCvVu
         I5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218521; x=1723823321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFiSQMJHI43oqNyM1bAf/PL4uDDcDnsyq+Tkj0NRVrc=;
        b=rYiEQ3VM40EBcvX3xlYx0vxOyrqJ6kw9+oNRTvG/nf3BBL1P4OYFwGBlxlJwTimVX5
         O+mkQ2UHmgGY63GmVjlEMlAhEys5IG4wmuiF0of+K8mPgSG4OOKQvTWcoBA1zOBOU+W7
         NVJ8ISfDagtKkXqsgfuZIY+usoi7UMrdOXb7GWgdmsR0qaKbfb2mfoSEs7K/OlM64HjD
         3jxM3XZ3fT8+gZ9ad+GyJYWIS8ehui84GxMINNgScmcYLORr8i1R9T4xwcJGbKAv0zpy
         8reQl6IXiy0mDgMLsNIa9QiuGMlvcvkH/E9KZM6bSHdJw++ZqcUtOrpkyyafiqIv2ecc
         MOBA==
X-Gm-Message-State: AOJu0Ywxt+2ZoNBiUSIsCkjYefqcpWeENOPfwT3GKrWPMESfVHfIyY0n
	PgCxaZs585BU3ptyQc1cXj/5skYBuMxgjy+gyn3xVcYmi0V08n/FWtZi366e
X-Google-Smtp-Source: AGHT+IF6lEh36R0p9dJcABjIn3oOfMHalrb7Fj767qiLUioIUwYr60O8TtzmKs0hs8CdWnmfOgu0dw==
X-Received: by 2002:a5d:50ce:0:b0:368:6660:36df with SMTP id ffacd0b85a97d-36d5fe749d2mr1455131f8f.35.1723218520881;
        Fri, 09 Aug 2024 08:48:40 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:40 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 01/13] python3-service-identity: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:18 +0300
Message-Id: <20240809154830.14927-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111697

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-service-identity-21.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 006fae290..267bbea13 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
 SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
 SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.25.1


