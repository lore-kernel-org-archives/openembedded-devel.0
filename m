Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.13343.1596178996129776295
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 00:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9v8mrRQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id e22so6947999pjt.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n/deS+WDxVwE2g2YG9wQTrPv7TkQBFEqld7qW9JB8zY=;
        b=Y9v8mrRQ9pMuGPSlTe0RB+cxg9rtMhBpTFwrOC/TAXa7lBr1zGAoJnMvGtZ6N8N8te
         4ddkeVArkZJoB7QoaRHyhByWLlU2GhTq/MOGYRCzdSrcwb7Va6+LJDNtUit8+sGLt2XF
         modxqJMACOszXzbl9Ipqqrp5gJBsf9XbdrbXNOKuLUvjNMVnd2zCmaGewgioZ+bpg4YC
         SwO4VU6xnCD1UvoLaMDRcfJRuiCtIHmBjBUIZ+V1x0OKk7DrCVzRy3n0uukANVwX86JU
         Bpgv5mtADpiXZzPFtw60fzrxb+H4hezyCOKJVVNCcJszO2lAZfogo5idJuS1frWAnw+N
         iZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n/deS+WDxVwE2g2YG9wQTrPv7TkQBFEqld7qW9JB8zY=;
        b=D0fvUsWDYpZB9WNRjgp6QRJu/cM92tCYHmOQ90fIe2md7+OkerN3fSVvTSetPbUBrP
         qX4W7cXdE3x2BygCYpWMwqMAEw7Q26pT8dwi6H5qmAkgwSVVJ4/hKyHh6sPXLqP3oY0h
         +C5kZcPhiRvHLTOYoBafIV9/PrvfSP1yyfUm4wcv2Mym8y4xy2XSQu+iHBydDXOZhooV
         VXzB11DBIMfVAZ07Nx9RW/WysXliLVrlsHHZ7shtGoQEePlXDnfL0SYjDvv2QGQfAePo
         i69D8L0R4HUwv3sFJGpKwCiDT6v+G5tb3nKd8E+AUlcUcRveKPy6b8S/P1yCoGtK73o9
         R8tw==
X-Gm-Message-State: AOAM530AxlamYcApqXZE1BmgCTJ1UV7wHvZAVexQFlwNECDC+Ef5qRIG
	rHLjZotATe0yVHxoNv89scBhwoylBa4=
X-Google-Smtp-Source: ABdhPJwC5LYQu/AJ2pZoVUDBuePmyV6rjAJoxH8RpNRSelUkJ3WmpNXUTNfhdAg6guX9IXZeJ8THkw==
X-Received: by 2002:a17:902:d886:: with SMTP id b6mr2540357plz.28.1596178995346;
        Fri, 31 Jul 2020 00:03:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id d65sm8414561pfc.97.2020.07.31.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 00:03:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] spdlog: Upgrade to 1.7.0
Date: Fri, 31 Jul 2020 00:03:12 -0700
Message-Id: <20200731070313.2929565-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use external fmt package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../spdlog/{spdlog_1.5.0.bb => spdlog_1.7.0.bb}             | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.5.0.bb => spdlog_1.7.0.bb} (80%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.7.0.bb
similarity index 80%
rename from meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.7.0.bb
index 39629cce0d..ce491da0d9 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.5.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.7.0.bb
@@ -3,14 +3,16 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCREV = "cf6f1dd01e660d5865d68bf5fa78f6376b89470a"
+SRCREV = "616caa5d30172b65cc3a06800894c575d70cb8e6"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x;"
 
+DEPENDS += "fmt"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
 # no need to build example&text&benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off"
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
 
 inherit cmake
 
-- 
2.28.0

