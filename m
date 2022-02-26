Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DBAC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:41:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.6917.1645890087925769037
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZApshL/b;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id p17so7211022plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ion1eMiKN2CG3FeFd9OVdABKqnnk2w4HLYVCQ+lo5Y8=;
        b=ZApshL/bcuRQZwOO60x38JpWUKXGlek4CMo2ecOJHYpxH7VhK/eSh7SqrS4lx8Gcp8
         Jxfrkqle3vPtBnanLDovA1n9uOONaEa34SM4FQ/4iF1dOM0fwVQv3DkXV98nrKblwmmo
         d8ijEDegddDGezinqb2/eUegOVSaCRDeIz8WWL3tCKmRqpDEhEQcBuTAsGUSSJNJzzgx
         ysdzELbRgercFnxIV+4Qnd3XsRXbllndzCMnt35VfeFMOlpMCifuUiK9DvWJY+0flytr
         7GxHrajcFrtM6ceZ2mdKhph9VSWjk9jhCDbsdonzPsh7cvUJpGOSdKRM5jLawsKVSVLc
         B1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ion1eMiKN2CG3FeFd9OVdABKqnnk2w4HLYVCQ+lo5Y8=;
        b=nHVv+Cyzc8X4sT/ckYNgDe2LN48kSIv3ezDkuANmP0E0G80C9POfHvVurMDRj6vRw8
         axc4H4pGrQXeX8WQVV+mLnLVoaiWj2eDfUigTzBhZ3uNcO2ACAqgTQ+2Cy8NtBMvsKd8
         vg8Hc/emejQNan8BGRbbNzqbzErFRf1sHODaRd54W7ILKyJnIB2Pzf+d7d62gc7j2vbl
         6YLh1Iw9Jpc9PMFSejJUKukHxksHUiodwPP4X5mdKMr3AfZWjg9YjovFWO9/SBsuIYke
         qkuxZoeHCL+Nsp7ZD/9zrlbJI/MBwExMIOWer/YzlGH5PxNe3JFOsn0v18Bcmfu5lcbU
         4k/g==
X-Gm-Message-State: AOAM531D4UaDXtiny5f46YlcD3wx7rA3R65PBotixse2i3w0+6ae67+0
	DNa2fDcHbmg9e9kLPHDM197keCPkmVY=
X-Google-Smtp-Source: 
 ABdhPJz1CDF72sKF+azWUTx/sr8dnFvBQ8MEhr+utNzHt7UFqfturn/DljGgLKjmZCu3g2Erb690PQ==
X-Received: by 2002:a17:90a:b945:b0:1bc:94be:ec4a with SMTP id
 f5-20020a17090ab94500b001bc94beec4amr8386095pjw.124.1645890087314;
        Sat, 26 Feb 2022 07:41:27 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004e136d54a15sm7676075pfv.105.2022.02.26.07.41.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:41:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 4/5] cryptsetup: Add runtime dependency on lvm2-udevrules
 for udev
Date: Sat, 26 Feb 2022 07:41:18 -0800
Message-Id: 
 <a6c1c340311caae188a9f935d993c1f12400332d.1645890015.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645890015.git.akuster808@gmail.com>
References: <cover.1645890015.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 15:41:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95548

From: Kristian Klausen <kristian@klausen.dk>

Without the udevrules cryptsetup luksOpen will be hanging with "Udev
cookie 0xd4de0f6 (semid 5) waiting for zero".

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 60b33e376b2331cd20950f0745336397790d2201)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 32f1d758a14bba35d67a75778ae747f1ff5c5482)
[Minor fixup for Dunfell]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
index b9668eb099..3c1c8b0beb 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
@@ -54,7 +54,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
 PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev lvm2-udevrules"
 PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
 # recognized.
-- 
2.25.1


