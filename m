Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83262C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:58:59 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.32701.1723035537924549045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsblBW/b;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so20408451fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035536; x=1723640336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zT7AQFbq9CZanJUsOZ+gSEQ1L84nIq4iooFXaVXpWM=;
        b=ZsblBW/bbwXm50q6djuKjWBChrkEWs6/YmsaTqKzBfzN/rNU7Y2740GydwX1r5GjTO
         ijjfHSWNpLYmrjCAO4UhljMoJmXExoyoNOvGtaRY8zF4JdDdkB1pKa3Y88K5g0qr120Z
         G6W1JZ7eS0adYxdbexMoV/8U5DFtxsRsFQ/v6tJ71TtXK62wrrubCzLfspD3A1mio1Za
         b1dqQ/O2O9ItCBNA+QD7zGql9+dB68i1xrijdN3QdrhJb5LPacAFuHk3UFYvcWimudTm
         P6jOGxB2zfOsoFq/HmGuxb1IpL8h8oVN5oADduB/kdfx45IA38s2d7L9vPo1tDUJ15xE
         j/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035536; x=1723640336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zT7AQFbq9CZanJUsOZ+gSEQ1L84nIq4iooFXaVXpWM=;
        b=PpqJFnBSO1NvmxiyegTVvT3T/15BqUYatLXmk1GyJjsff+sr9vmzRg66BaqUeAJ9Mu
         wwCjOX9qljfOjb7Gou8TGEbnCwnjRXrODxfKQ2fRS0swumNlBMzYQlp7GSkXgLAEvhGZ
         toBaIqgYLnF8x5B7H2+8Z/tyJ49N7y+x9dz5ON+QaQOFIfVJJ2rB94N7NPa7bql+IeXj
         sztPCHl2FZxGSDrkxOw1Dg4YnfiLz3N5NqxzSrd9YK8AGLFboVNJglyNo9jKos7Uw5Sz
         I14+V42kAHsB3FTss9XJ704Dl8Ads1KQYmzQyErXkaX+2gST7aTP0I3Fw3BhIHI1uZLw
         bebA==
X-Gm-Message-State: AOJu0YxwAHEWKMIhiBTRAzeJyxL3DBx53IIdWf7Tn0B9vSdKbnR1F57P
	Ghc4YwgJhMGp+kxg5jlQwNKhKtBr+fMzO93/w0BW8scvxgxpDb9iQZC1Rf5Y
X-Google-Smtp-Source: AGHT+IGe9Q8nHbMmCsyVh3b0gJpbKy3s24yG6V+Am/+ISQolVEi4oOVKFO4Mn1tKZyRxSN3G+Oydrg==
X-Received: by 2002:a05:651c:b2c:b0:2f1:929b:af03 with SMTP id 38308e7fff4ca-2f1929bafdcmr24241321fa.30.1723035535428;
        Wed, 07 Aug 2024 05:58:55 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290598f18asm27979895e9.27.2024.08.07.05.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:58:54 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-ipython: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:58:51 +0300
Message-Id: <20240807125851.139511-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111631

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.
- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as ipython, it is by default.

Fix:

WARNING: python3-ipython-8.26.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with _build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
index 6cea3d988..6f35d9548 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
@@ -3,8 +3,6 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-PYPI_PACKAGE = "ipython"
-
 SRC_URI[sha256sum] = "1cec0fbba8404af13facebe83d04436a7434c7400e59f47acf467c64abd0956c"
 
 RDEPENDS:${PN} = "\
@@ -25,4 +23,4 @@ RDEPENDS:${PN} = "\
     python3-stack-data \
 "
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
-- 
2.25.1


