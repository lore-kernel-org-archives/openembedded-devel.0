Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C12AC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:52:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.15635.1751971940365215406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4WDVytR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a528243636so2393808f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971939; x=1752576739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Le0eWy2KTxjy1neIZUbJSznAv6V9HyofgxgA38obeyk=;
        b=m4WDVytRrHufOxuNpP2n9qiH59ekncO3y07/LFMoovz/rR3U1HoR8a9dgWHptUxzR6
         ld5TPMUheHCrnLveFjep5KBfj9azA3HbFaPwj2w8/ff2RrHnUpSTTsqDHoLgCBvJfK3+
         1Ejab1f05HYNtmorLme+eGzlAmh+zDOInyLrp9EfApJT4cjSpHV4sdstxWSDbSlpMKCM
         0mtwTLebpoZ8az4Y+ywgKtZsVkKXrsboVP+Z0OZeHZwbvn2j3TlCKDO0TyLtVapxhGBR
         kJ+ZPyWUMG+iWD2sBUT6z2Q6MxZtB6mRE0zjUR2sCF10/WPMYFfqWLbNN/i/ayh60/0a
         qFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971939; x=1752576739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le0eWy2KTxjy1neIZUbJSznAv6V9HyofgxgA38obeyk=;
        b=EFhCfV0onGBcmBAYdmoX4+HiOAs+4d7/DfLvI2VRXdnS0+I2CORTQsFmUEVRaHeEUi
         bY1jdut9+YXYvshqHGiJHvBdz41eB0CZ7SKSBZ+jCg7/kAeW/NnnKyYAirCXGp8ZumuH
         LQ1hfAW/LBMMRbeKfVBsLvWfLP7u3h1OyWN2NYJBRcyHKMqOVyFmBXx/uwbsorCBComc
         L2AL75ThULpWaFv0fnYYX4sRgFiTkDQBT+vnFnqP3MaTGd0RFzehCww4A1Fe6mR4/6n9
         f5ZPLSRx6FSW2Q0EKL26/LRxjMZgmhj+LlOhrYiN0txIVWNjiUf+5sifpKroSgGCVn3W
         lQmg==
X-Gm-Message-State: AOJu0YwrfG2+LbnO4VHbAF/rdxpvxjUFa5QkGwZ3KxWfEYny8iEiaUSO
	cVHpRjJ9C+fkipIHCP9Gf95xij/pMf4MrOOhAdEGuVxVyMnJEIg4KJ56EZivFg==
X-Gm-Gg: ASbGncsxYfyNGK4VQlHmcXpiHriv60yGXss8+r1smRcL0n0LtJ9Pc+n99IcZwfV7EN/
	fSgh5IuMFjX1w5zDRDTnGUIjNXKu2hKS6IT9m4Lzi0fFOjV+QM25F+o/wNzdsxLxIAnub9108jD
	A9iBLfDekrfTBCvxd638iMAND0lYB8gGBnUB3vHKjO6M8cdH05MzRKim2RsHyNRtcmsgwPfo5Px
	fOLUQ7uQE3PrXi65GkW6PGNFRyst9y/W1ElIM5C6oLGAV5JPJPbUjNy9NRKcW/M24Sg6C5owpym
	+dzIMAkyte3sBKig7v9k8gW0WFbgHPkBbao+/Tg0wuxDMBdSUJuj92oOcgcfzRxX
X-Google-Smtp-Source: AGHT+IF8sBZ1MPuy7fQ2cYSWKiPoyv+zstEI1tn5twZTkRBgRlc2uaxxlcFmnC638MMiCq8L532jnA==
X-Received: by 2002:a05:6000:1887:b0:3a4:e665:ca5 with SMTP id ffacd0b85a97d-3b5dde8bb3bmr2065842f8f.23.1751971938660;
        Tue, 08 Jul 2025 03:52:18 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47225985csm12782127f8f.69.2025.07.08.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:52:18 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][walnascar][PATCH] xmlsec1: fix build with gnutls or openssl PACKAGECONFIG not enabled
Date: Tue,  8 Jul 2025 12:52:19 +0200
Message-ID: <20250708105219.478633-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118309

From: Martin Jansa <martin.jansa@gmail.com>

the .pc files might not be installed based on the PACKAGECONFIG
value

fixes:
https://git.openembedded.org/meta-openembedded/commit/?id=cce20b5124e28ee55adf03fe062084f38d065580
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
index 0f4ae205b1..3e97bde86c 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
@@ -59,7 +59,7 @@ do_install:append() {
         ${libdir}/xmlsec1Conf.sh \
         ${libdir}/pkgconfig/xmlsec1-openssl.pc \
         ${libdir}/pkgconfig/xmlsec1-gnutls.pc; do
-        sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i
+        [ -f ${D}$i ] && sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i || true
     done
 }
 

