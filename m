Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA795C0218B
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.4852.1737145850891427099
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso196612039f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145849; x=1737750649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYFy2PGU7l3Tw9R0mruJy2y/JsLv1OL0Cld2Hf7vTTc=;
        b=rKPbZ4rMmB/Bp16Kbxx3+beCoZ3yACrT8fIExnd6M57MGxzcuUscYxgWOWYoa5nHMl
         izzN2bmn3Zq/LicJKdo4DB31Wf7aE2e2XknircbJAOpk22z/drYf8rVfshviP4IZNnHp
         rbP59GM7nP13mxhYH0CnBjYDTlABydZ4ZZpN+SLZ8zH3JzxDa1joLIN6EXZWejbSCsjx
         dJFbKXTbMb5zSW63mQjQ58JSfWNoxvoC3rUye5wc6jjUqsUFfZBP49CsVwxLoddX59qK
         UZoU3gzMz83On0D9P93EYYm2s2M8xZT8owk7NrtR88PQBtDqa/XNrjGR5nr9rXlTbRW5
         IV0w==
X-Gm-Message-State: AOJu0YzHuXqVne1/NqtvbvsZZNfdC6tt3tBkiXU5nEp38ut5yONxjJUs
	hvzrXm2suN5l+Z/IDAZBt8b+ylVoT8GvQob3LktNyDEbDDtlq5WMEC64hg==
X-Gm-Gg: ASbGnctReXPckADxVVZWZalYDeL9sg1selR4K/BRDOSgYHdvVO2nd+iwuQ2BY+snZWb
	FsETbMgjMyL+NZQkl1qkn12q3R/T+gVP2t+Qe4eeeTmvsAQ44FVKVzDo2X81o/3Nox6oEJlT/bq
	sxh4xEb0XjOyc13sUXCAvQXVlvj9cvDR0sJHVr4Vd6unKf0HIQjBo/+G5Slo13VJIsCR/jU8bpE
	70TK/+cnyBNJicDOgGqxZOMM/eNjYwpsDl0z8AxfscFm8EOkeXpnpoWgm3mwATzbRiq4jzn6k3+
	n2Gf9Du9cYzf1slfaPN8Y//KOw==
X-Google-Smtp-Source: AGHT+IFqu6VqJJepbmLC05HQOFrqaa0cr5t3pqkbp+9P+eIDbkLtmg4nrKNXH8hvjxoiXxl6nlgrIA==
X-Received: by 2002:a05:6602:394a:b0:844:debf:2b42 with SMTP id ca18e2360f4ac-851b619fc96mr371474439f.2.1737145849172;
        Fri, 17 Jan 2025 12:30:49 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/10] python3-propcache: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:27 +0000
Message-Id: <20250117203030.3648575-7-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114940

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-propcache/run-ptest               |  3 ---
 .../python/python3-propcache_0.2.1.bb                | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-propcache/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-propcache/run-ptest b/meta-python/recipes-devtools/python/python3-propcache/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-propcache/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
index 0ea24e8bc..d15ead920 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
@@ -5,26 +5,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "3f77ce728b19cb537714499928fe800c3dda29e8d9428778fc7c186da4c09a64"
 
-inherit pypi python_setuptools_build_meta ptest cython
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
 DEPENDS += " \
 	python3-expandvars-native \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
 	python3-pytest-codspeed \
 	python3-pytest-xdist \
 	python3-rich \
 	python3-statistics \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


