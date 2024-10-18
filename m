Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FC7D3F282
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.29966.1729278810208871073
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCHfKihd;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e38fa1f82fso23649337b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278809; x=1729883609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTua2cExBfxQ79xQbPWrNuio0vNq8fqhhFguA8+/3JY=;
        b=bCHfKihdqQHhZrSP1duPjMdxcgDrl24X1Zx98vTfGFq4GGkjvTMk766YMwMEOxQbP2
         iZOm91puHQ3eCpEQFt8XuUVwlFl1H7T/ykl6MNle9qzaVtKAxgfyDl2OaLTT7OxImmO5
         N1pJHSJkriRJJn5E6I9Z/mjb+E6xL7DHgOv5YjSWAhoYzXLbWaL5npBxBWmYx0QbJarC
         2rSEgC2Ibhtq04YPYBdAr3OT2aqKN+LL8VqSfKSt5UWlkYKiINEWYeZXNNWDhikaOmfJ
         JcvH8I2Cl8zZ1o/9dnnBMyea0WF2aKNn2uuH897JbPIXbXjwJ+/DecsRpxlIzfLWUJHh
         AwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278809; x=1729883609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTua2cExBfxQ79xQbPWrNuio0vNq8fqhhFguA8+/3JY=;
        b=tcxFKlVZb8yyGt3xPUXlgF7cgjo57nsajQKkR7L10YSvoMyg9uIXr8weutk2cJgKOc
         0TfW8p+KcKDXmAPe99kER3BJnPFADyt7gRagHHOan478jVJ8BZ+B98UQUEIxhFZCuTB5
         v/Re2oL0ZQq705RCjKQuFdixfW5WYypM5jd6aQCBEASmC9dkISclMqSATDdw6fLRsPmn
         JfufKmj/aML2mmsDw2g4XdGKcIYJeQ51OoP1vh5qx2Kx0sC+7ar73alQnrzu9bKYZ3bA
         ZaGsdtnLyyJQ+n2IDupFv5BNuBo5r0qGCCbkE8svrb7DY93KeNoPY4E7uOY/s1CFuHJL
         Cl8Q==
X-Gm-Message-State: AOJu0Yzl4Dkz73O8QwIHddwIahwFc47OW6xeQf3FqWNvw4svIffd+c2y
	qF3Lj3eXNmlyCfxeUUlVaJmM8tkGPCXb8NqC2GAknKsek20RIoBnYQzOZw==
X-Google-Smtp-Source: AGHT+IGSdXNfsmRFi09ZMA8THJ6aSwHO4qv73+DfwqcqFJ7CRoHTUDVGOqkx8e1dKWscFRUEiVCgiQ==
X-Received: by 2002:a05:690c:290b:b0:6e3:1f02:407b with SMTP id 00721157ae682-6e5bfc39ad8mr26271147b3.11.1729278808713;
        Fri, 18 Oct 2024 12:13:28 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:28 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 28/68] python3-inflection: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:15 -0400
Message-ID: <20241018191101.25184-29-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113015

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index 5c6f4e235..ba1d0ec53 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31"
 
-SRC_URI[md5sum] = "c3287d4f0e3bdf625a52d655cc514403"
 SRC_URI[sha256sum] = "1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417"
 
 inherit pypi setuptools3 ptest
-- 
2.43.0


