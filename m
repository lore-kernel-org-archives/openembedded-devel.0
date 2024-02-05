Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9DBC4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 21:48:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6700.1707169697021058478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 13:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NgkvOVsg;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33b0ecb1965so2777794f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 13:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707169695; x=1707774495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQFW7hiIm0mlj80U9fGU2xu+1yllJiHQrUXbM7DsHnI=;
        b=NgkvOVsgEtSMxKkHhl2X+Me12TrZxli7oIcfsf5axQCCkMGPOkTBin9LT10ePa62Y9
         Yx4XkxZGsQ985fgHztfZxoJhy0+eYv5v5bjUb6hkdCLZinL1Q+hjVwNn1UHLu9+yWst0
         lvNfyWWf6ZSRoYos/N5nOVPLPyNBvHlEt7xHkvNV3n9XiK+UjYA9nmM1fCU/EIhKCS9s
         8UY33/Zj/2kYzORJ9MEDhOfPvwIKEwRshgvwzDGNtTe+ePkXLJvLQUTxWslZAc8UpPFf
         hJWlsvfHWyHA/xPjpQ9jLiYH8272BYlsAbGpFnSWY5GgoTfDmi/7/f6XsTCI+igRcbVo
         MzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707169695; x=1707774495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQFW7hiIm0mlj80U9fGU2xu+1yllJiHQrUXbM7DsHnI=;
        b=eGaeT5u/Y+opcOi4YUCCzq3N9uML27Wjh+SKSVFrgyy8lyHWJ8xjvntLpENNoNl6df
         jvCLBeFKW2CjiwrBgtJHjnm7IrwEBCTpyEK45WoeL/4kwEn+QyaLRtZTUexJFb6lDdxy
         Txslp4/+F9t3YyTof39jNq2vLSkVd0CCAeuk81jAV/LDamX2jYGVT+R/Tnyln5Xtb8RN
         Z7Y3e5aHaCmqvhhsG4yv/tijvc+qdec0vrrzqYa0M0QRxYWsyX5Yew0mdIFBUKxsxXYA
         qDenSDmofyyOZEM30hz3PkDNmpmB2HAQdU2de7dLY0lsJ5e8W6oZlJq1LhyMQKeg+OKd
         BX8A==
X-Gm-Message-State: AOJu0Yzh0Mp3jAK2tYzwLQm/+M8a8VBOu1xX37apvYZwiV/mqsAr7ZnY
	uQUPJlRd14qSW8c79rbZOiC4pKF57u9hXLKSEb9My3br2Rmfo8W6NiHVBzhx
X-Google-Smtp-Source: AGHT+IEm48X+ZPIDva9pVnKBOg9el4fSMlO6FCeCyK44o6KRD+q159kB4d6IchSmObweKCWyLO4duQ==
X-Received: by 2002:adf:e80f:0:b0:33b:353f:6b8f with SMTP id o15-20020adfe80f000000b0033b353f6b8fmr197186wrm.20.1707169695156;
        Mon, 05 Feb 2024 13:48:15 -0800 (PST)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:e8ff:190c:245b:bc9c])
        by smtp.gmail.com with ESMTPSA id i6-20020a5d5586000000b0033b376b9219sm500282wrv.92.2024.02.05.13.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 13:48:14 -0800 (PST)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 3.5.1 -> 3.5.2
Date: Mon,  5 Feb 2024 21:47:36 +0000
Message-Id: <20240205214736.111571-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 21:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108581

* Includes security fix for CVE-2024-23170 - Timing side channel in private key RSA operations
* Includes security fix for CVE-2024-23775 - Buffer overflow in mbedtls_x509_set_extension()

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/{mbedtls_3.5.1.bb => mbedtls_3.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.1.bb => mbedtls_3.5.2.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
index 6fc824898..d61c54edb 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "edb8fec9882084344a314368ac7fd957a187519c"
+SRCREV = "daca7a3979c22da155ec9dce49ab1abf3b65d3a9"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master \
 	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
 	file://run-ptest"
-- 
2.34.1


