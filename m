Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B219FE6F084
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 11:43:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99599.1766490231401597801
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 03:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COSV44fy;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47774d3536dso38533435e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 03:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766490230; x=1767095030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PhzXM1iiRXCQkxeZWg5g8gPk7CIeH4Bms6Bb2trH58=;
        b=COSV44fyF6v4OwAPYoXRi9V4jYSc/jDg/t/cAAoQM0j9MEBztMwFbDFAw4ROJjTCpZ
         i9tnKCd8QspIbDNSHEfGtBXLZDRNbvnqMXeA+NyRpxqHG44FIBWQhsG6Ak1TI7TdksnM
         YHHxh1BDzUa+m7qBBM6crr+eMOS9FHanpdydYdWI8cIal2m20qui4wLxgInRf1Bb+PfA
         luw1KhtfhyKcxcuLpv0fMKfvaLAJMjLZws0SXsp0bZins2mCL0FW3PEE7K34CY3FvoqC
         pMbTznPFUdUXFiB2ylyou3d/fblBi71bRzozNBY1Bv2LDKIwOtpF1TTdWfIOrj7JSJ0q
         dmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766490230; x=1767095030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PhzXM1iiRXCQkxeZWg5g8gPk7CIeH4Bms6Bb2trH58=;
        b=fPQTL9RVigHf2/NYYvJK7dBqt3sf/wVczhqPGfph7KaBXcrDlwb65iGNB80iMvUhnH
         5Wk+f+zb+Za94YoylFnVhEdgbjzQlI0ycsEXIUfUScjGPFJw9Xx6f4fK27GuI+XSXjPm
         ldLIow+2GpVfqX8XIov67WIRI9mq9BllsKIcF/lpd+vDwgeH5Qu63LZilHdF8voosbac
         ritn9dt/bC1M3b0bI4hl8TDmvH/1bclos7KBWm5lN0NYuAjiYlU8ep0KW0e5Vh54WcIk
         IM55P4YtgzqdkLJX4uzzkBu0J1U46CKXRJ4dmCj3yCq0wliP4Wr6SRszl02aqGrRbnbx
         DmAA==
X-Gm-Message-State: AOJu0YwiTDszqxaxFdXBpWx65XIbmi2UP2q55ENdmt8bSpybeL4IqDa5
	xoFC82TRbC/SvZEemNnSp9EtacLbshnA+fNwiJIRn3N26u91leXM6GbBTgL8OA==
X-Gm-Gg: AY/fxX6I4434s5/QtYtg866INGZNYwauCb8TQy/xPzxijpJH6M8AdT4icADlsRtJ5Mn
	tm1wUCliIcGylNfXghuAzWlh99L0weXePd8FiA9eim98+nMOUbnX8MtitywAoD+GkjxWb5Vhh1R
	jrYuFvtBi4H7t+wYMp//Iica2f1HsxFM06jNZFd/UFQr890+YxSmYjW+sde0/71lw5G52ASTk0d
	DG8+evM8ykO2D1eGigrEPbkOcudUvdDN03JRbBHNbCH6B3k1LYOaKtCfuEk5yQaP6rUX6Rut9bt
	MDjolu2utW+0RKZbfh89D7LO+s3tosM+D59guv8tH1XB8AU1CjlUGGB0KzxPOcwN5WWQzhw3Yzl
	s6OCMU0uDnimST8tGZvtUkXqJ9TRjsu1vsf9j0vVPHJI0Jq/lBRir/m8wB1lBZshJANDYhX/mIt
	GG4wCHidbH
X-Google-Smtp-Source: AGHT+IEffGD3rt61y6IcdPDrluvkV9VAhFieo2z9y6IS9dJROs3B4C0CPeocgUGXwaSP3WkwiIhTFw==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr128012845e9.14.1766490229253;
        Tue, 23 Dec 2025 03:43:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be26a81b6sm295778045e9.0.2025.12.23.03.43.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:43:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] freerdp3: upgrade 3.19.0 -> 3.20.0
Date: Tue, 23 Dec 2025 12:43:44 +0100
Message-ID: <20251223114345.591895-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 11:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122834

Contains fix for CVE-2025-68118

Changelog:
3.20.0:
Mingw fixes
[crypto,certificate_data] add some hostname sanitation
[client,common]: Fix loading of rdpsnd channel
[client,sdl] set touch and pen hints

3.19.1:
[core,transport] improve SSL error logging
[utils,helpers] fix freerdp_settings_get_legacy_config_path
From stdin and sdl-creds improve
[crypto,certificate] sanitize hostnames
[channels,drdynvc] propagate error in dynamic channel
[CMake] make Mbed-TLS and LibreSSL experimental
Json fix
rdpecam: send sample only if it's available
[channels,rdpecam] allow MJPEG frame skip and direct passthrough
[winpr,utils] explicit NULL checks in jansson WINPR_JSON_ParseWithLength
[packaging,flatpak] remove xprop

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/{freerdp3_3.19.0.bb => freerdp3_3.20.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.19.0.bb => freerdp3_3.20.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
index 9b6df4e0cb..07e6db69b7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "300a4e6d60aa072cb7201b6d32c0dc925092fb9a"
+SRCREV = "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 

