Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58F0C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 20:55:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.32392.1703105729161786272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 12:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0WxHkZp;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d190044c5so1233365e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703105727; x=1703710527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZrUKdDGD6h9xtUnoU6IBfRgsrUurfg8Ds6E6JMepFg=;
        b=g0WxHkZpdJfCqpWOY0RsPKUai9e+sAz6O9UD8sXfBLAM88+4jUOj6FvnBZ1cE+HX1/
         TOxsDiZPGRYm+qbKTewf0yHMJ7v/SFOsxLQQWzQhqfocATpkdTbC52TyXs4acXXhfZ8S
         6iaaU9zodq64B1z1Eg1S2ZzPW/fMBogDUEvb/eVqGnY8Nvw0ZnFF/Xvo3EIk79wOJGuM
         VuUpRlqgcd2ivnMJU2JA2X8yK86IPuNeDIydHyPEm/QHawIAb88yj+ZnR7Wx8tFyyHUE
         AuDofiCsBQth7jiSs723YZmnYt1xtgZXx7vH6CtCJ0m+8prRD96XfutWUYvd31ONqHvj
         Czlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703105727; x=1703710527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZrUKdDGD6h9xtUnoU6IBfRgsrUurfg8Ds6E6JMepFg=;
        b=vvAbevuXzMc4qNGKy9TF+wL9EanfLLwk8l96BB9306doIFUC7Pi7fHcR3WiKFEr3rA
         tfid/h5XsLKwuhYQx0dFxdkwLndsdYxAaSOI7v74UdK8ThGC8MDf11Rhtwuq9zB8YDSf
         3GK9galJzYO+3XAS0VsrdAVWGKL3v6IRrxEd++EjclzIOSh+TvaT6WhJEUWReHNugHOI
         KtOZr3V8J/02NU24u2stQEZv/rrTbUsjlvFL9ge7pqUXJ/QvbXRc7Bf0XBfYmciqaDiK
         QG2dzWKP2i+BYDXTU3D36hepahG3YNupkjAFSr+MmR9ek25fkJuVOkmNsjgdFdL2SLmP
         qEqA==
X-Gm-Message-State: AOJu0YwjX+j8zU99m5gOcydeOEIe2CmhMPZAsNYRd06yUtZnEV/tjU8z
	UQKCh1p50PBjc0Ovz/zoMfoKbnKTsB0=
X-Google-Smtp-Source: AGHT+IHFmpDhlZLDeYZ7YtTWzOBuy5+HA+9InuUOjYdqEJjKqocL6oB/3+ZYdvaWuBZ+pGzHpmOzmg==
X-Received: by 2002:a05:600c:501f:b0:40c:692e:2576 with SMTP id n31-20020a05600c501f00b0040c692e2576mr174884wmr.136.1703105726613;
        Wed, 20 Dec 2023 12:55:26 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:8108:f84e:1a21:c7d3])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b0040c2c5f5844sm780042wmn.21.2023.12.20.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:55:26 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2] c-ares: Move to tarballs, add ptest and static support
Date: Wed, 20 Dec 2023 20:55:18 +0000
Message-Id: <20231220205518.6966-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 20:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107672

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Use relative path to arestest

 .../recipes-support/c-ares/c-ares/run-ptest   |  7 +++++++
 .../recipes-support/c-ares/c-ares_1.24.0.bb   | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/run-ptest

diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
new file mode 100644
index 000000000000..15971dec058c
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if ./arestest; then
+	echo "PASS: c-ares"
+else
+	echo "FAIL: c-ares"
+fi
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
index 2171002aa95e..3b3b2b83febc 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
@@ -5,14 +5,23 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "972f456f2808b4e4b1730c90ab506f6af5f4c725"
+SRC_URI = "https://c-ares.org/download/c-ares-1.24.0.tar.gz \
+           file://run-ptest"
+SRC_URI[sha256sum] = "c517de6d5ac9cd55a9b72c1541c3e25b84588421817b5f092850ac09a8df5103"
 
-UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
+PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[tests] = "-DCARES_BUILD_TESTS=ON,-DCARES_BUILD_TESTS=OFF,googletest"
 
-S = "${WORKDIR}/git"
+inherit cmake manpages pkgconfig ptest
 
-inherit cmake pkgconfig
+EXTRA_OECMAKE = "-DCARES_STATIC=${@ 'ON' if d.getVar('DISABLE_STATIC') == '' else 'OFF' }"
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}
+	install -m 0755 ${B}/bin/arestest ${D}${PTEST_PATH}
+	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
+}
 
 PACKAGE_BEFORE_PN = "${PN}-utils"
 
-- 
2.39.0


