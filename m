Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7335DE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 19:02:53 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.29052.1736362963302857381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 11:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jL+UYvgL;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so234742a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736362962; x=1736967762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=76q9cBff2qK+TfD6tybzTAxY43ypqPByZq8orxYH5YE=;
        b=jL+UYvgLQV1BcCQx9pTYOgN6fwmd1wbuKveD0jLhYPv89IF5xrI+t7sI7aj9E0hE+p
         mRbU6ydzMmt833GIAQaF7oseEE9qsOXkZ6Fn2o0Mx3TltExXUPi2PR+4zaNjyAj/WR0v
         +olwmVXrLMEnzIu1rCh2AhN3f6MvqGGs/XIORoFHB/rL4Q7t7ykABs+RFJHGeDTTIRXF
         ZxJCoqq/ufaoJBZiiyerFOmdii+88OuvV7hTQf86wMfeXU6tA3D61oI/dSsv43CA7oK/
         x5wOwy18aq3366D3MUJQN6LRmAe5fvVrabAWtCXr/iJOAmHqlc/k+Szw40cQIFwT+w/N
         T94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736362962; x=1736967762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76q9cBff2qK+TfD6tybzTAxY43ypqPByZq8orxYH5YE=;
        b=Ij4S5uY6JF93PLccqXexzk6y6kuaB22KQOaYz98c/vu04nrRPZLFqNar3VYoqkOP9b
         ycqONUkQVZQneHIt1tQBHvvxwFaf/0refKiUdE9Y/MPu3g4/5KCM55+30/XYpRY8X6lF
         4mrQD+BJk+yz3XIJ9AHNboX+I0G3mbzb5m81mpxHZEsCO36u06/iuTUe/tqrz59gyBaM
         BEbk/xm6+LPdMb1lKF9pMDPI9URKY7p2uBP2V8WU7R2f4o/Ek1CzFmvdVmtSszpbI0aa
         U8kbaDcug612MjGOQTszF+3O045MX3leWrWuwZb1apcKw1yVbP47Tp3H88/3E31MmkBD
         7yZw==
X-Gm-Message-State: AOJu0YwkF5Jt+Evd1EE+Kh8adUuRAwCholR0leVNQi1o1miZAJaXWIfK
	B5Ve5iiHy/Rjie1i9X3YWHryEaRzH/lzaXo/h3A2+sYsjfu8ok0gxR+/CQ==
X-Gm-Gg: ASbGncufv2slIZ4md7XaXEgvmi1AeGVk7usml8Qw+iedJz4/c3KSALjvcRtgugJCfBb
	CDjqBKj8kiLiPdTKQMVSWSzrCoYoHKJJOotZr+zOxpiyYuE5cmmpw2gDYvKa2yiyt75C/OhTO57
	St89NZde3730XmRuCsuhEe9+g6wbxdSKgwg2x2Jh9cqm+8EWI7JiIlaB5ubuLF7LRsMWkr8yrWW
	lTY7t6iqFUsFCk2VlzXoyUhixkaTgzCpR3Jigz1dAiSYPsd
X-Google-Smtp-Source: AGHT+IEv6zmBtKVLjradmPaYcDvz6AjPRGQi6pjEytZ34HmfOzfGLYl6gLUNh5vWCRNz6M/jYkHSIQ==
X-Received: by 2002:a17:90b:2e06:b0:2ea:77d9:6345 with SMTP id 98e67ed59e1d1-2f548f5b923mr5112134a91.22.1736362962215;
        Wed, 08 Jan 2025 11:02:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::e846])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a28726fsm1928869a91.12.2025.01.08.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:02:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-argcomplete: Upgrade to 3.5.3
Date: Wed,  8 Jan 2025 11:02:38 -0800
Message-ID: <20250108190238.3209388-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 19:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114743

Changes for v3.5.3 (2024-12-31)
Use interactive shells and bind to make environment variable name completions work in older Bash versions (#506)

Changes for v3.5.2 (2024-12-06)
Fix _parse_known_args monkeypatching

Note: This fix is required to restore compatibility with Python 3.12.8 and 3.13.1.

CI improvements

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ython3-argcomplete_3.5.1.bb => python3-argcomplete_3.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.5.1.bb => python3-argcomplete_3.5.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
index 531399d364..d4d66f0bce 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4"
+SRC_URI[sha256sum] = "c12bf50eded8aebb298c7b7da7a5ff3ee24dffd9f5281867dfe1424b58c55392"
 
 PYPI_PACKAGE = "argcomplete"
 

