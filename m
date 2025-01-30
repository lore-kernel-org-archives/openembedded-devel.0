Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C94C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:36 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.6228.1738274306659385181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso90489639f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274305; x=1738879105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvWsLQid6zU/0JMrKcB7QE0faPhBK+p9hNEWLkyJiLc=;
        b=UWFQSp54BtNJHpllR8Q2NvrBGVeS8WOpw9FyZuJuEi0EDgyls3AGEdAejC+CBewxFU
         LA9YdZmv831yjCwcYrKyE99WBVBCgnWaN8oiI023JBGGr8ZkXubNe+ERVLoR+inTLncO
         hvKjN1ErmY1Qfe2fr5CaiX7hA+BgsZDMR5CwT6JFwYSBAcXh3IwemflbtAt/1OFnn+dE
         JHssDEjXRcDu13tF373o+K7n1ms72F025tAkpoAeKoMUwpr+oU4x7Yp3MxZrjb9vUmXe
         uJ1KljxXQc0gjvouB4GAqG6z5MIZBd/5YdVcO0ITedAZIzCr9Lay4l7TZeFH3TDT5K1+
         qlww==
X-Gm-Message-State: AOJu0YzDO5WiRUWfXWh+LDsilAdjYeszMrXwQOd0PmOiveFaNwf/8nhk
	E0D3aEUb2FMgZ+Wtc1cb8BWJi3+I8w8F0vdH0Gwc5xXLpDn5SKrNJVJCcWMs80g=
X-Gm-Gg: ASbGncsEZF8GtzO1tjGECwTp518SbhcXTXPCfVI92ekM88MCC8sKd52V3MV/FJAde+5
	+9AhVchisNao8Y2WkKQDVOQ7tDmkJX5nM0ebQcwzfbUVZ/E1BkaPFtiZQEZdAsjDM4VcCdFVbMd
	CC4A9pxLT7YINYrmTFF7lTT115UzzSYOlMGwV4DFc/l7P/WZjIlOfFzfjYF/+cIfmqL9HtMY97o
	GtQkoLmDEkqJKCUqYwfM+whx/+9ohI7ldQdIR0+Up+VMeYvElhM81PYTKygIPC7KihKQ5Gw0UGZ
	XgfgeBjc1k0SeaV0R3HjYx7Q0tDlEfk1txuNRvLTIQBw/WkH88beqwobBlgz
X-Google-Smtp-Source: AGHT+IFPfaioIsfELnnR7Dx1eBN5zslmOc3vmcnXC0Jvg7ws55104q0SfYwAo1Q2CKMkE6/x967WlA==
X-Received: by 2002:a05:6602:3a01:b0:841:984b:47d2 with SMTP id ca18e2360f4ac-85427e34f43mr1057589739f.14.1738274305517;
        Thu, 30 Jan 2025 13:58:25 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 18/23] python3-flexcache: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:33 +0000
Message-Id: <20250130215738.3280576-18-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115172

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-flexcache/run-ptest           |  3 ---
 .../python/python3-flexcache_0.3.bb              | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flexcache/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-flexcache/run-ptest b/meta-python/recipes-devtools/python/python3-flexcache/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-flexcache/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
index 1bee774022..35769b45c4 100644
--- a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -5,22 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
 DEPENDS += "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "18743bd5a0621bfe2cf8d519e4c3bfdf57a269c15d1ced3fb4b64e0ff4600656"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 PYPI_PACKAGE = "flexcache"
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
-        python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/testsuite
-        cp -rf ${S}/flexcache/testsuite/* ${D}${PTEST_PATH}/testsuite/
-}
+PTEST_PYTEST_DIR = "flexcache/testsuite"
 
 RDEPENDS:${PN} += " \
 	python3-compression \
-- 
2.34.1


