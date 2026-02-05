Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BDFE91294
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 08:50:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16631.1770281438932545401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 00:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=SF6xDwCS;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.51, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8864618c99so6864866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770281437; x=1770886237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPRoGAXs963c5dma1OB/MrOdZH9gNOWTv01WPQ/YL9E=;
        b=SF6xDwCSmM/arU0MXIZnr2xWlK8si9i/bAlSKXNsfbaEykMjKLKminRlGVynZIwpV/
         EHkK1RfrejIoAPnJ9CGlCm23OHz67bbQoWmv2+1PWk60xxNuEb7m2kzd2iXRQmeUfFGS
         zhg0dPJyVwJdaA/QgBfNRCu8+nrKQuy4S+MqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281437; x=1770886237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPRoGAXs963c5dma1OB/MrOdZH9gNOWTv01WPQ/YL9E=;
        b=S6oak6pqC7mX+prg9sL4+BAsVkm9ZyqQ6+yVazOZLomfMM6l/KmexXtq9FRztELiIy
         hxRE1IRGSoJot/6lhZzw3wJi73Q0ndzoi4iihdbHlmJ4ZrbjPZKi8QQfPKnawi/dUXmX
         fws23icySuad31D/Tb+7Akc5Erz/kILi6wair+lqRYAGQD3pQS3ZpL8WHDHb6nBglYQm
         5DsTz+0uQo0QasVyRvzA+DAWP+m6HfQ72qGsqhVUssivdUO6/+sG+NfiQw6DI/e/YFIX
         7xxVT829Kwn7RjhcwW9A3UlXgim2+tGcWe2wMZP/n6rjWLLqLXJWMPVNWxZZTGMLJdip
         oLjg==
X-Gm-Message-State: AOJu0YyGL3sf/dSOTNHJrNRw30kJxK5ACbPkzprJ9NbIxSz20d0DWmXF
	dFm69uetcG1nIGwX1N61/KHr8k8L50CET3bXR1SstRe49NYAKrbkuDhHheayp3881BDX3RDM30Q
	J9vfL
X-Gm-Gg: AZuq6aLwBfDncZcBjnc0LbB6kxf6nYI4v+QR6uJpDTxk5WHM5SyfiqAiSSr/JNMkiic
	8Iw2XzzVo8gxTWT497cyK8KM360sGBOLuOtFCi6aSf3fgNn1ZSFEbNczuTvHbqcH9BSL44+AOWt
	gnh4fWCNc2/6+CwnzjdT4qXhDCLVDCx+2Amhlx8Mnj4zbFHQAhagcqZBYepzHzMS2Uxcm8Z9MZ5
	lYHxluuuNKKfkgcatgfA4OMmozKPpat3axyx5Yk014ugqg+nlGHFyNiTMalfg/HyX5Md6yvdqUN
	UIxFM31Fc2Z8w50MiCWbdwvj7CuLb/j84VVAiExf5kkZ08+C4cLH0W3oO7DRpf7X70NJi3xNmYa
	4Cf8EDUprQjEc73iBGXyYp0msv9k0PVBvh/b50TU6XGTRDDJGijnIoZFWNMdXa0OOcv2u/GmWDR
	Am0frXiLdQqH+tkxaoEuTUmn89++UXSignFq9eZN9IDFG+75t3yjb4kLppq3gN2lWpWKBHaCvv5
	ZeRiFRwKUwgFB1KujSv3sp2kD+iJTuiCvBasK+eCG0c5XZUu9vV
X-Received: by 2002:a17:907:9451:b0:b8a:f365:f2f4 with SMTP id a640c23a62f3a-b8e9ec79a7cmr240048566b.0.1770281437168;
        Thu, 05 Feb 2026 00:50:37 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff2bsm206269666b.42.2026.02.05.00.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:50:36 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 1/2] libtsm: upgrade 4.4.0 -> 4.4.2
Date: Thu,  5 Feb 2026 09:50:33 +0100
Message-ID: <20260205085034.10531-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 08:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124200

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
index 074302bed7..6f060cd0f5 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
+SRCREV = "b052e48cc776be1cdb940be2dcc1603457c01c96"
 
 inherit meson pkgconfig
 
-- 
2.52.0


