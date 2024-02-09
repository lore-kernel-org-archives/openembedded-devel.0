Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743B7C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 05:39:54 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.5569.1707457193752453388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 21:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WAyJKcZR;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d0a4e1789cso5849351fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 21:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707457191; x=1708061991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbgQeW1Jkf75qfW08Y/a3RlebFZqF/JBSLMwXQiJdcc=;
        b=WAyJKcZRSWAsh6JJTC+1rQK8V7jvd0Tz/Q15o4gm3HcXzt6g64vyeNJ/a/6OcCbbfj
         G4srJX8NuceVjzeNsa71EKdZbAkcpIFUt7HWd9FmWQrly0oOItnXDKBJeyc0W15HJUR5
         +r1H24WjrUTI+16w0OsGevs3IXGYg4UUrbpZHZZviMabGAMmc7pxtiglxQWagQatfEtj
         9jnrXFVCJ9TPGgGPaf8C0yQMGyZBwRU2kmVZReXDQnGZ8vUMgrrv1oWZ+dnISaEzN581
         7LH1Q/RsqoxlYD3OmoXrx8uAvmsWb4VYqGkJ1Z5TURZORHBxIYMYnPyafYucKpcNgYEG
         1jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707457191; x=1708061991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbgQeW1Jkf75qfW08Y/a3RlebFZqF/JBSLMwXQiJdcc=;
        b=N289WnxdoVnuAGzlEUqKjA9fvFArEO3HAOpBG/eEiOL5E7dCkxiJ2/qk+7j/zt5cof
         leDgxiyuAKS1WG6lZfgDzFIZVOVdAaEYWkGngqRrNX2Q34AiktUTh/B2b2k+aqdQsX7H
         M1XdlKkuFwX2e999pg8XXG+q+OyQuYfanrj1VgbcjWN2Wup1vLsNuKpdIWpStk9AsToz
         88hMKClblN69kWfG3BWpPlpXkVE28QSBd5n8bUGNyh1vMis/onTHbOrOwLaDVSvNUptl
         xGLrTRZbfwjTKYjLUXsh5Yt+wQPN9DE4hI9hFUa0MzgtlWFtueT91jWcRYzF3HvwwHX9
         kk2Q==
X-Gm-Message-State: AOJu0Yzl6EGHH+2oA6ccBEb4YS9UNfzFxcfphiBa0HqfKLXj0t9d64gd
	FwMJG1L+2eTJpymRyAPcwa3FIx5H5P+uJbAN0C2R0zMvLrOIaiCKisF4TUbDUbw=
X-Google-Smtp-Source: AGHT+IFABS8ehjuvRiq/LjxJ4NQqPPYmE2YVR0974B2bP3B8yuxoL6NS9vQvh6dYg+WQ1YnP3zNQcw==
X-Received: by 2002:a2e:6a01:0:b0:2d0:ca39:5fb8 with SMTP id f1-20020a2e6a01000000b002d0ca395fb8mr358693ljc.53.1707457190996;
        Thu, 08 Feb 2024 21:39:50 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id tk6-20020a170907c28600b00a38a868bcf7sm410647ejc.41.2024.02.08.21.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 21:39:50 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-flask-marshmallow: upgrade 1.1.0 -> 1.2.0
Date: Fri,  9 Feb 2024 08:39:44 +0300
Message-Id: <20240209053944.17982-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 05:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108676

License-Update: Remove license year

Changelog:

Performance improvement

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...arshmallow_1.1.0.bb => python3-flask-marshmallow_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-marshmallow_1.1.0.bb => python3-flask-marshmallow_1.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.0.bb
index 15fb22900..573b20291 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.0.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Flask + marshmallow for beautiful APIs"
 HOMEPAGE = "https://github.com/marshmallow-code/flask-marshmallow"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dfbd4ae0074716275fc229c775723e8f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27586b20700d7544c06933afe56f7df4"
 
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "flask_marshmallow"
 
-SRC_URI[sha256sum] = "2d186af7c8b4455b8a2c166c7470939c17d70353671ea5a287a14676846fa013"
+SRC_URI[sha256sum] = "d0f79eb9743f0c530a3d9e848503e1f2228e6b35a819c91e913af02e68421805"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.25.1


