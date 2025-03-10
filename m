Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09971C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:23:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.33384.1741597682704862857
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=puFep7fT;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso4058315e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741597681; x=1742202481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9n7URN2wFZMusPbAkmDwl5Ws/Qi9245hg1x3OJ+JTI=;
        b=puFep7fTLJn9Eo+1Tu3WQAW66jzBya5AA1DNGBI5x44wqWrhyE+znHnz4TW1XHimOb
         URCsIvpP72yZkuRrdQb3RxYH/XoqhDyivSsnWAF3KTOfWzGnp5KNwBGeRJu9mbqVrexk
         wB4Of5PGv1DxLvxWV7bvnSY+dj2bM6LhjkA/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597681; x=1742202481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9n7URN2wFZMusPbAkmDwl5Ws/Qi9245hg1x3OJ+JTI=;
        b=Uv8OJG58YAw7yfPq9f0EOvtaGidDh5LKQJGNOqP5Cz+hMSAcepTWqtVjd9tz9vLudW
         V+D4XhxO7cjPQIXbDk/uNFsOZF+Xli458ZUd4AM4vvfHGhlcpKIpZR2dHM1xysngRbXI
         uL22+v+ArlqzTM3uhjtVkGzM/kvQG80jkrtptEPVd+VGRipF6yVJ/+UULE1CmK8Mekgq
         U7OA7M5TGgOpZKo+LnsdRQNxR7iwzSkMO/E6jt+DBpgU2v/dzP0P7sGYkwPmMxJzDhYM
         2YOw4/ULdbaW5QWspHPfS/Wu/3ZMUGXktKutHDQi5+7d2PsIyC2+4y1zeEW+5DaVMZve
         B9/Q==
X-Gm-Message-State: AOJu0YwwuML01qipFY2+ujJNbN1DqrXbgvbrzs0EXwz98LL8oiIpqqGf
	2o0PuaGXwOY2y2kpWIAJWd8Y+SYqofcMJ3mgTeNGfwLrCgdb6jITFtCcI+F0sy+rpHJsiRWhM7q
	9
X-Gm-Gg: ASbGnctWc0qLqGC6H+BD6l1JYaTcpv2s6suvOCUnDrEDfURfFHuR0ZBaYV0RlmezciB
	EJ6WLLSK+JnqdFD6BXQDxeRiicGGT2YC83cwK6R+fXmk0Yh3nUehp3uFMOLDokL5sw99kOuv7Kc
	loWP3OjKeoTRpfmARixDdZM5RHynqrM+jOX8Hym2DqfyIRj1HmUBDjmUYKz6hzaM1zOwoM214VH
	bmLLqOGgq1k+JlOIgyjSQVLtpSoEYDQ07lOP13jmG0LAXqZmSH+h13pQuPv+l1CnsI9c6i84zNm
	2SS9jX4gkGfbylPYcnnbCLJ6xt7py7CMq34N6LCGcW7tXfK9xHn01SDhR6Prp28t3zI9Z8SwOXe
	QUiPfDmft4MA+BUPX56Htxs/PiF87Y0y062+9l9pJhBOK2Fr0KdEIhQ==
X-Google-Smtp-Source: AGHT+IHrgRAxOpCnFLJT2ZwvctTVWeOfsZzpHe/zy6863ylNcJ0UMIlQYsm7x7bZ1HsA4bJ4TMJ6Zg==
X-Received: by 2002:a05:600c:3ba7:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43cf4b3b345mr21673475e9.6.1741597680876;
        Mon, 10 Mar 2025 02:08:00 -0700 (PDT)
Received: from FRSMI25-BPYTOP.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0193bfsm14440776f8f.55.2025.03.10.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:08:00 -0700 (PDT)
From: "Sofiane HAMAM" <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [meta-networking][scarthgap][PATCH 2/2] wolfssl: Upgrade 5.7.0 -> 5.7.2
Date: Mon, 10 Mar 2025 10:06:53 +0100
Message-ID: <20250310090653.2985649-2-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310090653.2985649-1-sofiane.hamam@smile.fr>
References: <20250310090653.2985649-1-sofiane.hamam@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115832

The upgrade includes many vulnerability fixes, new features and
inhancements, refer to:
https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.2-stable

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 .../wolfssl/{wolfssl_5.7.0.bb => wolfssl_5.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.0.bb => wolfssl_5.7.2.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index 119d76abb..8e86b6296 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
     file://run-ptest \
 "
-SRCREV = "8970ff4c34034dbb3594943d11f8c9d4c5512bd5"
+SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
 
 S = "${WORKDIR}/git"
 

