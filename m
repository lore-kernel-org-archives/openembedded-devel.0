Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BA8C001DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7419.1687180975300205744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=LfL4O5pg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-307d20548adso2535557f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180974; x=1689772974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/t8mAM/HzsIXRiR+aSghHzlVcefKPDKNNl3I7uOHIw=;
        b=LfL4O5pgF8z/UAA3CVHjw0+TzWOwTJqPMtzDUqV3AbGIzKigtQUf9QNeVCoOsp+Ki4
         yKN8kmNAC2l1hhpOREuQVUmkxfz5AhP9fu+L0A4NQ3DqjHBuNN4XiGQP4PjUhE/1qaH+
         V9nfGOmgP5OInH6KFyUt/xA0jl/hIbuttkDEBpph/4eZTmfxbEUEMw8yRc+bB74GyklP
         BmyCICGf02muisc2RTLObUUR2ckIE1Ov4wuDkEe9jOf4bmV0ueDLDTp2IZ6qiDTawEQp
         ckl77WlesLN+f4svLKi8+A0v+9MAHo3x6Ef0tSgnmPw+cM/ZmQGnLG8oy+dlOcAE79f5
         lseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180974; x=1689772974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/t8mAM/HzsIXRiR+aSghHzlVcefKPDKNNl3I7uOHIw=;
        b=JTPMPQJhiG0e1IJsGHWTBFlNwten7vOoEKVhVpSR3Ohtcnk27Y3o8vPKdvYt597/wQ
         qGwoZvFMzxGUaPiiuhiByHPHZvFSkWiUmMWJu1NHEvvTgBEioO290l+aOs/uBtOCaOQR
         YW6eiUHm5W5298kkiCML3KiCIACDhetWZepmsC44VcrDkL/NDIejCyZHVmjxxVKbOPBS
         me7M82aMX9XW7WNRDp8HIPjncjIGV/g1SN4PzK4vO4QQeLYTWueB6WgMa5Qw0K/up+df
         RHES/PO7zoSi87ziNE7Cwx3ItmsjUgnIEsRDywN/+U+S0fdWgtfsExksjSQnJ+rni9yu
         d1UA==
X-Gm-Message-State: AC+VfDzbI/qa21S1tR9d29PKJABKeuicymHDnR8ganEUjoShfADONfn1
	B0JqdCIzl8RB4GWBjg8cozJ51Q==
X-Google-Smtp-Source: ACHHUZ7+Z40WaxAL9Vt+eNzaydh/ia+D8qYbnc3ECAC7hCkEgA0Cy35RIP0I5Wpz8YDe/MJuS7vo/Q==
X-Received: by 2002:a5d:5960:0:b0:30f:c56c:b5b3 with SMTP id e32-20020a5d5960000000b0030fc56cb5b3mr6383971wri.4.1687180973885;
        Mon, 19 Jun 2023 06:22:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 32/54] python3-aioserial: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:52 +0200
Message-Id: <20230619132214.213417-33-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103416

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
index 6419aa9c9..8279f2704 100755
--- a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
@@ -12,5 +12,6 @@ SRC_URI[sha256sum] = "702bf03b0eb84b8ef2d8dac5cb925e1e685dce98f77b125569bc6fd2b3
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-asyncio \
     python3-pyserial \
 "
-- 
2.39.2


