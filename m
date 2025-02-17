Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9869C021A4
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:22:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.47554.1739784138832570845
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 01:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WP1k+KFC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so27662035e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 01:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739784137; x=1740388937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNVzYJethEdPHpoJvao84WfmzQX+6N8P1L2WKkVpul8=;
        b=WP1k+KFChJ/PcCcuATBQRcYODs466e5V1xVRGofLA4N3Zhuloz80A94AHzCHqSDx5c
         GKJ8ELqnKZapuEQo6GDr5sIZHMW6Kc3tpZR1YRLkyP7VaGh8PsruHLn8sNF3Hf0rmm2o
         KFmNdwIL1bLcjrR9+7al5CaKH5MFGYbIsGiwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784137; x=1740388937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNVzYJethEdPHpoJvao84WfmzQX+6N8P1L2WKkVpul8=;
        b=ZV0bxaG1BLXQ9QN4f1LmQ1VkS56jL6mJFJG++w15fciSBVdPRIvvUzQ2ZBgCAzycVy
         XNJdYPNVIwkFk3HGW1uZcY/EFhpzgZLTkLfg755WumgvcZQ7cB54pt2OCBf1bVOjqI1p
         gjxETV5GY9E+qFjahYGbOUsNOqBb1Hit9ZPwqTPyaabWpcvCdq1Ww6G+tQ9lw04bSSKq
         oGUQ/Oy+oCE5GJXumxGbFll6ghhciVNMLdqXVebW0JiLVkp8z0tnO1gi17IguINSbNub
         TiStPyVYx/e6bJU+iwIx6Fw24KIe1FpqwMVwdBqFYMCajbLIH+LjDlv6bNl22RLufuMC
         YuAQ==
X-Gm-Message-State: AOJu0Yy2SVtg3m+ZnJlgFSP0mwITmZPOIONOA0fQIRYzAvO6GKqAAfgo
	gYqYH0sYs+W6Kbf+DXg0+B1F/8pwOGeZd7Gf/YmDQADI40lt2cFBkZLUONZ3BqD6lZVoshBISYq
	r
X-Gm-Gg: ASbGncvDOSXEpSVc++/3hVePZiZoTIJzqcN9McZ3witPHK+a2h1Ouxt8mv10ipwqcAU
	EORORTFM0Oc/9blJgVxakAz94MHacOq7RWF7/R9EBgynIw0P+kvIsU7ulDzpFf51g9BBt/Mgvty
	Kt61Yx+Q6hpg5w4m73ZkzDyYtHYTil1zjzICSwV0sF4tGadXYZVS4tLR3uy/kRd8bZxIcdDOkIr
	ToottEAeQzILrHTktbO4zj/sbmfV1hec4337AyqzBLk1FkzTrcisoUCNnXBsHfNTkUXvkcSNEVA
	4Zr//xrn5tFAJhx6DghOwYKEsc6w/g==
X-Google-Smtp-Source: AGHT+IEwZ10Lp7vmiXoacvsOIdHSYej7DzMm3jYv8WucPX73IZToWFLvJjTpB2+IkyghvLFm3I60hA==
X-Received: by 2002:a05:6000:144e:b0:38d:d701:419c with SMTP id ffacd0b85a97d-38f33f437f2mr6661432f8f.41.1739784137127;
        Mon, 17 Feb 2025 01:22:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm12022347f8f.18.2025.02.17.01.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:22:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-humanize: Upgrade 4.11.0 -> 4.12.0
Date: Mon, 17 Feb 2025 11:22:11 +0200
Message-Id: <20250217092212.3970278-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217092212.3970278-1-leon.anavi@konsulko.com>
References: <20250217092212.3970278-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 09:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115512

Upgrade to release 4.12.0:

- Add support for Python 3.14 and test PyPy3.11
- Handle en_GB and en_US locale
- Release to PyPI using Trusted Publishing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_4.11.0.bb => python3-humanize_4.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.11.0.bb => python3-humanize_4.12.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.11.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.12.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.11.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.12.0.bb
index ede3dc4171..1b9ea94300 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.12.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be"
+SRC_URI[sha256sum] = "87ff7b43591370b12a1d103c9405849d911d4b039ed22d80b718b62c76eec8a3"
 
 inherit pypi python_hatchling
 
-- 
2.39.5


