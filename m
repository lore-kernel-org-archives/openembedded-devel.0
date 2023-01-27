Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE42C61DA4
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 10:10:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.99062.1674814256477681372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 02:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IgyT4aVv;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b10so4156741pjo.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vu3fEr320C/FWh4KvyEMWUStju0X0B63cCbvdJmeoyE=;
        b=IgyT4aVvEdJymhBTgM5kpRfRYvR8a5SA4sOSJU/cXzmeieloOs7fZMVXaH+ryBUsou
         q7vtaRpDk7sNWpxo5k6kNoJgBI7pS8/cH8zPforhfUc5rrhbamS/abQFyEDE4lDmyZVC
         VxvneamfXJ9qDhbdTIWF9q4FweWR/xX55oyioO3fdP+dwJb7ONgh4LL0iNIz7uXO/A9F
         rU+VK4v1KTkFSRSTWkdWGLTGRE+1tXye4xayNXVx12kThVz0aeJdX/KQjHSmsyh6vl7v
         EIwIWjgJW5vWlsa1HoRVzbNbnm76MPw/WeRdaBVc8N8ufGji0oJqbHxDfK0J4SmVats3
         F8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu3fEr320C/FWh4KvyEMWUStju0X0B63cCbvdJmeoyE=;
        b=DU1jGN0wY4Nh7sqoETz67tz72z/hGS4yDL/Lj9jbirr3Zz2O3/sXiOrhrcmQANTHuA
         +GTG09yGG64NQ4wjaGlpu/6yS540pmOf2lOBmyQt2uoQQlcTfr+6XVRRptYHbq6veR5o
         npWZLwEz4OsdwfLaGEnHnhmHBX0S23aE0bnrm3UiNklu6Q/BXnlUplEND61rUDiyZntS
         TqbfVTJBVhu4TZAUjoK2uTvTsJux9RtAIQ5bdqCDM/mxo1z6lmTD6jt4p96dyW5sFOK4
         tHFmFa3d/YMeuGMIKjtdSGBPTRIEN/eC9uzDmm0gbV0fsOiIrZy1pAy3iSnIadB4aXwT
         lJKw==
X-Gm-Message-State: AO0yUKVdSGxYr9Q6hcdU++AxaaNDj3gtLgkZqFiYP6MeJjx1bX5yR+yQ
	kbEQCpXw87oVhRyyAYquZRMM2F3Gq+4=
X-Google-Smtp-Source: AK7set+IGFLwG/7+/T74slTQ51Pb4ZRng1V9DdAAjNuX/wQpGd/tqsuoRXBZeim5WHfOXVKV4AvYcQ==
X-Received: by 2002:a05:6a20:7da8:b0:bc:4e98:4e27 with SMTP id v40-20020a056a207da800b000bc4e984e27mr958933pzj.15.1674814255833;
        Fri, 27 Jan 2023 02:10:55 -0800 (PST)
Received: from beni-pc.corp.ad.wrs.com ([5.13.130.19])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902bb8900b0019488090884sm2432232pls.273.2023.01.27.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:10:55 -0800 (PST)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: export source files/headers needed by ATF
Date: Fri, 27 Jan 2023 12:10:29 +0200
Message-Id: <20230127101029.343691-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 10:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100815

Arm Trusted Firmware uses a list of mbedtls source files/headers to build
a static library used for crypto functionality:
https://github.com/ARM-software/arm-trusted-firmware/blob/master/drivers/auth/mbedtls/mbedtls_common.mk#L10

At the moment, any ATF version that wants to build with yocto and enable
for example secure boot, needs to download and patch a version of mbedtls
separately, e.g. :
https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.bb#n10

This commit enables a simple way for ATF recipes to use the existing oe
version of mbedtls by adding it as a dependency, and simply extending the
build flags with:
EXTRA_OEMAKE += 'MBEDTLS_DIR="${STAGING_DATADIR}/mbedtls-source"'

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.28.2.bb          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index 3c52fe13b..f5f1236f1 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -55,3 +55,9 @@ CVE_PRODUCT = "mbed_tls"
 CVE_CHECK_IGNORE += "CVE-2021-43666"
 # Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
 CVE_CHECK_IGNORE += "CVE-2021-45451"
+
+# Export source files/headers needed by Arm Trusted Firmware
+sysroot_stage_all:append() {
+	sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
+	sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
+}
-- 
2.25.1


