Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7884DC47084
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.21283.1649623219705231705
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=YOBZIXFl;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id d40so15847055lfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpF/5uSn1Ytpv5F5Fe5owLIDgAhfPWaQGcu65nCL0Lo=;
        b=YOBZIXFlcfLenybYjPDJLgX3p9iXjgRfLIoMgbMpP9dqUfWkn55B7qzBjc35wHCB1A
         R75brQwcbP909kJukzE9pfpJy6vsa0qoxJUnu5+T3eRgCGC5sNgQtGHTrPwI5fzZ+Zf2
         g4/JKhwRUgZVIR4kZA1Sbgzbw+YwwWKPdZs/gwLnIYba4B3FxzYrY3lzbSpmJYMCs8mH
         54dT8fSB51xGAEH0YO6ywzpvJVxzxrDM2M/jHzOCCaXTrC529PHzj5uEzSD/dxJ3shIu
         IIzT2sMJdFdvRvaUgu6K/v/1A6mJ/EYqCBw0B3Kx8/t9nLCWI9TiLusyWGIbEhRbtcRf
         FvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpF/5uSn1Ytpv5F5Fe5owLIDgAhfPWaQGcu65nCL0Lo=;
        b=yFiTOuldROj+tE0HjdIRALytkh2IeDBS4CoqGxQTx8UkfzKIN3s1GlI5iO8bgsTnUS
         2cSNuqU2/a4lPppeOR5gvygmhloT6YlgiMw84jopdtYGJ6JcJaNYyQZoZjrTzc5GPoIc
         5TKgW/Y3dY3Q2n6fohW6hgpfARE7C5ztuDgImksdONSdITpTqsnn8PEfLro3F62ZeRHi
         1DFmffLIDWa9DJXEMSK8FKbjHLXxupPryVThIlDCFZnRtU1hBMIqxtFaaxicTP8y2WYe
         ANicXW5SR2ViQmb7KQ91BRiqf3sQCgRJCEwy/gIukw7UkqXMQmZA6ozhamyXIoZD64nK
         o/5g==
X-Gm-Message-State: AOAM5338GgzH00qiZcNNzryhTmPtmPTxle5KiY5gO/RG7xIk7hcUqH/g
	r0Bt/yS2zpYjGkgzjAhaOTykh6LFdDO4yvYJ
X-Google-Smtp-Source: 
 ABdhPJwTuVrM572V0UghoXdVJwhKnca4FepocNxOfxa/we8GcJFFuhigbxO8kr1jrboL80KOUwaomQ==
X-Received: by 2002:a05:6512:3f0b:b0:450:aba7:850b with SMTP id
 y11-20020a0565123f0b00b00450aba7850bmr19373632lfa.78.1649623217101;
        Sun, 10 Apr 2022 13:40:17 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 i23-20020a198c57000000b0045dcb4816d3sm1929278lfj.35.2022.04.10.13.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pywbem: update to 1.4.1
Date: Sun, 10 Apr 2022 22:40:13 +0200
Message-Id: <20220410204013.4042999-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96507

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../pywbem/{python3-pywbem_1.3.0.bb => python3-pywbem_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.3.0.bb => python3-pywbem_1.4.1.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.4.1.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.4.1.bb
index 676c654b5..210d64320 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.4.1.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "5df0af28f81891a3914a12f3a30b11b1981f7b30e09c5a42c011797e7fce9b6a"
+SRC_URI[sha256sum] = "ad8bbbe4ab7e795722c0f27f2656c92fc673a7e06a14cd151a50f0306454d17e"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.25.1


