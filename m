Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C241E7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:57:52 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.1819.1736542670326102950
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844e7409f8aso78801739f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736542669; x=1737147469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAITKZ9ucfYGa01OW9LtaTX3WrQpq86qrfYh66/rHFg=;
        b=YXe1JP/EffT9uneGDY2WvjD1WSN4uySo/vuHIFCcPeSR5qBaZgkEOfbnzT7it5Xd5g
         z8mB0MeF+aq88O6oSDQI/LlbpmgTXSbUWC3zv1PK1UvoD4Kn45MwPaolK/juB4gUNr9N
         RuB4xeKLNdtB48kgXara/bq52WJK/JTEiwtYkADzkBm3U3dblorbZIWarjh4sGpLswn8
         BoCElHHKzS/kJVCtWdlr2U7OLg8nx1Fbc7etXdE2Zx04z5aT4bkrZW/6wcRncVMtrJUY
         vLEw0ZNykhTNXCAGYPzAkDNW/k29In+RdQWn8DfqrCyCbXWH39ylsXY7ApXRL/Kz2FK7
         wsxA==
X-Gm-Message-State: AOJu0Yz6LjaevmH2XMi/lUfEUvif0X+P/EGBz8ODXY6K7f/RMCavrC6i
	lyNnIG+dJ/V0B3E6182l2ZgigkXJkcdbbgXBy7p/PPiiKVz2IZFFB8H8pg==
X-Gm-Gg: ASbGncsMAv4s+XxJBL3X+VyVrNFEWTtaatBcFoB6cbjO9AgyYOQT8cFo9ma2FhIMQTz
	Fg7ApJ1eVbYAnfqJIxTlEaWqttiNXtCHAeB2NfdDEUrRbbFc7Xw8WtOxl921SQJK8MD6JmW+1mC
	palrd+YpOx3Vj3MYDPsAu7TbUZZvK2TNfc9ce20lc51u+R5V/QVtEF60gp2d9+imNUkFOAdv/u6
	rfSmect96Uw8hsIZNECrGMx9VhgYj7T6+3XghtjyrEMan7569RFXAKFeE6wV77uDFy7YNRo09Cz
	TuviYbXpgbSDBSVY6jLcpGKoDw==
X-Google-Smtp-Source: AGHT+IHpGuaWhJsYK9EJgQHk81KuaPVPuhPNwFTLgeW+Pi34hXcLkEg6yZr9R0X2myBEZWh2QGcKZQ==
X-Received: by 2002:a05:6602:4805:b0:841:9516:4e2e with SMTP id ca18e2360f4ac-84ce01e91bcmr1069089439f.11.1736542669153;
        Fri, 10 Jan 2025 12:57:49 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d4faee16bsm106960939f.4.2025.01.10.12.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:57:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/3] python3-sqlparse: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:57:29 +0000
Message-Id: <20250110205729.4088028-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110205729.4088028-1-derek@asterius.io>
References: <20250110205729.4088028-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114807

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-sqlparse/run-ptest               |  3 ---
 .../python/python3-sqlparse_0.5.3.bb                | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest b/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
index 588568c6a..0282c1848 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
@@ -4,27 +4,16 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI:append = " \
-    file://run-ptest \
-"
-
 SRC_URI[sha256sum] = "09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272"
 
 export BUILD_SYS
 export HOST_SYS
 
-inherit pypi ptest python_hatchling
+inherit pypi ptest-python-pytest python_hatchling
 
 RDEPENDS:${PN}-ptest += "\
     python3-mypy \
-    python3-pytest \
-    python3-unittest-automake-output \
     python3-unixadmin \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


