Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52287EC873E
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 16:08:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17232.1694102923578578538
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 09:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CY1X7iP3;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40078c4855fso12578965e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694102922; x=1694707722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kouZntRLzd6joco1kpA+d/6kpDk2tRWjQXsMmxC0Wp8=;
        b=CY1X7iP3T65h3gj1FM7Ce7fOSzX1ry/oT4GV0vwa8L64xfl7biRXABNw9tPeSrpesn
         2tkU4vzTftCY18ljFmRWz/OESpKMdeEMx6KOeEb2yhmQfAOaTYqwvkXyG/Hmuqq43hcV
         zpCQGwxzalucKGl0csXWxwv7Oz2VqsM8ecFK9DctcX2/6J26RCEnR/lgLBMq5dHWkt4j
         GreONNKsdFSvOvqKLb52mXbGaUWw4Na/b/qnvOsyMU91vimz5jnlcOionaujOoqL72yB
         DfWZV/EhbZ8uXzVCKSrKgBO5UC0AxHj8LAJS0zGMp86WJB9ELk+cFbWB2iVcRnvQttfe
         3ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102922; x=1694707722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kouZntRLzd6joco1kpA+d/6kpDk2tRWjQXsMmxC0Wp8=;
        b=D47VwqPvUypeT437BCLMEkaURuu1r6dYx3eFI43/nt9/4cAUpKE3BcKgOEpXjGnL0p
         8VeYZ0a1SXFG22fDuWpp0BHkGE+uiE53tnTmTuSOZGjPqmZ9CzPjKJlKytroCkmI4ASR
         Txar8ekUKeD9RE5S4VbKYCpUKGsJAgpu7c7xI9alC7Xeh3AfN6TxG1qxz/ndGcrhIw6A
         sax9APMSy8CUdqY3q+/YZUAYYSHFdj3463eKEhsmrxvVaoUxNkFJCcqZcCdICZCdd1IE
         bMKOl/sxte1Us5xh8HTGfnCz2LYSDfMzSSjjSl0tHUbsJ+deFCGHWcUpgIblWs8k5yGf
         7btg==
X-Gm-Message-State: AOJu0Yw5NWdpihM5fR5+v/t8x5S7CpRVJiREb2nFWM+pArB2gh3yeBPu
	hrAWuoy4EAhp830u9FoiYqkby2vKCBs=
X-Google-Smtp-Source: AGHT+IEFxqZytfk+7ZJWTDTBRjsCKoyY0rLqtuyvHWKKl7astPUdA037HVLsCRrYZadwdqj1MfXxpw==
X-Received: by 2002:adf:e705:0:b0:319:52a5:569f with SMTP id c5-20020adfe705000000b0031952a5569fmr5255208wrm.11.1694102921799;
        Thu, 07 Sep 2023 09:08:41 -0700 (PDT)
Received: from localhost.localdomain ([5.13.223.14])
        by smtp.gmail.com with ESMTPSA id a21-20020a05600c225500b003fed78b03b4sm2912360wmm.20.2023.09.07.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:08:41 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 2.28.3 -> 2.28.4
Date: Thu,  7 Sep 2023 19:08:27 +0300
Message-Id: <20230907160827.232870-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 16:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104792

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
index 4626e400f..80ec8a5af 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "981743de6fcdbe672e482b6fd724d31d0a0d2476"
+SRCREV = "aeb97a18913a86f051afab11b2c92c6be0c2eb83"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.25.1


