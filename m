Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A85C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:21:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.3014.1742372475929843489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mSxLngqH;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so12430812a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742372474; x=1742977274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FofFd+REo9p8jGzHfBJtz+3NDYQHk9682ntn9yyEYjg=;
        b=mSxLngqH7XpP1mAQCVVjZLDfc2GIOosyCzmIwSR88kIsNvkPUwBH9yWnUu1oD9Y0iT
         Oz+jAX4Po3TP+/CKSvJHXOXdcnrcBE46X6yPUr01Cv3Jvhxh4VWX3DT4wVn0VJxbNwQe
         Jn/0wTini9KnJza0T2wlCpZ7UVzLhcpJzidd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372474; x=1742977274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FofFd+REo9p8jGzHfBJtz+3NDYQHk9682ntn9yyEYjg=;
        b=V79sSv+Bqmp/hwcfJ63Yz3VbiJl/rN6bGLPJxTIyZCa+LhbzwxQuM+wXvburBVYgzi
         w11ecY7HZ9LUkF+MmQ9bOqK5ldc3iOIXptvSLgfKQyA9OuZoXrw1+sxRXDiHGnD2VLqF
         pmNWRLE6lQBvaGfLJlff69i91fpNgA4hjcgtWCMpeH17zjIbc9iM81INVI8XN0ByJrHK
         EMbr5/qxNuHMPo2bMbBnDTi6bNmtAUZuRTWNKOLg1Leyd6FHVjS7kxGVD26Kl10h9IOf
         As8cf82Ena8SUUKd5hVdzqqKq7U8rZD4F0YOGIbDe77ceHO1iEXd4YLctye6hEoIXsA5
         dpsA==
X-Gm-Message-State: AOJu0Ywf6QoKqFDlWqFC5A9TkikEHQZlmnk6RyE11lyhwD5/XUGUZmb9
	TP5NYvHlmDJ9e0jFBmGqErqrXK1okFXZypJujafNkwIoTvn9Axo/3CDGoWEDfuSOelN9QBse0Pk
	c
X-Gm-Gg: ASbGncsGBwWKFgEKZ+sqoFR8filQquc3RclyiHv/AgGCEizeFlV+Xdol3yqH+ZCO8dA
	ITfo++wPnq+hBU4Z4McPPCdMr/1gMLY7A6ZhLc//ARiqpcXVibnwaigXy1Vw9TeeyS3k6dmqdcW
	r1I8sgzMlKoLp7Ty9yQrXEVMV4w+Fla1Go7yKXT/YHyFFOyKRSBwkouYzgqkEOSoyehzLnMD3QX
	mJiKlQyN97qSYjrnN7AoY+HWWPEVdBXxag3Sw3Btgqm7JcvaGyc0OG+Wg9SgEuyihPiGjrbF/ZD
	KcTtP51jN5SBSKxu8yLsWz/Wu4Ek9jeJBabTevAtZWafEJyKR6b0MrMZQ0GVTvKl7YJXGw==
X-Google-Smtp-Source: AGHT+IESLuYE6dR5CiZytOjh/bLmZaTlP2o9ZxkECFOBtU0v6FPARKTojaWH9wBjfGuEX+JPO1Btaw==
X-Received: by 2002:a05:6402:270b:b0:5eb:534e:1c59 with SMTP id 4fb4d7f45d1cf-5eb80fcdb0bmr1642566a12.29.1742372473749;
        Wed, 19 Mar 2025 01:21:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b04dasm9035761a12.37.2025.03.19.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:21:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.1.0 -> 6.2.0
Date: Wed, 19 Mar 2025 10:21:08 +0200
Message-Id: <20250319082110.2907028-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 08:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116065

Upgrade to release 6.2.0:

- Fixed in checks throwing an exception instead of returning
  :data:`False` when testing non-strings.
- Fix a leak when the last accessed module in PyInit__multidict
  init is not released.
- Implemented support for the free-threaded build of CPython 3.13
- Started publishing wheels made for the free-threaded build of
  CPython 3.13
- Used stricter typing across the code base, resulting in improved
  typing accuracy across multidict classes. Funded by an NLnet grant.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
index ed49b8ff02..568b1b93ce 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
+SRCREV = "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.39.5


