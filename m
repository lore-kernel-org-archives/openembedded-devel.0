Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9B1C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:30:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.44945.1674653450319646087
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hCj2mFar;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id ud5so47679825ejc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmD4T7zhZbbgzUY1scjeKaQ2Ty3z81dlhg8v970eGiE=;
        b=hCj2mFarT6M64rdBqavtdHa/xGuSQGuKiwAwOnqjGKJaN2YpnQQ9ZRuqr+jl+49Qpr
         zkrjXAEz3EDW9/aA7yLEvIoDLCZAF8MDAMwEYPj5Bh+8d+MFPOXpVsrA8nBzCvP8cJWf
         FsrJ2OZcq+xNaiVrNEsuKwuKSK9uWJHk98eFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmD4T7zhZbbgzUY1scjeKaQ2Ty3z81dlhg8v970eGiE=;
        b=KvZ+pU53f6J1vWExoQIFGOZpll2x5kjpz7hY8ayBkShNpnG7o2RDNrwz+KqmCPUMB0
         4SFV2aa5eyX0V3szKRIeC4e+w0jaRfSR4pHjc8tZjxkzuIvKfbZDN94p3RcSHmWU2QIX
         fkYKUhR6lgZ3r+5AQy8DwXa1V5yRzwIzMIT+hn4dRTgPw+Di50SbuKuPwEHUFi+3to1T
         rEwmZo7SxjlgFp6EwjB4E7WgcubfVp8w9pg21QdPlYrorfFPRQCQaHJe0YIdvIxKdM00
         TR5R9qKEG9q6bem8Qhs9FYKGd4f5W3PmUdhIoZJcnmabsfUcgV44eTZN/Y8NkJ79lDoA
         j5XA==
X-Gm-Message-State: AFqh2krYZKd36SIik4oNX8tGzZ1V+HDD5wrLq9t0mei5Ir6Kb3SsskFo
	rCCmHY2cqF7vXKQDPPy1TgvgEOUPCt4rEjQR
X-Google-Smtp-Source: AMrXdXvsBYW6A2I5xR4nWezid5F6DVTKSTXGLSTEQg7y5domSBJ2Jt2PdWKPGyyYtW9NZbE+qmQEDw==
X-Received: by 2002:a17:906:13cc:b0:870:1090:66b4 with SMTP id g12-20020a17090613cc00b00870109066b4mr27003779ejc.26.1674653448633;
        Wed, 25 Jan 2023 05:30:48 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id g23-20020a17090613d700b007ae32daf4b9sm2382648ejc.106.2023.01.25.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:30:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-imageio: Upgrade 2.24.0 -> 2.25.0
Date: Wed, 25 Jan 2023 15:30:43 +0200
Message-Id: <20230125133044.2331059-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230125133044.2331059-1-leon.anavi@konsulko.com>
References: <20230125133044.2331059-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100733

Upgrade to release 2.25.0:

- Add audio support for ffmpeg writer

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.24.0.bb => python3-imageio_2.25.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.24.0.bb => python3-imageio_2.25.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.24.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.25.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.24.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.25.0.bb
index 4ea45c9fd..4edd166fd 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.25.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "f240f8229f4f329a1546281194b52da5d6694141a524668fed3f81b0d07782fa"
+SRC_URI[sha256sum] = "b80796a1f8c38c697a940a2ad7397ee28900d5c4e51061b9a67d16aca867f33e"
 
 inherit pypi setuptools3
 
-- 
2.30.2


