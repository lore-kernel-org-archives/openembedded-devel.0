Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB67C46CC6
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:01:15 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.66300.1702656072843384933
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z77Wmv+S;
 spf=pass (domain: konsulko.com, ip: 209.85.218.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so92473866b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 08:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702656071; x=1703260871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDS0fZJhgpH4rM8J5D1TBUYZ68uNOr9jkL6kTIh5HH0=;
        b=Z77Wmv+Sbxds4MsmDRFnvjEi59y5EcN+stgLh2fWeY1nWYTaw+t8OnCIXkEGurZ2mG
         2qGXoZtEE9DyUnKFRk+t03oyc+1CYp2POxuCjd6QBncu4vZ1fVd8Ys/8OuPL9N1/WvnW
         YWvseV1Af7rZntzDX/FmnfH4yBkFHYBVWApqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656071; x=1703260871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDS0fZJhgpH4rM8J5D1TBUYZ68uNOr9jkL6kTIh5HH0=;
        b=GoELD3rl3PdIT7fFkvxTflfXIUUz9eFfzveOtT4Wo2hFSGDUfjkWakLhABvqXQYQ/2
         FOOfPo6De/6IAogB924jnF6Cd8OuoeDrr9zQB8uPtQcaOO9FFrzkhSTtgdpOzvd2kir9
         tXKcLAjSQ6pKz4wZvti756f2sEc7lR1LRja4Kd2ud3KgfMZ7JdATjHS7xP4liS33k2s4
         u/yWZnKi/nJDS3plyxIlrU4ui+bDL/2Zmz2Glt2pbfiy7mbPWMl/QhypIiIAg1/7VwHG
         BybIDf2LtnISG3DzyvkI4wYYPhWjmV3D4btalnZ7DpaCzKFIXrSFqULS8x0hxioXFBYP
         MBbA==
X-Gm-Message-State: AOJu0Yxwv25PpMSn2BI8sQLDQlncux2uLjd0PwAO26qEn5ykn/EFNQbx
	pE/5tHFpUDPYXUS+aQ24jJJhzwiVDxv0difmttU=
X-Google-Smtp-Source: AGHT+IHP95gqk18Cy4WZAJzzzBuMrmSIC13dgtTGYrSsTgXQRw4FrJcXc2fQOEL4DmFAnGthQnYqtA==
X-Received: by 2002:a17:906:d4:b0:a0a:f739:ad6e with SMTP id 20-20020a17090600d400b00a0af739ad6emr4594827eji.31.1702656071096;
        Fri, 15 Dec 2023 08:01:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm10926896ejc.132.2023.12.15.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:01:10 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-yarl: upgrade 1.9.2 -> 1.9.4
Date: Fri, 15 Dec 2023 18:01:00 +0200
Message-Id: <20231215160103.2164505-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215160103.2164505-1-leon.anavi@konsulko.com>
References: <20231215160103.2164505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 16:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107524

Upgrade to version 1.9.4:

- Started raising :py:exc:TypeError when a string value is passed
  into :py:meth:~yarl.URL.build as the port argument -- by
  :user:commonism
- The leading -- has been dropped from the :pep:517 in-tree build
backend config setting names. --pure-python is now just pure-python
- A step-by-step :doc:Release Guide <contributing/release_guide>
  guide has been added, describing how to release yarl

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-yarl_1.9.2.bb => python3-yarl_1.9.4.bb}     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.9.2.bb => python3-yarl_1.9.4.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
index 63700024c..d9fe4c0c4 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
@@ -3,13 +3,18 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571"
+SRC_URI[sha256sum] = "566db86717cf8080b99b58b083b773a908ae40f06681e87e589a976faf8246bf"
 
 SRC_URI += "file://run-ptest"
 
 PYPI_PACKAGE = "yarl"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
+
+DEPENDS += " \
+    ${PYTHON_PN}-expandvars-native \
+    ${PYTHON_PN}-cython-native \
+"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-multidict \
-- 
2.39.2


