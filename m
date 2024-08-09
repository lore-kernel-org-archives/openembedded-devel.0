Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76318C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.87154.1723218542285521913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZjDSDmm0;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428101fa30aso16440675e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218540; x=1723823340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPjTnORbWOYiR+Xb8UpEmc5Eujq9cMkhcvMD6aGOFaQ=;
        b=ZjDSDmm08KvwBBmGVCbe4kS0I5e3o5d3H/JJUNKCaYxeYGmc2mXc5HFza5oN08GHtB
         v7w2Vhs8x7lWtcIxK7IouDTHGQmbV/3N1ipCc/gL5Rr5jfX5VLtjGEXLBQyvic6VDUcf
         PzMMazrOdap4bYN9/V7D6ePzdG4du4GKrJjnN7TgfKsX1JHCLwWuF8FzDgKfK2D/VSsJ
         58g5b5s+injP2qMHkv+YXeKsepe0F7UGwRB7hwgca1rxdlApg0rsa0Fqv9uYL5RugAZM
         XxShaOXvO5HlWd/Kn8k8oxraWyLaPAZ3rsZk8tb35+tXy2Ur72RmejWj2/Qsyx+E5i1U
         GH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218540; x=1723823340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPjTnORbWOYiR+Xb8UpEmc5Eujq9cMkhcvMD6aGOFaQ=;
        b=CeXmlYscLeV3ZXZpjdCk816gdeMlIP2OSA3lbM63ZTPCXTZhhzY65OpMfa8s5JB+XI
         5B1uhK+KvPtncdDgDn63j3NOl92p9ySh4GBPuQL7aAlbTNqBNFf1elszwTmj4J8TxjfU
         D+BOXj8F6t1xvm/yRnNHrPWs4U1NyHnSFOMVGQ5+39VAUFv2wE4mD2jbXBf7mO6a30Qo
         bvHGvnpdvsTdo08IWZKRih+5LbYO9Ks1v0G6YJVnP/BZMb4ri8FUxf1AZEbAiJpRb4vO
         BPDmyPXt0YNssAYtlyf8MgtqUQ+eaRwpVlX/9lfyAtRJO5aqxcgex6040z3dwiK4/Cj9
         Xl0w==
X-Gm-Message-State: AOJu0Yzvhtt0zi5tnfYX5DxugbZnUIMusFkoxA9vsbVhCjdFzPRMebHk
	ulni8L1+4i71cM49auId4ogsAVkAwBw4BjvBJgQjxwB6pUMXtb3qhN7PYXHq
X-Google-Smtp-Source: AGHT+IFLfZTtH3KtkISSl6u7x/Uleh+bZ3GqnFrR4M5QUta8vFl26XQglSQ4QLfl8/yye3ccGv6FCw==
X-Received: by 2002:a05:600c:35d1:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-429c3a1719emr14956835e9.3.1723218540253;
        Fri, 09 Aug 2024 08:49:00 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:59 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 07/13] python3-pyroute: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:24 +0300
Message-Id: <20240809154830.14927-7-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111703

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyroute2-0.7.12-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
index 3ea980f44..cf9885df7 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
 
 SRC_URI[sha256sum] = "54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3"
 
-inherit setuptools3 pypi ptest
+inherit python_setuptools_build_meta pypi ptest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
-- 
2.25.1


