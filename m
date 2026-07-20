Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74746C44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:31 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11270.1784590704126181701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yi6QG9+G;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96c92c0980so4846904a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590703; x=1785195503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=89xAqqUfzFJApjaJwtw2fIA/dxVBe7lbybpugHAtLkk=;
        b=Yi6QG9+GynOKSylFd2dTARn2bG2fSbFz45cDkPg99/Je9mYZLjwv3j6dEs+NJAqzgr
         Uh8ngfrFFYO2o6ONz3c/Lx5+Jo14Iv/qxY+wJisTrT+NlTxs2csmy3GRqt1JNL9BdcFJ
         xzLshoiy1XbX5J3SFfNMggVEV9PXgzM/squGHfxZtATWzJasZmrjUdeHIgkBdmxZQRuY
         N376NbqAfjICg7uHg9cDu5sHPN+8kHZkmIdGL3nDS1qP3l3xDUfV/AuumHqNU3u9+/6T
         pMIIjmieD4drkxrxk04Bo1aQIiNz9reFa0mhI9iueQx3jpwZRHBi4lk69+tLmhuwFWBa
         YIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590703; x=1785195503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89xAqqUfzFJApjaJwtw2fIA/dxVBe7lbybpugHAtLkk=;
        b=mo6G6likxAPrexiZYIlUmBq8dANdW2DCLj0XPIXb/iNqGbs+nM+nFXHxvdHNDXYhlr
         XVPK1/Vyn2Edpzpnvozsf552mSa/4XUzmkVWq4g9LtEO+UMkjhj1YbUfkSW3X6NLd/nI
         4GqUvLXDM+pARWwIUVRolSPaFTXUfyb0OAC4nnCgKl0olQvnTy3jJ86P+raeToYlk7wk
         0Hie9aAbmywrR1rXbMaTw5aPCVSyfKVX+Kmj8X+TnZqfWFJcjnaeIlK4I7ZoNCqeGVO/
         rDYBd5K42mGfWh7VfeQexGv0S6vNuty6Qw8WFmJWPoAm6Y8B/iRn+tRiWOYeazKm5yr7
         gXSw==
X-Gm-Message-State: AOJu0Yxitj/OFRm+jHFu1y2yyfh0UZPUkXj3N4EzREgCglGyYFiGtr1J
	HhPwHeZMV0m7d18p8475F4gUDaVX5eJOgcax3N+70FRr1wmQULQbie9O28XMGw==
X-Gm-Gg: AfdE7ckYioarNujUGLj2ZVc5jOyMcZnV1M1XzjUJdm6elWNNir9Cizx36qPg/rKLa7I
	rv1By3rExeTb01TOof2NX9vw/VM3g0dmyguUukbLkmRZ+u3zYn15Lr/BhIUdwHHXObs4FPwvwis
	ku0IMPxmqul6cEBI3wqIkj9mQ4xbK0Cug8XsQvaagiK7QZQVBct/UyVat9rOPhqwQSIEDj5egSs
	9ckoN9OsW1nHRz+qmZzfHLiZoyc85QSqNOlydRk3bi94jLn870gcs3SRrn77M6J1HsfYqtzYUjx
	WJW9ZoYl+nT2LdcN98dvZWm90iMQeri8SlYo3IFUE7KQbn+582/PGoAWhVHn53pw35BRM9OC22X
	Fu16rv4f0xLaj64Kjvjjq/hdlziUymoVz53Uk+pfSn2vajMZ+LZKI2UeMu7/vlllLh/hAkDOjIv
	R12jC5nniGKUuwv8M=
X-Received: by 2002:a05:6a20:734b:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c3ada905ecmr17445030637.52.1784590703432;
        Mon, 20 Jul 2026 16:38:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/30] imagemagick: upgrade 7.1.2-24 -> 7.1.2-25
Date: Tue, 21 Jul 2026 11:37:42 +1200
Message-ID: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128302

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 9775e7d42b68085fff95787a85128a4535867063)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-24.bb => imagemagick_7.1.2-25.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-24.bb => imagemagick_7.1.2-25.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
index 98e1ccdc6e..4a0cc0e1ff 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "271b6bc4cbbd3e52e6768c5daeac9e9ed7a139f8"
+SRCREV = "04a04eaaa22f721f204c4bf4c6b24b08b1afe5c5"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

