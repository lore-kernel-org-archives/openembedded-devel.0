Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788B9C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:25:28 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.31024.1723029919229539050
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1rUJxDH;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so16640011fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723029917; x=1723634717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw5bQU//+n6OYtpxDZ/i9HZvzvUQ9z7zhhyQx0cEBJE=;
        b=c1rUJxDHZRIUl/NXrPNHGQ61iKNTUrGOWWpyA1ICgz3Bd7Cac/fgc5HDyhaDe5sEoO
         dGwurHSUcByEqQiG+y04uM7SaLPA6AkPlZqAH9PrhzDZGJmyDgIGddYXAgyhJYjWYpFp
         LZO6O/LzfNbmlOTufFtssPb+iYecd+5/kDYxYPpYGYed05m8ydgqzPaF4i3haBwJu4R0
         e82VrFUVGja4XTrcoc/mPYIbOA7p7FdEc/cS/diK72gCnuRYgXMi0OmgFcxQ6LoVJC2x
         qXUNaapoatM3Bfs21aVw9fAzLbumPkUZiDNuxLLtYD1Kmi7qN5TN9mRTKJ57uSM7TWBb
         Us/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029917; x=1723634717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw5bQU//+n6OYtpxDZ/i9HZvzvUQ9z7zhhyQx0cEBJE=;
        b=JMqDxyc5BW+5qIHGQJsE0+dmHhn1VjQ/pu2uWm7A9kFOpAphdx9WRnLWVeSGsawqo9
         G0BPL+QnKgEhqV84nySO7tje0zI+hxc8euBDBUfw7SakZIggKdw6uyCZ6mYa1LBME4TA
         xHyNy0JiY2kCwjcEwia7ocVfln+y7o3zil4I3TzXitWFQQMuqwtjzlR49AoecCxYOtDL
         R7svUxPu9plAKCUJfa9d9T9xZbSdjWGzTRXa9m+nC8BuKbnzCzCbnssZvaF0KHYwenBV
         /syL9rdSVHm5nGhquMjdPKfstzqISOcGKntIMDgi2I9UTHXTOaf2BxDUL/DuoTFttqML
         DZLA==
X-Gm-Message-State: AOJu0YzgEFRl5wJ+6lH1l+xIKCjRDPmg2JYnSh8APnvolx2B/8RAlqsX
	BkvYn0gYpQ9byLNRifT04XzxZIWGUHyTvKG265z2uU1ZV8fcEb7Ce4p2eq6X
X-Google-Smtp-Source: AGHT+IGExL74Oe42xZyfa9iRUgIntc9CKtPJmwrwVXKBI9/y+1pXOt6JZuilwAW13ii1brtU3OJAYw==
X-Received: by 2002:a2e:891a:0:b0:2ef:2c0f:284a with SMTP id 38308e7fff4ca-2f15ab048f9mr125457471fa.44.1723029916684;
        Wed, 07 Aug 2024 04:25:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429057bfe4dsm13122315e9.1.2024.08.07.04.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:25:16 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-can: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:25:14 +0300
Message-Id: <20240807112514.63624-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111614

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-can-4.2.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-can_4.2.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
index 9ca926d66..b0d87f4e3 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI[sha256sum] = "6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f"
 
-PYPI_PACKAGE="python-can"
+PYPI_PACKAGE = "python-can"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-aenum \
-- 
2.25.1


