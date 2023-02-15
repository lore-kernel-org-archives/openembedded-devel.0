Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DF9C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 09:40:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.11525.1676454028047198049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Feb 2023 01:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y3fcyZW7;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id f18-20020a7bcd12000000b003e206711347so57235wmj.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8p7mG2Ce4KMvMcWv77871cWtbF1ohNEvU10/ceIFY4=;
        b=Y3fcyZW7QKQLqPTiVzI63AMpQxKLH3whRjTAzPNxGLbtqs7cm6L4TeFiP5S0wHIzOl
         6k9onTDSYXMr0BctuwZQOvx3xYX2I223fkQkJIuiCVgdRC5MoFeO4+DE1p0t7V9pMgJO
         68onY5fwztC6juRQMkwo1kHbVwESn1GHrFu1Jk7pWsW+01GLj6GTv7ozQC1z61nLAOJe
         L2wplpa4rXErensd7ecDG0n2sJQXCdV+BSOA0TyPK49QL+f1C3bKTK3FMwD9YBa/mry6
         lNY/TdSf0tLuxzk3r9EakN/zNowo1A3y6ubfDeWDQSe8CyDj6IK21cjqSV7kwCZIM4bL
         7YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8p7mG2Ce4KMvMcWv77871cWtbF1ohNEvU10/ceIFY4=;
        b=AtBcSOjQBAKCdkuGuvnVYMy3DnYe+/j5678ShjDw9bttgmtT243eFrbhSg69riKC8M
         ZdB7a8p3GlsHyAxLt01nxbris1ci+ON1+qOjrqcNuA68oGMEmpwXy/Hc64Ujbgrvkv8t
         uVciipfqUCNtOw9lovqTKwZWonvXp3zIs2PIhqJSKYeE6oMsbFko7tEZOLQ4FtMoTn8J
         i6+Y7xBVC3hVLUr6TOktZUBZ9PZvkr179bgSm/lszKfVIKOgKzmwNFOzEWVPHNuvE6z9
         x6xEAUCr8WDDFC3S6eIIYPedASM3MOryWA9ji7iL5VG/k6L4wKXwwxQqF2wOVJvSsQZF
         7Umg==
X-Gm-Message-State: AO0yUKU/f7qtMYrLQV53LI31Y20DhIe13TUijpV42vdB1kuIZ39V3yCo
	mLe4LFTV8eLqbC8lH8xjwv/69ukfbag=
X-Google-Smtp-Source: AK7set+uTyPij8j1v2LG8CkKB1d9/GtpGOGciW7oQYdvHMLReZKfte6whGkCRu7kj7mvZPBrGp+2fA==
X-Received: by 2002:a05:600c:4710:b0:3dc:59c3:9020 with SMTP id v16-20020a05600c471000b003dc59c39020mr1518260wmo.8.1676454026348;
        Wed, 15 Feb 2023 01:40:26 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e12-20020a05600c218c00b003de8a1b06c0sm1604220wme.7.2023.02.15.01.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 01:40:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][langdale][PATCH] exiv2: fix SRC_URI
Date: Wed, 15 Feb 2023 10:40:21 +0100
Message-Id: <20230215094021.819234-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 09:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101082

* https://exiv2.org/releases returns 404 now, use github releases
* it's already fixed in master with upgrade to 0.27.6 in:
  https://git.openembedded.org/meta-openembedded/commit/?id=00a7d4b284c1afccfa26021111384d2184b82e5b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 31afe78e45..b210fa6340 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat"
 
-SRC_URI = "https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz"
+SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz"
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
-- 
2.39.1


