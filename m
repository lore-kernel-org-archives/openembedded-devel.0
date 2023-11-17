Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB1BC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:18:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.8271.1700212718199587410
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=c/6voFCb;
 spf=pass (domain: smile.fr, ip: 209.85.208.173, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so22158691fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212716; x=1700817516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFkUYmWo2sOAYFvHwONd4DTmsEPoReMf3ZjHzurE+LY=;
        b=c/6voFCbSIIf1hdv8JPtJK5XbDzjpxp9shchmXLsQV96bCuPdtx5hWe+huVjQuWrJd
         /CVF+Nh6e/y+SXDSegwx64C2MpCEj3vLgIa84xwpTQYZCrVOtfhrjyFzT0un5L05cqRM
         RM31xOFgnm/8YlN43CGBCYHTJytlEcqSVuhPchyWWjWX0URblwr5ck0QRRntzB+9S0hA
         uomRHrkW35EsQfAm/xnClvfLAnmoKYLNiq+gjZlABqlLd1HXskC1mmCRlmbnExhZiFfB
         yZddA440jc7oLvAI/0MsrgtdwPzGe/lJmh/rX42qm8E85PahaWPNambUqwiIkn88Kw2A
         wkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212716; x=1700817516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFkUYmWo2sOAYFvHwONd4DTmsEPoReMf3ZjHzurE+LY=;
        b=qGXmh0Bf8/xTr972cZgNTzoSgJXKjJqeHCkwlxaiVY/5czWTw0IzKzd9kT68sQDJ/1
         FNwgR3cnq0YqSdaWVSiL9wkzwuxCR7Rkpc+PzjlxAB54D36gAcYDRrXRgxTROf1mEtPF
         0Q3K3OjecQb/9hwIj/HGBmrkxijuhwBO9gjmd/F2rJpSSX7NIxpiKqtmTvHQas1x2Cl/
         nzOKLFh18qRWH0DgnflNj7zBI0XNr/z7/DjQDYDdtFO4RTrVdZw1gidJLsALQnA99lhY
         wv5NWqxU3I5TWCRjcHErchVFv/ArgJU1g+Ug5u++VPbVERPgxcV6hajsTg/evno6hGB9
         j8cg==
X-Gm-Message-State: AOJu0YwZRJpZwBZcfwTeCnZFD93123/RWkwkVdKW4bN62bnZMQkq70A/
	zYEazpiiXVulDmAPERZ5JuynF3RgkOMX0hQz5Hc=
X-Google-Smtp-Source: AGHT+IEcfjNCnXuFXYjscqfnVb54lZcd/WfcaCdpxT8GYqJvIWCAdp/oMtzKTjEqq7hKcGifnwfxWA==
X-Received: by 2002:a2e:890c:0:b0:2c5:3492:5d96 with SMTP id d12-20020a2e890c000000b002c534925d96mr8054881lji.12.1700212715783;
        Fri, 17 Nov 2023 01:18:35 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bcb19000000b00405391f485fsm1965649wmj.41.2023.11.17.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:18:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][kirkstone][PATCH 1/2] python3-cson: fix DEPENDS on python3-native
Date: Fri, 17 Nov 2023 10:18:23 +0100
Message-Id: <20231117091824.450741-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106864

python-native is not provided by meta-python anymore and this is clearly
a python3 recipe.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-extended/python-cson/python3-cson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index c4fcc61ec..da174ad55 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}:class-native = ""
-DEPENDS:append:class-native = " python-native "
+DEPENDS:append:class-native = " python3-native "
 
 inherit setuptools3
 
-- 
2.30.2


