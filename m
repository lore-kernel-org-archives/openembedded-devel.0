Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A212C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 12:35:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.35625.1699878899173426561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 04:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A4cTqhiG;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-543923af573so6759306a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699878897; x=1700483697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpW0JXp2aI+H2T0vukK4Z0n+Y1A6PFLsjmkaMzIVVmw=;
        b=A4cTqhiGiiom840rEfKy7Ts3m8uvLhuT3gQHSXfvtdOhkMuCH6DspIJW+w9TYEWoYK
         lESN3kDO7sr1aC5/WTK85DQT02EW+SK+E16p4v11KhzF2Qt3N5oxbnPbt7eZ3EzQ89gI
         F4TJc5DT831bABsrrL5Avl/lOeeN9klBkY2LA5kv/DLt4iWghASGQPN2ODrhS5zqIbWS
         GJvpVW+vHA8dqLuRLKXCLhFXCXQQ2HaHndTFq9gowzwM8arlFjOqwgi9+zCvBixGqvDN
         Rxt+fVir8F88Wes3DFDcg10q6E29fZU85yxYUm7xLYRVW8gcCPUOANyyUXjD9E5eHqHI
         jK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878897; x=1700483697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpW0JXp2aI+H2T0vukK4Z0n+Y1A6PFLsjmkaMzIVVmw=;
        b=rzb0ZRvtNvmKF2ERSHVs9gfln/6pKEJLSmDe2xI6QBPw3GeZARIEbVPkyxRMFTPZTJ
         x/L1dCuj69FaQAgieFRgDh+7YK8b+ipBHha6bNRQkv/x88pnE6lFdMVYux9darRSS2xJ
         ku1Eb+cJ7rd87DZka1rWaQPzbg5f9qPh4s4SF0rg8/acJrv4cslWJIo8Fiu9wO0z4Iej
         hRiGl6mpNYbdAIo8MVs3thIfQZRuQfslTv0y6b0DklwbRhfgIUiXJqzr8GsFkplLQHZG
         bFUkT60NFBztnG8UEvZv4OKwV3gOyjcdiC5V0JecY4p4D4sGSdCkUz1LSqmBf7MDbXHY
         vS/A==
X-Gm-Message-State: AOJu0YyTHg2xF8+zq2zH7ipN7sKe78cAgi9GAWO33inXzLhzeyC/c9If
	LU5GO3RPw3WHUw4rpmS2rjkaXUaxjxHCrw==
X-Google-Smtp-Source: AGHT+IHLYYteWJGFJYX609ug6keId3ZN4mkV96pAWt6DERGn+wBTprMfLkB9cvnw5/Rqj+SVOZp3+w==
X-Received: by 2002:a17:907:8687:b0:9c2:a072:78bf with SMTP id qa7-20020a170907868700b009c2a07278bfmr6647326ejc.26.1699878896377;
        Mon, 13 Nov 2023 04:34:56 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id rp13-20020a170906d96d00b009ddb919e0aasm3979772ejb.138.2023.11.13.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:34:55 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCHv2] civetweb: upgrade 1.12 -> 1.16
Date: Mon, 13 Nov 2023 15:34:41 +0300
Message-Id: <20231113123441.104938-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106641

License-Update:

- Copyright years changed
- Added additional components Copyright
- The website keplerproject.org seems to no longer exist. So, the source URL used was changed

=========================

- Added "-DCIVETWEB_SSL_OPENSSL_API_3_0=ON" because of following error:

civetweb.c:1561:2: error: #error "Please define OPENSSL_API_#_# or USE_MBEDTLS"

You may also want to check out the available CMake options here:

https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba988a15159/CMakeLists.txt
=========================

Changelog:

https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba988a15159/RELEASE_NOTES.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Added explanation about why the license was updated.
 
 .../civetweb/{civetweb_git.bb => civetweb_1.16.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/civetweb/{civetweb_git.bb => civetweb_1.16.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
rename to meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index e9c205618..0a654a10f 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -2,10 +2,10 @@ SUMMARY = "Civetweb embedded web server"
 HOMEPAGE = "https://github.com/civetweb/civetweb"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=50bd1d7f135b50d7e218996ba28d0d88"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ce6ce6eb1b2fd59ee6bab219470442a3"
+
+SRCREV = "d7ba35bbb649209c66e582d5a0244ba988a15159"
 
-SRCREV = "4b440a339979852d5a51fb11a822952712231c23"
-PV = "1.12+git${SRCPV}"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
@@ -23,6 +23,7 @@ EXTRA_OECMAKE = " \
     -DCIVETWEB_ENABLE_LUA=OFF \
     -DCIVETWEB_ENABLE_ASAN=OFF \
     -DCIVETWEB_BUILD_TESTING=OFF \
+    -DCIVETWEB_SSL_OPENSSL_API_3_0=ON \
 "
 
 # Building with ninja fails on missing third_party/lib/libcheck.a (which
-- 
2.25.1


