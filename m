Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61BFC61DA7
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:05:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.86297.1674767132037428959
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HR1Y4+ZD;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id p24so2986128plw.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CudGvke5Reo7SgrWd+uTlHD4dbiI03zyBE9amGYrkwA=;
        b=HR1Y4+ZDiCtQBvGfX9/UiVtgg15fERkg40h6u+ZZLYAMEmAAYtNO6VNFUdHZVan4bc
         YSC/trvLWQ20Sho2d1GKDKJPhCZztM/dvYVhBweWM1gpxWUTSTf9wovEZpAMAr7DYKqC
         FB070wKjngOAs3/TMvmAFE9zup0wuZqNeF6Ltz1sNVcFQCIRkwo6i9aA77XJGRN/uhL5
         tVE4Go22tmAEXpnEzVRqcT9H6gpMJds9jG6VYzWXv3vo7fgophidKMmpPAgjIqPAUTZ3
         mVYbEeRbUb11mHSvA/vVQlpULtZ2z7FmA57YNEfUvqYMcreCnGw0h7XjnFGioFCL6Zp2
         d58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CudGvke5Reo7SgrWd+uTlHD4dbiI03zyBE9amGYrkwA=;
        b=loUID+Bjt217wQifXXu3Pebg64K3xdcdaSLM7xPdxN7zkT32lWalfFGlmOvsfLdB8C
         Dk4DuXtvQCL19ruL/KpHbFTFLKyONEH5PwSACBhUAd5JD0Ha7InVlD78Jf0Bnanb2YAd
         QUhlmuvYi54Kmliv0RYkbpV3w7gb/kfJW+zWxuFM1hpcrBr2zYLZ8rniwTfQ2KamPl7e
         6HWI7z+Mki82zaPEJKwooeNmdtJzvZT88mFBlKIaG+Y/6956hXh/OKPS3pMEBF/CGd9i
         8kUVSRX9yjyXwSJ0zMIJ1tyL1lKl55FCEBYYAaFxBXKtiBjmokqMWqTDhwmSTuJqkGR/
         /4rA==
X-Gm-Message-State: AFqh2kocWBO7f+TcptOYYDo9pRrnFxG8IPgRdoFYqBBho8zScMf7THSX
	ccAzKlitrPmMAcDHS6RvUniANVM5H+MZRw==
X-Google-Smtp-Source: AMrXdXvpUdbffBOxhOHDa8NbomOtUg1STqFEwCIcZDIyB+TY1GO+LVJCjtXM/YUA1KtxFppkYYFIiA==
X-Received: by 2002:a17:90a:c57:b0:228:f13b:9649 with SMTP id u23-20020a17090a0c5700b00228f13b9649mr39341470pje.43.1674767131145;
        Thu, 26 Jan 2023 13:05:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a94c800b0022bee398e09sm1503847pjw.4.2023.01.26.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:05:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] redis-plus-plus: Enable SSL/TLS by default
Date: Thu, 26 Jan 2023 13:05:25 -0800
Message-Id: <20230126210527.2815542-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126210527.2815542-1-raj.khem@gmail.com>
References: <20230126210527.2815542-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100801

Makes the build consistent and it does not look into native sysroot for ssl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
index b127025a73..8e906a4483 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
@@ -12,7 +12,9 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-DEPENDS += "hiredis"
+EXTRA_OECMAKE += "-DREDIS_PLUS_PLUS_USE_TLS=ON"
+
+DEPENDS += "hiredis openssl"
 
 RDEPENDS:${PN} += "hiredis"
 
-- 
2.39.1


