Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FE5CF07CE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:48:38 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.38829.1728550116603894054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4TC/21W;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a993f6916daso116603366b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728550115; x=1729154915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akfqzeKaxchAF+kFfozR0LmvELdUb8R9vaEutuYlQQw=;
        b=H4TC/21WQJaMDdmer7kwV+SHsthnduopZxWpPSNZqDuhTVvQsZrG8Fwd/Ib0+veHQ1
         W4HshH/NDRQOC3j8GIcTX/wuxofMOOjXfQk1aGqeY2WQ7NptBejBhZh5OmKZeWuYeAdj
         vT4tirYIVdh7BxSklZQb2QAvPYFPMbo2PB5IsR9kGauVMAAi96lROTSoQ7qQJBrK0ljN
         xI7UCdL6Eb2QzCid+bzJBeB56YKBzx0Q1e79H5v2ZKSRTKcuOItpeMlBqX7jGj2EaOHF
         NH1CVMAdvEgaT/MWLYYHOHR4Yi1DudivB30hOfnUXpHIgzjrmGLBJ1gvuUQ97imPdoIP
         NSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550115; x=1729154915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akfqzeKaxchAF+kFfozR0LmvELdUb8R9vaEutuYlQQw=;
        b=HLsDboA+jdc1QkKXGCidJKdwRWo79uniAComEw/usAW2OPntzKx8DS16z1cUl6cbJj
         sagGIB4grKxnKZQcxgIO18UrGSpvjxPezhQfIrHscoXcMR7E8zmDYwXlx/aZP50rul+z
         fEpGLfKQub5V6kcdeGF4hu9WyssbMU84v9f5YigJoATZdA34K7apQR1M2awwuVPdRwj6
         Iq2/aUQEa8CdY1VvDIRxGR0Xr80Ej9i1d7ke6S/DeKULj0LtFiZbGwIJSAlhQdWebE1g
         KHVv3jIoI2RbRfHElwwv+d5iHvEeAMzc+MhqCWhNKKQBinkW9ixD3Dr1ldn9m0FG/651
         FPAg==
X-Gm-Message-State: AOJu0Yz2B5cJzBexQhgCKZaMNNalZcJlwggfLAKZlQBMoDmcJ9WjYioA
	9hiyjuXMvpN5IBPfsvtMREeg4Qv6vdy6kuLUqfoCwMcMFhwbWYxv5rSTtC++
X-Google-Smtp-Source: AGHT+IEZL+w/FpjFrJ9iZkFXNXVlSOn5n2hQH2le6RUlChrkjM3tSmuPub5BxvwMS5NpvViTRrS+og==
X-Received: by 2002:a17:907:d16:b0:a99:4dc3:dadd with SMTP id a640c23a62f3a-a998d1aef1amr507130866b.20.1728550114461;
        Thu, 10 Oct 2024 01:48:34 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0238sm56844466b.115.2024.10.10.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:48:33 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2 5/6] python3-pastedeploy: switch to PEP-517 build backend
Date: Thu, 10 Oct 2024 11:48:15 +0300
Message-Id: <20241010084816.40869-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010084816.40869-1-alperyasinak1@gmail.com>
References: <20241010084816.40869-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112771

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- Unnecessary dependencies dropped.

Fix:

WARNING: python3-pastedeploy-3.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-pastedeploy_3.1.0.bb         | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index 27f32bf1a..e3405939c 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -3,19 +3,22 @@ HOMEPAGE = "https://pylonsproject.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-inherit pypi
+inherit pypi python_setuptools_build_meta
+
 PYPI_PACKAGE = "PasteDeploy"
 
 SRC_URI[sha256sum] = "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed418b6a7ff6a095a95"
 
-S = "${WORKDIR}/PasteDeploy-${PV}"
-
-inherit setuptools3
-
 # Uncomment this line to enable all the optional features.
 #PACKAGECONFIG ?= "paste docs"
 PACKAGECONFIG[paste] = ",,,python3-paste"
 PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
 
-DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
-RDEPENDS:${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
+RDEPENDS:${PN} += " \
+	python3-core \
+	python3-misc \
+	python3-netclient \
+	python3-pkgutil \
+	python3-setuptools \
+	python3-threading \
+"
-- 
2.25.1


