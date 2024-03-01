Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332FAC5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 15:36:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.26179.1709307368881818980
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 07:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0XBTWc6;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a34c5ca2537so364452266b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 07:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709307367; x=1709912167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sw1SZB7gEoeIszK+odGir486kwOdXEEqh2cp2abqlZc=;
        b=U0XBTWc6dxwSwNEKrz7Gi6GMqIUq9qkGCinXxTTx6KgK2oPkXKDnUIUQC1chMJBoYC
         MYLRihSax4j5scV/m+pAsmgfUTMjSner8FS6MII9Uc0CpIDMtbdMjnBa6J4rZQiaYVty
         TnyQSWLtRouPxBQWMKzuQAZr7W1/Hna6e6FCJ1uw98Tng1jhWWVOWzGlVbAmhA/SrG6M
         Ahlvzrer2Z3FMAsFk7lnvPTw80KW3sSqg3Ule61fhbGHyVbJOZ726xK/yfFQmtCisK5E
         3eb5gdTsFy4+hbZKh6J++gMg3EJvu+qh7TYGGI5B4YcLwqOoKaqOUQ8wZcinUPQBdVcf
         xSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709307367; x=1709912167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sw1SZB7gEoeIszK+odGir486kwOdXEEqh2cp2abqlZc=;
        b=YFRDH9RsY3QXeM9PITt7LuQJDoufAUXGZhcg6fxsLg+13mhULP3L53TigsMQI1QXfM
         C0TwwzVtc6BjMid3qEh2Qlp5f+LqRbjMbn2ERirGwfXhlLCJcM0Ir73Apu2Po+xxnVBe
         znzMd2wTOAJ3XvglUYvTGNtZAs0EgR/kh097hPFNOasuJS52ewrEgghN3tzrRqZzLd3I
         xceCPLGMM3ozsnicx0eLHSTEd6enb0gGgAv/oOO17UG7pi2jbnBkXnBnwBwDkqNZKMkh
         RF2sCQ0UlPNg1HJcS8AXL2ihSGB6ca/SbG9fgbGyoDv3fyaHVSIx5gNn3mGCdM6E4m3/
         +uUA==
X-Gm-Message-State: AOJu0YyeWNmwva5+/bDFnsVMr+bKbvtZy9zff6fxa7WWWSk2zlKmPFC0
	aj8JF3VXOUPrMux7tGv/x+p1Dnc9gugscRMaR7g8Lv4HDipukyOyZltBudXG
X-Google-Smtp-Source: AGHT+IH/ArGsf/Xpf3IpStthqEveFUYMeHR4qaGNlKktC6XQA1vgh8T/ZUeA2CDv/Oxcy2alDJ2T4g==
X-Received: by 2002:a17:906:aecd:b0:a3e:5de6:701d with SMTP id me13-20020a170906aecd00b00a3e5de6701dmr1270065ejb.50.1709307367013;
        Fri, 01 Mar 2024 07:36:07 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z20-20020a170906271400b00a441cb52bfcsm1793888ejc.165.2024.03.01.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:36:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH] fuse3: use 4 spaces for indentation
Date: Fri,  1 Mar 2024 16:35:57 +0100
Message-ID: <20240301153557.202049-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 15:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109078

* instead of mix of 8, 9 and 4 spaces

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-support/fuse/fuse3_3.16.2.bb      | 56 ++++++++++---------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index 321851da5c..7964621b58 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -7,9 +7,11 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
 LICENSE = "GPL-2.0-only & LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE;md5=a55c12a2d7d742ecb41ca9ae0a6ddc66"
+LIC_FILES_CHKSUM = " \
+    file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
+    file://LICENSE;md5=a55c12a2d7d742ecb41ca9ae0a6ddc66 \
+"
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz \
 "
@@ -25,7 +27,7 @@ CVE_PRODUCT = "fuse_project:fuse"
 inherit meson pkgconfig ptest
 
 SRC_URI += " \
-        file://run-ptest \
+    file://run-ptest \
 "
 
 RDEPENDS:${PN}-ptest += " \
@@ -36,29 +38,29 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/test
-        install -d ${D}${PTEST_PATH}/example
-        install -d ${D}${PTEST_PATH}/util
-        cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-
-        example_excutables=`find ${B}/example -type f -executable`
-        util_excutables=`find ${B}/util -type f -executable`
-        test_excutables=`find ${B}/test -type f -executable`
-
-        for e in $example_excutables
-        do
-            cp -rf $e  ${D}${PTEST_PATH}/example/
-         done
-
-        for e in $util_excutables
-        do
-            cp -rf $e  ${D}${PTEST_PATH}/util/
-        done
-
-        for e in $test_excutables
-        do
-            cp -rf $e  ${D}${PTEST_PATH}/test
-        done
+    install -d ${D}${PTEST_PATH}/test
+    install -d ${D}${PTEST_PATH}/example
+    install -d ${D}${PTEST_PATH}/util
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+
+    example_excutables=`find ${B}/example -type f -executable`
+    util_excutables=`find ${B}/util -type f -executable`
+    test_excutables=`find ${B}/test -type f -executable`
+
+    for e in $example_excutables
+    do
+        cp -rf $e  ${D}${PTEST_PATH}/example/
+    done
+
+    for e in $util_excutables
+    do
+        cp -rf $e  ${D}${PTEST_PATH}/util/
+    done
+
+    for e in $test_excutables
+    do
+        cp -rf $e  ${D}${PTEST_PATH}/test
+    done
 }
 
 DEPENDS = "udev"
-- 
2.44.0


