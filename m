Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5391DE810B1
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.13272.1695804172335178684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3FwVpSP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so1182105e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804170; x=1696408970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjkVn+V4RtoheDFfgX18yaQOeof5kEMsufqHi6D5v2E=;
        b=h3FwVpSP/ZPjSunfF3l8dsegkh2TpiAsneEPDpxwoFiXrtSmwSYR3/A22jtlvFpp8w
         SoYezqTPjpDXK8S9620uDQ0ZlzD2hwUvfjd/51p5brSFUa0Tc9qriFw63duwB95drnnA
         saCsKAvrdrU+jqzO/fEsYEiD4H1+dsZyuGsfLrKPw/1cIwYhfE+OWBJpX3frBql2PG2o
         4D4OYafTZGXdOnTRSkC9YVJG1yN1IAhX3zEF6kC9vK7rcxU/f6s0vkTN4czokum2KsJb
         AuAe9QuV/i//CRqap8bkzj4hjl+ItZNDEeINd/xmPlfVmGSOIszPUBwj3T3znwolES9M
         VGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804170; x=1696408970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjkVn+V4RtoheDFfgX18yaQOeof5kEMsufqHi6D5v2E=;
        b=YSt1pQDKYHfBSIBaU4V22D4Z2Dh6IrvYXRa00Q2BpfIJvz/1kI1PCjIifTR7C7IuNb
         gVfLUDhdsQnN1VFCtBf7y/cF1iusw55HebEuk1z8kykALxsHG6oJ1arkUMKa2pbFbch3
         8FzB0g2/bBAJ3HIhjDCxewum8A+iuFPDnlecbwOsvUlHbIHCApn34EyVyh+8zfTfLjPg
         IrF1rGkT8xcuQll+yI6DVv0TxPTCupk12gZEu3rQsfcKGqqKdbAz2zvkcaIZEiysadV9
         ezx4KsRBjnOnyWWUtEBYXGStREMegfz50zzL7aMw9ip327mzmwdsLOX2wHybJC5Cm+Yq
         hnBA==
X-Gm-Message-State: AOJu0YylpMX6PfK1pJfcehFs6yH5gZ0adyjJHtUtNNvvNmUoLHguqNR3
	fN6bRRcLjFfDffQe/W0OAv/KJ+MM06A=
X-Google-Smtp-Source: AGHT+IEYj3+nYE7IjBwVETz0mu8DCs+OB+ip1m6ikgpMF4tqqQkoO6veR7WOQMEmahHAM9vBO2fABQ==
X-Received: by 2002:a05:600c:2252:b0:3fe:4548:1892 with SMTP id a18-20020a05600c225200b003fe45481892mr1343484wmm.16.1695804170096;
        Wed, 27 Sep 2023 01:42:50 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 5/9] etcd-cpp-apiv3: upgrade 0.14.3 -> 0.15.3
Date: Wed, 27 Sep 2023 10:42:38 +0200
Message-Id: <20230927084242.1195772-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927084242.1195772-1-peron.clem@gmail.com>
References: <20230927084242.1195772-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105180

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../etcd/{etcd-cpp-apiv3_0.14.3.bb => etcd-cpp-apiv3_0.15.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/etcd/{etcd-cpp-apiv3_0.14.3.bb => etcd-cpp-apiv3_0.15.3.bb} (91%)

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.3.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
similarity index 91%
rename from meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.3.bb
rename to meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
index 71744026d..d724abc3c 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.3.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eae7da6a2cd1788a5cf8a9f838cf6450"
 
 SRC_URI += "git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https"
-SRCREV = "5e2884f36276e44f683fa02fca39807716fdbc16"
+SRCREV = "e31ac4d4caa55fa662e207150ba40f8151b7ad96"
 
 inherit cmake
 
-- 
2.34.1


