Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E51C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:32:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.8920.1737714770029998506
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACx6Juf8;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385eed29d17so1027781f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737714768; x=1738319568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fC/eEmTTgvmeL+e64RAIzr24JMUJt102t5p5o51EYHQ=;
        b=ACx6Juf8uAcoliLDobgkRNC5PWNMqA9NQePUDbToZuKdXYoPD1mT3Zepx9iRZpoKB+
         xjDIqJGJIXAnj6upVtQnG7LbqsK85QV/3VI+hpcT5gkiK9XByuHvWHDxQUL8eahOrGe6
         ZOnj+OOh13kx0pdVNO3jLzRL+rQKqwa3Uey1bI9gNoWV9Cf7D/JEX9Q9G0wKvR8Cj7mn
         v3q9PSVjDYgSbAw6N3cY6slHGQkC3ro2xt8acOzuFooQEZXZVOq9lziOaj2qqNWMk8IE
         0t0fYrJcyrMP/MsOQOSe6KVGvXrVyNRwaqKITwAlNfASo6SvH8U8CqpPSnQvpGQJPGUP
         8DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737714768; x=1738319568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC/eEmTTgvmeL+e64RAIzr24JMUJt102t5p5o51EYHQ=;
        b=kG7zuGtBWG7gPrHRn1BWlRhtAYHyQ8V32xxrdZmIO44X4r/ChQ1Ua56Bo58xvIRFRT
         KCkFJkGd7wmN7rW+plaglan8PMHE82+QB2DzBZFa6ZbU7a1Py3hwRexjGbzbJwg+QAri
         YF0WliYppaqCOnyzTy/KIJmehB9iiuREn0kFEDsUJBunvgNdL5uu+aPH1l3y+1M1AzHH
         XoZoB3y/7tg4poD55g5/cbVqhwDxxp0YXtxTZLiovoJ+CoKZbw578ojbJIt0URrwXK/E
         YcCRwBRvtJ+QANoB4FeFIbnntEKtxFOHeurFHWf2AnhyHxsgwsi/rvenyFeuVqaU5A6H
         IHJA==
X-Gm-Message-State: AOJu0YxNui/o1tX6jiBo2XyiUm2bicq5gLDD1muPgcrBfL+WxA4SnYxo
	rArdb2dzlHxterCEJm1qFADaYsjNJAIr4QTsi0ZKmRCtIIAfILqf3PuL+A==
X-Gm-Gg: ASbGncuzq2prju042c3XTMLfit61NYikojGmyEFZobv4j0Js6yvWjKpoh6MZkn3rj40
	AvdVMwB/AuQ8NGnzuztJg4HKd58Q15HafqKllSbmm0zHb0KZ1DXufIfj82qndd7nO+IYaSnKBSS
	VjFQh+lxG5BRuq/fCdOYEyZGcqQImUCbIFGaTLkZCTUSPUqoepqoy5TWNyJYAL+obPctVAg/rX1
	4FlevFkEJYqguBipGaxmluGbWegYMi+9Gn68lhDlYuum04er8p5H4uDVZKGtEWuy0S8RFteGFOh
	Vd6jKhXDHfUfGU4j3Uib
X-Google-Smtp-Source: AGHT+IFeHe4gmBfrkmWei/5DL/yu7n1sNPVHbMiBxKFOAXC5P5m56KylMK2vZWXG/yl5CV93Whrdkw==
X-Received: by 2002:adf:ed50:0:b0:38a:9f7d:9339 with SMTP id ffacd0b85a97d-38bf566fe7amr23222258f8f.28.1737714768195;
        Fri, 24 Jan 2025 02:32:48 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188915sm2246642f8f.41.2025.01.24.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:32:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-networking][PATCH] civetweb: fix pathes in cmake file
Date: Fri, 24 Jan 2025 11:32:44 +0100
Message-ID: <20250124103244.3904639-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115051

1. The do_install:append() deleted the TMPDIR from the cmake file,
however that left two absolute pathes in the file: /usr/lib/libssl.so
and /usr/lib/libcrypto.so. In case another project is trying to link
to civetweb-server with cmake, it fails with the following error:

ninja: error: '/usr/lib/libssl.so', needed by 'examples/prometheus/prometheus_example', missing and no known rule to make it

Instead of only deleting the TMPDIR, change it to ${CMAKE_SYSROOT} -
a variable set by cmake.bbclass. This allows other projects to find
the required interfacing libraries successfully.

2. When linking to civetweb-server from another project using cmake,
the cmake file verifies if the /usr/bin/civetweb binary exists. When using
the class-target package, this file is not included in the sysroot during
build-time, so this check fails with the following error:

 CMake Error at ${RECIPE_SYSROOT}/usr/lib/cmake/civetweb/civetweb-targets.cmake:97 (message):
   The imported target "civetweb::server" references the file

      "${RECIPE_SYSROOT}/usr/bin/civetweb"

   but this file does not exist.  Possible reasons include:

To avoid this error, this check is deleted for class-target.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/civetweb/civetweb_1.16.bb       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index f5a699d5b..d061e1a81 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -41,8 +41,13 @@ PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=OF
 PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
 
 do_install:append() {
-    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
-        -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/civetweb/civetweb-targets.cmake
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}|\$\{CMAKE_SYSROOT\}|g' \
+        -e 's|${RECIPE_SYSROOT}|\$\{CMAKE_SYSROOT\}|g' ${D}${libdir}/cmake/civetweb/civetweb-targets.cmake
+}
+
+do_install:append:class-target() {
+    sed -i '/list(APPEND _cmake_import_check_files_for_civetweb::server "\${_IMPORT_PREFIX}\/bin\/civetweb" )/d' \
+        ${D}${libdir}/cmake/civetweb/civetweb-targets-noconfig.cmake
 }
 
 BBCLASSEXTEND = "native"
-- 
2.48.1


