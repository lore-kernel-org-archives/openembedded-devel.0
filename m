Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E612C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 20:08:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.30903.1703102891962494115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 12:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+GFg4Ba;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3365f09de18so23420f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703102889; x=1703707689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAXHwi4Oac9GR3Pjeheewj4QSIfXdBOTD4EK5oNfyTM=;
        b=C+GFg4BaePcuRgADl+Vs0rEzy4vlFvI/owrSHnSNEmhr9ozTFTHLbceSrXJiS8vtPS
         h/imSbgGkdR6tatMPhxvG+FkSfrwzJUL+0OeWFZCpjZM3BvSyzLe+Y9OnC+G7c81TihK
         DCv2Pac049YEgyZSfvP1oNkoGbwA8A8uFsIM+UQ7zcn5FQeZxo0B77kqbzKQGf8MVfzl
         +GE7+VRXlLCwAsXhkY7fXm9Cdf99z9j0OKmmXcuzjXWzh1I10XHM1wepfbTdaccKl7zZ
         RT6SHZNJtd3NOLYxMM61oHxEBz9PGyow2aBm2f68YIjVBQs+987iCLoIdCaTIjaa+wjW
         x8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703102889; x=1703707689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAXHwi4Oac9GR3Pjeheewj4QSIfXdBOTD4EK5oNfyTM=;
        b=vA/jVq8A9YtDqdFr2yh0e5eoBfz4JMdaViOswGBbF7XLTWoMcC/fL40jxsyxZ70VPy
         L+9LBVzNl3KqhvuPMiFcSAL56FWsKhAf0ThZwDhBCQWsqN2pRP7GRaLx6aUR+0zTJxAl
         VCnxbGnwi1uZLhOq9e1KQDQ0BHGs9+U2DndezgTeACbtbnlclQtQyWl+nb9NS5/KCoMg
         IQlb+IoC2pboXCr0xmeT3zGO33atdOjfeC2LmHqTp1c3h6P7PCKbvtVlD/y5Aicyie4D
         amJnUFNvP/pwRvhPe7Y8QmtikwO+Yb9zOWaJIRGsPNmy3m9QEPX8MmPXI5xJh5Yma/Ov
         rvzg==
X-Gm-Message-State: AOJu0Yx446LR10k2k76qGW/M4NmAn3cR5WxJEFzF/o3T4rVLj5sTslkj
	cdx+0Oomapwkhh3Gb2zenES6RHATRZc=
X-Google-Smtp-Source: AGHT+IG+Bg3/Qb8b9mKjbA+ByDeugzZVXv+JT5rr4L+Q5P18ysT1bl+8/Uh+6L9JTwXH30c1QF6TIA==
X-Received: by 2002:a05:600c:3153:b0:40d:39f3:6947 with SMTP id h19-20020a05600c315300b0040d39f36947mr102458wmo.140.1703102889030;
        Wed, 20 Dec 2023 12:08:09 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:8108:f84e:1a21:c7d3])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0040c11fbe581sm686980wmq.27.2023.12.20.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:08:08 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] c-ares: Move to tarballs, add ptest and static support
Date: Wed, 20 Dec 2023 20:08:05 +0000
Message-Id: <20231220200805.27842-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 20:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107667

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-support/c-ares/c-ares/run-ptest   |  7 +++++++
 .../recipes-support/c-ares/c-ares_1.24.0.bb   | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/run-ptest

diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
new file mode 100644
index 000000000000..ec115a535217
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if /usr/lib/c-ares/ptest/arestest; then
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


