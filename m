Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4918CA5FC4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:04:07 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3391.1790823847371013083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oniwxNms;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-880fcd3790bso2166746b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823847; x=1791428647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w0BH3T23EkGWoP5imEdXuGV3UwTl3uyJMaI6SbBZZg=;
        b=oniwxNmsrCLMTJWG9xPeDCdeOe4E7IoSV3DGp2ERPYK7KXI5uHSUH99HgeoSW1UDRl
         KdVyT8QHJKso0oIuX3YCqyCra8t+Q6JHnWGz65SaCwj6Os+ovVhanEXRBdZLeSKj/j86
         N2rae+Pe7g4/MetqSeFd/qHMUhN+3/WQasBU/ElAHiW2YoNGauMwLABQFB4Xm4VQWC2G
         ti30kwuJHfepZLS+kzMDH3vorYtVFRCqy3rm/k/KGD5EGy2o5iKHF+qdsnVNiqxG7bDx
         W2mD4jwbhe247H7Wchh9A90sZCUanyWZ2zwJNHpvtFJQoUs2nAZkyr+gRrsmAip20hau
         j6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823847; x=1791428647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+w0BH3T23EkGWoP5imEdXuGV3UwTl3uyJMaI6SbBZZg=;
        b=0uwb78rE2esQ6ozNnSM+Ib6gED+9SU/ykh/czJvRt9yG5FxlMn/RGowm+niHHM27B5
         3kdQb1DyDxqOuyQada076K+lr+QhnMbffhgWrkUGFuNUnL0XU/h2BowHc5O42oloWQJv
         IMO29A+vtntb4qqyS/cmgl7l1o30TQ7XB3te+YaKG5/H/4vGNJVZgB9gqH2xcA8YfPXg
         1NavHqWnW7ytFXxU4e/EH3JhZCnur+8zlgF2INfoxuKjXuIOZmD/hWU1nUo3f/DC7Xm8
         a7IQNqh5JLwkUKd5gNwm1Zclsi5Dk1jbUJ0EwvsVpG3E+iZKWauemWZ+KVyx+iR8c4N9
         ggvQ==
X-Gm-Message-State: AFuF++nf7hdIAc7ehGQegjIaai06do4TsQCV8mVBL0I49QaW0AiNyfrX
	oJz6AZOjjvJPcVkaOi5PLLRS4NYL1qmT8na+poo2bdpEnx1u9yB7XYcfOQNA2Q==
X-Gm-Gg: AYBFou3oFV9pdlAmJql8kkzwwH6G/usj6DBk9NkfrzfCs2FDHHnhBIV8GB6YArFSHfl
	mcmgvQv2jR6H5hsxN/5Iu4otdB59XRYim0U4tc7W7MRYPVwpnYeFivSPwNOFG1CreNxdYCcmtis
	1EexfQvf/bUjj8FDoj0rU2ke92Sj5NfJNeAOvTfmax9lLd7po/JtpijmDb7MGRf5j90PYdQ5oCx
	kAfF9isMznhcJ7qeAA8klDmcEq3oyP1C1snda/7sCLI34ntdbIxpGBu1gXIJz7RYc06wyV21vxN
	uRwUGkyMMaxCxMvEva2s42I59PcvbQumIRvgIg9feLEfdny8WtR3xQ5227FI5Osey/SKgtZv+ll
	q/UZZuJwqdhn20bmL9RLVUnC/LLLfX02lv7bOiXJb+SGHrUrRvo6+4MR1FU70KXWKThXl6lk3Xg
	gFV/TXDhOg4ps4m0vhwNqugkcNwcSRjmjIgR0hXfcUN4yi2u7SY0B4nrOlN+Nyq08/BoNkxmjF7
	qISABX5kI5RdjGHrAlLulY=
X-Received: by 2002:a05:6a00:1312:b0:881:bc81:e8f3 with SMTP id d2e1a72fcca58-8874a79e2efmr2495741b3a.12.1790823846683;
        Wed, 30 Sep 2026 20:04:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:04:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 15/17] leancrypto: upgrade 1.9.0 -> 1.9.1
Date: Thu,  1 Oct 2026 16:03:27 +1300
Message-ID: <20261001030331.1581021-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130564

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: added SNTRUP license[1]

Changelog:
https://github.com/smuellerDD/leancrypto/releases/tag/v1.9.1

[1]https://github.com/smuellerDD/leancrypto/commit/cbf0afac87ed2c97d8b0b72dcf236c113d955823

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../leancrypto/{leancrypto_1.9.0.bb => leancrypto_1.9.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/leancrypto/{leancrypto_1.9.0.bb => leancrypto_1.9.1.bb} (95%)

diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
similarity index 95%
rename from meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb
rename to meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
index 566f44fb76..6a5e63b84d 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
@@ -6,7 +6,7 @@ ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more"
 HOMEPAGE = "https://leancrypto.org"
 LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=b00845406d87e919d7995d9b51e06861 \
+    file://LICENSE;md5=581f53c96a634ae7f241516370a8f1ee \
     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
     "
@@ -14,7 +14,7 @@ SECTION = "libs"
 SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
            "
-SRCREV = "0110b781707c7bdde88482933811387b744d21eb"
+SRCREV = "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"
 
 inherit pkgconfig meson
 

