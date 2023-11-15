Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD13DC47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:08:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7974.1700032094497185933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A9QYFZhI;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso913359566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032092; x=1700636892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FR7Mw1HFwHsnAOd6UKpB1HABKcKSqTNvIi9cvTxMnh0=;
        b=A9QYFZhISbzRWWxJX7gvtlB+alfkCrNm2Ie44MEoA70NmRI3PIOSxZWHOhcmUQFJrN
         5NoeboizRILNduKSn1e529Iex8fVeoJ1+mGCd0H6QwNXdCWf3aKGdcPUpWPgIzmqhZ5e
         VQ2pXvBkeFPwLKrZcgTWAaEy/O7T8BXumM6yLQgNZHii2pNVAPDtpLdUWgrNxbRsPUJO
         f7a572iQY5aRneO9eDxqUNnItktMJpLQNy2K34S6VoXwbmf8Iuyq7NojrUdcUr19ek9c
         d9ICrAb+54gzOl0treo8MgsXdcAW9rwaO/7I51fWbRMttIeu2vGS1Szc2t4WXelq3/1q
         OojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032092; x=1700636892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FR7Mw1HFwHsnAOd6UKpB1HABKcKSqTNvIi9cvTxMnh0=;
        b=ImWowgrvTZmk8W9eAeH0qgIIe23KdlKp+cDKLpOKGY9zsnc77l9GwMWlhX5B2OeYsp
         VVRaiGhXTr5ZawE6Fd/jKjpQz4g3stndqFOyWopGkNPqzQXGw8Bfk0pADeAFVXHYBLh4
         eJOtYPj/y9ndlUVpmLSCvuZ9MK8ZeVX5ukstMPC00uy4UmXdSov87c6ZLn3O9UVDn1Ee
         LHjNiTB2b9KVaPoSZ/UBz7Mo2nBnhVv60VGvn6SDYmU4WGRumX4rtHLo/sE3YOmLDK/n
         Sh7p3jylrLkjypKUkeivVLXb1UnRdu+u9syU2F9AT++fD+1gkZ2EY8bJ5PhA0RSi5dOD
         ONqQ==
X-Gm-Message-State: AOJu0YxS9t1cLd8gr13HgJHnus8gTmmm0xTcYcIRw+dVIi7tFPZxDFX3
	nBtWb/41UB5fSP9FQvaS7twq+wCHxjWZ7g==
X-Google-Smtp-Source: AGHT+IF4GtA1eplc2+IzT2coWXFey03kWFtgqdz/cnYIVLGlpaFlHek0wzUVqb5WHFbEF4jm2YjOvw==
X-Received: by 2002:a17:907:111a:b0:9bf:2673:7371 with SMTP id qu26-20020a170907111a00b009bf26737371mr10665606ejb.13.1700032092163;
        Tue, 14 Nov 2023 23:08:12 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709064b0a00b009dd7bc622fbsm6612704eju.113.2023.11.14.23.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:08:11 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][master][PATCHv3] civetweb: Added license change reason
Date: Wed, 15 Nov 2023 10:07:33 +0300
Message-Id: <20231115070733.186462-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106734

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


