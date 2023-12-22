Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA821C47070
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:11:36 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.25175.1703257888144824748
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QBOg5OOW;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-554473c653aso1157382a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703257886; x=1703862686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNqQkuKDZCm5vkepWuzoiDD+i7bP+mUeHeySnspP2UQ=;
        b=QBOg5OOWwAXmqKxNuObvQIVgY1DNNztfEgnj2gs52HqyLRgXjYCI+y6ow78nHDCfGe
         exbnfaYO9mx/YMUL+weUsaylgs8djiNYQj3ZZiq1/D6c145CzR4yjXY+IesOu36B0Myr
         78in6UcU6GYLAugAyBubayXZLK2mw6+L1kJW4cZcnPUEvd5dsqhdn4L8n9JIUmOzPQ6Z
         oeeOB6pzoLXtAYKIIfJv1zhBBpVedP9iQ/SnNTfDTFVLQ2Mj3ULfUqPy23LDQ5IPXE+v
         U4fgVycolb3jwf0crGEAK/y01An41MApA+407KnxubzIOkg4yXs7eRTbGIAxINH0lu8N
         Lh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257886; x=1703862686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNqQkuKDZCm5vkepWuzoiDD+i7bP+mUeHeySnspP2UQ=;
        b=l9buMmXs9MzC7tj1Ya3T74PASJUeJM/81+gOGvyeuPMswEwQfhm+Jjz0Ubm4pSjd3f
         ElbEyhl0lX4Pdy3njB5VtIAMpaV95OLW/m4KM/bcMZLazL2krVQRNMPJxw9Bd+zYl96X
         YMTe+nPCEwdCrajt74W0m3FxxhMTMApZmNEcYIG4Ep+xHU5Zncsvz9yv/cIHNGkj62l5
         syP2AKo4+PkoRn2OTcT8jc2qh1aJ/KmrjKmH3b8eCiB6Q4f5VBTCBzEoiCiwZ5cH7xxI
         uguvTYJx0IZg0ad7qR6MrqdWZ4DFlpM+6nCfSSn81MK17OJRs5eHgvaS2kMZVvlN4/Kp
         DLVg==
X-Gm-Message-State: AOJu0Yz9QmQS6c++c7XCcP0/AGn/+Hrhb9btdNMjAKsdOHQtu3wP1jIm
	5al2mnMDb+6tuHQ7pfWF3qlXSYnvBdz8UA==
X-Google-Smtp-Source: AGHT+IGbEyR+nLU1mhvb6VIdH4wVAggI0SIypCfpGEmEEnu8kj9708hjjdMrcjrrYoe8X6VCjlwgGw==
X-Received: by 2002:a50:a6db:0:b0:551:a444:2a4d with SMTP id f27-20020a50a6db000000b00551a4442a4dmr612343edc.77.1703257886366;
        Fri, 22 Dec 2023 07:11:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm2650247edp.22.2023.12.22.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:11:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/9] mozjs-115: split the way-too-long PYTHONPATH line
Date: Fri, 22 Dec 2023 16:11:02 +0100
Message-Id: <20231222151108.645675-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107754

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-extended/mozjs/mozjs-115_115.2.0.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
index fcdf64c93..d0acabd8b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -28,7 +28,22 @@ DEPENDS:remove:powerpc:toolchain-clang = "icu"
 
 B = "${WORKDIR}/build"
 
-export PYTHONPATH = "${S}/build:${S}/third_party/python/PyYAML/lib3:${S}/testing/mozbase/mozfile:${S}/python/mozboot:${S}/third_party/python/distro:${S}/testing/mozbase/mozinfo:${S}/config:${S}/testing/mozbase/manifestparser:${S}/third_party/python/pytoml:${S}/testing/mozbase/mozprocess:${S}/third_party/python/six:${S}/python/mozbuild:${S}/python/mozbuild/mozbuild:${S}/python/mach:${S}/third_party/python/jsmin:${S}/python/mozversioncontrol"
+export PYTHONPATH = "${S}/build:\
+${S}/third_party/python/PyYAML/lib3:\
+${S}/testing/mozbase/mozfile:\
+${S}/python/mozboot:\
+${S}/third_party/python/distro:\
+${S}/testing/mozbase/mozinfo:\
+${S}/config:\
+${S}/testing/mozbase/manifestparser:\
+${S}/third_party/python/pytoml:\
+${S}/testing/mozbase/mozprocess:\
+${S}/third_party/python/six:\
+${S}/python/mozbuild:\
+${S}/python/mozbuild/mozbuild:\
+${S}/python/mach:\
+${S}/third_party/python/jsmin:\
+${S}/python/mozversioncontrol"
 
 export HOST_CC = "${BUILD_CC}"
 export HOST_CXX = "${BUILD_CXX}"
-- 
2.39.2


