Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D0EC46CA3
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.58186.1702626774023187804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HOKT64FS;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a1fae88e66eso39689766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626772; x=1703231572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4D6C6aQoSsgfkNALS/KpHnUEX35qsMHiEPH4fKmqjg=;
        b=HOKT64FS6Oz5B/ETrlcs/A6kHDYHdhGpqpDwT3fd0ICf8UKyxo1B2TU5hXsLaUbfIU
         UV0vx5Nej+QPs+pHvtOiPKWsYrLHXUDMfkaDxp0eSsEQhjyNBi0A0Wj2x9VN33Hd5IZ1
         r3WAjRLJGtjy+5pdMqbtVpCUtUB79seBV2m0x9Bq3KPpdRxIjoBCAWusVLzDjInndNv9
         ueVN42Pet/eX+JBYA2cDbppY7G//eo3ODbKvVD3xi5SxK2WUe+/rfO0RCJ+Xi8JKJ9cl
         Md7//SNV+B5s1i/5/NEKu9cD8JqlZlBZXWMyYteQLwAuhJFuiFsndMBT3YRLkgyIXGti
         1mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626772; x=1703231572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4D6C6aQoSsgfkNALS/KpHnUEX35qsMHiEPH4fKmqjg=;
        b=Dcm8aUUxGwwSyPSDA6GjfaYLgTKB23aOCMveV/ZHtABwTDIRnS8lau9A94ti6hk0rm
         DyQJAyGsUkq//gIbJxrOzX7N1CAtPKjm9o3E9vIDXomSRQL3JFlSWQ/sCjoih0iuMjEo
         TZq31DwnXVq5T4nYv2XSvmxarY/mJS3miNfwC/P4ioLeHAXNntcl4ASe1/k+2gT1DZ0I
         yBXRMi6xCv62jJqz5jIPaQ3LWtSIiVeA2o10w41B4MnX5qwrUVPhYmaWYMSGDM4GbsnZ
         mDjDPqE/JHsG2WoJ0q4ip90E63mxi3NGGI3eqBGJa/3erFAh/NXQO05Js2fjODhr7T+q
         Kwzw==
X-Gm-Message-State: AOJu0YywPENl62W8CYKUHNJpKPhRjmdR6ih5lKxXhXhz7BLmsHXhByY3
	oRFsoq9dmEURochy7IdcYyTc8SLS5Ys=
X-Google-Smtp-Source: AGHT+IF2UVplOAjL7Q0ibJNSrg3V1BqMBh9aqA+eURLEx/QiusshtV4r+5AG7Y0hm8X7myyCIgcY+A==
X-Received: by 2002:a17:906:790:b0:a19:a1ba:8cd1 with SMTP id l16-20020a170906079000b00a19a1ba8cd1mr5036959ejc.111.1702626772446;
        Thu, 14 Dec 2023 23:52:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/20] python3-unoconv: rely on setuptools to obtain distutils copy
Date: Fri, 15 Dec 2023 08:52:31 +0100
Message-Id: <20231215075239.3049865-12-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107505

The source contains:
from distutils.version import LooseVersion

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
index 3c944b4f2..be1dab476 100644
--- a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
@@ -11,7 +11,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE="unoconv"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-shell \
 "
-- 
2.39.2


