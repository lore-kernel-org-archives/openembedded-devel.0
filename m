Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E86CC001B0
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 19:17:17 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3434.1689448634317680055
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jul 2023 12:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Oi1fgHYI;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6687096c6ddso2001669b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689448633; x=1692040633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkQW8j11JiPrHpOq753AiLcBk7fX8KKCjHWYisbe/W4=;
        b=Oi1fgHYIFEZlODOtGtBOWyrfE2h/mT6MPWEJWWa7iOlW2iB9FzUlYNj/DFEVP6Yv/o
         RbktxPo2s61NdTnGY+qEif5Qk3hE25zSKV4vbk1hpvsL2WtOpw8DhwGwX/fL4yP2oUZn
         9e8FkjlLamj3SGORWT0skeETFJM0Z/2XeBektwyt9sZJdJ30+TvE/XvegL9Uss5qjz21
         k81R8LURZEvTIh7roM5FkRmOkLfwxqZyfDzCJc1d/h0jxYWAUiWf0iNs3D32RFzlWZZw
         lEabCQHYeUr+9ozrlA3LRYhFt69CIPeWDEqBLUva8BUjWK1qX5FjO+PQz8hnrnk4nB/J
         wnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689448633; x=1692040633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkQW8j11JiPrHpOq753AiLcBk7fX8KKCjHWYisbe/W4=;
        b=iIiFji4HI6b0l9Nq3LlHVsgufr54XN1uZTwtzHlb+9TsTXk1OFjKDYhZaeZ75EpMYX
         GbupuGqgDjokHdYeYuXmY6N1Q8LPll+8p1mSRtk4/PNp4K4G2BgHu2u1Zre4alL0RfHQ
         rh2LgXiOtxx/5Dm5CLTelKlEC7ECUQZE19wNANGyRC4Jx0ojUuAk41ZNzkqCQK8tCiQP
         FmsqzzbnfwDoGzsjzvjj0Qm3UrpmsdlpZCBdF9jS3TYA9saTp30oU7MythU7LQoLfZRV
         rs/Im7syFu0hWkSgnftG6zdqVQj5JR+7Laz4sGYrOx4LKzaCelMl85lcxzs/LG8ywLkj
         6G4g==
X-Gm-Message-State: ABy/qLb/XyWyndyFfbUmXgWpk66WZKYGmXGBacvI3l5op/SUGXvIqXOZ
	ssgjaZTUiUHGZfgY6B2k9JGIHlr53mA=
X-Google-Smtp-Source: APBJJlFksj2BGyYseqc572BeXrNXtCSMTY7DkDFurDjCJbx9r0T69syWc6VWAQvS3wwSHrqu9H27Ag==
X-Received: by 2002:a05:6a00:2e12:b0:67a:9208:87a with SMTP id fc18-20020a056a002e1200b0067a9208087amr7141530pfb.23.1689448633208;
        Sat, 15 Jul 2023 12:17:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1069])
        by smtp.gmail.com with ESMTPSA id e26-20020a62aa1a000000b006749c22d079sm9041781pff.167.2023.07.15.12.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 12:17:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] mdio-tools: Update to latest on trunk
Date: Sat, 15 Jul 2023 12:17:10 -0700
Message-ID: <20230715191710.2545420-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 19:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103871

This brings fixed for compiling kmod with linux 6.4+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/mdio-tools/mdio-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
index 7afe1c56bd..46d0c1b4f1 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -5,4 +5,4 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
-SRCREV = "ee47c32d958ae0dcb9900b3b06654a8c08001331"
+SRCREV = "0dbfca13a094d20d736153c63161cf11b9ccf2d3"
-- 
2.41.0


