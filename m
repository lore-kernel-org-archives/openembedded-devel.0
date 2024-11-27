Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30E1D609DD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.70016.1732706783856276222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=es7kopVR;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434aabd688fso3175205e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732706782; x=1733311582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VVpgKyyD+GOSDmGbc7/hnF1tKDTWXQ8yjVj2N5Hpeg=;
        b=es7kopVRLvml2Yz4XHinJcTfVXw6TsApP1Dto/F/wzkLyhQlbqW/U2ajqke2sDcc1I
         jiIQGK0joyaofwoU4IY1M4VNqbbJYwpCgHMUr3mGwxOw3C2lFfEp9Ps0rGuXb9cl+AH1
         XexDrq4s8Dln44C405kV2g15hWp5861QNn91g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706782; x=1733311582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VVpgKyyD+GOSDmGbc7/hnF1tKDTWXQ8yjVj2N5Hpeg=;
        b=xCCHa69PY9IQbz69Po1kkMiczbQZNtZl846Xsqw4XmoohSvM7zUNqqm/a5bd9Iuty0
         c2nXFelncggJtZHqGAyuF5HnMWxbyeiAI8cwXOVdIe6+GbhtnTc4MJQZxdBB1aiLj/OU
         Yn/jroTvqUzpY3CtokWzH6FEsbC8L3xk/om/oc2sdKIlugpNs2WGQpsFpdRH1rqrIuU3
         2NO/ghJMwr8LEShsm6WCWv7fyP7sif6ewywjH1LHgohjkCG97IW+hKvaXKoYhgm6YPYd
         UkebAy0SVpSWsjGYU2m6LzpEbjXUghlrwBA6JnzBosRpcW80CtEm3Urvo3I3uBUfi3WP
         Gevw==
X-Gm-Message-State: AOJu0Ywrz9anM1/2Ja2Nt0w2H/FJfnq/l/QXjxDKEUAfSPMua15rvWVe
	jY+QQnHhr7cccgVqzyCBrfEMdei9MzXbd8Fv5fbVT9g3kW0bAPhq9EKrrNefhfP/k6obnmSOC0V
	h
X-Gm-Gg: ASbGncuulcARhIT1HefnELsQRKlKX7bWvV3ZTM/3TXzAqyLMoDe6gzjW6VrCQ+3KgNR
	rXZFhYxUCsmYa3VSFX/p0MqKpHjxO5Zbjr2ur8YnPRcf0dLDBV8gN9QKptgRqzDNu6mux6e1PSx
	Rm5B5XU9pMtFmK5VnJLhlqUHitemqcyY01vkGjYC3hZtBImBTOUx3AQqKWMRpmZ6T5BH+f8jXpF
	ifVVu4XMjiigOUn+s3MX6osKAoTRFcBLCcrBO3WlNjUnxVm3R6H/Gq48tPv/4/T
X-Google-Smtp-Source: AGHT+IFavAP7N4fih6Zhm0/pZe5VIbBasCO0/FNucVg77nBsdojb2CoJJ+fgtUOpXV9tti1fT7a4qQ==
X-Received: by 2002:a05:600c:5101:b0:434:942c:1466 with SMTP id 5b1f17b1804b1-434a9df6d91mr21878975e9.29.1732706782029;
        Wed, 27 Nov 2024 03:26:22 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm17951645e9.43.2024.11.27.03.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:26:21 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-simpleeval: Upgrade 1.0.0 -> 1.0.3
Date: Wed, 27 Nov 2024 13:26:15 +0200
Message-Id: <20241127112617.789120-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127112617.789120-1-leon.anavi@konsulko.com>
References: <20241127112617.789120-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114089

Upgrade to version 1.0.3:

- Spelling fixes in documentation, docstrings & tests
- Fix support for 3.14 (deprecated features actually being removed,
  so getattr use was incorrect).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-simpleeval_1.0.0.bb => python3-simpleeval_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simpleeval_1.0.0.bb => python3-simpleeval_1.0.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.0.bb b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-simpleeval_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
index 686f54b41d..4537645c73 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://pypi.org/project/simpleeval/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=83843c8f0f3beb18af2f282faecbdebe"
 
-SRC_URI[sha256sum] = "f3d259deeb751d34c63e56747bab384efad63a2dbdb4f130281c42279788ac3c"
+SRC_URI[sha256sum] = "67bbf246040ac3b57c29cf048657b9cf31d4e7b9d6659684daa08ca8f1e45829"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta python_hatchling ptest
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


