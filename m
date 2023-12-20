Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46C2C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 23:13:24 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.35327.1703114002774037476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 15:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7b7f6097355so5937139f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703114001; x=1703718801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axa022SrucDTr/HF75QOeNfn8wCVrB3zEt07MC3P/2o=;
        b=nFvkJlDNEA/aesTnBIpdys3QIdTXCCjCJnqvxvrkmeoU7CcNQDhT2Wzw7fFKzUrPha
         hel/y5UvVpg3Rb8zEtlwwCeG/VJ+x8knjo8XoGBT/BfT/r1zLFyjAm1e/aGZG9ataedT
         /WGQNDDI7YcMlrWHaM9/f/xIlXpKjQZG/odO9US8ZFgZ+vJ0/yvA+eYIQxLOtND8ZNU6
         WMKWoKDeyX1vS4zA/5B7CG1540e6n8mWYy7P0TZ3FFTJWgY0ihMzx/J1GbwFBhs2cLBL
         6oQees6xojUWdBzBiYUxK/W3jin5jJcWzOYTHFZxeysmmbSr8Yf7ef40UIt2NQVQTuPq
         93hg==
X-Gm-Message-State: AOJu0YyWKrIxe0P3rM6J4gIkVmIxu5DTheF58BDbs4ckYIYT8TDWPPW1
	/8ZFuIHF1urNYsEnhLyNxoP/xJa/tsZDmg==
X-Google-Smtp-Source: AGHT+IEbHzeVXx80CJf3KP1eX1jtbl0LjeJz/BxWicCADo7VG3oB1XJp6zBk/Cuhgm1zqMBM0wcljw==
X-Received: by 2002:a5e:a90f:0:b0:7ba:7b36:45a with SMTP id c15-20020a5ea90f000000b007ba7b36045amr1461040iod.21.1703114001183;
        Wed, 20 Dec 2023 15:13:21 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id fi3-20020a056638630300b0046b368cb99fsm155249jab.97.2023.12.20.15.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:13:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-apiflask: update to version 2.1.0
Date: Wed, 20 Dec 2023 23:13:12 +0000
Message-Id: <20231220231312.3842099-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 23:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107691

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-apiflask_2.0.2.bb => python3-apiflask_2.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.0.2.bb => python3-apiflask_2.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.0.2.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_2.1.0.bb
index 88afdda71..5bffa2291 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.1.0.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "APIFlask"
 
-SRC_URI[sha256sum] = "c1ab81640a1ab252888e2cc7ae556272a169b449c582abae309a8fe295f9337d"
+SRC_URI[sha256sum] = "e7616d902d446eb9e1c67d1d8a34691b437f9da4fe7a3b4d49c91ba88c85ee2a"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.34.1


