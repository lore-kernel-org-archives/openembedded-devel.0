Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228ADEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 15:04:53 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.9702.1689174286784946907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 08:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qoTTaElS;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-992ace062f3so897471266b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689174285; x=1691766285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmFhzKPqytngzAxhO3HbARzbq2kzPHLuuWPDfR1xFfM=;
        b=qoTTaElSaFAz9ovhoSRVgur0gXenRAedDzw0vtrerPoEq+Id5y6mmXyS8ZSY0W45Ol
         FmIGtUd4g2kNu2YgLRSn9XYjmPr5i61kpHGcdCmWNSIf12rLEjYfYfx/MDtflA4+Lc1I
         FHDOKSg9DQfR9/Y+3C+b6Rz5POQzTfl4mXd8gWSxNSOcW+n+joUbnF/sNgAVVFFk10rG
         8+Tn7T2cg6NM0aXTASpwD++KSYppDn82Uagy+q2bE9e0g6Dut2C2d6iM46LqL6H/0EK6
         Y7nGZt+3wi0U83XZKleeZQjT+vVpPG8EN4+ajhBnofKJu7zZaVZotS7zMVmiSaT9wnVt
         VueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689174285; x=1691766285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmFhzKPqytngzAxhO3HbARzbq2kzPHLuuWPDfR1xFfM=;
        b=hlIMZPr28j+r7it6ahq6ltEImPBYZ2XtRmwSyXE+vcrqk7gFr1sSwFEpc+4C9vzF0L
         D9cni0/VkgrfqtlpQLMHBxSFaze1fl/9UVT1eSMDqwZytb0t0PbHNHE2kG+pzIJ1ctf1
         N9y4IomX7dGlmAe2JhswhzXhBvouFDoQB9sy3gRcdDs4N8HrR4t/SYnbZo91QSFC8WPc
         c2zcgCy/qc16TOmXTAvyWbl2HYb3aMf5eQG9EQcGH9oD+GJs0S1vZm3sS1vHJ324H7AM
         9peu31UCPFwZIYfwFPxYLL6ilZcc8kcziUt8g7kXgKmKLKnod5iYh4j2Q5ZYkZbn3G4M
         mV2g==
X-Gm-Message-State: ABy/qLbdFGUAw6xjh03Cm7BzbdpUFAhacXj15qILI7tmg2YW3RpFemWs
	cM1p+C3gCRogsgaOovvWP478z0riW8dMW2gG
X-Google-Smtp-Source: APBJJlGVRA4Ogr2JDq7lOfMxrdN/HGuKSsybIboGW3PnvUpxXFnINCD8P7DV0EJynApTEg2u9aIuNw==
X-Received: by 2002:a17:906:3744:b0:982:b920:daad with SMTP id e4-20020a170906374400b00982b920daadmr17005449ejc.71.1689174284611;
        Wed, 12 Jul 2023 08:04:44 -0700 (PDT)
Received: from localhost.localdomain ([5.13.147.85])
        by smtp.gmail.com with ESMTPSA id y24-20020a17090629d800b0098822e05539sm2687508eje.191.2023.07.12.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:04:44 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][kirkstone][PATCH] mbedtls: build with v2 version by default
Date: Wed, 12 Jul 2023 18:04:19 +0300
Message-Id: <20230712150419.113110-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 15:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103843

For anyone else that wants to use the newer v3, there is
PREFERRED_VERSION.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
index b8c9662de..3a355bb43 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -31,6 +31,9 @@ SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
 
 inherit cmake update-alternatives ptest
 
+# Build with the v2 LTS version by default
+DEFAULT_PREFERENCE = "-1"
+
 PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
 PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
-- 
2.25.1


