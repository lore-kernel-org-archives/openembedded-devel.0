Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD231C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:57:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.54453.1699718223090138320
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VgyWXqS7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4084de32db5so24698045e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 07:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699718221; x=1700323021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eH2XCtRffBDYg3pWWT4+AhU75wVopUxOxCvVdUclG6o=;
        b=VgyWXqS7JbAAvgbMEJ7NQ3TJyNHqhE+QL7azcdVTPsOa9X748X7BvvkcsxVKSbmuvX
         hqkTSaWBb3c9OkMvtYtAj6XHQ4j1HZ8n1DO92AgMAPrm/JF1Kxlb2oq4+aY6WqcLWKgo
         W/LElx4bVh7AhgKEDpkIkZTGcmd+7d2TwK6dJBO5u0SgNGGajeMnU6G3JibDX5ToFmxr
         pR6TFnmEq4po/oImuyVFJ4B/jeLLANAPwbAMNSvA2l1r9h7bR/lkkW0U/+BVhW7e7+Md
         1z3rKiS3uSzyRwmHMUrdFbeirTfXat9F7SADWvYCUoGrTcINy//o9bbxPTaBbW8wyyj5
         3Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699718221; x=1700323021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eH2XCtRffBDYg3pWWT4+AhU75wVopUxOxCvVdUclG6o=;
        b=VTVXe9Me6G2u8AImD3qiadECNbQknu2LT7SofibC+/s9NbeSr75OV8cQn6HCy14xZz
         SM4NJ/Iuru2OPZFmcTuwcxWyFXeRSn3TFT9090B2fbhDX3MuQbShiVWpKG95XFcwGJ0d
         xeYq2B5YvvjM4U3zkY8OAEqeYGroIbhjoCgtb5vScmDfQpBwX3kGRenX6MitAJT1FpJj
         z79SWglyItL/YFGjq0O/0gexvpkx35zzgh+fZkqK5VchT4+RIG22/GI17ZjNUnJjSWgl
         s50bd3JmOzYMWnNp5aoCSldofa8j5KZw+dID1/WQBb+E/aEbMq4luiSczfh/vQ75Cygu
         8uzA==
X-Gm-Message-State: AOJu0YydwrBXOxc2a25aM2adQYqMUwkNAlav1JON1KktaZWHETysSGvg
	oCMg7ncNJdFUGCy9SozRGpJbN+fnQ7qvtA==
X-Google-Smtp-Source: AGHT+IEou0T8ZO+OkQuLpwBMznpvnEwOPFZVvCRajyiCAcLU2lhQ/IddPooHz3PtQ44t41izPHI8Pg==
X-Received: by 2002:a05:600c:1c25:b0:408:543d:5536 with SMTP id j37-20020a05600c1c2500b00408543d5536mr1965878wms.4.1699718220089;
        Sat, 11 Nov 2023 07:57:00 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b004030e8ff964sm8424960wms.34.2023.11.11.07.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:56:59 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-webserver][PATCH] xdebug: upgrade 3.2.0 -> 3.2.2
Date: Sat, 11 Nov 2023 18:56:10 +0300
Message-Id: <20231111155610.3381685-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 15:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106555

Changelog:

[2023-07-14] — Xdebug 3.2.2
	-Fixed bug #2175: Crash with EXC_BAD_ACCESS in xdebug_str_create
    -Fixed bug #2180: Crash on extended SplFixedArray
    -Fixed bug #2182: Segfault with ArrayObject on stack
    -Fixed bug #2186: Segfault with trampoline functions and debugger activation
[2023-03-21] — Xdebug 3.2.1
    -Fixed bug #2144: Xdebug 3.2.0 ignores xdebug.mode and enables all features
    -Fixed bug #2145: Xdebug 3.2.0 crash PHP on Windows if xdebug.mode = off
    -Fixed bug #2146: apache2 segfaulting with version 3.2.0 on PHP 8.0
    -Fixed bug #2148: Icon for link to docs in xdebug_info() HTML output does not always render correctly

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.2.0.bb => xdebug_3.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.2.0.bb => xdebug_3.2.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
index fe6fc5bf9..8ad588d29 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7"
+SRC_URI[sha256sum] = "f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.25.1


