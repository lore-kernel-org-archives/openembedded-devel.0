Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4721BC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:54:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.49941.1752760454398233122
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfYO1ptp;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so10455995e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752760452; x=1753365252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqHgT11UL1h64972ufee+dP869qRYnpiWwLh1XgtwKw=;
        b=TfYO1ptpHCr7CCRzjrj7NighP1ibfGwEZp9ADfF4dB7ZAdqu8Lahl9Dk3v3yeGP8IY
         ljZXCXTfgjY4SFVB6Tpm1LWkpaBqNiBif1snUz91jFiHAP6HIDABow8h8/Lpi0GMF4Aj
         j8TGLuxLGHk5mdsaVbe+XU7uloByKfN9+1lq0TsI3i07LN0Y9aD+RD/85kTmEoKASnYx
         qoFLS+VGUZQWbxT66/8gEMebuiijybfVfEF4OL6OZvOFxNNxSzJ+Novl6zcMm4Q+s3Hq
         I9GCs6c6FKJpkkqb+DtdGaY+A+u1e8TYyS11Eu3Cbv+z2Vu+Yb0g16nNejwwd1wpifaH
         HZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752760452; x=1753365252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqHgT11UL1h64972ufee+dP869qRYnpiWwLh1XgtwKw=;
        b=hz9aLIMzGJcMhFaW+skBy3ApoaLGtKgPmHkSuwqKqIATJAwZq1sYe99cQnj2f2kWlE
         hwORkv3Zi7AdLIMbF9LllNBDmaQ/Jp/cdJ2vz0w+dzYZz37xir1/gev2DhH9XuXw6oRI
         Tv09FKVSJdTv1ZeMFyIh2Udd20lII/VlkdinaUNdTZm9o6yoGZQ6edIdqycey9kdJSi0
         4qZNI9rDpctspWN1A94aqiLMQbtFoM/Au8Hq54w1WPQtUz7byxxjvDsrtUiSwb6xP/Ix
         APHDQLHNtqp69MNanN7z5PMTR5UTWT4XskFNSTVRXp+BvdFWNB2wQEVDq53ErwnuoVE4
         Ngow==
X-Gm-Message-State: AOJu0Yxyu5NclsUX1TjWRiP1yhlgkm/acwJQUXPOaSWpwhoxrTFNh2+4
	l7ImvS1ze7Q5o21GPOlsxYjkUqh3dtymYhy7BQK2OUQKWtyRYnGkENeIY1oBn+zK
X-Gm-Gg: ASbGncvQlopj2BfbkBGV/fgI9Hb2rAP3vGgrSVtRmzk7Ihl/nQu/6E8IU1d8jUE7GUx
	cz+cll3ABQO8C6iPYKFEpwTnfZVkRUEf1keYrOELAuwug1mCnjcVOEZejS9uP4zoo6AHP3HAO72
	09F5cSZKvosjdYCaYQ1q9GAqXjbs+eVy9LqkwT6lg10bSC3ATEfM7xPQCNis0KvN/RemnnpN2Qa
	DmVN/wl8E3/NIo+WJ+c58EN3KbKsvh/qr9IEXaXKV2G7v2YGcMApk2kPieBm7p9misA4IFd6iJP
	d9KMeQB8DBjCxFk0rL0Q2lKpyTaadQzdL3ki9e5mnE7fnMl82Qn4BNPmOcyvNR8WimCMupKp1x7
	3gyBqveekuya33JFvhmYZbK1P2qvNM+RXewLiMDBZ57VNgC4=
X-Google-Smtp-Source: AGHT+IEUMKHsxzuLgdQIifraDTcLyhA9TiVAPsV5R+//5ZV9NYPjtWpiBarTjx7DWVCHdT888JoA+A==
X-Received: by 2002:a05:600c:a009:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-456389d8690mr13852665e9.27.1752760452294;
        Thu, 17 Jul 2025 06:54:12 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f9be79sm22819905e9.31.2025.07.17.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:54:11 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][walnascar][PATCH 2/2] mbedtls: upgrade 3.6.3.1 -> 3.6.4
Date: Thu, 17 Jul 2025 13:53:58 +0000
Message-ID: <20250717135359.3644-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717135359.3644-1-gudni.m.g@gmail.com>
References: <20250717135359.3644-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 13:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118609

Fixes several security vulnerabilities:
CVE-2025-49601, CVE-2025-49600, CVE-2025-52496,
CVE-2025-47917, CVE-2025-48965, CVE-2025-52497,
and CVE-2025-49087

The framework directory has been changed into a git submodule.[1][2]
The recipe now uses Git Submodule Fetcher (gitsm)

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4

[1] https://github.com/Mbed-TLS/mbedtls/commit/8cf5666a174237998a7965e284d7ba8c1655d16d
[2] https://github.com/Mbed-TLS/mbedtls/commit/c90c6d8ff787ab8787d9373b0e662a95ed1f4dae

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 1e99f92306..0905c14aa7 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,11 +23,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
            file://run-ptest \
            "
 
-SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
+SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


