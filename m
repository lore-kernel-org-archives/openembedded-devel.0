Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380D8C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 11:31:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.19367.1707219104547771113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 03:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PIqCZQqs;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3810e975aaso85955966b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707219103; x=1707823903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwmVIQ77IWeTCj8qEvSkDeQBc5PZAcxGautLg9eI/lI=;
        b=PIqCZQqsgIBBhfp4lMFzF+JkynIzxoIFfIKjtEePyAZMPSOhf3Ci75Fe2kOWqcigUc
         /9ivQlKT7gSX/C/t30gLnsZX56uyUYeS3NzhqXqvHzJhZCiHyRsAWI2ieh/pqc1GhWsa
         y8K7B0Z+gyPYW+rblTIzVULG+MLaIzNb0NLMTaUYAu4uIuGrwrcRQ5MCRvznLzbohOYX
         hjXIG/yRUVfn/xTSmtXfm4hl+JjL6+7Ab4LQ1VfouSp9HtZZv/j7Ckhd53S7zCk7EGRe
         XLlSR0h8vWts8SKoB0D6QVB+IPVCtnYznvzr9hkSXjmCz1EhFJ1unh9gK6nRzl69ZJtJ
         6anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707219103; x=1707823903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwmVIQ77IWeTCj8qEvSkDeQBc5PZAcxGautLg9eI/lI=;
        b=J3/eHxLobZD1dFWEQ8t9ZvskIbUbpiEXorFu2JCf4uwLgZGCzqxIXPa27K6B2gXBFq
         dsuzChZmTATdpWuUKO6aC93ZVoSrWlyTp9/g/fjZelq+khsdA9OrVWnukSR48ZgGLHYo
         8XfJM9p8I5r8h73xoVUAqHeAHzXqnVbc4SQYAZCe0auGUyjxEzxo594pHPqa93/fDKJs
         b82/iiLo/mA3bMq6Vng3ci93PTnBy9rcgF2ePEnOvPgtGTnxqqqG6aIxTJWBodoaczcV
         0CNhMkgRgDkiEHYFaus1KiVpOxtrQAUBSZ2DaA6oV6udFubXrH0YrRgebUmbnktFbh//
         TXmw==
X-Gm-Message-State: AOJu0YwP8RkHuUnPrSQuwoHXncF7n780/caQ7LvOyEAsu9eqkyJtxBRS
	+dX5OvGcSvxGHXq/TPPfzViSg8MbzqrCvTtXiIDQqGxoU2tqtposyj3ThgDo
X-Google-Smtp-Source: AGHT+IF8Fx26jRKAV2vZQd5PNvtt6EZOufoS2aQcOTYRHG3lMNb4NMAamlcAZ3i752gS/tBSh9udTA==
X-Received: by 2002:a17:906:5791:b0:a37:e980:5946 with SMTP id k17-20020a170906579100b00a37e9805946mr1398684ejq.24.1707219102781;
        Tue, 06 Feb 2024 03:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVQZfrAAgPIO2LQotPLt0Szof1fGLTfUaDz69JdABrwAosrJt22LlfGU4WePpFX9lyIwPWa284SfvdiaP2y079bVQlGiQCj
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m3-20020a1709060d8300b00a3634a461f9sm1033434eji.109.2024.02.06.03.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 03:31:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Angelo.Ribeiro@criticaltechworks.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] flatcc: respect baselib
Date: Tue,  6 Feb 2024 12:31:37 +0100
Message-ID: <20240206113137.464450-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 11:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108625

* avoid installed-vs-shipped with multilib when baselib is lib32 or lib64 instead of just lib

ERROR: QA Issue: lib32-flatcc: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libflatcc.a
  /usr/lib/libflatccrt.a
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-flatcc: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index 161c4107b5..ed26299901 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -24,6 +24,7 @@ EXTRA_OECMAKE += " \
     -DFLATCC_INSTALL=On \
     -DFLATCC_TEST=Off \
     -DFLATCC_ALLOW_WERROR=Off \
+    -DFLATCC_INSTALL_LIB=${baselib} \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


