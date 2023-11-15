Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E5AC2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 21:05:59 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.24960.1700082356412964142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 13:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zy1lmoea;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5435336ab0bso196558a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700082354; x=1700687154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PT+AVIfNWArHCCLOPmLcLyboylysZkTTwn5CQdZ4CU=;
        b=Zy1lmoea9dEokjXOKbIdFCdca2Xne0YPPIHQBQ15wKG/dW++ecWEhduoGHAuvs23/2
         6dHomXMMoICjN0zWvutUeWCm6TtnQXlUB779A/GExJaZ3JQb4qtZS7NJEplNUhOBipAe
         foTTFZxEXkfgNxEbq8s4Ub6kiWJ+Ez6J2D4Qc9FTpt3G5rf6owc29kuVXY6mQzV6+rzQ
         VuiiA6LY4c62+3YDNk1UPzeMq7NbG/iMdTfzof0mmzc54FEVyHzl2+HhxaOss31pBDXi
         2aGjYlsNu0dFAZalZ7PFmN63+dQ16OB8jW2seoMcVetcCRGJuvDiu1vq1kZIRcFXDyGS
         nBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082354; x=1700687154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PT+AVIfNWArHCCLOPmLcLyboylysZkTTwn5CQdZ4CU=;
        b=lIhQ9dsrQc6HCw6vOOdNlKG3UnSZELCubSvvqNpKJdJHrlCjmYb0uDgmrxJQ46Hfyx
         AtMqDR+PxmkIkTcwJ0luFCM7CiabDY4rIELD+uVz8RbWDVFIrBtsE0qJ8L40b5RXZ+oH
         FYULSKdhO/nSaBitim0raI0msvIZmq9uhURrZ7uEW34rJumqPyPE/ZXSzxCnrIv5LX9x
         K3lObIUZTFh8LRf95FHhECvt45R65wx2aSpwtv7C21Gfb6oenNbI+VXqh3okV3uGSjKU
         LoY8BRdCZlSCsw9oL8+e5TLNTE04lGRi+sHJpuEhQNth8lm8ObI9osoW0Jklt9Do3nda
         Y07w==
X-Gm-Message-State: AOJu0YwkRmPEHc4o+Kcr5JlKqIQYQPu4OSqOqlm7zwatsQIfgH2PA3YG
	4NGtwTh8Y8o8lt/asv8AIUMlj/7Z70hIZA==
X-Google-Smtp-Source: AGHT+IEXCDmYbXlcZTLkqKsxXWMVoRzN8AAgd+oJwoJ4oQDb+JByhfI2Dvr21O0z4S4gDFUyXVD88Q==
X-Received: by 2002:a05:6402:50cb:b0:53f:a526:779 with SMTP id h11-20020a05640250cb00b0053fa5260779mr12353974edb.12.1700082354144;
        Wed, 15 Nov 2023 13:05:54 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id z9-20020a50cd09000000b00543b2d6f88asm7029098edi.15.2023.11.15.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 13:05:53 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] bolt: upgrade 0.9.5 -> 0.9.6
Date: Thu, 16 Nov 2023 00:05:29 +0300
Message-Id: <20231115210529.800031-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 21:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106773

Changelog:

* The compiler warnings caused by the incorrect data type declaration
  were fixed.

* The log message `boltd[123]: [93B blob data]` was fixed. The sysfs path
  will be printed when the domain can't be found.

* CI: Replaced the docker command with podman and fixed the DNS issues for
  podman.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-bsp/bolt/{bolt_0.9.5.bb => bolt_0.9.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.5.bb => bolt_0.9.6.bb} (92%)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
similarity index 92%
rename from meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
rename to meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
index 0cc9d8542..860cb8381 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
@@ -8,7 +8,7 @@ DEPENDS = "udev polkit dbus"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
-SRCREV = "5a8a5866a847561566499847d46a97c612b4e6dd"
+SRCREV = "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


