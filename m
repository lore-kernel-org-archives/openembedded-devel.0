Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE851C02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:36 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.6230.1738274309527865840
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso10307005ab.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274308; x=1738879108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyRKoaqM4bJoakUcInsiwCoBYZQK5RASoJH9SqIyg2U=;
        b=L+A/vsQCkFUMQ+9Q5SNkES2PHkQqvSoSVLjknPfebG6Hc5jJc0ousu7XfVM+E9wpuP
         AA9JXJX2gQXDj6zwfqXzi4FIVzEDUoamGlTMRE1OHZwxNiIPDPfuMrLWEmeYabiiIpht
         rGBrdW3nApElGImYe3TwELF2+8KmpklMNCCdbB6Wq3Bnis0mpAurjacLI2H+8k0ZunqS
         x/SyaTqkzXnJdOKcD7ckM/0e/h1S2iVulVXeCk7foshBLIWqUiB6KHY0oxn50WtjiXzB
         uSmC2wDHnQ9nG8skgIsPHADm+XY1Ar6czZ1DJ/0Be/9DM9AXh8TLTp1B39pzn+cakGME
         6SvQ==
X-Gm-Message-State: AOJu0YxOE5qGAbtQstgZ3zRHBWCTG/xj7WbaWdAC8U+w1P6m9jmoNX1D
	8oCQiwM7622jRCH3Ebcw1WY7Vazwsn51NvJMUTagLQd8j52MB6vD8XH/nEg5bbk=
X-Gm-Gg: ASbGnctyb0553U3S4IrwRmBYBGV+xibimRRiTCZPvQY+GHIz4qQq3gl0G0QPVsf++Y8
	XL2ADtv0/DpbPT81XkspeKXjZw41/WiEDF/2N9371/oHdO2clf70sbhmn238XMwIalWusyaGHrf
	1dnaNEsbt0GDjKpzF9q554nw+DC4v2Rs2Ci9miigrN+KpL3PokHdO/FxRuAxM+2VZ2TI6n+U8Qx
	aH3iz8LUzEanmK7fQUjglUm+bCtzGqB71f6ETKjCQzOx6IhxYPKmxwdXnyvZ22uRkHuaJUJ04+B
	zKjJR+ybkh3xhSSyhgTM13a2lDCohBOXAHG7gPzOeR+e2HAU91Ls0JLQCAf1
X-Google-Smtp-Source: AGHT+IHrvnpNkIFCDY2aE1I6j/FTRRkUmma+EtriuvEhkx8epw60mpR00+6P51XuBeA0m7cbaWFEpA==
X-Received: by 2002:a05:6e02:470e:b0:3cf:cc8d:48a2 with SMTP id e9e14a558f8ab-3cffe4702d2mr94632255ab.21.1738274307892;
        Thu, 30 Jan 2025 13:58:27 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 20/23] python3-fastjsonschema: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:35 +0000
Message-Id: <20250130215738.3280576-20-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115174

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-fastjsonschema/run-ptest           |  3 ---
 .../python/python3-fastjsonschema_2.21.1.bb           | 11 +----------
 2 files changed, 1 insertion(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest b/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
index ecd92d5a74..11fc6de8d6 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
@@ -8,14 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
 SRC_URI[sha256sum] = "794d4f0a58f848961ba16af7b9c85a3e88cd360df008c59aac6fc5ae9323b5d4"
 
-SRC_URI += "file://run-ptest"
-
-inherit ptest pypi setuptools3
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit ptest-python-pytest pypi setuptools3
 
 # python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += "\
@@ -23,11 +16,9 @@ RDEPENDS:${PN}-ptest += "\
     python3-jsonschema \
     python3-misc \
     python3-pylint \
-    python3-pytest \
     python3-pytest-benchmark \
     python3-pytest-cache \
     python3-statistics \
-    python3-unittest-automake-output \
 "
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.34.1


