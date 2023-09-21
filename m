Return-Path: <yesipov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6754E71062
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:14:35 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.15102.1695298468812095475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 05:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IeK7qfm+;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: yesipov@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so13776991fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695298467; x=1695903267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQSqib54Sz1+XIGRtcbCIFM3RO005l8XiLevVF8Me10=;
        b=IeK7qfm+k9Twru/41wEGP+tviyDCRX8gX++wMKhltE6RvamSMpApQMhsW2uw1aj13i
         SQGgpvoiac5wXuBzuj5n7aWR0FDS/ofBmEbHm1gGpEAts+DE/tR1EIjEY9JD4UrpWDTp
         Z+qfcIkJeCrV1f7sqVeXG5Xo2W2Dh716uyVVTLttZmy4+rJZQcJ4lRN1NQhlcdmYfNw8
         7MtXFQwxegiLVRhl47mbGJ9o6OQa3vkkpR3bj+PzQ0I2EocShq21PyBPypWMz5RfEPs8
         Fjq+KAXFhp6A9r7rQ8N0+kEq2W0qN+LqL3U3ff7T7r4A9DEcqs5+bXFyUqEDyxQMRNeD
         kKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695298467; x=1695903267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQSqib54Sz1+XIGRtcbCIFM3RO005l8XiLevVF8Me10=;
        b=CKM+S0YUVG2fKZnSaJgTiUTvd0NOtTdkdombpyxj5VmeqVcEfeLUSTF8BEwnaUHWSz
         7Xd9k8d1NuF7FFGaKkDsw+L+d6MEDsMT1LX+L6g+JXx7W4Hs6NtjC0KHmMm0xYhVyaie
         T2/NZfIDmyyY7oHE+nwAFTxxk1WB5JWBBtRz0jAStVeNHfBx1xfC067XV+3UgH0ZwOf7
         dAmhpQUPmwK94kFy504EqXgcpr0aG0H/0uSf724BbvXVgglYq3lrsuA9rX2K38yEsLuD
         yX80kuaHsd9lmAB+rgQr9X25XJqhgveuPgBVxFmaaq9iS4OLh/r/DHm+tFRKXYsmf7kE
         uyrQ==
X-Gm-Message-State: AOJu0YwE798flYccmfLYYzRXQ14dKX4Jf0DNE3iw9T6iRmJgPTSPuzPz
	fHL6T1e/QUsbBWfzc5HnFrU9Kj93W20=
X-Google-Smtp-Source: AGHT+IG+RExBxvUT7n4zoM5SCQut4frDWAb49e+uiKG6eMJiMZU4IJJNC1g3jA4pMGUT/Zm+FVTdgw==
X-Received: by 2002:a2e:7c14:0:b0:2b6:e2e4:7d9a with SMTP id x20-20020a2e7c14000000b002b6e2e47d9amr4652573ljc.38.1695298466242;
        Thu, 21 Sep 2023 05:14:26 -0700 (PDT)
Received: from nt.. ([141.113.65.137])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709066b9900b0099cc36c4681sm956767ejr.157.2023.09.21.05.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:14:26 -0700 (PDT)
From: Kirill Esipov <yesipov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kirill Esipov <yesipov@gmail.com>
Subject: [meta-oe][dunfell][PATCH] catch2: switch from master to v2.x branch
Date: Thu, 21 Sep 2023 14:14:14 +0200
Message-Id: <20230921121414.37377-1-yesipov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 12:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105041

"master" branch does not exist in original repo.

Signed-off-by: Kirill Esipov <yesipov@gmail.com>
---
 meta-oe/recipes-test/catch2/catch2_2.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb b/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
index 9d449a23a678..50188937d51f 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x;protocol=https"
 SRCREV = "2c869e17e4803d30b3d5ca5b0d76387b9db97fa5"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


