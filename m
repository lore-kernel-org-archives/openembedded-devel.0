Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8875EC433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 13:33:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10686.1634391212575827037
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 06:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=vYZ9qFi9;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id x27so54183721lfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQ4z44JhrqCflUfCU3jODU6vuiIjTizVSNcFSe2EKUw=;
        b=vYZ9qFi95pcoTwqNTe+QqSTsLMWZh+UcEYaPRIXB4X47F7UNyzHQWq/6jq1605ymcV
         xp7DiypNb8ky17h/jXJ71DslVkoIunMldjs3UqhzYBLkwBSqWWp1YGoTEeNueUwc8ZgA
         UKeuZDzeM1qFN8evR2FQnzuSdJNR9FDdkqMbQwkXqQTEkyi3U9mk1bd51HYp0NAfmuH5
         x2rIEBKXAZm7TKRxljmUF297nv/IB22pkTw9ZUDUQN8YiWCxIxeY4cPSpLlI4zdtNVts
         yus4tRwDi6cfN9bmJNU5b2ff/GeVMmMcEnucndgnFf71/6hJ/ZFiWGFIpeTcIwqYhZGd
         Sqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQ4z44JhrqCflUfCU3jODU6vuiIjTizVSNcFSe2EKUw=;
        b=yetZxNH5fGsjePlubc83FIU4AL9OoUGSqWr/RBbEtwN0oYP00nPjEFFkI7AoJGUCNE
         Ow23QYFyM4MmJP/Pc0jTeyyuL0zqLGBpO+Tu5CQFkAJ7ucR8fhjqCMdIV4DOS+jgEJ3h
         Fo7oFN4P/+CO9t6Kc7E8FGDHterxy0gOr3tuW+GVdw1ObDEEkGZgOZamfhaKWr5C2O3W
         Ahf93U7LTJMed/MbgmZTlU4iWVJgM1OcNHbWHzTsQRCUxaXAK9PmKp1XWYbhPTG0a5zg
         8H2o2cqADjOz6y4vIbgT6KMkA2UaJUOUFQr+IwuxyQHmL9M5ijq1OHpVmtoEZYS5Imjv
         js+g==
X-Gm-Message-State: AOAM532dxoR+UJhIri+V7snR9OtBsvPPYRu+h+yBdJp7MghCTEceTPtx
	GX9KnSc4UHlfW+QLPcenlCoKO0UzKp7wBnc/
X-Google-Smtp-Source: 
 ABdhPJy+Ka8ENN7p+Ta/E54eGgvxaN+BZeO+cYJOAWr3DDDZkDBd4CpRQg91MjdmUeK3gYYXxEUqwg==
X-Received: by 2002:a05:6512:1155:: with SMTP id
 m21mr17398540lfg.471.1634391210289;
        Sat, 16 Oct 2021 06:33:30 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t20sm913482lft.240.2021.10.16.06.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 06:33:29 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-python] python3-pyroute2: update to 0.6.5
Date: Sat, 16 Oct 2021 15:33:27 +0200
Message-Id: <20211016133327.3781109-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 13:33:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93402

Tests are, unfortunately, not anymore supplied with pypi package.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hon3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
index a85b0929d..d69439352 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
@@ -3,9 +3,9 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29"
+SRC_URI[sha256sum] = "d0995c8aeb96c0e4eed4d62e97c9d795000a1a33b747d6dc54326665857cf11c"
 
-inherit setuptools3 pypi ptest
+inherit setuptools3 pypi
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-ctypes \
@@ -29,8 +29,3 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 	${PYTHON_PN}-fcntl \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.25.1


