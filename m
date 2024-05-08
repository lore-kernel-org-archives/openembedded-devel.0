Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696BDC19F4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 15:07:23 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.15083.1715180836390554306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 08:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RmpIXuiO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1eeabda8590so9683695ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715180836; x=1715785636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNIifRWqPWVc+Bf2WdadWBl8PuL66vETwNhcjCBmFbc=;
        b=RmpIXuiOSmeddNx4jE+AAezAzFFr7FNVnKpmXoNvtCFUUWKRvaxTw4BtfQdkH07SHl
         qtK53TEsF3j0r0GwKIBVYUyTzZiTrdvJKk3ZXroykI6en+7BC9XrBCJJH5KMfUmGiU5P
         dMP8B6+VrMIPGP/gy1WJ1tZEFMIjwDvfUz3omhFWXH053xy3/rhdRtMYzwk0rsf9Mqj/
         bX7ImQMdksvPFjyuoak/Xfd3uHb/xv58EOi7mXKhqqQnbPsCIcCAhgkcKPI8iRYvuzFR
         +SMX5eTMjgdzwZmxgihu9ZeuSIPBIkFNl+a7Qufrl1rAGFZoNTO8gjYnqBK3uVhqVxhm
         4GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715180836; x=1715785636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNIifRWqPWVc+Bf2WdadWBl8PuL66vETwNhcjCBmFbc=;
        b=Ttc/cTwJXSVz8X+eIV/rlHbc9zq4fPuAy/TMdJDJNawe3Zv3kSsXzBY2kIYEsRx9uP
         82iBcABRsVQT1tFkR5ln0INKUZePXK/VDV9tZzFsbk+0NiNt4CLnoHgXhJARdfM5QeH2
         expW36ffBKHqPwFpYJo03oQCjQ5A7Ger8MFcixKR5WWL3fIF6C1ttvpbGo1UUWobzlPi
         BIiCbHR7k5cvp9MaABK4+5xlSAcgIdcrc9TzBxwIpalj8jiB9hWvrXRddR4olZCAlcjn
         X+h+L06el3IeCKwBoci+eEdKN3n2sbgOwazRLjaHcFp6qGy73sD6QzeCEoSuQZTqzpCB
         dRTA==
X-Gm-Message-State: AOJu0Ywj7jO8mk3d14WHHKbGpY+NAqgxweqSOat3eUzT2/Q2blsBD6NM
	4rqxt7IqGcnlhrN+z9ieoLtHGRLSW11BE3T08X5aoIETz/yPFUISqL+ZSb42
X-Google-Smtp-Source: AGHT+IFkG9mKmCdCjNtFtlMMuog+PsPdSU5ZZxk7u2LBHDbF1EF168YrYUElNl3lFdfha9Dc+jEWoA==
X-Received: by 2002:a17:902:b7c1:b0:1e4:9ad5:7522 with SMTP id d9443c01a7336-1eeb0592106mr28686835ad.21.1715180835531;
        Wed, 08 May 2024 08:07:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902e84f00b001db5fc51d71sm12054658plg.160.2024.05.08.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:07:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Upgrade to 20.13.0 release
Date: Wed,  8 May 2024 08:07:13 -0700
Message-ID: <20240508150713.2626431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 15:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110278

nodejs release notes [1]

[1] https://nodejs.org/en/blog/release/v20.13.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_20.12.bb => nodejs-oe-cache-native_20.13.bb} | 0
 .../nodejs/{nodejs_20.12.2.bb => nodejs_20.13.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.12 => nodejs-oe-cache-20.13}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.12.bb => nodejs-oe-cache-native_20.13.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.12.2.bb => nodejs_20.13.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.13/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.13/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.13.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.13.0.bb
index 232df24baa..df68b5f77d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.13.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9a7fcce64128730251dbc58aa41b4674"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cef54676c547a5bbab44aa8be3be9ef7"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "d7cbcc5fbfb31e9001f3f0150bbeda59abe5dd7137aaa6273958cd59ce35ced7"
+SRC_URI[sha256sum] = "11d229fcad7e6e10f450301223c602043f021cda51259ffafc7e55e484b37dc7"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.45.0


