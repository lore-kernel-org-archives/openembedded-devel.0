Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88F0C531DB
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:16 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.87202.1723218549849154593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhDin9WA;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso23439241fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218548; x=1723823348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA54v7Wi9V6lErUWAeqZ2jb065qL80sKhkcuyb9bLDE=;
        b=dhDin9WAmiSkOhlogtbIaYLBwzwSDcGpzkREkXISM/WO60CCzUZztcj3jgovmULIa6
         dwsqJQt9BvJWh+ZnMzsnfepXG4AK3fNOPrpmh9rAgDWkFb+bqoiNfOgbrnSpYoEZeTdr
         wGzqBZYz/uNXwaiiCrZ50k7evjA57OTf+VNsFpmQhsY+NPrkHp6iHZxd62hP64kk+/Gx
         HvQJvwaSDemuEUukGV/ponYE/4wML4oj8ID3j5v4F1Oey7hnSVJXQkGC/sGlkVy3RKNa
         wovXjtjjNHOYoDIEctQ7NLrV4a9prcFirC42ht4gAf3Bug493W2wPT6mHCk7KJR67GJx
         xFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218548; x=1723823348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aA54v7Wi9V6lErUWAeqZ2jb065qL80sKhkcuyb9bLDE=;
        b=Z3sG8hWjrkOvj7F1t5+Qb3whMCctitp1d1Q0vYJVgv5D+f7kGaFJw9993MP6LPP5If
         7mR9I3l+5pnlUmqDbtkPUwIo4BMo7VrpI51MpKySc89j1kLrkNasgYINeFoakWYgXQ3+
         sAON/m/IZzpxCLggUcf57CK8imDwmk0iN40NdoyB+d7kVnPprP7z/wAOlvMKoo0qgPbh
         EQ460Fp23WVIYFtHn+ZtXJ4x7h19CSjXlgped9hqk/LWYwZ7KgLsOstnl31vDraJ7uPC
         7qhVDX5gtsN2HDb3JJKoZ7QcIQlXk6F2J/F6rC1hioZKyiwRSMHuMB6+G5mTUshTLY62
         bKTw==
X-Gm-Message-State: AOJu0YwJy+3j0Ts6Ix4BFTCBXPbqYwRPpbA+Mm6hgbW+JgOSi36STYfp
	9YGKZ9h1EMbINJSdYwHYwBVFixNh3nC14lBjeuNeCFvTOm/FFv0nvnLudZkw
X-Google-Smtp-Source: AGHT+IE2YxawjuaUNupDarPGkLbG3iCJIoH7/Eb6u4JV61qjttDc8C89/zacPRk6G8z2up+a2vJDAw==
X-Received: by 2002:a05:651c:1986:b0:2ef:243b:6dca with SMTP id 38308e7fff4ca-2f1a6d0080emr17120701fa.10.1723218547134;
        Fri, 09 Aug 2024 08:49:07 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:49:06 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 12/13] python3-greenlet: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:29 +0300
Message-Id: <20240809154830.14927-12-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111708

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- python3-greenlet was supposed to be native because of the python3-gevent build. It's python3-gevent's dependency.

Fix:

WARNING: python3-greenlet-3.0.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
index abd6c49ca..a79db0049 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
 
 SRC_URI[sha256sum] = "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


