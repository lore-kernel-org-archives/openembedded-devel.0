Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0118AD3F285
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.29985.1729278830070942196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=af0fxBSc;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: schonm@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e6075cba82so258069b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278829; x=1729883629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVOWfCeUeNiAC/z+Qjvdwzv+TLU5Q3PCI7e1ipnphiA=;
        b=af0fxBSclkFbgWY1v9tZ+ttsR8YQwGQDGdf2iNfZqOVRQJWh1oKHKX2Ii7fQPRKehp
         qbW2qjiNveSfDt8XI1ovm1mwMzR1/1FNLhhmvAO/LICkgrhdHJNdi/JkNe+nqa3fxdA7
         4VkDieVzfLy/12ifaAgZVFfJUYCXMaAaoy7WADhfh4BTpVw0nGNdRRGP57KXP28iXrr2
         F5M0PCFszbIDv4EQq5gzGliqC3RcL1E7Ivez5xGMNZfV6849sn8rTbhp9+cTGCFUJ6Ij
         OuUTsnJ5aB68QrhZoQDEBHwDHdtj5Pz6lfu3WlE+9cM51LrCU6xTJYQT8JLK07NKLftV
         Kmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278829; x=1729883629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVOWfCeUeNiAC/z+Qjvdwzv+TLU5Q3PCI7e1ipnphiA=;
        b=LBYZA9r1GhmqElgVgCW6sf4mioJu2Y308oYgkH4Wd+quM09s4p4YP8spSUKzB7jeSb
         IWPEuu62vPGVpaeyKXS9TOmHnkwW6nM9A0CTNn/dVs5AObZN26UsYCnHRLst+qWY7vZw
         Z2Y3iItyrZm76w4EoP4r9WNR9kXyFNlRRxYXgxNZ7himAOL2V7HWKi/sykXmecsNcD+b
         ENpEp3euPcMyzTLzi2Lzg8DfDgSv9Xxfkw2hhIF1ghmunbp/+8VhbJnhzU1Ns/sBLui+
         jKdRap56w+6GtPH+k6VHdi8JPKlmL/D73zNovypPC0AjSuYSkQyibrGTXCHWSDYxsdEx
         eXVA==
X-Gm-Message-State: AOJu0YzCr2yfUZ+uWvQfas4gLhsIPDkDH5pt7BjI4fQiVFyGU1ZPcaDx
	JZSdRr3RgShgtmzbME70anPIaiTgT5w1meLoiQh/Ym8MvxWfGUCfaWTqIA==
X-Google-Smtp-Source: AGHT+IHbTX9Te0K9c3Ci+szF4HQu72NMPZtZ6T9a6o7gndtruA+kUCMXTcx601jWfMTEsu0G/7ufKA==
X-Received: by 2002:a05:6808:191c:b0:3e5:fd5a:c39b with SMTP id 5614622812f47-3e602c64e79mr3325195b6e.4.1729278829000;
        Fri, 18 Oct 2024 12:13:49 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:48 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 59/68] python3-service-identity: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:46 -0400
Message-ID: <20241018191101.25184-60-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113046

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index a1d6a3c0d..babe05e1d 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "https://pypi.org/project/service-identity"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
 
-SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
 SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
 
 inherit pypi python_setuptools_build_meta ptest
-- 
2.43.0


