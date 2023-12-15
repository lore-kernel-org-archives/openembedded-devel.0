Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20B5C46CA2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.57806.1702626772157148308
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WredWFPC;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso404933e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626770; x=1703231570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bjhoLbjhqyV43eSXkWedr7rjFfBSIzwVnag9ghGcfQ=;
        b=WredWFPCY8p4J+NCz7nvmD7XOrcX4Pv3mYb3OL15DOMEWnB+Bqm6NZwbw4vD40sjML
         vQlUtilpvqlizbhj66OaD2wsyN62bdqpTxTAcrW3doTiNCD4zFgmyncN4861f+B5VHjp
         ogbgvMw1+GDQxEKa8SUbummGSWzMdWG+vRO9TQfaoemxZjekSw9c06pKbnNL6uUVlFyH
         45PI59/5avnXCj0henohxZFhQW4KKplAWMr4O/+aYOjMd3OWTHe0w8HD6tIjWMov3Caj
         PskKfXu/9QQrJOGBqWYTumZKats5Ih2TvmZuKG9fIHzJcmHBPYIuEhQlF9JxVi8jjUhY
         5j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626770; x=1703231570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bjhoLbjhqyV43eSXkWedr7rjFfBSIzwVnag9ghGcfQ=;
        b=guKTnh7jEKEEbZPyAN9IT0Rj6lKzHCLOB7p0w0I/wY8nPAW8uhi16jwbP3ufZMMnFz
         Lp5g2AFnwdVtiCGjBovEIGswm6Rq8Z+CjC9CcD/TbUBFdU5W8FJ8rLTuAWQYgMGf5Xxi
         2qKbvbYTHnLdp+sFOy1LRFvD1rPsibVWPhCAZw49oskB7ECY2T+1q2+fbU0NHW3Ih3Yh
         xvAGh/U7Ku6XXoDHAHxzwiZOYskhkNbqgBaccd5+IINSFab4zhacAmqJjeHLTRF/e0Oy
         m/4XcotBOq0jAjcnekqUF8uGE+0fJFUnvGy5gDl895JpM5pGvTnHPTCj9FSs7Y8UD+Sv
         0hFQ==
X-Gm-Message-State: AOJu0YwCnP2hwyzozuTb5Pl1pgrsC1S3pDbGHqLzQeYFU6w1VbA0OEJ2
	Mcoxh13AIYQzT/4HF9ix2CWwXZs85oo=
X-Google-Smtp-Source: AGHT+IElitUYC4yi837jXRkkxSK29hisDmcSTXYFN1j8OwY/MOVR0W/FQI7+rmjGSgQ7rOT55/EVCg==
X-Received: by 2002:a05:6512:1308:b0:50d:1a14:2f78 with SMTP id x8-20020a056512130800b0050d1a142f78mr7658535lfu.86.1702626770340;
        Thu, 14 Dec 2023 23:52:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/20] python3-cppy: remove unused distutils dependency
Date: Fri, 15 Dec 2023 08:52:28 +0100
Message-Id: <20231215075239.3049865-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107502

It's not mentioned anywhere in source tree.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
index 270f74963..7817401fa 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
 SRC_URI[sha256sum] = "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
 
-RDEPENDS:${PN} += "python3-setuptools python3-distutils"
+RDEPENDS:${PN} += "python3-setuptools"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


