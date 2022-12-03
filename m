Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F98C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 12:47:59 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.103034.1670071671761369640
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 04:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCGlwpLN;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: festevam@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1445ca00781so1828935fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 04:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XEWwAGzM9ZuT0xWHe5tJ0r90x/ihMNXxH8u59Cbuai4=;
        b=aCGlwpLN64iGnPLqDdtXyeVah3H0RmpnvdJSB8Vvrfs2VDUGPcBAe5reyfv5/jJ/46
         QophTLre75BAGN3nSXNh66/GhcyTDSC5/vEzvYs6aweH387RQrVk4NrwwfZEJLI2Z1nN
         IB0wC27Rn2sitXsaKuxvgKAFf/59lOtPGvFm3qOMv1ZJJvFelKTjyOa8iR7agjMjIOwO
         TedF54QS/p/fBNkSVCn7CsfFHL0bENOkZKeS2+fJa4MVhWFLVDTJL8K66fuuMEORNQWM
         XAmfkTKUEtGW2kkWg/v896u5iiEnTy5YYKcBos3joMikav9F9kxcUcpPYv49plSlan8Q
         GbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEWwAGzM9ZuT0xWHe5tJ0r90x/ihMNXxH8u59Cbuai4=;
        b=s5OEt0dLU4fTLUazKytnDcusLfUIa/8HHxOrnn39vkM/+FhFHoxTR7qWHaXHmsB55h
         wlostv61hk7yvoU0MoJbgi7fRY73zkITIJoEp8tsh0JgWhzXoCIj3REBIhuzJknQsict
         Y9nfSjpZPn/Q4UAS4/pOwj1R8gOJKjuUNGMP3PTAC+zKMEslbW4BL+wugX5XvWgT+o2x
         IvFk5Io5ztDbJF71cnenqOxiU3NEuuODAbZYM6xw95LladiQIpClfmz0HLR2391Pte3Y
         ijixKx/EVB8aZaeggrNaJxlQ9rpS2nW2Pclzmj0LTIZtw1lnUg5Mj8hTOZLdCLLkCBg3
         lBnQ==
X-Gm-Message-State: ANoB5pn255iHJhw70mjudKLs6Ub/7jXsGXbLdCPPGx2XyRSeS9/0Jvtg
	kasOqP4ZroZqZeQIvB67+xxLGciZgVw=
X-Google-Smtp-Source: AA0mqf5Gpvwede+HuEkIe0HNBkzUip1X+JBuCqiuA+93YEQ04rjPD/04DqCEAPQc4mMDIw+iDhJCgw==
X-Received: by 2002:a05:6871:792:b0:141:c075:9346 with SMTP id o18-20020a056871079200b00141c0759346mr31647153oap.30.1670071670253;
        Sat, 03 Dec 2022 04:47:50 -0800 (PST)
Received: from localhost.localdomain ([2804:431:d77e:9e9e:dfd6:58ac:75b7:34d2])
        by smtp.gmail.com with ESMTPSA id f14-20020a4ad80e000000b0049fb39100a5sm4021011oov.37.2022.12.03.04.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 04:47:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] remmina: Update to 1.4.28
Date: Sat,  3 Dec 2022 09:47:26 -0300
Message-Id: <20221203124726.40982-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 12:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99941

From: Fabio Estevam <festevam@denx.de>

Update to the 1.4.28 version, which includes the following changes:

https://gitlab.com/Remmina/Remmina/-/compare/v1.4.27...v1.4.28

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../remmina/{remmina_1.4.27.bb => remmina_1.4.28.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.27.bb => remmina_1.4.28.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.27.bb b/meta-oe/recipes-support/remmina/remmina_1.4.28.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.27.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.28.bb
index 7eb87a00552c..aacba787ae5e 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.27.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.28.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "9d409a3556c8c2759a376b4f4ac5149db7aacf4f"
+SRCREV = "852ceab35b0feaba07124265d0e2fa8c629b9dc1"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


