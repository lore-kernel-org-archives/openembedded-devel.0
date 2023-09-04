Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F2C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 11:08:53 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.45343.1693825730579862852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 04:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ECp7NqAm;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a5e1812378so204146366b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 04:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693825729; x=1694430529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1rFuH9r81L1ez9eU+VxC9FGORuABiSNP5l0pBNiFJQ=;
        b=ECp7NqAmpdqct2yXG45nHNNLCyleWEo8iCTUJsHDaYep93CVqz6QT+EXJJBDrqHJdZ
         YmaTNt+n6acTc2TOp+tU4d3LillXhf1gOQhiqccqpd8wuhLjF4+JvocAuuS0/pO31W0d
         uiPnMT3X0dPlof0FfcTAlAdQmYVGwP1IaIkprk6W+VY3ALA1aZWuWzcAfYHtpLrV3q6z
         CDyuiCHHfm5NAGc3vlyxEmRjj5oVM7y6Tv1avFl8vhcKChgiRwknkwJkQJv/b84bafYa
         LipBF963MNfoV1qTQ1Tm9cg9rB0bYpd1OAn/ZS59uckTfLeu3TLTjChvyG03oAp6s+KO
         wT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693825729; x=1694430529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1rFuH9r81L1ez9eU+VxC9FGORuABiSNP5l0pBNiFJQ=;
        b=BdZ6gQRzuV/iB7A+ISIeNho0KncvBEvci2pgr9A7eKGGV6y3RQA31pP/65pSFlsq92
         PUb1VC7RnjIEarNxpJDMtegXFgx5KI/asDcMAnv1GAj+jWuUzsnThGueZoqhG/FnM+OA
         pV8nU+mNm4BdNMBx4wnV8+o164VqWMU9xcEDArIFzPjXw3Hz6R5YpXvNYXGVcUrY99d/
         HhAP7eWZuCv2K/5CNjRYYrbqdF8PplnlFQpP6PgM8rwAJwTZUqUwTB//Q67/rs//BSyv
         OWtEuF+Q2Wg0o2KcIsEjYq6FedqcffYeQYFY2GXr4n5T3XeZZIQHlxrd7RPts9yb+xzB
         FJrw==
X-Gm-Message-State: AOJu0YwhNyeg6kvtxDHyg0hWIVoHnyiDhr6tqsxA2krflduSokfMUCZ/
	kWhLdxKM2uV7Z8x1KNnq8VJU4lT4/20=
X-Google-Smtp-Source: AGHT+IEuXj1WsUTb/A0RtFFmd/hs2u+e2lE8sWUceVBMkIQyHW4B8hz0Yphtzh1tb9QflA9vczZs0w==
X-Received: by 2002:a17:907:62a5:b0:9a1:ecb5:732e with SMTP id nd37-20020a17090762a500b009a1ecb5732emr7655032ejc.71.1693825728826;
        Mon, 04 Sep 2023 04:08:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170907984300b00992b2c55c67sm6002551ejc.156.2023.09.04.04.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 04:08:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH] libiio: use main branch instead of master
Date: Mon,  4 Sep 2023 13:08:27 +0200
Message-ID: <20230904110827.1935448-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 11:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104709

* the branch was renamed upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index bb253f421a..612dd897be 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 SRCREV = "92d6a35f3d8d721cda7d6fe664b435311dd368b4"
 PV = "0.23"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=main \
            file://0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch \
 "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.42.0


