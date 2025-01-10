Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9E9C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:11 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.685.1736539747860660252
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-84cdacbc3dbso176734139f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539746; x=1737144546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+CwmaU6UjAPhC3k5dKeG4l0Ho6hmE5vSdFTydXrOMw=;
        b=piEsJc5dhNF2RJAMDRMwWi+nuUiE0jGORTvqkPrYIupRRqSCoG5NA8EIsYTnkd6k6h
         gXOygigcLh/rj+YrMtsbtcWhRZ/owepGon+NPGZdh3ZpwLoAaakUhNzEZDYKMmUYR1hA
         XB0GawBkDxnjSZwF/a05aOOJtrH8arBD420Ov4goaLRtx3fGmGS4+n1l0MlfOog82Rw3
         KHUkWmj85Mm9lSY20vJdEIKzwA9X+E+20cYg2ceDPVb1bLYjQ18uH+7pn4Ag9c9ZPGxC
         Sr+w4Xpbs+A/bgqLcMnzUSYVizGRKJThaJim7ScriF+eEX5K2CvNUYKASFh3QjVJ4Z2Q
         IKbg==
X-Gm-Message-State: AOJu0YyP+/RYKGQ04mcraoyVpnDI4llZReFiwweoEfoaQblIQ7PdvUSG
	ffPL/EQMm98yP+IZ+DnVcKRopo/ztivTbDHXWC7G5ArS/6b7WA4PgeRV5g==
X-Gm-Gg: ASbGncu7lzFO/P4IJGf3fpEmprHpiGjgb2rtIepTvEQmWVV/cCxuvNfT9W1WJTB6iPk
	tTkhiOQ3gYJXA1o23g8dwyPSLrP5tttbRhdHCETDEw3+lUFGVH2UXR+JKJ/JkV+8yEyQ+Tu96Jv
	S2CH9QJFiIdziNPMfRATZOdMcn1p1O2c7xB/stN5vBcW8pb/+nqv6sjD3qQQHhAhkXeTRiYnTuH
	kedU0wRrSo8xG8r9W1bBTmkTy6y5vSsoOeM23TTQlluRlJQ4IiqKoS4KMzfISrNtoRqPZfXPfZ8
	ZxF6O7XMT6QWPtrIGCbnTM7meg==
X-Google-Smtp-Source: AGHT+IFRZsY6dwVt9S0eP96M2rJRS2OQJNcfOnZ+ijKMJ9PPYn+eF89+/GmJfX7pSrEOsTau5V2JCg==
X-Received: by 2002:a05:6602:3685:b0:847:22a7:240e with SMTP id ca18e2360f4ac-84ce01a4b45mr1113546339f.13.1736539746207;
        Fri, 10 Jan 2025 12:09:06 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/13] python3-wrapt: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:14 +0000
Message-Id: <20250110200822.3958062-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114795

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-wrapt/run-ptest    |  3 ---
 .../recipes-devtools/python/python3-wrapt_1.17.0.bb    | 10 +---------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wrapt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-wrapt/run-ptest b/meta-python/recipes-devtools/python/python3-wrapt/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-wrapt/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
index b72bafb6d..fae45fb70 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
 
 SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d"
 
-inherit setuptools3 ptest
+inherit setuptools3 ptest-python-pytest
 
 SRCREV = "e663d4910a81d666786ac773ad7c16199b01d31b"
 SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=develop \
-	file://run-ptest \
 "
 
 S = "${WORKDIR}/git"
@@ -18,15 +17,8 @@ S = "${WORKDIR}/git"
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
 	python3-misc \
-	python3-pytest \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN}:class-target += "\
     python3-stringold \
     python3-threading \
-- 
2.34.1


